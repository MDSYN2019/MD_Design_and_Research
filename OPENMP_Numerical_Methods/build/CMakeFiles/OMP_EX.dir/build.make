# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/oohnohnoh1/Desktop/GIT/MD_Design_and_Research/OPENMP_Numerical_Methods

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/oohnohnoh1/Desktop/GIT/MD_Design_and_Research/OPENMP_Numerical_Methods/build

# Include any dependencies generated for this target.
include CMakeFiles/OMP_EX.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/OMP_EX.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/OMP_EX.dir/flags.make

CMakeFiles/OMP_EX.dir/main.cxx.o: CMakeFiles/OMP_EX.dir/flags.make
CMakeFiles/OMP_EX.dir/main.cxx.o: ../main.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/oohnohnoh1/Desktop/GIT/MD_Design_and_Research/OPENMP_Numerical_Methods/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/OMP_EX.dir/main.cxx.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/OMP_EX.dir/main.cxx.o -c /home/oohnohnoh1/Desktop/GIT/MD_Design_and_Research/OPENMP_Numerical_Methods/main.cxx

CMakeFiles/OMP_EX.dir/main.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OMP_EX.dir/main.cxx.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/oohnohnoh1/Desktop/GIT/MD_Design_and_Research/OPENMP_Numerical_Methods/main.cxx > CMakeFiles/OMP_EX.dir/main.cxx.i

CMakeFiles/OMP_EX.dir/main.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OMP_EX.dir/main.cxx.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/oohnohnoh1/Desktop/GIT/MD_Design_and_Research/OPENMP_Numerical_Methods/main.cxx -o CMakeFiles/OMP_EX.dir/main.cxx.s

CMakeFiles/OMP_EX.dir/main.cxx.o.requires:

.PHONY : CMakeFiles/OMP_EX.dir/main.cxx.o.requires

CMakeFiles/OMP_EX.dir/main.cxx.o.provides: CMakeFiles/OMP_EX.dir/main.cxx.o.requires
	$(MAKE) -f CMakeFiles/OMP_EX.dir/build.make CMakeFiles/OMP_EX.dir/main.cxx.o.provides.build
.PHONY : CMakeFiles/OMP_EX.dir/main.cxx.o.provides

CMakeFiles/OMP_EX.dir/main.cxx.o.provides.build: CMakeFiles/OMP_EX.dir/main.cxx.o


# Object files for target OMP_EX
OMP_EX_OBJECTS = \
"CMakeFiles/OMP_EX.dir/main.cxx.o"

# External object files for target OMP_EX
OMP_EX_EXTERNAL_OBJECTS =

OMP_EX: CMakeFiles/OMP_EX.dir/main.cxx.o
OMP_EX: CMakeFiles/OMP_EX.dir/build.make
OMP_EX: src/libsrc.a
OMP_EX: /home/oohnohnoh1/anaconda3/lib/libmpichcxx.so
OMP_EX: /home/oohnohnoh1/anaconda3/lib/libmpich.so
OMP_EX: /home/oohnohnoh1/anaconda3/lib/libopa.so
OMP_EX: /home/oohnohnoh1/anaconda3/lib/libmpl.so
OMP_EX: /usr/lib/x86_64-linux-gnu/librt.so
OMP_EX: /usr/lib/x86_64-linux-gnu/libpthread.so
OMP_EX: libgsllib.a
OMP_EX: /usr/lib/gcc/x86_64-linux-gnu/7/libgomp.so
OMP_EX: /usr/lib/x86_64-linux-gnu/libpthread.so
OMP_EX: CMakeFiles/OMP_EX.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/oohnohnoh1/Desktop/GIT/MD_Design_and_Research/OPENMP_Numerical_Methods/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable OMP_EX"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/OMP_EX.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/OMP_EX.dir/build: OMP_EX

.PHONY : CMakeFiles/OMP_EX.dir/build

CMakeFiles/OMP_EX.dir/requires: CMakeFiles/OMP_EX.dir/main.cxx.o.requires

.PHONY : CMakeFiles/OMP_EX.dir/requires

CMakeFiles/OMP_EX.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/OMP_EX.dir/cmake_clean.cmake
.PHONY : CMakeFiles/OMP_EX.dir/clean

CMakeFiles/OMP_EX.dir/depend:
	cd /home/oohnohnoh1/Desktop/GIT/MD_Design_and_Research/OPENMP_Numerical_Methods/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/oohnohnoh1/Desktop/GIT/MD_Design_and_Research/OPENMP_Numerical_Methods /home/oohnohnoh1/Desktop/GIT/MD_Design_and_Research/OPENMP_Numerical_Methods /home/oohnohnoh1/Desktop/GIT/MD_Design_and_Research/OPENMP_Numerical_Methods/build /home/oohnohnoh1/Desktop/GIT/MD_Design_and_Research/OPENMP_Numerical_Methods/build /home/oohnohnoh1/Desktop/GIT/MD_Design_and_Research/OPENMP_Numerical_Methods/build/CMakeFiles/OMP_EX.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/OMP_EX.dir/depend

