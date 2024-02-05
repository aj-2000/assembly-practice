//
// Assembler program to convert a string to
// all upper case.
//
// X0-X2 - parameters to linux function services
// X3 - address of output string
// X4 - address of input string
// W5 - current character being processed
// X16 - linux function number
//


.global _start // Provide program starting address to linker
.p2align 2

_start:
    adrp x4, instr@PAGE // start of input string
    add x4, x4, instr@PAGEOFF
    adrp x3, outstr@PAGE // start of output string
    add x3, x3, outstr@PAGEOFF

// loop is until
loop:
    ldrb w5, [x4], #1 // load character and increment pointer
    // if w5 > 'z' then goto cont
    cmp w5, #'z' // is letter > 'z'?
    b.gt cont
    cmp w5, #'a'
    b.lt cont // goto to end if, if < 'a'
    sub w5, w5, #('a'-'A')

cont:
    // end if
    strb w5, [x3], #1 // store character to output str
    cmp w5, #0 // stop on hitting a null character
    b.ne loop // loop if character is not null

// setup the parameters to print our hex number
// and then call kernel to do it.

    mov x0, #1 // 1 = stdout
    adrp x1, outstr@PAGE // string to print
    add x1, x1, outstr@PAGEOFF
    sub x2, x3, x1 // get the length by subtracting the pointers
    mov x16, #4 // unix write system call
    svc #0x80 // call kernel to output the string

// Setup the parameters to exit the program
// and then call the kernel to do it.
	mov     X0, #0		// Use 0 return code
	mov     X16, #1		// System call number 1 terminates this program
	svc     #0x80		// Call kernel to terminate the program

.data
instr:  .asciz  "ajay bhai pyaare h This is our Test String that we will convert.\n"
outstr:	.fill	0, 1, 0