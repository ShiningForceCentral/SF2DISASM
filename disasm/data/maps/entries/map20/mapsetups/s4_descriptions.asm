
; ASM FILE data\maps\entries\map20\mapsetups\s4_descriptions.asm :
; 0x5392C..0x5395E : 

; =============== S U B R O U T I N E =======================================


ms_map20_AreaDescriptions:
                
                move.w  #$FD7,d3        ; "A book...{N}BODY BUILDING{W1}"
                lea     byte_5393C(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map20_AreaDescriptions

byte_5393C:     msDesc 23, 6, 4, 0      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}BODY BUILDING{W1}"
                msDesc 24, 52, 4, 1     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}MASTERPIECES{W1}"
                msDesc 25, 52, 4, 2     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}CASTLE ROMANCE{W1}"
                msDesc 19, 50, 7, 3     ; "{NAME} investigated{N}the closet.{W2}{CLEAR}"
                                        ; "A small piece of silk.{N}{LEADER} is flustered.{W1}"
                msDesc 17, 36, 4, 4     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}MAKING A RUG{W1}"
                msDescEnd
                dc.b $4E 
                dc.b $75 
