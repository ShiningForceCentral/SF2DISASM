
; ASM FILE data\maps\entries\map02\mapsetups\s2_entityevents_530.asm :
; 0x5E9C8..0x5EA20 : 
ms_map2_flag530_EntityEvents:
                msEntityEvent 128, UP, Map2_212_EntityEvent0-ms_map2_flag530_EntityEvents
                msEntityEvent 129, UP, Map2_212_EntityEvent1-ms_map2_flag530_EntityEvents
                msEntityEvent 130, UP, Map2_212_EntityEvent2-ms_map2_flag530_EntityEvents
                msEntityEvent 131, UP, Map2_212_EntityEvent3-ms_map2_flag530_EntityEvents
                msEntityEvent 132, UP, Map2_212_EntityEvent4-ms_map2_flag530_EntityEvents
                msEntityEvent 133, UP, Map2_212_EntityEvent5-ms_map2_flag530_EntityEvents
                msEntityEvent 134, UP, (Map2_EntityEvent7-ms_map2_flag530_EntityEvents) & $FFFF
                msEntityEvent 135, UP, (Map2_EntityEvent8-ms_map2_flag530_EntityEvents) & $FFFF
                msEntityEvent 136, UP, (Map2_EntityEvent9-ms_map2_flag530_EntityEvents) & $FFFF
                msDefaultEntityEvent (Map2_DefaultEntityEvent-ms_map2_flag530_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================


Map2_212_EntityEvent0:
                
                 
                txt     3595            ; "This is Pacalon, a kingdom{N}of fine centaurs.{W2}"
                txt     3596            ; "We welcome you.{W1}"
                rts

    ; End of function Map2_212_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map2_212_EntityEvent1:
                
                 
                txt     3597            ; "Rain!  This must be a{N}present from the gods!{W1}"
                rts

    ; End of function Map2_212_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map2_212_EntityEvent2:
                
                 
                txt     3598            ; "Thanks to the rain, I'm no{N}longer thirsty.{N}But, I'm still hungry.{W1}"
                rts

    ; End of function Map2_212_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map2_212_EntityEvent3:
                
                 
                txt     3599            ; "Did you save Mitula?{W2}"
                txt     3600            ; "Then, why don't you defeat{N}those devils?{W1}"
                rts

    ; End of function Map2_212_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map2_212_EntityEvent4:
                
                 
                txt     3601            ; "Was Tristan occupied by{N}devils?{W2}"
                txt     3602            ; "That's why we've had no{N}rain lately.{W1}"
                rts

    ; End of function Map2_212_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map2_212_EntityEvent5:
                
                 
                txt     3603            ; "I see Geshp frequently.{N}He always stares at the{N}castle.{W1}"
                rts

    ; End of function Map2_212_EntityEvent5

