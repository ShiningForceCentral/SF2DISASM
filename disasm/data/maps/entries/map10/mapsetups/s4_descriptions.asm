
; ASM FILE data\maps\entries\map10\mapsetups\s4_descriptions.asm :
; 0x56FE0..0x57028 : 

; =============== S U B R O U T I N E =======================================


ms_map10_AreaDescriptions:
                
                move.w  #$1007,d3       ; "ITEMS{W1}"
                lea     byte_56FF0(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map10_AreaDescriptions

byte_56FF0:     msDesc 32, 23, 2, 0     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "ITEMS{W1}"
                msDesc 30, 27, 2, 1     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "WEAPONS{W1}"
                msDesc 38, 35, 4, 2     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}PHOENIX{W1}"
                msDesc 40, 34, 4, 3     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}HOW TO FLY{W1}"
                msDesc 11, 42, 4, 4     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}FIGHT WHILE FLYING{W1}"
                msDesc 12, 42, 4, 5     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A magazine...{N}BIRDMEN TODAY{W1}"
                msDesc 29, 48, 4, 6     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}DECORATE YOUR NEST{W1}"
                msDesc 30, 48, 4, 7     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}WINGS AND FEATHERS{W1}"
                msDesc 40, 25, 6, 8     ; "{NAME} looked at{N}the paper.{W2}{CLEAR}"
                                        ; "It reads...{N}Don't drink and fly!{W1}"
                msDescEnd
