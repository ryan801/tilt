#!/bin/bash
set -e
rm -rf build
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DMANUAL_SUBMODULES=1 ..
make -j$(nproc)
