setlocal EnableDelayedExpansion

cmake -G "NMake Makefiles" %CMAKE_ARGS% ^
    -DBUILD_SHARED_LIBS=ON -DEXAMPLEDIR= -DCMAKE_DEBUG_POSTFIX= ^
    -B BUILD -S .
if errorlevel 1 exit 1

cd BUILD
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1

nmake test
if errorlevel 1 exit 1

nmake install
if errorlevel 1 exit 1

