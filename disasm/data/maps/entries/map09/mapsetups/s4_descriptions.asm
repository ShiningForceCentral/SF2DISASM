
; ASM FILE data\maps\entries\map09\mapsetups\s4_descriptions.asm :
; 0x5687A..0x568A4 : 

; =============== S U B R O U T I N E =======================================


ms_map9_AreaDescriptions:
                
                move.w  #$1011,d3       ; "Monument of the landing{N}at Parmecia.{W1}"
                lea     byte_5688A(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map9_AreaDescriptions

byte_5688A:     msDesc 14, 13, 0, 0     ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
                                        ; "Monument of the landing{N}at Parmecia.{W1}"
                msDesc 17, 21, 2, 1     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "Inn is alwa....{N}You can't read it...{W1}"
                msDesc 18, 12, 2, 2     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "WEAPONS--Top Quality!{W1}"
                msDesc 27, 11, 2, 3     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "ITEMS{W1}"
                msDescEnd
