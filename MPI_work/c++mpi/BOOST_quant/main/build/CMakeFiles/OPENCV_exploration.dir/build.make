# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

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
CMAKE_SOURCE_DIR = /home/noh/Desktop/Program/GIT/CV_Analysis/main

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/noh/Desktop/Program/GIT/CV_Analysis/main/build

# Include any dependencies generated for this target.
include CMakeFiles/OPENCV_exploration.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/OPENCV_exploration.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/OPENCV_exploration.dir/flags.make

CMakeFiles/OPENCV_exploration.dir/main.o: CMakeFiles/OPENCV_exploration.dir/flags.make
CMakeFiles/OPENCV_exploration.dir/main.o: ../main.cxx
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/noh/Desktop/Program/GIT/CV_Analysis/main/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/OPENCV_exploration.dir/main.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/OPENCV_exploration.dir/main.o -c /home/noh/Desktop/Program/GIT/CV_Analysis/main/main.cxx

CMakeFiles/OPENCV_exploration.dir/main.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/OPENCV_exploration.dir/main.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/noh/Desktop/Program/GIT/CV_Analysis/main/main.cxx > CMakeFiles/OPENCV_exploration.dir/main.i

CMakeFiles/OPENCV_exploration.dir/main.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/OPENCV_exploration.dir/main.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/noh/Desktop/Program/GIT/CV_Analysis/main/main.cxx -o CMakeFiles/OPENCV_exploration.dir/main.s

CMakeFiles/OPENCV_exploration.dir/main.o.requires:

.PHONY : CMakeFiles/OPENCV_exploration.dir/main.o.requires

CMakeFiles/OPENCV_exploration.dir/main.o.provides: CMakeFiles/OPENCV_exploration.dir/main.o.requires
	$(MAKE) -f CMakeFiles/OPENCV_exploration.dir/build.make CMakeFiles/OPENCV_exploration.dir/main.o.provides.build
.PHONY : CMakeFiles/OPENCV_exploration.dir/main.o.provides

CMakeFiles/OPENCV_exploration.dir/main.o.provides.build: CMakeFiles/OPENCV_exploration.dir/main.o


# Object files for target OPENCV_exploration
OPENCV_exploration_OBJECTS = \
"CMakeFiles/OPENCV_exploration.dir/main.o"

# External object files for target OPENCV_exploration
OPENCV_exploration_EXTERNAL_OBJECTS =

OPENCV_exploration: CMakeFiles/OPENCV_exploration.dir/main.o
OPENCV_exploration: CMakeFiles/OPENCV_exploration.dir/build.make
OPENCV_exploration: src/libsrc.a
OPENCV_exploration: CMakeFiles/OPENCV_exploration.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/noh/Desktop/Program/GIT/CV_Analysis/main/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable OPENCV_exploration"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/OPENCV_exploration.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/OPENCV_exploration.dir/build: OPENCV_exploration

.PHONY : CMakeFiles/OPENCV_exploration.dir/build

CMakeFiles/OPENCV_exploration.dir/requires: CMakeFiles/OPENCV_exploration.dir/main.o.requires

.PHONY : CMakeFiles/OPENCV_exploration.dir/requires

CMakeFiles/OPENCV_exploration.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/OPENCV_exploration.dir/cmake_clean.cmake
.PHONY : CMakeFiles/OPENCV_exploration.dir/clean

CMakeFiles/OPENCV_exploration.dir/depend:
	cd /home/noh/Desktop/Program/GIT/CV_Analysis/main/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/noh/Desktop/Program/GIT/CV_Analysis/main /home/noh/Desktop/Program/GIT/CV_Analysis/main /home/noh/Desktop/Program/GIT/CV_Analysis/main/build /home/noh/Desktop/Program/GIT/CV_Analysis/main/build /home/noh/Desktop/Program/GIT/CV_Analysis/main/build/CMakeFiles/OPENCV_exploration.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/OPENCV_exploration.dir/depend
