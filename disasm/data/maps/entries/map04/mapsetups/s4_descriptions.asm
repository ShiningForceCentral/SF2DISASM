
; ASM FILE data\maps\entries\map04\mapsetups\s4_descriptions.asm :
; 0x51702..0x51720 : 

; =============== S U B R O U T I N E =======================================


ms_map4_AreaDescriptions:
                
                move.w  #$1058,d3       ; "A book...{N}HEALING MAGIC{W1}"
                lea     byte_51712(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map4_AreaDescriptions

byte_51712:     msDesc 40, 6, 4, 0      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}HEALING MAGIC{W1}"
                msDesc 41, 6, 4, 1      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}TRICKS OF THE SWORD{W1}"
                msDescEnd
