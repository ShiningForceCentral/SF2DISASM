
; ASM FILE data\maps\entries\map16\mapsetups\s4_descriptions.asm :
; 0x51F2A..0x51F6E : 

; =============== S U B R O U T I N E =======================================


ms_map16_AreaDescriptions:
                
                move.w  #$FEA,d3        ; "A book...{N}HISTORY OF GALAM{W1}"
                lea     byte_51F3A(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map16_AreaDescriptions

byte_51F3A:     msDesc 20, 5, 4, 0      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}HISTORY OF GALAM{W1}"
                msDesc 21, 5, 4, 1      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}SOLDIERS{W1}"
                msDesc 39, 16, 5, 2     ; "{NAME} looked into{N}the well.{W2}{CLEAR}"
                                        ; "A deep well.{W1}"
                msDesc 36, 25, 2, 3     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "ITEMS{W1}"
                msDesc 38, 25, 2, 4     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "WEAPONS{W1}"
                msDesc 33, 10, 4, 5     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}JOY OF FANTASY{W1}"
                msDesc 26, 17, 4, 6     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}MYTHOLOGY{W1}"
                msDesc 36, 21, 4, 7     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}ART OF SELLING{W1}"
                msDescEnd
                dc.b $4E 
                dc.b $75 
