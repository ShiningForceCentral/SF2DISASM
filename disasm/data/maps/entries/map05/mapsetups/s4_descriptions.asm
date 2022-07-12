
; ASM FILE data\maps\entries\map05\mapsetups\s4_descriptions.asm :
; 0x51C28..0x51C54 : 

; =============== S U B R O U T I N E =======================================


ms_map5_AreaDescriptions:
                
                move.w  #$FDD,d3        ; "A book...{N}MYCOLOGY{W1}"
                lea     byte_51C38(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map5_AreaDescriptions

byte_51C38:     msDesc 9, 15, 6, 0      ; "{NAME} looked at{N}the paper.{W2}{CLEAR}"
                                        ; "A book...{N}MYCOLOGY{W1}"
                msDesc 10, 16, 4, 1     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}ECOLOGY{W1}"
                msDesc 11, 16, 4, 2     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}CIVILIZATIONS{W1}"
                msDesc 22, 11, 1, 3     ; "{NAME} investigated.{W2}{CLEAR}"
                                        ; "An old piano.{W1}"
                msDescEnd
                dc.b $4E 
                dc.b $75 
