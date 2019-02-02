//#include "Mat.h"
#include <iostream>

#include <Eigen/Dense>


int main(int argc, char **argv) {

  
  Eigen::MatrixXd p(2,2);

  p(0,0) = 3;
  p(1,0) = 3;
  p(0,1) = 3;
  p(1,1) = 3;
  
  std::cout << p.sum() << std::endl;
  /*
  QSMatrix<double> mat1(10,10,1.0);
  QSMatrix<double> mat2(10,10,2.0);
  QSMatrix<double> mat3 = mat1 + mat2;

  for (int i = 0; i < mat3.get_rows(); i++) {
    for (int j = 0; k < mat3.get_cols(); j++) {
      std::cout << mat3(i,j) << ",";    
    }
    std::cout << std::endl;
  }


  Eigen::Matrix3d p;
  */
  
  return 0;
  
}