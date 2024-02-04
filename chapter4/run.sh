as -arch arm64 -o printword.o printword.s
ld -o printword printword.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
./printword

as -arch arm64 -o case.o case.s
ld -o case case.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
./case