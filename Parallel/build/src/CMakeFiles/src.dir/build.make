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
CMAKE_SOURCE_DIR = /home/oohnohnoh1/Desktop/GIT/Research/Parallel

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build

# Include any dependencies generated for this target.
include src/CMakeFiles/src.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/src.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/src.dir/flags.make

src/CMakeFiles/src.dir/openmp1.cxx.o: src/CMakeFiles/src.dir/flags.make
src/CMakeFiles/src.dir/openmp1.cxx.o: ../src/openmp1.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object src/CMakeFiles/src.dir/openmp1.cxx.o"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/src.dir/openmp1.cxx.o -c /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src/openmp1.cxx

src/CMakeFiles/src.dir/openmp1.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/src.dir/openmp1.cxx.i"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src/openmp1.cxx > CMakeFiles/src.dir/openmp1.cxx.i

src/CMakeFiles/src.dir/openmp1.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/src.dir/openmp1.cxx.s"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src/openmp1.cxx -o CMakeFiles/src.dir/openmp1.cxx.s

src/CMakeFiles/src.dir/openmp1.cxx.o.requires:

.PHONY : src/CMakeFiles/src.dir/openmp1.cxx.o.requires

src/CMakeFiles/src.dir/openmp1.cxx.o.provides: src/CMakeFiles/src.dir/openmp1.cxx.o.requires
	$(MAKE) -f src/CMakeFiles/src.dir/build.make src/CMakeFiles/src.dir/openmp1.cxx.o.provides.build
.PHONY : src/CMakeFiles/src.dir/openmp1.cxx.o.provides

src/CMakeFiles/src.dir/openmp1.cxx.o.provides.build: src/CMakeFiles/src.dir/openmp1.cxx.o


src/CMakeFiles/src.dir/openmp2.cxx.o: src/CMakeFiles/src.dir/flags.make
src/CMakeFiles/src.dir/openmp2.cxx.o: ../src/openmp2.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/CMakeFiles/src.dir/openmp2.cxx.o"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/src.dir/openmp2.cxx.o -c /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src/openmp2.cxx

src/CMakeFiles/src.dir/openmp2.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/src.dir/openmp2.cxx.i"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src/openmp2.cxx > CMakeFiles/src.dir/openmp2.cxx.i

src/CMakeFiles/src.dir/openmp2.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/src.dir/openmp2.cxx.s"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src/openmp2.cxx -o CMakeFiles/src.dir/openmp2.cxx.s

src/CMakeFiles/src.dir/openmp2.cxx.o.requires:

.PHONY : src/CMakeFiles/src.dir/openmp2.cxx.o.requires

src/CMakeFiles/src.dir/openmp2.cxx.o.provides: src/CMakeFiles/src.dir/openmp2.cxx.o.requires
	$(MAKE) -f src/CMakeFiles/src.dir/build.make src/CMakeFiles/src.dir/openmp2.cxx.o.provides.build
.PHONY : src/CMakeFiles/src.dir/openmp2.cxx.o.provides

src/CMakeFiles/src.dir/openmp2.cxx.o.provides.build: src/CMakeFiles/src.dir/openmp2.cxx.o


src/CMakeFiles/src.dir/openmp_LA.cxx.o: src/CMakeFiles/src.dir/flags.make
src/CMakeFiles/src.dir/openmp_LA.cxx.o: ../src/openmp_LA.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object src/CMakeFiles/src.dir/openmp_LA.cxx.o"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/src.dir/openmp_LA.cxx.o -c /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src/openmp_LA.cxx

src/CMakeFiles/src.dir/openmp_LA.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/src.dir/openmp_LA.cxx.i"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src/openmp_LA.cxx > CMakeFiles/src.dir/openmp_LA.cxx.i

src/CMakeFiles/src.dir/openmp_LA.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/src.dir/openmp_LA.cxx.s"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src/openmp_LA.cxx -o CMakeFiles/src.dir/openmp_LA.cxx.s

src/CMakeFiles/src.dir/openmp_LA.cxx.o.requires:

.PHONY : src/CMakeFiles/src.dir/openmp_LA.cxx.o.requires

src/CMakeFiles/src.dir/openmp_LA.cxx.o.provides: src/CMakeFiles/src.dir/openmp_LA.cxx.o.requires
	$(MAKE) -f src/CMakeFiles/src.dir/build.make src/CMakeFiles/src.dir/openmp_LA.cxx.o.provides.build
.PHONY : src/CMakeFiles/src.dir/openmp_LA.cxx.o.provides

src/CMakeFiles/src.dir/openmp_LA.cxx.o.provides.build: src/CMakeFiles/src.dir/openmp_LA.cxx.o


src/CMakeFiles/src.dir/MPI_broadcast.cxx.o: src/CMakeFiles/src.dir/flags.make
src/CMakeFiles/src.dir/MPI_broadcast.cxx.o: ../src/MPI_broadcast.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object src/CMakeFiles/src.dir/MPI_broadcast.cxx.o"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/src.dir/MPI_broadcast.cxx.o -c /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src/MPI_broadcast.cxx

src/CMakeFiles/src.dir/MPI_broadcast.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/src.dir/MPI_broadcast.cxx.i"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src/MPI_broadcast.cxx > CMakeFiles/src.dir/MPI_broadcast.cxx.i

src/CMakeFiles/src.dir/MPI_broadcast.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/src.dir/MPI_broadcast.cxx.s"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src/MPI_broadcast.cxx -o CMakeFiles/src.dir/MPI_broadcast.cxx.s

src/CMakeFiles/src.dir/MPI_broadcast.cxx.o.requires:

.PHONY : src/CMakeFiles/src.dir/MPI_broadcast.cxx.o.requires

src/CMakeFiles/src.dir/MPI_broadcast.cxx.o.provides: src/CMakeFiles/src.dir/MPI_broadcast.cxx.o.requires
	$(MAKE) -f src/CMakeFiles/src.dir/build.make src/CMakeFiles/src.dir/MPI_broadcast.cxx.o.provides.build
.PHONY : src/CMakeFiles/src.dir/MPI_broadcast.cxx.o.provides

src/CMakeFiles/src.dir/MPI_broadcast.cxx.o.provides.build: src/CMakeFiles/src.dir/MPI_broadcast.cxx.o


src/CMakeFiles/src.dir/statistics.cxx.o: src/CMakeFiles/src.dir/flags.make
src/CMakeFiles/src.dir/statistics.cxx.o: ../src/statistics.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object src/CMakeFiles/src.dir/statistics.cxx.o"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/src.dir/statistics.cxx.o -c /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src/statistics.cxx

src/CMakeFiles/src.dir/statistics.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/src.dir/statistics.cxx.i"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src/statistics.cxx > CMakeFiles/src.dir/statistics.cxx.i

src/CMakeFiles/src.dir/statistics.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/src.dir/statistics.cxx.s"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src/statistics.cxx -o CMakeFiles/src.dir/statistics.cxx.s

src/CMakeFiles/src.dir/statistics.cxx.o.requires:

.PHONY : src/CMakeFiles/src.dir/statistics.cxx.o.requires

src/CMakeFiles/src.dir/statistics.cxx.o.provides: src/CMakeFiles/src.dir/statistics.cxx.o.requires
	$(MAKE) -f src/CMakeFiles/src.dir/build.make src/CMakeFiles/src.dir/statistics.cxx.o.provides.build
.PHONY : src/CMakeFiles/src.dir/statistics.cxx.o.provides

src/CMakeFiles/src.dir/statistics.cxx.o.provides.build: src/CMakeFiles/src.dir/statistics.cxx.o


# Object files for target src
src_OBJECTS = \
"CMakeFiles/src.dir/openmp1.cxx.o" \
"CMakeFiles/src.dir/openmp2.cxx.o" \
"CMakeFiles/src.dir/openmp_LA.cxx.o" \
"CMakeFiles/src.dir/MPI_broadcast.cxx.o" \
"CMakeFiles/src.dir/statistics.cxx.o"

# External object files for target src
src_EXTERNAL_OBJECTS =

src/libsrc.a: src/CMakeFiles/src.dir/openmp1.cxx.o
src/libsrc.a: src/CMakeFiles/src.dir/openmp2.cxx.o
src/libsrc.a: src/CMakeFiles/src.dir/openmp_LA.cxx.o
src/libsrc.a: src/CMakeFiles/src.dir/MPI_broadcast.cxx.o
src/libsrc.a: src/CMakeFiles/src.dir/statistics.cxx.o
src/libsrc.a: src/CMakeFiles/src.dir/build.make
src/libsrc.a: src/CMakeFiles/src.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX static library libsrc.a"
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && $(CMAKE_COMMAND) -P CMakeFiles/src.dir/cmake_clean_target.cmake
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/src.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/src.dir/build: src/libsrc.a

.PHONY : src/CMakeFiles/src.dir/build

src/CMakeFiles/src.dir/requires: src/CMakeFiles/src.dir/openmp1.cxx.o.requires
src/CMakeFiles/src.dir/requires: src/CMakeFiles/src.dir/openmp2.cxx.o.requires
src/CMakeFiles/src.dir/requires: src/CMakeFiles/src.dir/openmp_LA.cxx.o.requires
src/CMakeFiles/src.dir/requires: src/CMakeFiles/src.dir/MPI_broadcast.cxx.o.requires
src/CMakeFiles/src.dir/requires: src/CMakeFiles/src.dir/statistics.cxx.o.requires

.PHONY : src/CMakeFiles/src.dir/requires

src/CMakeFiles/src.dir/clean:
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src && $(CMAKE_COMMAND) -P CMakeFiles/src.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/src.dir/clean

src/CMakeFiles/src.dir/depend:
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/oohnohnoh1/Desktop/GIT/Research/Parallel /home/oohnohnoh1/Desktop/GIT/Research/Parallel/src /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/src/CMakeFiles/src.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/src.dir/depend

