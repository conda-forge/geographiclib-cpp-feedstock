#! /bin/sh -e
mkdir -p build && cd build

cmake ${CMAKE_ARGS} \
    -DGEOGRAPHICLIB_LIB_TYPE:STRING=SHARED \
    -DCMAKE_INSTALL_PREFIX:PATH=${PREFIX} \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    ..

make -j$CPU_COUNT
if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]]; then
    make test
fi
make install
