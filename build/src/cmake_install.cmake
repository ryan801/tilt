# Install script for directory: /home/shawr/develop/crypto/tilt/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "0")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/shawr/develop/crypto/tilt/build/src/common/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/crypto/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/ringct/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/checkpoints/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/cryptonote_basic/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/cryptonote_core/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/lmdb/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/multisig/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/net/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/blockchain_db/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/mnemonics/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/rpc/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/serialization/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/wallet/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/p2p/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/cryptonote_protocol/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/simplewallet/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/daemonizer/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/daemon/cmake_install.cmake")
  include("/home/shawr/develop/crypto/tilt/build/src/device/cmake_install.cmake")

endif()

