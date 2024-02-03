//
// Example of 128-Bit addition with the ADD/ADC instructions.
//

.global _start
.align 2

_start:
// First 64-bit number is 0x0000000000000003FFFFFFFFFFFFFFFF
    mov x2, #0x0000000000000003
    mov x3, #0xffffffffffffffff
// Second 64-bit number is 0x00000000000000050000000000000001
    mov x4, #0x0000000000000005
    mov x5, #0x0000000000000001
// Add the two 64-bit numbers together
    adds x0, x2, x4
    adc x1, x3, x5
// Exit
    mov x16, #1
    svc #0x80
