
; ASM FILE data\maps\entries\map18\mapsetups\s4_descriptions.asm :
; 0x52B26..0x52B40 : 

; =============== S U B R O U T I N E =======================================


ms_map18_AreaDescriptions:
                
                move.w  #$FF3,d3        ; "It reads...{N}RESPECT YOUR PARENTS{W1}"
                lea     byte_52B36(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map18_AreaDescriptions

byte_52B36:     msDesc 12, 9, 6, 0      ; "{NAME} looked at{N}the paper.{W2}{CLEAR}"
                                        ; "It reads...{N}RESPECT YOUR PARENTS{W1}"
                msDescEnd
                dc.b $4E 
                dc.b $75 
