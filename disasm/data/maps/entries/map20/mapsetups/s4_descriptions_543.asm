
; ASM FILE data\maps\entries\map20\mapsetups\s4_descriptions_543.asm :
; 0x63364..0x6339A : 

; =============== S U B R O U T I N E =======================================


ms_map20_flag543_AreaDescriptions:
                
                move.w  #$FD7,d3        ; "A book...{N}BODY BUILDING{W1}"
                lea     byte_63374(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map20_flag543_AreaDescriptions

byte_63374:     msDesc 23, 6, 4, 0      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}BODY BUILDING{W1}"
                msDesc 24, 52, 4, 1     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}MASTERPIECES{W1}"
                msDesc 25, 52, 4, 2     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}CASTLE ROMANCE{W1}"
                msDesc 19, 50, 7, 3     ; "{NAME} investigated{N}the closet.{W2}{CLEAR}"
                                        ; "A small piece of silk.{N}{LEADER} is flustered.{W1}"
                msDesc 17, 36, 4, 4     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}MAKING A RUG{W1}"
                msDesc 20, 52, 1, 5     ; "{NAME} investigated.{W2}{CLEAR}"
                                        ; "Princess Elis is sleeping{N}quietly.{W1}"
                msDescEnd
