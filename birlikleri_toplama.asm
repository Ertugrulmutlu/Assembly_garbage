.model small
.data
    say1 db 0
    say2 db 0
    sum db 0
    rem db 0
    
.code
     lo:
     ;birinci sayiyi aldýk
     mov ah,1h; Al'ye sayiyi aldik
     int 21h; Ekran cikardik
     sub al,48;al'den 48 cikardik
     mov say1,al; say1'e attik 
     
     mov dl,43
     mov ah,02h
     int 21h      
            
            
     ;ikinvi sayiyi aldýk
     mov ah,1h; Al'ye sayiyi aldik
     int 21h; Ekran cikardik
     sub al,48;al'den 48 cikardik
     mov say2,al; say1'e attik
       
     mov dl,61
     mov ah,02h
     int 21h      
            
     
     mov dl,say1; dl'ye attik
     add dl,say2; say1+say2 yaptýk ve dl'ye aktardik
     
     mov sum,dl; int sum'a dl'i attik
     
     mov ah,00; ah'i sifirladik
     mov al,sum; al icine sum yani dl yani say1+say2 attik
     
     mov bl,10; bl icine 10 attik
     div bl;ikiye boluyoruz
     
     mov rem, ah 
     
     mov dl,al
     add dl,48
     mov ah,02h
     int 21h
     
     mov dl,rem
     add dl,48
     mov ah,02h
     int 21h  
     
     mov dl,000
     mov ah,02h
     int 21h      
            
     
     loop lo
 
     
    