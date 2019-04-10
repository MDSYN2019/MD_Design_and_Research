#include <pybind11/pybind.h>
#include <string>

namespace py = pybind11;

int add (int i, int j) {
  return i + j;
}

struct Pet {
  Pet(const std::string &name) : name(name) {}
  void setName(const std::string &name_) {name = name_;}
  const std::string &getName() const { return name;}
  std::string name;
};

PYBIND11_MODULE(example, m) {
  m.doc() = "pybind11 example plugin";
  m.def("add", &add, "A function which adds two numbers");

  py::class_<Pet>(m, "Pet")
     .def(py::init<const std::string &>())
     .def("setName", &Pet::setName)
     .def("getName", &Pet::getName);

}
