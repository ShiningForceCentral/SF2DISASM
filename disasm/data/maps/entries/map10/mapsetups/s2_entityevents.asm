
; ASM FILE data\maps\entries\map10\mapsetups\s2_entityevents.asm :
; 0x56D80..0x56E9C : 
ms_map10_EntityEvents:
                msEntityEvent 128, DOWN, Map10_EntityEvent0-ms_map10_EntityEvents
                msEntityEvent 129, DOWN, Map10_EntityEvent1-ms_map10_EntityEvents
                msEntityEvent 130, RIGHT, Map10_EntityEvent2-ms_map10_EntityEvents
                msEntityEvent 131, RIGHT, Map10_EntityEvent3-ms_map10_EntityEvents
                msEntityEvent 132, RIGHT, Map10_EntityEvent4-ms_map10_EntityEvents
                msEntityEvent 133, RIGHT, Map10_EntityEvent5-ms_map10_EntityEvents
                msEntityEvent 134, RIGHT, Map10_EntityEvent6-ms_map10_EntityEvents
                msEntityEvent 135, RIGHT, Map10_EntityEvent7-ms_map10_EntityEvents
                msEntityEvent 136, RIGHT, Map10_EntityEvent8-ms_map10_EntityEvents
                msEntityEvent 137, DOWN, Map10_EntityEvent9-ms_map10_EntityEvents
                msEntityEvent 138, DOWN, Map10_EntityEvent10-ms_map10_EntityEvents
                msEntityEvent 139, UP, Map10_EntityEvent11-ms_map10_EntityEvents
                msEntityEvent 140, DOWN, Map10_EntityEvent12-ms_map10_EntityEvents
                msEntityEvent 141, DOWN, Map10_EntityEvent13-ms_map10_EntityEvents
                msEntityEvent 142, DOWN, Map10_EntityEvent14-ms_map10_EntityEvents
                msEntityEvent 143, DOWN, Map10_EntityEvent15-ms_map10_EntityEvents
                msEntityEvent 144, UP, Map10_EntityEvent16-ms_map10_EntityEvents
                msEntityEvent 145, DOWN, Map10_EntityEvent17-ms_map10_EntityEvents
                msEntityEvent 146, DOWN, Map10_EntityEvent18-ms_map10_EntityEvents
                msEntityEvent 147, UP, Map10_EntityEvent19-ms_map10_EntityEvents
                msEntityEvent 148, UP, Map10_EntityEvent20-ms_map10_EntityEvents
                msEntityEvent 149, DOWN, Map10_EntityEvent21-ms_map10_EntityEvents
                msEntityEvent ALLY_LUKE, DOWN, Map10_EntityEvent22-ms_map10_EntityEvents
                msDefaultEntityEvent Map10_DefaultEntityEvent-ms_map10_EntityEvents

; =============== S U B R O U T I N E =======================================


Map10_EntityEvent0:
                
                 
                txt     1569            ; "Mighty Volcanon!  He easily{N}defeated the greater devil!{W1}"
                rts

    ; End of function Map10_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent1:
                
                 
                txt     1572            ; "They know that they can't{N}defeat our God.{W2}"
                txt     1573            ; "What was their true{N}purpose?{W1}"
                rts

    ; End of function Map10_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent2:
                
                move.b  #SHOP_ITEM_BEDOE,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                rts

    ; End of function Map10_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent3:
                
                 
                txt     1564            ; "Creed is the last greater{N}devil to survive the war.{W2}"
                txt     1565            ; "But he retired from the army{N}and now lives alone in{N}Devil's Tail.{W1}"
                rts

    ; End of function Map10_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent4:
                
                 
                txt     1562            ; "The devils were almost{N}annihilated before.{N}"
                txt     1563            ; "Why did they attack Bedoe?{W1}"
                rts

    ; End of function Map10_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent5:
                
                 
                txt     1576            ; "(Burp)...I'm not afraid{N}of devils...{W2}"
                txt     1577            ; "as long as I drink a{N}rootbeer first...(burp).{W1}"
                rts

    ; End of function Map10_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent6:
                
                 
                txt     1566            ; "Uuuu...ooo....{N}He's...a...terrible...{W1}"
                rts

    ; End of function Map10_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent7:
                
                 
                txt     1570            ; "Ouch...the greater devil was{N}incredibly strong.{W2}"
                txt     1571            ; "But the other devils were{N}strong as well!{W1}"
                rts

    ; End of function Map10_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent8:
                
                 
                txt     1580            ; "Yes, they were strong.{N}But...{W2}"
                txt     1581            ; "Monsters like the Kraken and{N}Taros are much bigger!{W1}"
                rts

    ; End of function Map10_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent9:
                
                move.b  #SHOP_WEAPON_BEDOE,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                rts

    ; End of function Map10_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent10:
                
                jsr     j_ChurchMenu
                rts

    ; End of function Map10_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent11:
                
                 
                txt     1582            ; "My spouse was...killed...{N}in the war....{W1}"
                rts

    ; End of function Map10_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent12:
                
                 
                txt     1583            ; "Zzzz...dad, no...come back...!{W1}"
                rts

    ; End of function Map10_EntityEvent12


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent13:
                
                 
                txt     1584            ; "The devils?!  I thought they{N}were only an old legend.{W1}"
                rts

    ; End of function Map10_EntityEvent13


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent14:
                
                 
                txt     1585            ; "I never let my hatchling{N}go out!{W1}"
                rts

    ; End of function Map10_EntityEvent14


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent15:
                
                 
                txt     1586            ; "Have you seen my dad?{N}Mom won't tell me anyhting{N}about him.{W1}"
                rts

    ; End of function Map10_EntityEvent15


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent16:
                
                 
                txt     1587            ; "We have a lot of weapons,{N}but I don't want to use any{N}of them!{W1}"
                rts

    ; End of function Map10_EntityEvent16


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent17:
                
                 
                txt     1588            ; "I'm bored!{N}I want to go out!{W2}"
                txt     1589            ; "How wonderful it would be to{N}fly on such a beautiful day!{W1}"
                rts

    ; End of function Map10_EntityEvent17


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent18:
                
                 
                txt     1590            ; "We need a lot of hot water{N}to treat these injured men.{W2}"
                txt     1591            ; "I've been standing here all{N}day!{W1}"
                rts

    ; End of function Map10_EntityEvent18


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent19:
                
                 
                txt     1678            ; "Hmmm...you're right.{N}{NAME;7}, go ahead.{W1}"
                rts

    ; End of function Map10_EntityEvent19


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent20:
                
                 
                txt     1677            ; "He should talk to him.{W1}"
                rts

    ; End of function Map10_EntityEvent20


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent21:
                
                 
                txt     1574            ; "Kneel before King Bedoe.{N}Just kidding.{W1}"
                rts

    ; End of function Map10_EntityEvent21


; =============== S U B R O U T I N E =======================================


Map10_EntityEvent22:
                
                 
                txt     1593            ; "If...God Volcanon doesn't{N}calm down...{W1}"
Map10_DefaultEntityEvent:
                
                rts

    ; End of function Map10_EntityEvent22

