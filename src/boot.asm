; boot.asm
; boot程序。用于加载loader

org 0x7c00

boot_start:
    ; 初始化段寄存器，此时CS应该为0x7c00
    mov ax, cs
    mov ds, ax
    mov es, ax
    ; 初始化实模式视屏地址
    mov ax, 0xb800
    mov gs, ax
    ; 设置视频模式号为：Text(文字模式) 80*25 16色
    mov ax, 0x003
    int 0x10
    ; 写入字符串和字符串颜色
    ; 地址偏移
    mov bx, 0
    ; 字符串颜色：红色黑底
    mov ah, 0x03

    mov al, 'O'
    mov [gs:bx], ax
    add bx, 2

    mov al, 'S'
    mov [gs:bx], ax
    add bx, 2

    mov al, '!'
    mov [gs:bx], ax
    add bx, 2
    ; 死循环
    jmp $
; 填充剩余空间为0
times 510-($-$$) db 0
dw 0xaa55


