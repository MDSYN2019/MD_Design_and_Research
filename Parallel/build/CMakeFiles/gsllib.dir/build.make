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
include CMakeFiles/gsllib.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/gsllib.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/gsllib.dir/flags.make

CMakeFiles/gsllib.dir/main.cxx.o: CMakeFiles/gsllib.dir/flags.make
CMakeFiles/gsllib.dir/main.cxx.o: ../main.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/gsllib.dir/main.cxx.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/gsllib.dir/main.cxx.o -c /home/oohnohnoh1/Desktop/GIT/Research/Parallel/main.cxx

CMakeFiles/gsllib.dir/main.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/gsllib.dir/main.cxx.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/oohnohnoh1/Desktop/GIT/Research/Parallel/main.cxx > CMakeFiles/gsllib.dir/main.cxx.i

CMakeFiles/gsllib.dir/main.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/gsllib.dir/main.cxx.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/oohnohnoh1/Desktop/GIT/Research/Parallel/main.cxx -o CMakeFiles/gsllib.dir/main.cxx.s

CMakeFiles/gsllib.dir/main.cxx.o.requires:

.PHONY : CMakeFiles/gsllib.dir/main.cxx.o.requires

CMakeFiles/gsllib.dir/main.cxx.o.provides: CMakeFiles/gsllib.dir/main.cxx.o.requires
	$(MAKE) -f CMakeFiles/gsllib.dir/build.make CMakeFiles/gsllib.dir/main.cxx.o.provides.build
.PHONY : CMakeFiles/gsllib.dir/main.cxx.o.provides

CMakeFiles/gsllib.dir/main.cxx.o.provides.build: CMakeFiles/gsllib.dir/main.cxx.o


# Object files for target gsllib
gsllib_OBJECTS = \
"CMakeFiles/gsllib.dir/main.cxx.o"

# External object files for target gsllib
gsllib_EXTERNAL_OBJECTS =

libgsllib.a: CMakeFiles/gsllib.dir/main.cxx.o
libgsllib.a: CMakeFiles/gsllib.dir/build.make
libgsllib.a: CMakeFiles/gsllib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libgsllib.a"
	$(CMAKE_COMMAND) -P CMakeFiles/gsllib.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/gsllib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/gsllib.dir/build: libgsllib.a

.PHONY : CMakeFiles/gsllib.dir/build

CMakeFiles/gsllib.dir/requires: CMakeFiles/gsllib.dir/main.cxx.o.requires

.PHONY : CMakeFiles/gsllib.dir/requires

CMakeFiles/gsllib.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/gsllib.dir/cmake_clean.cmake
.PHONY : CMakeFiles/gsllib.dir/clean

CMakeFiles/gsllib.dir/depend:
	cd /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/oohnohnoh1/Desktop/GIT/Research/Parallel /home/oohnohnoh1/Desktop/GIT/Research/Parallel /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build /home/oohnohnoh1/Desktop/GIT/Research/Parallel/build/CMakeFiles/gsllib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/gsllib.dir/depend

