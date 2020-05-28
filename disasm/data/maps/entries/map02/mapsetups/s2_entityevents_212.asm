
; ASM FILE data\maps\entries\map02\mapsetups\s2_entityevents_212.asm :
; 0x5E9C8..0x5EA20 : 
ms_map2_flag212_EntityEvents:
                msEntityEvent 128, UP, Map2_212_EntityEvent0-ms_map2_flag212_EntityEvents
                msEntityEvent 129, UP, Map2_212_EntityEvent1-ms_map2_flag212_EntityEvents
                msEntityEvent 130, UP, Map2_212_EntityEvent2-ms_map2_flag212_EntityEvents
                msEntityEvent 131, UP, Map2_212_EntityEvent3-ms_map2_flag212_EntityEvents
                msEntityEvent 132, UP, Map2_212_EntityEvent4-ms_map2_flag212_EntityEvents
                msEntityEvent 133, UP, Map2_212_EntityEvent5-ms_map2_flag212_EntityEvents
                msEntityEvent 134, UP, (Map2_EntityEvent7-ms_map2_flag212_EntityEvents) & $FFFF
                msEntityEvent 135, UP, (Map2_EntityEvent8-ms_map2_flag212_EntityEvents) & $FFFF
                msEntityEvent 136, UP, (Map2_EntityEvent9-ms_map2_flag212_EntityEvents) & $FFFF
                msDefaultEntityEvent (Map2_DefaultEntityEvent-ms_map2_flag212_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

Map2_212_EntityEvent0:
                
                 
                txt     $E0B            ; "This is Pacalon, a kingdom{N}of fine centaurs.{W2}"
                txt     $E0C            ; "We welcome you.{W1}"
                rts

    ; End of function Map2_212_EntityEvent0


; =============== S U B R O U T I N E =======================================

Map2_212_EntityEvent1:
                
                 
                txt     $E0D            ; "Rain!  This must be a{N}present from the gods!{W1}"
                rts

    ; End of function Map2_212_EntityEvent1


; =============== S U B R O U T I N E =======================================

Map2_212_EntityEvent2:
                
                 
                txt     $E0E            ; "Thanks to the rain, I'm no{N}longer thirsty.{N}But, I'm still hungry.{W1}"
                rts

    ; End of function Map2_212_EntityEvent2


; =============== S U B R O U T I N E =======================================

Map2_212_EntityEvent3:
                
                 
                txt     $E0F            ; "Did you save Mitula?{W2}"
                txt     $E10            ; "Then, why don't you defeat{N}those devils?{W1}"
                rts

    ; End of function Map2_212_EntityEvent3


; =============== S U B R O U T I N E =======================================

Map2_212_EntityEvent4:
                
                 
                txt     $E11            ; "Was Tristan occupied by{N}devils?{W2}"
                txt     $E12            ; "That's why we've had no{N}rain lately.{W1}"
                rts

    ; End of function Map2_212_EntityEvent4


; =============== S U B R O U T I N E =======================================

Map2_212_EntityEvent5:
                
                 
                txt     $E13            ; "I see Geshp frequently.{N}He always stares at the{N}castle.{W1}"
                rts

    ; End of function Map2_212_EntityEvent5

