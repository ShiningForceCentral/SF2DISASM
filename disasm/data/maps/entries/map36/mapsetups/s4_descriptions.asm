
; ASM FILE data\maps\entries\map36\mapsetups\s4_descriptions.asm :
; 0x5D9C6..0x5DA0E : 

; =============== S U B R O U T I N E =======================================


ms_map36_AreaDescriptions:
                
                move.w  #$1038,d3       ; "A book...{N}PACALON KINGS{W1}"
                lea     byte_5D9D6(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map36_AreaDescriptions

byte_5D9D6:     msDesc 35, 3, 4, 0      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}PACALON KINGS{W1}"
                msDesc 36, 3, 4, 1      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}PALADIN HONOR{W1}"
                msDesc 56, 8, 10, 2     ; "{NAME} investigated{N}the door.{W2}{CLEAR}"
                                        ; "It's locked.{W1}"
                msDesc 19, 15, 9, 3     ; "{NAME} investigated{N}the statue.{W2}{CLEAR}"
                                        ; "A statue of a fine soldier.{W1}"
                msDesc 23, 15, 9, 4     ; "{NAME} investigated{N}the statue.{W2}{CLEAR}"
                                        ; "A statue of a fine soldier.{W1}"
                msDesc 26, 8, 9, 5      ; "{NAME} investigated{N}the statue.{W2}{CLEAR}"
                                        ; "A statue of a fine soldier.{W1}"
                msDesc 32, 8, 9, 6      ; "{NAME} investigated{N}the statue.{W2}{CLEAR}"
                                        ; "A statue of a fine soldier.{W1}"
                msDesc 26, 11, 9, 7     ; "{NAME} investigated{N}the statue.{W2}{CLEAR}"
                                        ; "A statue of a fine soldier.{W1}"
                msDesc 32, 11, 9, 8     ; "{NAME} investigated{N}the statue.{W2}{CLEAR}"
                                        ; "A statue of a fine soldier.{W1}"
                msDescEnd
