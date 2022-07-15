
; ASM FILE data\maps\entries\map11\mapsetups\s4_descriptions.asm :
; 0x57A88..0x57AA0 : 

; =============== S U B R O U T I N E =======================================


ms_map11_AreaDescriptions:
                
                move.w  #$1010,d3       ; "A big statue of a heroic{N}bird.{W1}"
                lea     byte_57A98(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map11_AreaDescriptions

byte_57A98:     msDesc 6, 12, 9, 0      ; "{NAME} investigated{N}the statue.{W2}{CLEAR}"
                                        ; "A big statue of a heroic{N}bird.{W1}"
                msDescEnd
