as -arch arm64 -o addexample1.o addexample1.s
ld -o addexample1 addexample1.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
./addexample1

as -arch arm64 -o addexample2.o addexample2.s
ld -o addexample2 addexample2.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
./addexample2