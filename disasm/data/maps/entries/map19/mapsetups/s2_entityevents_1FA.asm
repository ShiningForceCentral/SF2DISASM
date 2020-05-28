
; ASM FILE data\maps\entries\map19\mapsetups\s2_entityevents_1FA.asm :
; 0x5301C..0x530BA : 
ms_map19_flag1FA_EntityEvents:
                msEntityEvent 129, DOWN, Map19_1FA_EntityEvent0-ms_map19_flag1FA_EntityEvents
                msEntityEvent 131, RIGHT, Map19_1FA_EntityEvent1-ms_map19_flag1FA_EntityEvents
                msEntityEvent 134, DOWN, Map19_1FA_EntityEvent2-ms_map19_flag1FA_EntityEvents
                msEntityEvent 135, DOWN, Map19_1FA_EntityEvent3-ms_map19_flag1FA_EntityEvents
                msEntityEvent 136, RIGHT, Map19_1FA_EntityEvent1-ms_map19_flag1FA_EntityEvents
                msEntityEvent 137, RIGHT, Map19_1FA_EntityEvent1-ms_map19_flag1FA_EntityEvents
                msEntityEvent 138, RIGHT, Map19_1FA_EntityEvent6-ms_map19_flag1FA_EntityEvents
                msEntityEvent 139, RIGHT, Map19_1FA_EntityEvent7-ms_map19_flag1FA_EntityEvents
                msEntityEvent 140, RIGHT, Map19_1FA_EntityEvent1-ms_map19_flag1FA_EntityEvents
                msEntityEvent 141, RIGHT, Map19_1FA_EntityEvent1-ms_map19_flag1FA_EntityEvents
                msEntityEvent 142, RIGHT, Map19_1FA_EntityEvent1-ms_map19_flag1FA_EntityEvents
                msEntityEvent 143, RIGHT, Map19_1FA_EntityEvent11-ms_map19_flag1FA_EntityEvents
                msEntityEvent 144, RIGHT, Map19_1FA_EntityEvent1-ms_map19_flag1FA_EntityEvents
                msEntityEvent 145, RIGHT, Map19_1FA_EntityEvent1-ms_map19_flag1FA_EntityEvents
                msEntityEvent 146, RIGHT, Map19_1FA_EntityEvent14-ms_map19_flag1FA_EntityEvents
                msEntityEvent 147, RIGHT, Map19_1FA_EntityEvent1-ms_map19_flag1FA_EntityEvents
                msEntityEvent 148, RIGHT, Map19_1FA_EntityEvent1-ms_map19_flag1FA_EntityEvents
                msEntityEvent 149, RIGHT, Map19_1FA_EntityEvent1-ms_map19_flag1FA_EntityEvents
                msEntityEvent 150, RIGHT, Map19_1FA_EntityEvent1-ms_map19_flag1FA_EntityEvents
                msEntityEvent 153, RIGHT, Map19_1FA_EntityEvent1-ms_map19_flag1FA_EntityEvents
                msDefaultEntityEvent (Map19_DefaultEntityEvent-ms_map19_flag1FA_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

Map19_1FA_EntityEvent1:
                
                move.w  ((SPEECH_SFX-$1000000)).w,((SPEECH_SFX_BACKUP-$1000000)).w
                clr.w   ((SPEECH_SFX-$1000000)).w
                txt     $2A6            ; "Already passed away...{N}{LEADER} feels pity.{W1}"
                rts

    ; End of function Map19_1FA_EntityEvent1


; =============== S U B R O U T I N E =======================================

Map19_1FA_EntityEvent2:
                
                 
                txt     $2A7            ; "This is a nightmare.{W1}"
                rts

    ; End of function Map19_1FA_EntityEvent2


; =============== S U B R O U T I N E =======================================

Map19_1FA_EntityEvent3:
                
                 
                txt     $2A8            ; "The Galam soldiers scared{N}me.{W2}"
                txt     $2A9            ; "But when Sir Astral made{N}an incantation, King Galam{N}screamed.{W2}"
                txt     $2AA            ; "He ran upstairs with a{N}pained look on his face.{W1}"
                rts

    ; End of function Map19_1FA_EntityEvent3


; =============== S U B R O U T I N E =======================================

Map19_1FA_EntityEvent6:
                
                 
                txt     $2AB            ; "We Granseal soldiers{N}fought against Galam with{N}all our strength.{W2}"
                txt     $2AC            ; "But we were powerless{N}against King Galam's magic.{W1}"
                rts

    ; End of function Map19_1FA_EntityEvent6


; =============== S U B R O U T I N E =======================================

Map19_1FA_EntityEvent7:
                
                 
                txt     $2AD            ; "What King Galam said was{N}wrong!{W2}"
                txt     $2AE            ; "We did not attack Galam!{W1}"
                rts

    ; End of function Map19_1FA_EntityEvent7


; =============== S U B R O U T I N E =======================================

Map19_1FA_EntityEvent11:
                
                 
                txt     $2AF            ; "Nobody knew that King Galam{N}was a wizard!{W1}"
                rts

    ; End of function Map19_1FA_EntityEvent11


; =============== S U B R O U T I N E =======================================

Map19_1FA_EntityEvent14:
                
                 
                txt     $2B0            ; "Why are we at war?{W1}"
                rts

    ; End of function Map19_1FA_EntityEvent14


; =============== S U B R O U T I N E =======================================

Map19_1FA_EntityEvent0:
                
                 
                txt     $2B1            ; "The Princess was taken{N}away...and I'm paralyzed{N}with fear.{W1}"
                rts

    ; End of function Map19_1FA_EntityEvent0

