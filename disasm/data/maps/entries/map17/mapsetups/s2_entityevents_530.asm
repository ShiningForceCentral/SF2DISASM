
; ASM FILE data\maps\entries\map17\mapsetups\s2_entityevents_530.asm :
; 0x611E0..0x61208 : 
ms_map17_flag530_EntityEvents:
                msEntityEvent 128, UP, Map17_212_EntityEvent0-ms_map17_flag530_EntityEvents
                msEntityEvent 129, DOWN, Map17_212_EntityEvent1-ms_map17_flag530_EntityEvents
                msEntityEvent 131, DOWN, Map17_212_EntityEvent2-ms_map17_flag530_EntityEvents
                msDefaultEntityEvent Map17_212_DefaultEntityEvent-ms_map17_flag530_EntityEvents

; =============== S U B R O U T I N E =======================================


Map17_212_EntityEvent0:
                
                 
                txt     3503            ; "I think he was looking for{N}the Holy Sword.{W2}"
                txt     3504            ; "Please don't tell anybody{N}that I told you.{W1}"
                rts

    ; End of function Map17_212_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map17_212_EntityEvent1:
                
                 
                txt     3506            ; "Why am I guarding the{N}kitchen?!{W1}"
                rts

    ; End of function Map17_212_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map17_212_EntityEvent2:
                
                 
                txt     3509            ; "I heard a rumor that a{N}handsome boy is leading{N}the devils now.{W1}"
                rts

    ; End of function Map17_212_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map17_212_DefaultEntityEvent:
                
                rts

    ; End of function Map17_212_DefaultEntityEvent

