module CommonCGR
   logical :: QMaster
   integer :: ierror
   integer :: MyRank, NProcs
   integer :: nmol, natm, nty, Nstep, nmolext, nbond, nangle
   integer :: nbondtype, nangletype
   real(8), dimension(:,:,:), allocatable :: Rcom_Group
   real(8), dimension(3) :: CellL
   real(8), dimension(:,:), allocatable :: DisBondL
   real(8), dimension(:,:), allocatable :: DisAngle
   integer, dimension(:,:,:), allocatable :: gr
end module CommonCGR

program para_cgr

use CommonCGR

implicit none

integer :: i, j, k, l, ii, jj, kk, nn, i1, j1, i2, j2
character(len=72) :: Filename
real :: Timeps

real(8), dimension(:,:,:), allocatable :: Rext
integer, dimension(:), allocatable :: Hands
integer, dimension(:), allocatable :: ibond, jbond
integer, dimension(:), allocatable :: bondtype
integer, dimension(:), allocatable :: iangle, jangle, kangle
integer, dimension(:), allocatable :: angletype
integer, dimension(:,:), allocatable :: anglebond, diranglebond
integer, dimension(:,:), allocatable :: HandBond
character(len=9), dimension(:), allocatable :: namebondtype
character(len=4), dimension(:), allocatable :: TypeName
character(len=14), dimension(:), allocatable :: nameangletype
integer, dimension(:), allocatable :: itype
integer, dimension(:), allocatable :: numbond, numangle
real(8), dimension(:,:), allocatable :: Sv
integer, dimension(:), allocatable :: numtypeinmol
integer, dimension(:), allocatable :: BondI, BondJ
integer, dimension(:), allocatable :: AngleI, AngleJ, AngleK
logical :: Qcount
integer :: iircom, iibond, iiangl, iigofr

real(8), dimension(3) :: Rij, InvCL, S1, S2
real(8) :: pi, R1, cst, t1, Vol, R2
integer :: ir, it, ix, iy, iz
real(8) :: drr, qk, g11
integer :: Nas, iarraymax

!## DCD
character(len=80) :: trajectory_file   ! trajectory
real, dimension(:), allocatable :: XYZ
real, dimension(6) :: Box
integer :: Natom, status, Handle
character(len=10) :: Intype

   call SetupMPI

   Intype = 'auto'

   Nas = NProcs - MyRank

   open(5,file='cgr.input',status='old')

! ----------------------------------------------------------------------------------
   if(QMaster) then
     trajectory_file = './Analy/CGconfig.dcd'
     call f77_molfile_init_
   end if
! ----------------------------------------------------------------------------------

!   print *, "Number of steps"
   read(5,*) Nstep
!   print *, "Number of Molecules and Groups"
   read(5,*) nmol, natm

   nmolext = nmol*8

   allocate(Rcom(3,natm,nmol))
   allocate(Rcom_Group(3,natm,nmol))
   allocate(Rext(3,natm,nmolext))
   allocate(itype(natm))

!   print *, "Number of Types"
   read(5,*) nty

   allocate(numtypeinmol(nty))
   allocate(TypeName(nty))

   do i = 1, nty
!     print *, "The name of type ",i
     read(5,*) TypeName(i)
   end do

!   print *, "Type number should be assigned for each group:", natm
   read(5,*) itype(:)

!   print *, "Number of Bonds"
   read(5,*) nbond

   allocate(ibond(nbond))
   allocate(jbond(nbond))
   allocate(bondtype(nbond))
   allocate(namebondtype(nbond))
   allocate(nameangletype(nbond))
   allocate(iangle(nbond))
   allocate(jangle(nbond))
   allocate(kangle(nbond))
   allocate(angletype(nbond))
   allocate(anglebond(2,nbond))
   allocate(diranglebond(2,nbond))
   allocate(Sv(3,nbond))

   do i = 1, nbond
!     print *, "Bond pair for Bond:", i
     read(5,*) ibond(i),jbond(i)
   end do

   if(QMaster) then
     print *
     print *, "-----------------------------------"
     print *, " Number of Steps : ",Nstep
     print *, " Number of Mols. : ",nmol
     print *, " Number of Group : ",natm
     print *, " Number of Types : ",nty
     print *, "    Typenames : ",TypeName(:)
     print *, " Number of Bonds : ",nbond
     print *, " bond pairs : "
     do i = 1, nbond
       print '(5x,2i7)', ibond(i),jbond(i)
     end do
     print *, "-----------------------------------"
     print *
   end if

! ----------------------------------------------------------------------

   numtypeinmol = 0
   do i = 1, natm
     j = itype(i)
     numtypeinmol(j) = numtypeinmol(j) + 1
   end do

   allocate(BondI(nbond))
   allocate(BondJ(nbond))

   do i = 1, nbond
     BondI(i) = itype(ibond(i))
     BondJ(i) = itype(jbond(i))
   end do

   nbondtype=0
   do i = 1, nbond
     if(i==1) then
       nbondtype = 1
       bondtype(1) = nbondtype
       write(namebondtype(1),'(3a)') trim(TypeName(BondI(i))),'-',trim(TypeName(BondJ(i)))
     else
       Qcount = .True.
lp1:   do j = 1, i-1
         if((BondI(j)==BondI(i).and.BondJ(j)==BondJ(i)).or. &
         &  (BondJ(j)==BondI(i).and.BondI(j)==BondJ(i))) then
           Qcount = .False.
           exit lp1
         end if
       end do lp1
       if(Qcount) then
         nbondtype= nbondtype + 1
         bondtype(i) = nbondtype
         write(namebondtype(nbondtype),'(3a)') trim(TypeName(BondI(i))),'-',&
         & trim(TypeName(BondJ(i)))
       end if
     end if
   end do

   allocate(Hands(natm))
   allocate(HandBond(natm,6))

   Hands = 0
   HandBond = 0

   do k = 1, nbond
     i = ibond(k)
     j = jbond(k)
     Hands(i) = Hands(i) + 1
     Hands(j) = Hands(j) + 1
     HandBond(i,Hands(i)) = k
     HandBond(j,Hands(j)) = k
   end do

   nangle = 0

   do i = 1, natm
     if(Hands(i)<2) cycle
     do j = 1, Hands(i) - 1
       do k = j + 1, Hands(i)
         ii = HandBond(i,j)
         jj = HandBond(i,k)

         i1 = ibond(ii)
         j1 = jbond(ii)
         i2 = ibond(jj)
         j2 = jbond(jj)

         nangle = nangle + 1

         anglebond(1,nangle) = ii
         anglebond(2,nangle) = jj

         jangle(nangle) = i
         if(i1==i) then
           iangle(nangle) = j1
           diranglebond(1,nangle)=-1
         else if(j1==i) then
           iangle(nangle) = i1
           diranglebond(1,nangle)=+1
         end if
         if(i2==i) then
           kangle(nangle) = j2
           diranglebond(2,nangle)=-1
         else if(j2==i) then
           kangle(nangle) = i2
           diranglebond(2,nangle)=+1
         end if
       end do
     end do
   end do

   allocate(AngleI(nangle))
   allocate(AngleJ(nangle))
   allocate(AngleK(nangle))

   do i = 1, nangle
     AngleI(i) = itype(iangle(i))
     AngleJ(i) = itype(jangle(i))
     AngleK(i) = itype(kangle(i))
   end do

   nangletype=0
   do i = 1, nangle
     if(i == 1) then
       nangletype = 1
       angletype(i) = nangletype
       write(nameangletype(nangletype),'(5a)') &
       & trim(TypeName(AngleI(i))),'-',trim(TypeName(AngleJ(i))),'-',trim(TypeName(AngleK(i)))
     else
       Qcount = .True.
lop2:  do j = 1, i-1
         if(AngleJ(i)==AngleJ(j)) then
           if((AngleI(i)==AngleI(j).and.AngleK(i)==AngleK(j)).or. &
           &  (AngleK(i)==AngleI(j).and.AngleI(i)==AngleK(j))) then
             Qcount = .False.
             exit lop2
           end if
         end if
       end do lop2
       if(QCount) then
         nangletype= nangletype + 1
         angletype(i) = nangletype
         write(nameangletype(nangletype),'(5a)') &
         & trim(TypeName(AngleI(i))),'-',trim(TypeName(AngleJ(i))),'-',&
         & trim(TypeName(AngleK(i)))
       end if
     end if
   end do

   allocate( DisBondL(nbondtype,150:500) )
   allocate( DisAngle(nangletype,180) )
   allocate( gr(nty,nty,200) )

   pi = atan(1.d0)*4.d0

   iircom = 3 * natm * nmol + 3
   iibond = nbondtype * (500-149)
   iiangl = nangletype * 180
   iigofr = nty * nty * 200

   DisBondL = 0.d0
   DisAngle = 0.d0

   gr = 0
   Vol = 0.d0

! ----------------------------------------------------------------------
! ##  calculation starts here
! ----------------------------------------------------------------------
   if(QMaster) print '(/a/)', "starting calc......."

  do i = 1, Nstep

    if(QMaster) then

      if(i==1) then
        Handle= -1
        Natom = -1
        call f77_molfile_open_read_(Handle, Natom, trajectory_file, Intype)
        if(Handle <0) then
           print*,'file type unknown or not registered'
        end if
        if(Natom /= nmol*natm) then
          print *, 'ERROR : Natom in the trajectory file is not consistent'
          print *, 'Natom=',Natom
          print *, 'N=',nmol*natm
          stop
        end if
      end if

      status = 1
      call f77_molfile_read_next_(Handle,Natom,XYZ(1),Box(1),status)

      if(i==Nstep) then
        call f77_molfile_close_read_(Handle,status)
      end if

      if(mod(i,10)==0) print *, "Step=", i

      ii = 0
      do k = 1, nmol
        do j = 1, natm
          Rcom_Group(1,j,k) = dble(XYZ(ii+1))
          Rcom_Group(2,j,k) = dble(XYZ(ii+2))
          Rcom_Group(3,j,k) = dble(XYZ(ii+3))
          ii = ii + 3
        end do
      end do

      CellL(1) = dble(Box(1))
      CellL(2) = dble(Box(2))
      CellL(3) = dble(Box(3))

    end if

    call BcastRL(iircom)

! ## intramolecular 

    do k = Nas, nmol, NProcs

      do l = 1, nbond
        ii = ibond(l)
        jj = jbond(l)
        Rij(:) = Rcom_Group(:,ii,k) - Rcom_Group(:,jj,k)
        R1 = sqrt(dot_product(Rij,Rij))
        ir = int(R1*100.) + 1
        Sv(:,l) = Rij(:)/R1
        DisBondL(bondtype(l),ir) = DisBondL(bondtype(l),ir) + 1
      end do

      do l = 1, nangle
        ii = anglebond(1,l)
        jj = anglebond(2,l)
        S1(:) = Sv(:,ii)*diranglebond(1,l)
        S2(:) = Sv(:,jj)*diranglebond(2,l)
        cst = dot_product(S1, S2)
        t1  = acos(cst)*180.d0/pi
        it  = int(t1) + 1
        DisAngle(angletype(l),it) = DisAngle(angletype(l),it) + 1
      end do

    end do

! ## intermolecular

    ii = 0
    do ix = 1, 2
      do iy = 1, 2
        do iz = 1, 2
          do k = 1, nmol
            ii = ii + 1
            do j = 1, natm
              Rext(1,j,ii)=Rcom_Group(1,j,k) + CellL(1)*(ix-1.5d0)
              Rext(2,j,ii)=Rcom_Group(2,j,k) + CellL(2)*(iy-1.5d0)
              Rext(3,j,ii)=Rcom_Group(3,j,k) + CellL(3)*(iz-1.5d0)
            end do
          end do
        end do
      end do
    end do

    if(ii/=nmolext) write(*,*) 'ERROR'

    CellL = CellL*2.d0
    InvCL = 1.d0/CellL

    do k = Nas, nmolext, NProcs
      do kk = k-1, 1, -2
        do j = 1, natm
          do jj = 1, natm
            nn = itype(j)
            ii= itype(jj)
            Rij(:) = Rext(:,j,k) - Rext(:,jj,kk)
            Rij = Rij - nint(InvCL*Rij)*CellL
            R2 = dot_product(Rij,Rij)
            if(R2>400.) cycle
            R1 = sqrt(R2)
            ir = int(R1*10.d0)+1
            gr(nn,ii,ir) = gr(nn,ii,ir) + 1
          end do
        end do
      end do
      do kk = k+1, nmolext, 2
        do j = 1, natm
          do jj = 1, natm
            nn = itype(j)
            ii= itype(jj)
            Rij(:) = Rext(:,j,k) - Rext(:,jj,kk)
            Rij = Rij - nint(InvCL*Rij)*CellL
            R2 = dot_product(Rij,Rij)
            if(R2>400.) cycle
            R1 = sqrt(R2)
            ir = int(R1*10.d0)+1
            gr(nn,ii,ir) = gr(nn,ii,ir) + 1
          end do
        end do
      end do
    end do

    Vol = Vol + CellL(1)*CellL(2)*CellL(3)

  end do

! ----------------------------------------------------------------------

  call SumUPdata(iibond, iiangl, iigofr)

  Vol = Vol / Nstep

  if(QMaster) then

  do i = 1, nty
    do j = i, nty

      write(Filename,'(5a)') 'gr_',trim(TypeName(i)),'-',trim(TypeName(j)),'.dat'
      open(2,file=trim(Filename))

      do k = 1, 200
        drr = (k-0.5)*0.1d0
        qk = Vol / (nmolext * numtypeinmol(j) * 4.d0 * pi * drr * drr * 0.1d0)

        g11 = dble(gr(i,j,k)+gr(j,i,k))*qk/(Nstep*nmolext*numtypeinmol(i))

        write(2,'(f7.2,f12.6)') drr, g11
      end do

      close(2)

    end do
  end do

  allocate(numbond(nbondtype))
  allocate(numangle(nangletype))
  do i = 1, nbond
    numbond(bondtype(i)) = numbond(bondtype(i)) + 1
  end do
  do i = 1, nangle
    numangle(angletype(i)) = numangle(angletype(i)) + 1
  end do

  do i = 1, nbondtype
    write(Filename,'(3a)') 'Bond_',trim(namebondtype(i)),'.dat'
    open(11,file=trim(Filename))
    do j = 150, 500
      drr = (j-0.5)*0.01d0
      g11 = dble(DisBondL(i,j))/(nmol*numbond(i)*Nstep)*100.
      write(11,'(f7.2,f12.6)') drr, g11
    end do
    close(11)
  end do

  do i = 1, nangletype
    write(Filename,'(3a)') 'Angle_',trim(nameangletype(i)),'.dat'
    open(11,file=trim(Filename))
    do j = 1, 180
      drr = (j-0.5)
      g11 = dble(DisAngle(i,j))/(nmol*numangle(i)*Nstep)*100.
      write(11,'(f7.2,f12.6)') drr, g11
    end do
    close(11)
  end do

  call f77_molfile_finish_

  end if

end program para_cgr


!######################################################################
!######################################################################


subroutine SetupMPI

use CommonCGR

implicit none

include 'mpif.h'

   call Mpi_Init(ierror)
   call Mpi_Comm_Size(Mpi_Comm_World, NProcs, ierror)
   call Mpi_Comm_Rank(Mpi_Comm_World, MyRank, ierror)

   QMaster = .False.
   if( MyRank == 0 ) QMaster = .True.

end subroutine SetupMPI


!######################################################################
!######################################################################


subroutine FinMPI

use CommonCGR

implicit none

include 'mpif.h'

   call Mpi_Barrier(Mpi_Comm_World, ierror)

   call Mpi_Finalize(ierror)

end subroutine FinMPI


!######################################################################
!######################################################################


subroutine BcastRL(Nall)

use CommonCGR

implicit none

include 'mpif.h'

integer :: Nall, ii, i, j, k
real(8), dimension(Nall) :: Buff1

   if(QMaster) then
     ii = 0
     do i = 1, nmol
       do j = 1, natm
         do k = 1, 3
           ii = ii + 1
           Buff1(ii) = Rcom_Group(k,j,i)
         end do
       end do
     end do
     do i = 1, 3
       ii = ii + 1
       Buff1(ii) = CellL(i)
     end do
   end if

   call Mpi_Bcast( Buff1, Nall, Mpi_Double_Precision, 0, &
   &               Mpi_Comm_World, ierror )

   if(.not.QMaster) then
     ii = 0
     do i = 1, nmol
       do j = 1, natm
         do k = 1, 3
           ii = ii + 1
           Rcom_Group(k,j,i) = Buff1(ii)
         end do
       end do
     end do
     do i = 1, 3
       ii = ii + 1
       CellL(i) = Buff1(ii)
     end do
   end if

end subroutine BcastRL


!######################################################################
!######################################################################


subroutine SumUPdata( Nall1, Nall2, Nall3 )

use CommonCGR

implicit none

include 'mpif.h'

integer :: i, j, k, ii
integer :: Nall1, Nall2, Nall3
real(8), dimension(Nall1) :: Buffb1, Buffb2
real(8), dimension(Nall2) :: Buffa1, Buffa2
integer, dimension(Nall3) :: Buffg1, Buffg2

! ## ---------

   ii = 0
   do i = 1, nbondtype
     do j = 150, 500
       ii = ii + 1
       Buffb1(ii) = DisBondL(i,j)
     end do
   end do

   call Mpi_Reduce(Buffb1,Buffb2,Nall1,Mpi_Double_Precision,Mpi_Sum, &
   &               0,Mpi_Comm_World,ierror)

   if(QMaster) then
     ii = 0
     do i = 1, nbondtype
       do j = 150, 500
         ii = ii + 1
         DisBondL(i,j) = Buffb2(ii)
       end do
     end do
   end if

! ## ---------

   ii = 0
   do i = 1, nangletype
     do j = 1, 180
       ii = ii + 1
       Buffa1(ii) = DisAngle(i,j)
     end do
   end do

   call Mpi_Reduce(Buffa1,Buffa2,Nall2,Mpi_Double_Precision,Mpi_Sum, &
   &               0,Mpi_Comm_World,ierror)

   if(QMaster) then
     ii = 0
     do i = 1, nangletype
       do j = 1, 180
         ii = ii + 1
         DisAngle(i,j) = Buffa2(ii)
       end do
     end do
   end if

! ## ---------

   ii = 0
   do i = 1, nty
     do j = 1, nty
       do k = 1, 200
         ii = ii + 1
         Buffg1(ii) = gr(i,j,k)
       end do
     end do
   end do

   call Mpi_Reduce(Buffg1,Buffg2,Nall3,Mpi_Integer,Mpi_Sum, &
   &               0,Mpi_Comm_World,ierror)

   if(QMaster) then
     ii = 0
     do i = 1, nty
       do j = 1, nty
         do k = 1, 200
           ii = ii + 1
           gr(i,j,k) = Buffg2(ii)
         end do
       end do
     end do
   end if

end subroutine SumUPdata