# as -arch arm64 -o upper.o upper.s
# ld -o upper upper.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
# ./upper

as -arch arm64 -o codesnippets.o codesnippets.s
ld -o codesnippets codesnippets.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
./codesnippets