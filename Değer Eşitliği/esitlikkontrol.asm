[org 0x7c00]

mov ah, 0x0e

mov dx, 30 ; Buraya  yazacağınız sayı değeri aşağıda 30 a eşit mi kontrol edilir
           ; Eğer eşitse ekrana DOĞRU yazdırır değilse YANLIŞ yazdırır
kontrol1:
    mov bx, dogru
    cmp dx, 30
    jne kontrol2
    call ekrana_yaz

kontrol2:
    mov bx, yanlis
    cmp dx, 30
    je bitir
    call ekrana_yaz1

ekrana_yaz:

    dongu1:
        mov al, [bx]
        cmp al, 0x00
        je yazmayi_bitir

        add bx, 1
        int 0x10
        jmp dongu1

dogru:  
    db 'DOGRU', 0

ekrana_yaz1:
   
    dongu2:
        
        mov al, [bx]
        cmp al, 0x00
        je bitir

        add bx, 1
        int 0x10
        jmp dongu2




yanlis:
    db 'YANLIS', 0

yazmayi_bitir:
    ret
bitir:
    hlt

jmp $

times 510 -($-$$) db 0
dw 0xaa55
