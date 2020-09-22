;+============================================================================+
;| START OF BOOT SECTOR:                                                      |
;+============================================================================+
[org 0x7c00]
[bits 16]

section .text
  global main

main:

cli
jmp 0x0000:ZeroSeg
ZeroSeg:
  xor ax, ax
  mov ss, ax
  mov ds, ax
  mov es, ax
  mov fs, ax
  mov gs, ax
  mov sp, main
  cld
sti

push ax
  xor ax, ax
  mov dl, 0x80
  int 0x13
pop ax


mov al, 1
mov cl, 2
mov dx, [0x7c00 + 510]
sub si,si
mov di, si

test:
call input

call printf
jmp test
jmp $

;+============================================================================+
;| Function Declarations:                                                     |
;+============================================================================+

%include "./printf.asm"		; Input from si reg
%include "./readDisk.asm"	; Input from al,cl reg
%include "./printh.asm"		; Input from dx reg
%include "./printc.asm"		; input from al reg
%include "./getch.asm"		; Output to al reg
%include "./input.asm"		; give string starting register at si

;+============================================================================+
;| Constants:                                                                 |
;+============================================================================+

STR: db 'Hello World',0x0a,0x0d, 0
DISK_ERR_MSG: db 'Error Loading Disk.', 0x0a, 0x0d, 0
TEST_STR: db 'adsfadsf',0x0a,0x0d,0


;+============================================================================+
;| Padding and magic number of boot sector:                                   |
;+============================================================================+
times 510 - ($-$$) db 0
dw 0xaa55

;+============================================================================+
;| END OF BOOT SECTOR.                                                        |
;+============================================================================+

;+============================================================================+
;| NEW SECOND SECTOR:                                                         |
;+============================================================================+

sectorStart:
  

times 512 db 0

