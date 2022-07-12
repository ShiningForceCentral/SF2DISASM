
; ASM FILE data\maps\entries\map15\mapsetups\s4_descriptions.asm :
; 0x5D020..0x5D044 : 

; =============== S U B R O U T I N E =======================================


ms_map15_AreaDescriptions:
                
                move.w  #$1041,d3       ; "A statue of beautiful Mitula.{W1}"
                lea     byte_5D030(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map15_AreaDescriptions

byte_5D030:     msDesc 31, 3, 9, 0      ; "{NAME} investigated{N}the statue.{W2}{CLEAR}"
                                        ; "A statue of beautiful Mitula.{W1}"
                msDesc 2, 27, 2, 1      ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "WEAPONS AND ITEMS{N}-Welcome{W1}"
                msDesc 22, 14, 4, 2     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}MITULA'S CODE{W1}"
                msDescEnd
