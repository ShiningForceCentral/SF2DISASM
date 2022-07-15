
; ASM FILE data\maps\entries\map19\mapsetups\s4_descriptions_543.asm :
; 0x62C72..0x62C96 : 

; =============== S U B R O U T I N E =======================================


ms_map19_flag543_AreaDescriptions:
                
                move.w  #$FD4,d3        ; "A book...{N}GRANSEAL KINGS{W1}"
                lea     byte_62C82(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map19_flag543_AreaDescriptions

byte_62C82:     msDesc 19, 3, 4, 0      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}GRANSEAL KINGS{W1}"
                msDesc 20, 3, 4, 1      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}TREASURES{W1}"
                msDesc 13, 20, 5, 2     ; "{NAME} looked into{N}the well.{W2}{CLEAR}"
                                        ; "A deep, dark well.{N}...very cool!{W1}"
                msDescEnd
