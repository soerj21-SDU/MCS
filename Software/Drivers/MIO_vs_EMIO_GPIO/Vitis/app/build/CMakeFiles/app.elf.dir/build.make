# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.24

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

# Produce verbose output by default.
VERBOSE = 1

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
CMAKE_COMMAND = C:/Xilinx/Vitis/2023.2/tps/win64/cmake-3.24.2/bin/cmake.exe

# The command to remove a file.
RM = C:/Xilinx/Vitis/2023.2/tps/win64/cmake-3.24.2/bin/cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/build

# Include any dependencies generated for this target.
include CMakeFiles/app.elf.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/app.elf.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/app.elf.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/app.elf.dir/flags.make

CMakeFiles/app.elf.dir/helloworld.c.obj: CMakeFiles/app.elf.dir/flags.make
CMakeFiles/app.elf.dir/helloworld.c.obj: C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/src/helloworld.c
CMakeFiles/app.elf.dir/helloworld.c.obj: C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/platform/export/platform/sw/standalone_ps7_cortexa9_0/lib/*.a
CMakeFiles/app.elf.dir/helloworld.c.obj: CMakeFiles/app.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/app.elf.dir/helloworld.c.obj"
	C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/app.elf.dir/helloworld.c.obj -MF CMakeFiles/app.elf.dir/helloworld.c.obj.d -o CMakeFiles/app.elf.dir/helloworld.c.obj -c C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/src/helloworld.c

CMakeFiles/app.elf.dir/helloworld.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/app.elf.dir/helloworld.c.i"
	C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/src/helloworld.c > CMakeFiles/app.elf.dir/helloworld.c.i

CMakeFiles/app.elf.dir/helloworld.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/app.elf.dir/helloworld.c.s"
	C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/src/helloworld.c -o CMakeFiles/app.elf.dir/helloworld.c.s

CMakeFiles/app.elf.dir/platform.c.obj: CMakeFiles/app.elf.dir/flags.make
CMakeFiles/app.elf.dir/platform.c.obj: C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/src/platform.c
CMakeFiles/app.elf.dir/platform.c.obj: C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/platform/export/platform/sw/standalone_ps7_cortexa9_0/lib/*.a
CMakeFiles/app.elf.dir/platform.c.obj: CMakeFiles/app.elf.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/app.elf.dir/platform.c.obj"
	C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/app.elf.dir/platform.c.obj -MF CMakeFiles/app.elf.dir/platform.c.obj.d -o CMakeFiles/app.elf.dir/platform.c.obj -c C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/src/platform.c

CMakeFiles/app.elf.dir/platform.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/app.elf.dir/platform.c.i"
	C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/src/platform.c > CMakeFiles/app.elf.dir/platform.c.i

CMakeFiles/app.elf.dir/platform.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/app.elf.dir/platform.c.s"
	C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/src/platform.c -o CMakeFiles/app.elf.dir/platform.c.s

# Object files for target app.elf
app_elf_OBJECTS = \
"CMakeFiles/app.elf.dir/helloworld.c.obj" \
"CMakeFiles/app.elf.dir/platform.c.obj"

# External object files for target app.elf
app_elf_EXTERNAL_OBJECTS =

app.elf: CMakeFiles/app.elf.dir/helloworld.c.obj
app.elf: CMakeFiles/app.elf.dir/platform.c.obj
app.elf: CMakeFiles/app.elf.dir/build.make
app.elf: C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/src/lscript.ld
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable app.elf"
	C:/Xilinx/Vitis/2023.2/gnu/aarch32/nt/gcc-arm-none-eabi/bin/arm-none-eabi-gcc.exe  -O2 -DSDT -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard  -MMD -MP -specs=C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/platform/export/platform/sw/standalone_ps7_cortexa9_0/Xilinx.spec -IC:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/platform/export/platform/sw/standalone_ps7_cortexa9_0/include -Wall -Wextra      -O0  -g3     -U__clang__       $(app_elf_OBJECTS) $(app_elf_EXTERNAL_OBJECTS) -o app.elf  -Wl,-T -Wl,"C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/src/lscript.ld" -L"C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/src/" -L"C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/platform/export/platform/sw/standalone_ps7_cortexa9_0/lib/" -L"/" -Wl,--start-group,-lxilstandalone -lxil -lxiltimer -lxilflash -lgcc -lc -Wl,--end-group 
	arm-none-eabi-size --format=berkeley app.elf
	arm-none-eabi-size --format=berkeley app.elf > C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/build/app.elf.size

# Rule to build all files generated by this target.
CMakeFiles/app.elf.dir/build: app.elf
.PHONY : CMakeFiles/app.elf.dir/build

CMakeFiles/app.elf.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/app.elf.dir/cmake_clean.cmake
.PHONY : CMakeFiles/app.elf.dir/clean

CMakeFiles/app.elf.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/src C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/src C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/build C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/build C:/Users/miwoj/Desktop/Zybo/MIO_vs_EMIO_GPIO/Vitis/app/build/CMakeFiles/app.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/app.elf.dir/depend

