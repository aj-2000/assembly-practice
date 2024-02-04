//
// Examples of the ADD/MOVN instructions.
//

.global _start
.align 2

_start:
    movn w0, #2
    add w0, w0, #1

    mov x16, #1
    svc #0x80

l1:	ADD X0, XZR, X1
	MOV X0, X1
	ORR X0, XZR, X1