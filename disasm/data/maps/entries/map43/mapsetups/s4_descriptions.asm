
; ASM FILE data\maps\entries\map43\mapsetups\s4_descriptions.asm :
; 0x5405C..0x540A6 : 

; =============== S U B R O U T I N E =======================================


ms_map43_AreaDescriptions:
                
                move.w  #$FE1,d3        ; "A book...{N}DIARY{W1}"
                lea     byte_5406C(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map43_AreaDescriptions

byte_5406C:     msDesc 3, 2, 4, 0       ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}DIARY{W1}"
                msDesc 4, 2, 4, 1       ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}HISTORY OF GRANS{W1}"
                msDesc 5, 2, 4, 2       ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}THE GROUND SEAL{W1}"
                msDesc 8, 2, 4, 3       ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}SACRED WAR{W1}"
                msDesc 3, 5, 4, 4       ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}LIVING ALONE{W1}"
                msDesc 4, 5, 4, 5       ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}STUDY OF THE TOWER{W1}"
                msDesc 9, 6, 4, 6       ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}MOUNTAINS{W1}"
                msDesc 12, 6, 4, 7      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}VILLAGES{W1}"
                msDesc 15, 10, 5, 8     ; "{NAME} looked into{N}the well.{W2}{CLEAR}"
                                        ; "A deep, and dirty well.{W1}"
                msDescEnd
                dc.b $4E 
                dc.b $75 
