//
// Examples of the MOV instruction.
//

.global _start
.align 2

_start:
    // Load X2 with 0x1234 FEDC 4F5D 6E3A first using MOV and MOVK
    mov x2, #0x63ea
    movk x2, #0x4f5d, lsl #16
    movk x2, #0xfedc, lsl #32
    movk x2, #0x1234, lsl #48

    // Just move W2 into W1
	MOV	W1, W2

    // Now lets see all the shift versions of MOV
    // This does not appear to work with the clang assembler
    //	MOV	X1, X2, LSL #1	// Logical shift left
    //	MOV	X1, X2, LSR #1	// Logical shift right
    //	MOV	X1, X2, ASR #1	//Arithmetic shift right
    //	MOV	X1, X2, ROR #1	// Rotate right

    // Repeat the above shifts using the Assembler mnemonics.

	LSL	X1, X2, #1	// Logical shift left
	LSR	X1, X2, #1	// Logical shift right
	ASR	X1, X2, #1	//Arithmetic shift right
	ROR	X1, X2, #1	// Rotate right

    // Example that works with 8 bit immediate and shift
	MOV	X1, #0xAB000000	// Too big for #imm16

    // Example that can't be represented and results in an error
    // Uncomment the instruction if you want to see the error
    //	MOV	X1, #0xABCDEF11	// Too big for #imm16 and can’t  be represented.

    // Example of MVN
        MOVN	W1, #45
        
    // Example of a MOV that the Assembler will change to MVN
        MOV	W1, #0xFFFFFFFE	// (-2)

    // Setup the parameters to exit the program
    // and then call the kernel to do it.
        MOV     X0, #0		// Use 0 return code
        MOV     X16, #1		// System call number 1 terminates this program
        SVC     #0x80		// Call kernel to terminate the program