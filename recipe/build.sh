#! /bin/sh -e
cmake ${CMAKE_ARGS} \
      -DBUILD_SHARED_LIBS=ON -DEXAMPLEDIR= -DCMAKE_DEBUG_POSTFIX= \
      -B BUILD -S .
cd BUILD

make -j$CPU_COUNT
if test "$CONDA_BUILD_CROSS_COMPILATION" != "1"; then
    make test
fi
make install
