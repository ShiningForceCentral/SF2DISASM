
; ASM FILE data\maps\entries\map45\mapsetups\s4_descriptions.asm :
; 0x60078..0x60090 : 

; =============== S U B R O U T I N E =======================================


ms_map45_AreaDescriptions:
                
                move.w  #$104A,d3       ; "A deep well.{W1}"
                lea     byte_60088(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map45_AreaDescriptions

byte_60088:     msDesc 21, 33, 5, 0     ; "{NAME} looked into{N}the well.{W2}{CLEAR}"
                                        ; "A deep well.{W1}"
                msDescEnd
