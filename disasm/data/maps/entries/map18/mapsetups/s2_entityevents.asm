
; ASM FILE data\maps\entries\map18\mapsetups\s2_entityevents.asm :
; 0x52ABA..0x52B20 : 
ms_map18_EntityEvents:
                msEntityEvent 128, DOWN, Map18_EntityEvent0-ms_map18_EntityEvents
                msEntityEvent 129, DOWN, Map18_EntityEvent1-ms_map18_EntityEvents
                msEntityEvent 130, UP, Map18_EntityEvent2-ms_map18_EntityEvents
                msEntityEvent 131, DOWN, Map18_EntityEvent3-ms_map18_EntityEvents
                msDefaultEntityEvent Map18_DefaultEntityEvent-ms_map18_EntityEvents

; =============== S U B R O U T I N E =======================================


Map18_EntityEvent0:
                
                 
                txt     870             ; "Why, you're wearing a{N}beautiful jewel!  Wow!{N}Give it to me!{W1}"
                jsr     j_ClosePortraitWindow
                clsTxt
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                clr.w   ((CURRENT_SPEECH_SFX-$1000000)).w
                txt     871             ; "The trader tried to remove{N}the jewel.{W1}"
                clsTxt
                jsr     LoadAndDisplayCurrentPortrait
                move.w  ((SPEECH_SFX_COPY-$1000000)).w,((CURRENT_SPEECH_SFX-$1000000)).w
                txt     872             ; "I can't remove it!  Blast!{N}How did you attach it{N}so firmly?{W1}"
                rts

    ; End of function Map18_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map18_EntityEvent1:
                
                 
                txt     873             ; "What should I do?{N}My mother is visiting{N}Granseal!{W2}"
                txt     874             ; "I didn't know a war was{N}going to start!{W1}"
                rts

    ; End of function Map18_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map18_EntityEvent2:
                
                 
                txt     875             ; "Are you new here?{W2}{N}I've never seen you before.{W2}"
                txt     876             ; "Anyway, don't leave town.{N}The King ordered us to stop{N}anybody who tries to leave.{W1}"
                rts

    ; End of function Map18_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map18_EntityEvent3:
                
                 
                txt     877             ; "Everything is rusty because{N}we have not used the bridge{N}for such a long time!{W2}"
                txt     878             ; "Who are you?!{N}Civilians are not allowed{N}to come up here!{W1}"
                rts

    ; End of function Map18_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map18_DefaultEntityEvent:
                
                rts

    ; End of function Map18_DefaultEntityEvent

