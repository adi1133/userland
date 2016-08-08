
#
# CMake defines to cross-compile to ARM/Linux on BCM2708 using glibc.
#

SET(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSROOT /home/adi/tools/android-sdk/ndk-bundle/platforms/android-21/arch-arm/)
SET(CMAKE_C_COMPILER /home/adi/tools/android-sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-gcc)
SET(CMAKE_CXX_COMPILER /home/adi/tools/android-sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-g++)
SET(CMAKE_ASM_COMPILER /home/adi/tools/android-sdk/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-gcc)
SET(CMAKE_SYSTEM_PROCESSOR arm)

#ADD_DEFINITIONS("-march=armv6")
add_definitions("-mcpu=arm1176jzf-s -mfpu=vfp -mfloat-abi=soft -marm")

# rdynamic means the backtrace should work
IF (CMAKE_BUILD_TYPE MATCHES "Debug")
   add_definitions(-rdynamic)
ENDIF()

# avoids annoying and pointless warnings from gcc
SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -U_FORTIFY_SOURCE")
SET(CMAKE_ASM_FLAGS "${CMAKE_ASM_FLAGS} -c")
#SET(CMAKE_BUILD_FLAGS "-O2 -g -mfpu=vfp -mfloat-abi=soft -Wa,-meabi=5 -ffunction-sections -fno-common -pedantic -Wall -Wextra -Wno-missing-field-initializers")
