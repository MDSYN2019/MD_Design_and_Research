#include <iostream>
#include <iomanip>
#include <vector>
#include <string>
#include <cassert>
#include <cmath>
#include <array>
#include <cassert>

// Custom headers

#include "mpi.h"
#include <gsl/gsl_errno.h>
#include <gsl/gsl_spline.h>
#include "MPI_IO.hpp"

//#include "MPI_broadcast.hpp"
//#include "MPI_functions.hpp"

/*
  
 */

template <class T> class placeHolder {
public:
  /*
    The role of any construct is to ensure that the object is correcltl
    initialized. 

    For the constructor to take a size, we will allocate the given amount 

   */
  placeHolder() { create(); }
  explicit placeHolder(std::size_t n, const T& val = T()) {create(n, val);}  
  // iterators
  typedef T* iterator;
  typedef const T* const_iterator;
  typedef T value_type;
  typedef std::ptrdiff_t difference_type;
  typedef T& reference;
  typedef const T& const_reference;
};

typedef struct {
  double a;
  double b;
  int c;
} myStruct;

void MPIGetData(float*  a_ptr, float*  b_ptr, int* n_ptr , int my_rank) {
    char  buffer[100];  /* Store data in buffer        */
    int   position;     /* Keep track of where data is */                            /*     in the buffer           */
    if (my_rank == 0){
      std::cout << "Enter a, b, and n\n";
        scanf("%f %f %d", a_ptr, b_ptr, n_ptr);
        /* Now pack the data into buffer.  Position = 0 */
        /* says start at beginning of buffer.           */
        position = 0;  
        /* Position is in/out */
        MPI_Pack(a_ptr, 1, MPI_FLOAT, buffer, 100, &position, MPI_COMM_WORLD);
        /* Position has been incremented: it now refer- */
        /* ences the first free location in buffer.     */
        MPI_Pack(b_ptr, 1, MPI_FLOAT, buffer, 100, &position, MPI_COMM_WORLD);
        /* Position has been incremented again. */
        MPI_Pack(n_ptr, 1, MPI_INT, buffer, 100, &position, MPI_COMM_WORLD);
        /* Position has been incremented again. */
        /* Now broadcast contents of buffer */
        MPI_Bcast(buffer, 100, MPI_PACKED, 0, MPI_COMM_WORLD);
    } else {
      MPI_Bcast(buffer, 100, MPI_PACKED, 0, MPI_COMM_WORLD);
        /* Now unpack the contents of buffer */
        position = 0;
        MPI_Unpack(buffer, 100, &position, a_ptr, 1, MPI_FLOAT, MPI_COMM_WORLD);
        /* Once again position has been incremented: */
        /* it now references the beginning of b.     */
        MPI_Unpack(buffer, 100, &position, b_ptr, 1, MPI_FLOAT, MPI_COMM_WORLD);
        MPI_Unpack(buffer, 100, &position, n_ptr, 1, MPI_INT, MPI_COMM_WORLD);
    }
}

void Build_mpi_type ( double* a_p,  double* b_p, int* n_p, myStruct* stct, MPI_Datatype* input_mpi_t_p) {
  int array_of_blocklengths[3] = {1,1,1};
  MPI_Datatype array_of_types[3] = {MPI_DOUBLE, MPI_DOUBLE, MPI_INT};
  MPI_Aint array_of_displacements[3] = {0};
  MPI_Aint a_addr, b_addr, n_addr;

  (*stct).a = *a_p;
  (*stct).b = *b_p;
  (*stct).c = *n_p;
  
  MPI_Get_address(&stct->a, &a_addr);
  MPI_Get_address(&stct->b, &b_addr);
  MPI_Get_address(&stct->c, &n_addr);
  
  array_of_displacements[1] = b_addr - a_addr;
  array_of_displacements[2] = n_addr - a_addr;
  MPI_Type_create_struct(3, array_of_blocklengths, array_of_displacements, array_of_types, input_mpi_t_p);
  MPI_Type_commit(input_mpi_t_p);
}

void Get_Input(int my_rank, int comm_sz,  double* a_p,  double* b_p, int* n_p, myStruct* myStruct) {
  MPI_Datatype input_mpi_t;  
  Build_mpi_type(a_p, b_p, n_p, myStruct, &input_mpi_t);
  if (my_rank == 0) {
    MPI_Bcast(myStruct, 1, input_mpi_t, 0, MPI_COMM_WORLD);
  }
  MPI_Type_free(&input_mpi_t);
}

std::vector<int> bb;
myStruct exampleDatatype;
double a, b;
int c;

int main(int argc, char** argv) {
  int my_rank, comm_sz;
  MPI_Init(NULL, NULL);
  MPI_Comm_size(MPI_COMM_WORLD, &comm_sz);
  MPI_Comm_rank(MPI_COMM_WORLD, &my_rank);

  std::cout << "Enter a, b and n \n";
  scanf("%lf %lf %d", &a, &b, &c);
  Get_Input(0, comm_sz, &a, &b, &c, &exampleDatatype);

  for (int q = 1; q < comm_sz; q++) {
    std::cout << q << " " << exampleDatatype.a << " " << exampleDatatype.b << " " << exampleDatatype.c << std::endl;
  }

  MPI_Finalize();


  int idfdf;
   double xi, yi, x[10], y[10];

  std::cout << "#m=0,S=17\n";

  for (int idfdf = 0; idfdf < 10; idfdf++)
    {
      x[idfdf] = idfdf + 0.5 * sin (idfdf);
      y[idfdf] = idfdf + cos (idfdf * idfdf);
      std::cout << "%g %g\n" <<  x[idfdf] << y[idfdf];
    }

  std::cout << "#m=1,S=0\n";

  
  gsl_interp_accel *acc = gsl_interp_accel_alloc ();
  gsl_spline *spline = gsl_spline_alloc (gsl_interp_cspline, 10);
  gsl_spline_init (spline, x, y, 10);

  for (xi = x[0]; xi < x[9]; xi += 0.01) {
    yi = gsl_spline_eval (spline, xi, acc);
    std::cout << "%g %g\n" <<  xi <<  yi;
  }

  gsl_spline_free (spline);
  gsl_interp_accel_free (acc);
  
  return 0;
}
