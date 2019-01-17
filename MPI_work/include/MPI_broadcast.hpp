
/*
  Tree structured-program looking at MPI_Broadcast 
  
  A communiation pattern that involves all the processes in a communiator is a 
  collective communication. As a consequence, a collective commmunication involves more 
  than two processes. 

  A broadcast is a collective communcation in which a single process
  sends the same data to every proceess in the communicator.

*/

#ifndef __MPI_BC__
#define __MPI_BC__

#include <iostream>
#include <vector>
#include "mpi.h"

class MPI_BC {
public:
  MPI_BC();
  virtual ~MPI_BC();
  int Ceiling_log2(int);
  void Send(float, float, int, int);
  void Receive(float*, float*, int*, int);
  voud Get_data2(float*, float*, int*, int, int);
  void Get_data2(float*, float*, int*, int);  
private:
  //TODO
};


#endif