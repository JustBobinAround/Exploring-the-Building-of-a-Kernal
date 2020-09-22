printc:
  pusha
    cmp al,0x0D
    mov ah, 0x0e
    je enterKey
    cmp al,0x08
    je backspace
    printcNext:
    int 0x10
  popa
  ret

enterKey:
  int 0x10
  mov al, 0x0a
  jmp printcNext

backspace:
  int 0x10
  mov al,''
  int 0x10
  mov al,0x08
  jmp printcNext
