
; ASM FILE data\maps\entries\map13\mapsetups\s4_descriptions.asm :
; 0x582AC..0x582D8 : 

; =============== S U B R O U T I N E =======================================


ms_map13_AreaDescriptions:
                
                move.w  #$1003,d3       ; "A book...{N}VIVA, FRIENDSHIP!{W1}"
                lea     byte_582BC(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map13_AreaDescriptions

byte_582BC:     msDesc 17, 2, 4, 0      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}VIVA, FRIENDSHIP!{W1}"
                msDesc 18, 2, 4, 1      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}VOLCANON{W1}"
                msDesc 5, 9, 2, 2       ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "WEAPONS{W1}"
                msDesc 7, 9, 2, 3       ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "ITEMS{W1}"
                msDescEnd
                dc.b $4E 
                dc.b $75 
