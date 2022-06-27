
; ASM FILE data\maps\entries\map29\mapsetups\s2_entityevents.asm :
; 0x5A0F0..0x5A14E : 
ms_map29_EntityEvents:
                msEntityEvent 128, DOWN, Map29_EntityEvent0-ms_map29_EntityEvents
                msEntityEvent 129, UP, Map29_EntityEvent1-ms_map29_EntityEvents
                msEntityEvent 130, UP, Map29_EntityEvent2-ms_map29_EntityEvents
                msEntityEvent 131, UP, Map29_EntityEvent3-ms_map29_EntityEvents
                msEntityEvent 132, UP, Map29_EntityEvent4-ms_map29_EntityEvents
                msEntityEvent 133, UP, Map29_EntityEvent5-ms_map29_EntityEvents
                msEntityEvent 134, UP, Map29_EntityEvent6-ms_map29_EntityEvents
                msDefaultEntityEvent Map29_DefaultEntityEvent-ms_map29_EntityEvents

; =============== S U B R O U T I N E =======================================


Map29_EntityEvent0:
                
                jmp     j_BlacksmithActions

    ; End of function Map29_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map29_EntityEvent1:
                
                jmp     j_ChurchMenuActions

    ; End of function Map29_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map29_EntityEvent2:
                
                move.b  #$1C,((CURRENT_SHOP_INDEX-$1000000)).w
                jmp     j_ShopMenuActions

    ; End of function Map29_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map29_EntityEvent3:
                
                 
                txt     2125            ; "I think...I've met you{N}somewhere before.{W1}"
                rts

    ; End of function Map29_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map29_EntityEvent4:
                
                 
                txt     2126            ; "It's very dangerous outside.{N}We can't go to Galam.{W2}"
                txt     2127            ; "But, we have to leave here{N}very soon.{W1}"
                rts

    ; End of function Map29_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map29_EntityEvent5:
                
                 
                txt     2128            ; "The Dwarven Blacksmith is{N}very good.{W2}"
                txt     2129            ; "You can place a custom order{N}with him.{W1}"
                rts

    ; End of function Map29_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map29_EntityEvent6:
                
                 
                txt     2130            ; "Mithril is very hard to find.{W2}"
                txt     2131            ; "Go see the blacksmith if you{N}have any Mithril.{W1}"
                rts

    ; End of function Map29_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map29_DefaultEntityEvent:
                
                rts

    ; End of function Map29_DefaultEntityEvent

