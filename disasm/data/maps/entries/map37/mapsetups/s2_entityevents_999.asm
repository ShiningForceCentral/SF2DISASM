
; ASM FILE data\maps\entries\map37\mapsetups\s2_entityevents_999.asm :
; 0x5F9D2..0x5FA22 : 
ms_map37_flag999_EntityEvents:
                msEntityEvent ALLY_ZYNK, UP, Map37_3E7_EntityEvent0-ms_map37_flag999_EntityEvents
byte_5F9D6:     msEntityEvent 128, UP, Map37_3E7_EntityEvent1-ms_map37_flag999_EntityEvents
                msEntityEvent 129, RIGHT, Map37_3E7_EntityEvent2-ms_map37_flag999_EntityEvents
                msEntityEvent ALLY_PETER, UP, Map37_3E7_EntityEvent3-ms_map37_flag999_EntityEvents
                msDefaultEntityEvent Map37_DefaultEntityEvent-ms_map37_flag999_EntityEvents

; =============== S U B R O U T I N E =======================================


Map37_DefaultEntityEvent:
                
                moveq   #(byte_5F9D6-ms_map37_flag999_EntityEvents),d6
                jsr     (GenerateRandomNumber).w
                move.w  #$EAC,d0
                add.w   d7,d0
                jsr     (DisplayText).w 
Map37_3E7_EntityEvent2:
                
                rts

    ; End of function Map37_DefaultEntityEvent


; =============== S U B R O U T I N E =======================================


Map37_3E7_EntityEvent0:
                
                 
                txt     3364            ; "Was it...too wild?{W1}"
                rts

    ; End of function Map37_3E7_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map37_3E7_EntityEvent1:
                
                 
                chkFlg  257             ; TEMP FLAG #01
                bne.s   return_5FA0E
                script  cs_5FB30
                setFlg  257             ; TEMP FLAG #01
return_5FA0E:
                
                rts

    ; End of function Map37_3E7_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map37_3E7_EntityEvent3:
                
                 
                chkFlg  257             ; TEMP FLAG #01
                bne.s   byte_5FA1C      
                txt     3363            ; "{LEADER}, come on!{W1}"
                bra.s   return_5FA20
byte_5FA1C:
                
                txt     3370            ; "We must finish our{N}preparations before Geshp{N}finds us.{W1}"
return_5FA20:
                
                rts

    ; End of function Map37_3E7_EntityEvent3

