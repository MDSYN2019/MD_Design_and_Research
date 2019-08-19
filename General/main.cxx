#include "QatGenericFunctions/Variable.h" 
#include "QatGenericFunctions/Sin.h"
#include "QatGenericFunctions/AbsFunction.h" 

#include <iostream>
#include <iomanip> // has the setprecision
#include <cstdlib>
#include <cmath>
#include <cstdio>
#include <limits>
#include <omp.h>

// Eigen Library

#include "Eigen/Dense"

// cppunit libraries

#include <cppunit/CompilerOutputter.h>
#include <cppunit/extensions/TestFactoryRegistry.h>
#include <cppunit/ui/text/TestRunner.h>

//#include <eigen3/Eigen/Core>

#include "openmp1.hpp"
#include "openmp_LA.hpp"
//#include "openmp_dynamicbindingandinheritance.hpp"
//#include "Student_info.h"


// Non-standard namespaces
// Boost

#include <boost/chrono.hpp>

// namespace definitions

using namespace Eigen; // eigen 
using namespace boost::chrono;  // chrono

// QAT headers

//#include "Variable.h"
//#include "Argument.h"

double f (int i) {
  int j, start = i * (i + 1) / 2, finish = start +  i;
  double return_val = 0.0;
  for (j = start; j <= finish; j++) {
    return_val += sin(j);
  }
  return return_val;
}

/*
void A() {

  
  Matrix2f A;
  A << 1, 2, 2, 3;

   SelfAdjointEigenSolver<Matrix2f> eigensolver(A);
   if (eigensolver.info() != Success) abort();

   std::cout << "The eigenvalues of A are:\n" << eigensolver.eigenvalues() << std::endl;
   std::cout << "Here's a matrix whose columns are eigenvectors of A \n"
        << "corresponding to these eigenvalues:\n"
	     << eigensolver.eigenvectors() << std::endl;

   SYN_Mat<double> mat1(10, 10, 10);
   SYN_Mat<double> mat2(10, 10, 10);
   SYN_Mat<double> mat3 = mat1 + mat2;

   for (int i = 0; i < mat3.get_rows(); i++) {
     for (int j = 0; j < mat3.get_rows(); j++) {
       std::cout << mat3(i,j) << ", "; 
     }
     std::cout << std::endl;
   } 
}

*/

//OMP AA(5);
//using namespace Genfun;

// Matrix2d a;
//  a << 1, 2,
//       3, 4;
//  MatrixXd b(2,2);
//  b << 2, 3,
//       1, 4;
//  std::cout << "a + b =\n" << a + b << std::endl;

  // Computing the inverse and the determinant

//  Matrix3f A;
//  A << 1, 2, 1,
//    2, 1, 0,
//    -1, 1, 2;
  
// std::cout << "Here is the matrix A:\n" << A << std::endl;
//std::cout << "The determinant of A is " << A.determinant() << std::endl;
// std::cout << "The inverse of A is:\n" << A.inverse() << std::endl;
//MatrixXf p(3,3);
//p << 12, -51, 4,
//     6 , 167 ,-68,
//     -4, 24 , -41;

// A local class - one where there is a class inside the function
{
Genfun::Sin sin;
Genfun::GENFUNCTION f=(1 + sin)/2;
}

main (int argc, char **argv) {

  
  // Major built-in datatypes
  Eigen::VectorXd Y(2);
  Y(0) = 1.0;
  Y(1) = 3.0;

  Genfun::Variable X;
  Genfun::Sin sin;
  std::cout << X(3.14) << std::endl;

  /*    
  std::vector<Student_info> students;
  Student_info record;
  std::string::size_type maxlen = 0;


  std::cout << system_clock::now() << std::endl; 

  // read and store the data
  while (record.read(std::cin)) {
    maxlen = std::max(maxlen, record.name().size());
    students.push_back(record);
  }
  */

}
