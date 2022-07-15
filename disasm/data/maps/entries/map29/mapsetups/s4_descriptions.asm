
; ASM FILE data\maps\entries\map29\mapsetups\s4_descriptions.asm :
; 0x5A154..0x5A16C : 

; =============== S U B R O U T I N E =======================================


ms_map29_AreaDescriptions:
                
                move.w  #$104F,d3       ; "A book...{N}LIFE IN A CAVE{W1}"
                lea     byte_5A164(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map29_AreaDescriptions

byte_5A164:     msDesc 54, 9, 4, 0      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}LIFE IN A CAVE{W1}"
                msDescEnd
