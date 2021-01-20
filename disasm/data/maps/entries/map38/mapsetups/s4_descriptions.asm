
; ASM FILE data\maps\entries\map38\mapsetups\s4_descriptions.asm :
; 0x5DD26..0x5DD50 : 

; =============== S U B R O U T I N E =======================================


ms_map38_AreaDescriptions:
                
                move.w  #$104B,d3       ; "A book...{N}MAN-EATING PLANTS{W1}"
                lea     byte_5DD36(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map38_AreaDescriptions

byte_5DD36:     msDesc 3, 14, 4, 0      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}MAN-EATING PLANTS{W1}"
                msDesc 11, 2, 4, 1      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}ANCIENT TRAVELS{W1}"
                msDesc 19, 26, 2, 2     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "Various Weapons{N}-Shopkeeper{W1}"
                msDesc 19, 5, 2, 3      ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "Various Items{N}-Shopkeeper{W1}"
                msDescEnd
