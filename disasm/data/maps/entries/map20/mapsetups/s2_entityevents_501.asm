
; ASM FILE data\maps\entries\map20\mapsetups\s2_entityevents_501.asm :
; 0x53830..0x538B4 : 
ms_map20_flag501_EntityEvents:
                msEntityEvent 128, RIGHT, Map20_1F5_EntityEvent0-ms_map20_flag501_EntityEvents
                msEntityEvent 129, RIGHT, Map20_1F5_EntityEvent1-ms_map20_flag501_EntityEvents
                msEntityEvent 130, DOWN, Map20_1F5_EntityEvent2-ms_map20_flag501_EntityEvents
                msEntityEvent 131, DOWN, Map20_1F5_EntityEvent3-ms_map20_flag501_EntityEvents
                msEntityEvent 132, DOWN, Map20_1F5_EntityEvent4-ms_map20_flag501_EntityEvents
                msEntityEvent 133, DOWN, Map20_1F5_EntityEvent5-ms_map20_flag501_EntityEvents
                msEntityEvent 134, RIGHT, Map20_1F5_EntityEvent6-ms_map20_flag501_EntityEvents
                msDefaultEntityEvent (Map20_DefaultEntityEvent-ms_map20_flag501_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================


Map20_1F5_EntityEvent0:
                
                 
                txt     2198            ; "Guooooorrrr!{W1}"
                rts

    ; End of function Map20_1F5_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map20_1F5_EntityEvent1:
                
                 
                txt     592             ; "Let me pass!{N}I must see my father!{W1}"
                rts

    ; End of function Map20_1F5_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map20_1F5_EntityEvent2:
                
                 
                script  cs_53C42
                rts

    ; End of function Map20_1F5_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map20_1F5_EntityEvent3:
                
                 
                chkFlg  259             ; TEMP FLAG #03
                bne.s   byte_53872      
                txt     593             ; "I saw a devil enter the{N}King's body...{W2}"
                setFlg  259             ; TEMP FLAG #03
byte_53872:
                
                txt     594             ; "and the King became{N}violent!{W1}"
                rts

    ; End of function Map20_1F5_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map20_1F5_EntityEvent4:
                
                 
                chkFlg  260             ; TEMP FLAG #04
                bne.s   byte_53886      
                txt     595             ; "Hurry to the Princess's{N}bedroom!  Hold the King{N}down!{W1}"
                setFlg  260             ; TEMP FLAG #04
byte_53886:
                
                txt     596             ; "The King knocked down{N}the Princess....{W1}"
                rts

    ; End of function Map20_1F5_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map20_1F5_EntityEvent5:
                
                 
                chkFlg  261             ; TEMP FLAG #05
                bne.s   byte_5389A      
                txt     588             ; "Ooo, ouch!{N}I didn't think he could{N}be so strong!{W2}"
                setFlg  261             ; TEMP FLAG #05
byte_5389A:
                
                txt     589             ; "Ouch!  I was knocked down!{W1}"
                rts

    ; End of function Map20_1F5_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map20_1F5_EntityEvent6:
                
                 
                chkFlg  262             ; TEMP FLAG #06
                bne.s   byte_538AE      
                txt     590             ; "Princess Elis!{N}I can't let you up there.{W2}"
                setFlg  262             ; TEMP FLAG #06
byte_538AE:
                
                txt     591             ; "Trust Sir Astral!{N}He knows how to cure{N}the King!{W1}"
                rts

    ; End of function Map20_1F5_EntityEvent6

