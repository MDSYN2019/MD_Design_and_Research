**==store.spg  processed by SPAG 4.52O  at 16:41 on 22 Jul 1996
 
 
      SUBROUTINE STORE(Iout, Dr)
c     writes configuration to disk
      IMPLICIT NONE
      INCLUDE 'parameter.inc'
      INCLUDE 'conf.inc'
      INCLUDE 'system.inc'
      INTEGER Iout, i
      DOUBLE PRECISION Dr
 
      WRITE (Iout, *) BOXX, BOXY, BOXZ
      WRITE (Iout, *) NPART
      WRITE (Iout, *) Dr
      DO i = 1, NPART
         WRITE (Iout, *) X(i), Y(i), Z(i)
      END DO
      REWIND (Iout)
      RETURN
      END
