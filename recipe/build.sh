#! /bin/sh -e

cmake \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DCMAKE_BUILD_TYPE=Release \
    -DEXAMPLEDIR= \
    -B BUILD -S .
cd BUILD

make -j$CPU_COUNT
if test "$CONDA_BUILD_CROSS_COMPILATION" != "1"; then
    make testprograms test
fi
make install
