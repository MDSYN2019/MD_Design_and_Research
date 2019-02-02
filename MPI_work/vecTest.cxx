#include <vector>
#include <iostream>
#include <iterator>

std::vector <int> vec;          // a global vector of ints

template<typename T>

class vector_element {
public:
    vector_element( std::vector<T>& v, std::size_t i )
      : m_container( v ), m_element_index(i)
    { }

    T& operator*() { return m_container[m_element_index]; }
    T* operator->() { return &m_container[m_element_index]; }
private:
    std::vector<T>& m_container;

    std::size_t m_element_index;
};

/*
void f() {
   vec.push_back( 1 );    // add to the global vector
   vector <int>::iterator it = vec.begin();
   * it = 2;              // change what was 1 to 2
   int * p = &(*it);      // get pointer to first element
   * p = 3;               // change what was 2 to 3
}
*/

int main() {
  vec.push_back( 1 );    // add to the global vector
  vec.push_back( 2 );    // add to the global vector
  int *a;
  int *b;
  std::vector <int>::iterator it = vec.begin();
  int * p = &(*it);      // get pointer to first element
  a = &vec[0];
  b = &vec[1];
  int c = b - a;
  
  std::cout << a << " " << b << " " << c << std::endl;
  return 0 ;
   
}