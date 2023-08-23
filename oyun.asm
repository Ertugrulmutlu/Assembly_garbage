include 'emu8086.inc'

ORG 100h 

.DATA

;input artik yeri
ix db 0
iy db 0
;altin
goldx1 dw 4
goldx2 dw 8
goldx3 dw 12
goldx4 dw 16
goldx5 dw 19

goldy db 23 

gold db 21


;yer x,y,count 
gx DB 0
gy DB 28

;karakter x,y
gmx DB 0
gmy DB 23
;karakterimiz X
character DB 120
;girilen sey
sayi dw 1
;yeri hareket ettirme
ground_count dw 20


.CODE
MAIN PROC
    MOV AH,2
    
     
    call ground_maker
    call char_maker
    call gold_maker
    
    mainloop:
        mov cl,b.ground_count
        cmp gmx,cl
        je re_ground_maker
        
        jmp input
        
        
        
        kontrol: 
            mov cl,'w'
            cmp b.[sayi],cl
            JE ileri_update
            
            mov cl,'s'
            cmp gmx,0
            je mainloop
            cmp b.[sayi],cl
            JE geri_update 

    
    
                       
                       
    
     
       

    jmp mainloop
        
        
       

  
    
MAIN ENDP   

ileri_update PROC
    GOTOXY gmx,gmy
    PUTC ' ' 
    jmp ileri
    
ileri_update ENDP

geri_update PROC
    GOTOXY gmx,gmy
    PUTC ' ' 
    jmp geri
    
geri_update ENDP
;Ýnput alma
input PROC
    MOV AH, 1h
    GOTOXY ix,iy
    int 21h
    mov [sayi],ax
    MOV AH, 2h
    GOTOXY ix,iy
    int 21h
    
    jmp kontrol     
input ENDP 
re_ground_maker PROC
        GOTOXY gmx,gmy
        PUTC ' ' 
        dec gmx
        dec gmx
        jmp char_maker
    
re_ground_maker ENDP    
;yer yapIMI
ground_maker PROC
    
    GOTOXY gx,gy
    PRINT "--------------------"
        
ground_maker ENDP 


;karakter
char_maker PROC
    GOTOXY gmx,gmy
    PUTC character
    
    
char_maker ENDP
;para haritaya koyma
gold_maker PROC
    GOTOXY b.goldx1,goldy
    PUTC gold
    GOTOXY b.goldx2,goldy
    PUTC gold
    GOTOXY b.goldx3,goldy
    PUTC gold
    GOTOXY b.goldx4,goldy
    PUTC gold
    GOTOXY b.goldx5,goldy
    PUTC gold
    jmp mainloop
    
        
     
    
gold_maker ENDP
;ileri komudu
ileri PROC
    inc gmx
    
    mov cl,b.goldx1
    cmp gmx,cl
    je goldx1l
    jne char_maker_2
    mov cl,b.goldx2
    cmp gmx,cl
    je goldx2l
    jne char_maker_2
    goldx1l:
        GOTOXY b.goldx1,goldy
        PUTC ' '        
        GOTOXY 20,20
        PRINT "GOLD ALDIN1"
    goldx2l:
        GOTOXY b.goldx2,goldy
        PUTC ' '        
        GOTOXY 20,20
        PRINT "GOLD ALDIN2"
    char_maker_2:
        GOTOXY gmx,gmy
        PUTC character 
    jmp mainloop
ileri ENDP 
;geri komudu
geri PROC
    dec gmx
    call char_maker
    jmp mainloop
    
geri ENDP

DEFINE_PTHIS
DEFINE_SCAN_NUM
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

END MAIN



             