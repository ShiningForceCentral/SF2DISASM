
; ASM FILE data\maps\entries\map42\mapsetups\s4_descriptions.asm :
; 0x5FE24..0x5FE90 : 

; =============== S U B R O U T I N E =======================================


ms_map42_AreaDescriptions:
                
                move.w  #$1B2,d3        ; "Nothing special there.{W1}"
                lea     byte_5FE34(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map42_AreaDescriptions

byte_5FE34:     msDescFunctionD6 39, 2, $FF, Map42_DescFunc0-byte_5FE34
                msDescFunction 39, 2, Map42_DescFunc1-byte_5FE34
                msDescEnd

; =============== S U B R O U T I N E =======================================


Map42_DescFunc1:
                
                 
                chkFlg  902             ; Set after you pull the Force Sword out
                bne.s   loc_5FE52
                move.w  #$D06,d0
                jsr     (DisplayText).w 
                bra.s   return_5FE66
loc_5FE52:
                
                clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #$1A8,d0
                jsr     (DisplayText).w 
                move.w  #$1B2,d0
                jsr     (DisplayText).w 
return_5FE66:
                
                rts

    ; End of function Map42_DescFunc1


; =============== S U B R O U T I N E =======================================


Map42_DescFunc0:
                
                 
                chkFlg  902             ; Set after you pull the Force Sword out
                bne.s   loc_5FE7A
                script  cs_5FF06
                setFlg  902             ; Set after you pull the Force Sword out
                bra.s   return_5FE8E
loc_5FE7A:
                
                clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #$1A8,d0
                jsr     (DisplayText).w 
                move.w  #$1B2,d0
                jsr     (DisplayText).w 
return_5FE8E:
                
                rts

    ; End of function Map42_DescFunc0

