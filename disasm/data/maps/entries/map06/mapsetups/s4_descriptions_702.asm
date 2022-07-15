
; ASM FILE data\maps\entries\map06\mapsetups\s4_descriptions_702.asm :
; 0x54D3C..0x54D8A : 

; =============== S U B R O U T I N E =======================================


ms_map6_flag2BE_AreaDescriptions:
                
                move.w  #$FF4,d3        ; "A book...{N}GREAT VOYAGE{W1}"
                lea     byte_54D4C(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map6_flag2BE_AreaDescriptions

byte_54D4C:     msDesc 5, 7, 4, 0       ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}GREAT VOYAGE{W1}"
                msDesc 6, 7, 4, 1       ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}FATHER CARPENTER{W1}"
                msDesc 4, 14, 4, 2      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}SOAP OPERAS{W1}"
                msDesc 5, 14, 4, 3      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A magazine...{N}HUNTER'S LIFE{W1}"
                msDesc 6, 14, 4, 4      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}DESPOTISM{W1}"
                msDesc 19, 6, 4, 5      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}AGRICULTURE{W1}"
                msDesc 17, 13, 2, 6     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "ITEMS{W1}"
                msDesc 29, 7, 2, 8      ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "WEAPONS{W1}"
                msDesc 20, 17, 4, 9     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}BUY AND SELL{W1}"
                msDescFunction 21, 24, Map6_DescFunc1-byte_54D4C
                msDescEnd
