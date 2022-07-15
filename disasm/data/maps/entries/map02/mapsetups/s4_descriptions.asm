
; ASM FILE data\maps\entries\map02\mapsetups\s4_descriptions.asm :
; 0x5EA26..0x5EA62 : 

; =============== S U B R O U T I N E =======================================


ms_map2_AreaDescriptions:
                
                move.w  #$1030,d3       ; "Various weapons!{N}-inquire within{W1}"
                lea     byte_5EA36(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map2_AreaDescriptions

byte_5EA36:     msDesc 8, 13, 2, 0      ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "Various weapons!{N}-inquire within{W1}"
                msDesc 15, 10, 2, 1     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "Various tools!{N}-inquire within{W1}"
                msDesc 17, 14, 9, 2     ; "{NAME} investigated{N}the statue.{W2}{CLEAR}"
                                        ; "A statue of a fine soldier.{W1}"
                msDesc 17, 18, 9, 3     ; "{NAME} investigated{N}the statue.{W2}{CLEAR}"
                                        ; "A statue of a fine soldier.{W1}"
                msDesc 25, 18, 9, 4     ; "{NAME} investigated{N}the statue.{W2}{CLEAR}"
                                        ; "A statue of a fine soldier.{W1}"
                msDesc 6, 5, 5, 5       ; "{NAME} looked into{N}the well.{W2}{CLEAR}"
                                        ; "A sturdy well.{N}No water there.{W1}"
                msDesc 25, 14, 9, 7     ; "{NAME} investigated{N}the statue.{W2}{CLEAR}"
                                        ; "A statue of a fine soldier.{W1}"
                msDescEnd
