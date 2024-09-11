# prepare build directory
Remove-Item build -Recurse -ErrorAction Ignore
New-Item build -ItemType Directory | Out-Null
Set-Location build

. ..\build_flags.ps1

cmake -G "Visual Studio 17 2022" -A x64 $cmakeFlags -DBUILD_FLAGS="$buildFlags" $args ..
cmake --build . --config Release -- /m
