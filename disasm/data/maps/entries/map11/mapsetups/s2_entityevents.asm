
; ASM FILE data\maps\entries\map11\mapsetups\s2_entityevents.asm :
; 0x57A0C..0x57A68 : 
ms_map11_EntityEvents:
                msEntityEvent 128, UP, Map11_EntityEvent0-ms_map11_EntityEvents
                msEntityEvent 129, UP, Map11_EntityEvent1-ms_map11_EntityEvents
                msEntityEvent 130, UP, Map11_EntityEvent2-ms_map11_EntityEvents
                msEntityEvent 131, UP, Map11_EntityEvent3-ms_map11_EntityEvents
                msDefaultEntityEvent Map11_DefaultEntityEvent-ms_map11_EntityEvents

; =============== S U B R O U T I N E =======================================


Map11_EntityEvent0:
                
                 
                txt     3147            ; "Devils?{W2}"
                txt     3148            ; "They can't enter the shrine.{W1}"
                rts

    ; End of function Map11_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map11_EntityEvent1:
                
                 
                txt     3149            ; "This is a sacred area.{W2}"
                txt     3150            ; "Volcanon's shrine is here.{W1}"
                rts

    ; End of function Map11_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map11_EntityEvent2:
                
                 
                txt     3188            ; "This shrine was built on top{N}of the mountain to watch{N}over everything.{W1}"
                rts

    ; End of function Map11_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map11_EntityEvent3:
                
                 
                txt     3189            ; "Do you know the legend{N}of the phoenix?{W1}"
                jsr     j_YesNoPrompt
                tst.w   d0
                bne.s   byte_57A56      
                txt     3190            ; "And {NAME;7} was born from{N}holy fire.{W2}"
                txt     3191            ; "Volcanon is the highest{N}of gods and can revive{N}anything.{W2}"
                txt     3192            ; "Phoenix serve and work for{N}him.{N}They help the people.{W1}"
                bra.s   Map11_DefaultEntityEvent
byte_57A56:
                
                txt     3193            ; "A phoenix is the legendary{N}bird who can't be killed.{W2}"
                txt     3194            ; "It is life itself.{W2}"
                txt     3195            ; "When his first life is{N}nearly over, he bursts into{N}holy fire to finish it.{W2}"
                txt     3196            ; "The fire creates another{N}life for the phoenix on the{N}ground.{W1}"
Map11_DefaultEntityEvent:
                
                rts

    ; End of function Map11_EntityEvent3

