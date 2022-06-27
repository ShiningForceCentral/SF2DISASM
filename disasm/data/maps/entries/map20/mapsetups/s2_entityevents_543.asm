
; ASM FILE data\maps\entries\map20\mapsetups\s2_entityevents_543.asm :
; 0x63234..0x6329A : 
ms_map20_flag543_EntityEvents:
                msEntityEvent 128, DOWN, Map20_21F_EntityEvent0-ms_map20_flag543_EntityEvents
                msEntityEvent 129, RIGHT, Map20_21F_EntityEvent1-ms_map20_flag543_EntityEvents
                msEntityEvent 130, UP, Map20_21F_EntityEvent2-ms_map20_flag543_EntityEvents
                msEntityEvent 131, DOWN, Map20_21F_EntityEvent3-ms_map20_flag543_EntityEvents
                msEntityEvent 132, DOWN, Map20_21F_EntityEvent4-ms_map20_flag543_EntityEvents
                msEntityEvent 133, DOWN, Map20_21F_EntityEvent5-ms_map20_flag543_EntityEvents
                msDefaultEntityEvent Map20_21F_DefaultEntityEvent-ms_map20_flag543_EntityEvents

; =============== S U B R O U T I N E =======================================


Map20_21F_DefaultEntityEvent:
                
                rts

    ; End of function Map20_21F_DefaultEntityEvent


; =============== S U B R O U T I N E =======================================


Map20_21F_EntityEvent0:
                
                 
                chkFlg  982
                bne.s   byte_63266      
                txt     3942            ; "{LEADER}!{W2}"
                txt     3943            ; "I'm waiting for Sir Astral.{W2}"
                txt     3944            ; "{LEADER}, will you go{N}see him?{W1}"
                bra.s   return_6326E
byte_63266:
                
                txt     4010            ; "You shouldered quite a{N}burden for the kingdom.{W2}"
                txt     4011            ; "I'll be happy if you rule{N}this kingdom with Princess{N}Elis!{W1}"
return_6326E:
                
                rts

    ; End of function Map20_21F_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map20_21F_EntityEvent1:
                
                moveq   #1,d0
                jsr     j_ClosePortraitEyes
                txt     4015            ; "Zzzzz....{W1}"
                rts

    ; End of function Map20_21F_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map20_21F_EntityEvent2:
                
                 
                txt     4016            ; "I'm splitting firewood!{N}My back hurts!{W1}"
                rts

    ; End of function Map20_21F_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map20_21F_EntityEvent3:
                
                 
                txt     4022            ; "This is the east tower.{N}I'm on watch.{W1}"
                rts

    ; End of function Map20_21F_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map20_21F_EntityEvent4:
                
                 
                txt     4023            ; "What a view!{N}Parmecia is beautiful!{W1}"
                rts

    ; End of function Map20_21F_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map20_21F_EntityEvent5:
                
                 
                txt     4024            ; "Yeeee!  Who are you!?{N}{LEADER}!{W2}"
                txt     4025            ; "I wouldn't have screamed{N}if I knew it was you.{W1}"
                rts

    ; End of function Map20_21F_EntityEvent5

