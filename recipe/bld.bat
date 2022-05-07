setlocal EnableDelayedExpansion

cmake -G "NMake Makefiles" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DEXAMPLEDIR= ^
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

