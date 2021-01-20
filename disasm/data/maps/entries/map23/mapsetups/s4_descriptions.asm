
; ASM FILE data\maps\entries\map23\mapsetups\s4_descriptions.asm :
; 0x59BD8..0x59BFC : 

; =============== S U B R O U T I N E =======================================


ms_map23_AreaDescriptions:
                
                move.w  #$1015,d3       ; "A book...{N}AN APPLE A DAY{W1}"
                lea     byte_59BE8(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map23_AreaDescriptions

byte_59BE8:     msDesc 5, 20, 4, 0      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}AN APPLE A DAY{W1}"
                msDesc 51, 2, 4, 1      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}HOME-MADE POTIONS{W1}"
                msDesc 52, 2, 4, 2      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}FAIRIES{W1}"
                msDescEnd
