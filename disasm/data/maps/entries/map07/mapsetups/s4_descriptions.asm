
; ASM FILE data\maps\entries\map07\mapsetups\s4_descriptions.asm :
; 0x557EE..0x5580E : 

; =============== S U B R O U T I N E =======================================


ms_map7_AreaDescriptions:
                
                move.w  #$1001,d3       ; "A book...{N}DARK SOL{W1}"
                lea     byte_557FE(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map7_AreaDescriptions

byte_557FE:     msDesc 4, 3, 4, 0       ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}DARK SOL{W1}"
                msDesc 3, 12, 4, 1      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}HINT BOOK{W1}"
                msDescEnd
                dc.b $4E 
                dc.b $75 
