
; ASM FILE data\maps\entries\map45\mapsetups\s2_entityevents.asm :
; 0x60024..0x60060 : 
ms_map45_EntityEvents:
                msEntityEvent 128, UP, Map45_EntityEvent0-ms_map45_EntityEvents
                msEntityEvent 129, DOWN, Map45_EntityEvent1-ms_map45_EntityEvents
                msEntityEvent 130, DOWN, Map45_EntityEvent2-ms_map45_EntityEvents
                msEntityEvent 131, UP, Map45_EntityEvent3-ms_map45_EntityEvents
                msDefaultEntityEvent Map45_DefaultEntityEvent-ms_map45_EntityEvents

; =============== S U B R O U T I N E =======================================


Map45_EntityEvent0:
                
                 
                txt     2077            ; "Monks are dedicated to{N}studying the powers of the{N}mind.{W2}"
                txt     2078            ; "We train very hard.{W1}"
                rts

    ; End of function Map45_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map45_EntityEvent1:
                
                 
                txt     2079            ; "Don't approach my back!{N}You will die!{W1}"
                rts

    ; End of function Map45_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map45_EntityEvent2:
                
                 
                txt     2080            ; "I'm always in control of my{N}mind.{W1}"
                rts

    ; End of function Map45_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map45_EntityEvent3:
                
                 
                txt     2081            ; "Where are you from?{N}I used to be a priest.{W2}"
                txt     2082            ; "Do you need my help?{W1}"
                jsr     j_ChurchMenuActions
                rts

    ; End of function Map45_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map45_DefaultEntityEvent:
                
                rts

    ; End of function Map45_DefaultEntityEvent

