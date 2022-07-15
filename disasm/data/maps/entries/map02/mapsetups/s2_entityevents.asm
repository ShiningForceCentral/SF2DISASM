
; ASM FILE data\maps\entries\map02\mapsetups\s2_entityevents.asm :
; 0x5E938..0x5E9C8 : 
ms_map2_EntityEvents:
                msEntityEvent 128, UP, Map2_EntityEvent0-ms_map2_EntityEvents
                msEntityEvent 129, UP, Map2_EntityEvent1-ms_map2_EntityEvents
                msEntityEvent 130, UP, Map2_EntityEvent2-ms_map2_EntityEvents
                msEntityEvent 131, UP, Map2_EntityEvent3-ms_map2_EntityEvents
                msEntityEvent 132, UP, Map2_EntityEvent4-ms_map2_EntityEvents
                msEntityEvent 133, UP, Map2_EntityEvent5-ms_map2_EntityEvents
                msEntityEvent 134, UP, Map2_EntityEvent6-ms_map2_EntityEvents
                msEntityEvent 135, UP, Map2_EntityEvent7-ms_map2_EntityEvents
                msEntityEvent 136, UP, Map2_EntityEvent8-ms_map2_EntityEvents
                msEntityEvent 137, UP, Map2_EntityEvent9-ms_map2_EntityEvents
                msDefaultEntityEvent Map2_DefaultEntityEvent-ms_map2_EntityEvents

; =============== S U B R O U T I N E =======================================


Map2_DefaultEntityEvent:
                
                rts

    ; End of function Map2_DefaultEntityEvent


; =============== S U B R O U T I N E =======================================


Map2_EntityEvent0:
                
                 
                txt     3583            ; "You're not devils, are you?{W2}"
                txt     3584            ; "How did you get here safely?{W1}"
                rts

    ; End of function Map2_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map2_EntityEvent1:
                
                 
                txt     3585            ; "I'm hungry....{W1}"
                rts

    ; End of function Map2_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map2_EntityEvent2:
                
                 
                txt     3586            ; "Are you strong?  Will you{N}please kill the devils?{W1}"
                rts

    ; End of function Map2_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map2_EntityEvent3:
                
                 
                txt     3587            ; "Pacalon soldiers are so{N}proud!{W2}"
                txt     3588            ; "But, they're just cowards{N}that hide in the castle.{W1}"
                rts

    ; End of function Map2_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map2_EntityEvent4:
                
                 
                txt     3589            ; "What will we do when we{N}lose?{W1}"
                rts

    ; End of function Map2_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map2_EntityEvent5:
                
                 
                txt     3590            ; "Do you know Geshp?{W2}"
                txt     3591            ; "He sometimes comes here.{N}He seems so friendly.{W2}"
                txt     3592            ; "Are all devils like him?{N}If so, I like them.{W1}"
                rts

    ; End of function Map2_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map2_EntityEvent6:
                
                 
                txt     3593            ; "Do you think Pacalon can{N}beat the devils?{W2}"
                txt     3594            ; "Say yes!  Pacalon has the{N}best fighters in the world!{W1}"
                rts

    ; End of function Map2_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map2_EntityEvent7:
                
                move.b  #$A,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenuActions
                rts

    ; End of function Map2_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map2_EntityEvent8:
                
                move.b  #$19,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenuActions
                rts

    ; End of function Map2_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map2_EntityEvent9:
                
                jsr     j_ChurchMenuActions
                rts

    ; End of function Map2_EntityEvent9

