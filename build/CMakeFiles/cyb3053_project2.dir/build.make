# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 4.0

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/homebrew/bin/cmake

# The command to remove a file.
RM = /opt/homebrew/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = "/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2/build"

# Include any dependencies generated for this target.
include CMakeFiles/cyb3053_project2.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/cyb3053_project2.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/cyb3053_project2.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/cyb3053_project2.dir/flags.make

CMakeFiles/cyb3053_project2.dir/codegen:
.PHONY : CMakeFiles/cyb3053_project2.dir/codegen

CMakeFiles/cyb3053_project2.dir/src/main.c.o: CMakeFiles/cyb3053_project2.dir/flags.make
CMakeFiles/cyb3053_project2.dir/src/main.c.o: /Users/holden/Desktop/University\ of\ Tulsa/Spring\ 2025/Operating\ Systems/Projects/Project\ 2/OSProj2/src/main.c
CMakeFiles/cyb3053_project2.dir/src/main.c.o: CMakeFiles/cyb3053_project2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/cyb3053_project2.dir/src/main.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/cyb3053_project2.dir/src/main.c.o -MF CMakeFiles/cyb3053_project2.dir/src/main.c.o.d -o CMakeFiles/cyb3053_project2.dir/src/main.c.o -c "/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2/src/main.c"

CMakeFiles/cyb3053_project2.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/cyb3053_project2.dir/src/main.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2/src/main.c" > CMakeFiles/cyb3053_project2.dir/src/main.c.i

CMakeFiles/cyb3053_project2.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/cyb3053_project2.dir/src/main.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2/src/main.c" -o CMakeFiles/cyb3053_project2.dir/src/main.c.s

CMakeFiles/cyb3053_project2.dir/src/alloc.c.o: CMakeFiles/cyb3053_project2.dir/flags.make
CMakeFiles/cyb3053_project2.dir/src/alloc.c.o: /Users/holden/Desktop/University\ of\ Tulsa/Spring\ 2025/Operating\ Systems/Projects/Project\ 2/OSProj2/src/alloc.c
CMakeFiles/cyb3053_project2.dir/src/alloc.c.o: CMakeFiles/cyb3053_project2.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir="/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/cyb3053_project2.dir/src/alloc.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/cyb3053_project2.dir/src/alloc.c.o -MF CMakeFiles/cyb3053_project2.dir/src/alloc.c.o.d -o CMakeFiles/cyb3053_project2.dir/src/alloc.c.o -c "/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2/src/alloc.c"

CMakeFiles/cyb3053_project2.dir/src/alloc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/cyb3053_project2.dir/src/alloc.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E "/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2/src/alloc.c" > CMakeFiles/cyb3053_project2.dir/src/alloc.c.i

CMakeFiles/cyb3053_project2.dir/src/alloc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/cyb3053_project2.dir/src/alloc.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S "/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2/src/alloc.c" -o CMakeFiles/cyb3053_project2.dir/src/alloc.c.s

# Object files for target cyb3053_project2
cyb3053_project2_OBJECTS = \
"CMakeFiles/cyb3053_project2.dir/src/main.c.o" \
"CMakeFiles/cyb3053_project2.dir/src/alloc.c.o"

# External object files for target cyb3053_project2
cyb3053_project2_EXTERNAL_OBJECTS =

cyb3053_project2: CMakeFiles/cyb3053_project2.dir/src/main.c.o
cyb3053_project2: CMakeFiles/cyb3053_project2.dir/src/alloc.c.o
cyb3053_project2: CMakeFiles/cyb3053_project2.dir/build.make
cyb3053_project2: CMakeFiles/cyb3053_project2.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir="/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2/build/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable cyb3053_project2"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cyb3053_project2.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/cyb3053_project2.dir/build: cyb3053_project2
.PHONY : CMakeFiles/cyb3053_project2.dir/build

CMakeFiles/cyb3053_project2.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cyb3053_project2.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cyb3053_project2.dir/clean

CMakeFiles/cyb3053_project2.dir/depend:
	cd "/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2/build" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2" "/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2" "/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2/build" "/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2/build" "/Users/holden/Desktop/University of Tulsa/Spring 2025/Operating Systems/Projects/Project 2/OSProj2/build/CMakeFiles/cyb3053_project2.dir/DependInfo.cmake" "--color=$(COLOR)"
.PHONY : CMakeFiles/cyb3053_project2.dir/depend

