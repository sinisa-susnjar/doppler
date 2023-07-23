@ECHO OFF
IF "%PACKAGE_DIR%"=="" set PACKAGE_DIR=%~dp0
git submodule update --init --recursive
mkdir %PACKAGE_DIR%\3rdparty\poppler\build
cd %PACKAGE_DIR%\3rdparty\poppler\build
cmake ..
cmake --build .
