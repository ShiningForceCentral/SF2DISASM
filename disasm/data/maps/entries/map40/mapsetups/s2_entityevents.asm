
; ASM FILE data\maps\entries\map40\mapsetups\s2_entityevents.asm :
; 0x53F92..0x53FBA : 
ms_map40_EntityEvents:
                msEntityEvent ALLY_LEMON, RIGHT, Map40_EntityEvent0-ms_map40_EntityEvents
                msEntityEvent 128, RIGHT, Map40_EntityEvent1-ms_map40_EntityEvents
                msEntityEvent 129, RIGHT, Map40_EntityEvent1-ms_map40_EntityEvents
                msDefaultEntityEvent Map40_DefaultEntityEvent-ms_map40_EntityEvents

; =============== S U B R O U T I N E =======================================


Map40_EntityEvent0:
                
                 
                script  cs_53FE0
                rts

    ; End of function Map40_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map40_EntityEvent1:
                
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                clr.w   ((CURRENT_SPEECH_SFX-$1000000)).w
                txt     1000            ; "He's already dead.{N}{LEADER} feels regret.{W1}"
Map40_DefaultEntityEvent:
                
                rts

    ; End of function Map40_EntityEvent1

