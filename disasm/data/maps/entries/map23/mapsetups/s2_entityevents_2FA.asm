
; ASM FILE data\maps\entries\map23\mapsetups\s2_entityevents_2FA.asm :
; 0x59BA8..0x59BD2 : 
ms_map23_flag2FA_EntityEvents:
                msEntityEvent 128, UP, Map23_2FA_EntityEvent0-ms_map23_flag2FA_EntityEvents
                msEntityEvent 129, UP, Map23_2FA_EntityEvent1-ms_map23_flag2FA_EntityEvents
                msEntityEvent 130, DOWN, Map23_2FA_EntityEvent2-ms_map23_flag2FA_EntityEvents
                msEntityEvent 131, UP, (Map23_EntityEvent5-ms_map23_flag2FA_EntityEvents) & $FFFF
                msDefaultEntityEvent (Map23_DefaultEntityEvent-ms_map23_flag2FA_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

Map23_2FA_EntityEvent0:
                
                 
                txt     $6A5            ; "Hey, you met Creed, didn't{N}you?{W1}"
                rts

    ; End of function Map23_2FA_EntityEvent0


; =============== S U B R O U T I N E =======================================

Map23_2FA_EntityEvent1:
                
                 
                txt     $6A6            ; "The evil has completely{N}lifted from the forest.{W1}"
                rts

    ; End of function Map23_2FA_EntityEvent1


; =============== S U B R O U T I N E =======================================

Map23_2FA_EntityEvent2:
                
                 
                txt     $6A7            ; "Is that sick dwarf better?{W2}"
                txt     $6A8            ; "Can he see the fairy now?{W1}"
                rts

    ; End of function Map23_2FA_EntityEvent2

