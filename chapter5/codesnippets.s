//
// This file contains the various code
// snippets from Chapter 5. This ensures
// they compile and gives you a chance
// to single step through them.
// They are labeled, so you can set a
// breakpoint at the one you are interested in.

.global _start
.global _l9

.data
l1: .byte 74, 0112, 0x4A, 0b1001010, 0x4a, 'J', 'H' + 2

l2: .word 0x1234ABCD, -1434

l3: .quad 0x123456789ABCDEF0

l4: .ascii "Hello, World\n"

l5: .asciz "Hello, World"

l6: .string "Hello, World"

l7: .byte -0x45, -33, ~0b00111001

l8: .rept 3
    .byte 0, 1, 2
    .endr

    .byte 0, 1, 2
    .byte 0, 1, 2
    .byte 0, 1, 2

l9: .fill 10, 4, 0

l10: .byte 0x3f
    .align 4
    .word 0x12345678

.text

_start:

l11:
    adrp x1, helloworld@PAGE
    add x1, x1, helloworld@PAGEOFF
    adr x1, helloworld2

l12:
    ldr x1, =0x1234ABCD1234ABCD

l13:
    // load the address of mynumber into x1
    adrp x1, mynumber@PAGE
    add x1, x1, mynumber@PAGEOFF
    // load the word stored at mynumber into x2
    ldr x2, [x1]

_l9:
    adrp x1, arr1@PAGE
    add x1, x1, arr1@PAGEOFF

l20: .fill 10, 4, 0

l21:
    // load the first element
    ldr w2, [x1]
    // load element 3
    // the elements count from 0, so 2 is
    // the third one. each word is 4 bytes
    ldr w2, [x1, #(2 * 4)]

l22:
    // the 3rd element is still number 2
    mov x3, #(2 * 4)
    // add the offset in x3 to x1 to get our element
    ldr w2, [x1, x3]

l23:
    ldr w2, [x1, #-(2 * 4)]
    mov x3, #(-2 * 4)
    ldr w2, [x1, x3]

l24:
    // our array is of WORDs. 2 is the index
    mov x3, #2
    // shift x3 left by 2 positions to multiply
    // by 4 to get the byte offset
    ldr w2, [x1, x3, LSL #2]

l25:
    ldr w2, [x1, #(2 * 4)]!
    adrp x2, arr1@PAGE
    add x2, x2, arr1@PAGEOFF

l26:
    // load x1 with the memory pointed to by x2
    // then do x2 = x2 + 2
    ldr x1, [x2], #2

l27:
    adrp x1, myoctaword@PAGE
    add x1, x1, myoctaword@PAGEOFF
    ldp x2, x3, [x1]
    stp x2, x3, [x1]

// Setup the parameters to exit the program
// and then call the kernel to do it.
	mov     X0, #0		// Use 0 return code
	mov     X16, #1		// System call number 1 terminates this program
	svc     #0x80		// Call kernel to terminate the program
helloworld2:	.ascii "Hello World!"

.data
helloworld:	.ascii "Hello World!"
.align 4
mynumber:	.quad	0x123456789ABCDEF0
arr1:	.fill	10, 4, 0
myoctaword:	.octa 0x12345678876543211234567887654321

