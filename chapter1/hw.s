.global _start
.align 4

_start:
    mov x0, #1
    adr x1, helloworld
    mov x2, #13
    mov x16, #4 // sys_write
    svc #0x80 // TODO: 0x80 what is this?

    mov x0, #0
    mov x16, #1 // sys_exit
    svc #0x80

helloworld: .ascii "Hello, world!\n"
