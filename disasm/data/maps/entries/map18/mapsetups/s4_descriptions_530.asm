
; ASM FILE data\maps\entries\map18\mapsetups\s4_descriptions_530.asm :
; 0x61278..0x61290 : 

; =============== S U B R O U T I N E =======================================


ms_map18_flag530_AreaDescriptions:
                
                move.w  #$FF3,d3        ; "It reads...{N}RESPECT YOUR PARENTS{W1}"
                lea     byte_61288(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map18_flag530_AreaDescriptions

byte_61288:     msDesc 12, 9, 6, 0      ; "{NAME} looked at{N}the paper.{W2}{CLEAR}"
                                        ; "It reads...{N}RESPECT YOUR PARENTS{W1}"
                msDescEnd
