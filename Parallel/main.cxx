#include <Eigen/Core>
#include <iostream>
#include <vector>
#include "statistics.h"


//! MPI headers
#include "MPI_broadcast.hpp"
#include "openmp_LA.hpp"
#include "MPI_IO.hpp"

// Accelerated C++
#include "Core.h"

int main(void) {


  
  // MPIInput MPIobj(3,3);
  // MPIobj.getData(&A, &B, &C);
  // Call MPI

  int A, B, C;

  
  // Furst we create the parameter list
  double S = 100.0;
  double K = 100.0;
  double r = 0.05;
  double v = 0.2;
  double T = 1.0;

  ProbDist probdist;
  double call, put;

  call = probdist.call_price(S, K, r, v, T);
  put = probdist.put_price(S, K, r, v, T);

  std::cout << "call_price: " << call << std::endl; 
  std::cout << "Put_price: " << put << std::endl; 

  std::vector<Core> students;
  Core record;
  std::string::size_type maxlen = 0;

  // read and store the data

  while (record.read(std::cin)) {
    maxlen = std::max(maxlen, record.name().size());
    students.push_back(record);
  }

  std::sort(students.begin(), students.end(), compare);

  // write the names and grades

  for (std::vector<Core>::size_type i = 0; i != students.size(); ++i) {
    std::cout << students[i].name() << std::string(maxlen + 1 - students[i].name().size(),  ' ');

    /*
      Exceptions provide a way to react to exception circumstances, like runtime erros, in programs
      by transferring control to special functions called handlers

      To catch exceptions, a portion of code is placed under exception inspection. This is done 
      by enclosing that portion of code in a try-block. When an exceptional circumtance arises within
      that block, an exception is thrown that transfers the control to the exception handler. 

      An exception is thrown by using the throw keyword from inside the try block. Exception 
      handlers are declared with the keyword catch, which must be placed immediately after the try block

     */
    try {
      double final_grade = students[i].grade(); // Core::grade
      std::streamsize prec = std::cout.precision();
      std::cout << std::setprecision(3) << final_grade << std::setprecision(prec) << std::endl;
        
    } catch (std::domain_error e) { // catches the domain error 
      std::cout << e.what() << std::endl; 
    }
  }
  
  return 0;
}
