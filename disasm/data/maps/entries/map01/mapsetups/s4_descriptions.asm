
; ASM FILE data\maps\entries\map01\mapsetups\s4_descriptions.asm :
; 0x5E726..0x5E758 : 

; =============== S U B R O U T I N E =======================================


ms_map1_AreaDescriptions:
                
                move.w  #$1044,d3       ; "A statue of beautiful Mitula.{W1}"
                lea     byte_5E736(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map1_AreaDescriptions

byte_5E736:     msDesc 11, 3, 9, 0      ; "{NAME} investigated{N}the statue.{W2}{CLEAR}"
                                        ; "A statue of beautiful Mitula.{W1}"
                msDescFunction 44, 26, Map1_DescFunc0-byte_5E736
                msDescEnd
                rts

; =============== S U B R O U T I N E =======================================


Map1_DescFunc0:
                
                 
                chkFlg  841             ; Set after the Taya join scene has played inside the Mitula Shrine
                bne.s   return_5E756
                script  cs_5E772
                setFlg  841             ; Set after the Taya join scene has played inside the Mitula Shrine
return_5E756:
                
                rts

    ; End of function Map1_DescFunc0

