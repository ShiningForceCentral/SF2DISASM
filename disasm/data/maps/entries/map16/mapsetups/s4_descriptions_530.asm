
; ASM FILE data\maps\entries\map16\mapsetups\s4_descriptions_530.asm :
; 0x61154..0x6119C : 

; =============== S U B R O U T I N E =======================================


ms_map16_flag530_AreaDescriptions:
                
                move.w  #$FEA,d3        ; "A book...{N}HISTORY OF GALAM{W1}"
                lea     byte_61164(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map16_flag530_AreaDescriptions

byte_61164:     msDesc 20, 5, 4, 0      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
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
                msDesc 23, 24, 0, 8     ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
                                        ; "A hole.{W1}"
                msDescEnd
