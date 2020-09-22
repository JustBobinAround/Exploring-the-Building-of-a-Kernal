input:
  mov si,0x0
  mov di,si
  inputLoop:
  call getch
  cmp al,0x0d
  je inputExit
  mov [si],al
  add si,1
  call printc
  jmp inputLoop
  inputExit:
  call printc
  mov al,0
  mov [si],al
  mov si,di
  ret
