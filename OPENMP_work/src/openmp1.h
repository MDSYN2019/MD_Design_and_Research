#ifndef _OPENMP1
#define _OPENMP1

#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <omp.h>

/*
  
As we noted earlier, we'll usually specifiy the number of threads on the command line, so we'll modify our parllalel directive ws with the 
num_threads clause. A clause in OpenMP is just some text that modifies a directive. The num_thereads clause 
can be aded to a parallel directive. 

It allows the programmer to speucfy the number of threads that should be execute the following block;

# prgama omp parlallel nun)threads(thread)count)

/*
What actulaly happens when the program gets to the parallel directive? Prior to the parallel directive, the program us 
using a single thread, the process started when the pgoraam started execution. When the pgoram 
*/

 */


class OMP {
public:
  OMP();
  ~OMP();  
  int input;
  
 private:
  int my_rank; // 
  int thread_count;
};

#endif
  