as -arch arm64 -o hw.o hw.s
ld -o hw hw.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
./hw