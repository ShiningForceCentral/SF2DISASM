
; ASM FILE data\maps\entries\map38\mapsetups\s2_entityevents.asm :
; 0x5DB76..0x5DCD0 : 
ms_map38_EntityEvents:
                msEntityEvent 128, UP, Map38_EntityEvent0-ms_map38_EntityEvents
                msEntityEvent 129, UP, Map38_EntityEvent1-ms_map38_EntityEvents
                msEntityEvent 130, UP, Map38_EntityEvent2-ms_map38_EntityEvents
                msEntityEvent 131, UP, Map38_EntityEvent3-ms_map38_EntityEvents
                msEntityEvent 132, UP, Map38_EntityEvent4-ms_map38_EntityEvents
                msEntityEvent 133, UP, Map38_EntityEvent5-ms_map38_EntityEvents
                msEntityEvent 134, UP, Map38_EntityEvent6-ms_map38_EntityEvents
                msEntityEvent 135, UP, Map38_EntityEvent7-ms_map38_EntityEvents
                msEntityEvent 136, UP, Map38_EntityEvent8-ms_map38_EntityEvents
                msEntityEvent 137, RIGHT, Map38_EntityEvent9-ms_map38_EntityEvents
                msEntityEvent 138, DOWN, Map38_EntityEvent10-ms_map38_EntityEvents
                msEntityEvent 139, UP, Map38_EntityEvent11-ms_map38_EntityEvents
                msEntityEvent 140, UP, Map38_EntityEvent12-ms_map38_EntityEvents
                msEntityEvent 141, UP, Map38_EntityEvent13-ms_map38_EntityEvents
                msEntityEvent ALLY_ZYNK, UP, Map38_EntityEvent14-ms_map38_EntityEvents
                msDefaultEntityEvent Map38_DefaultEntityEvent-ms_map38_EntityEvents

; =============== S U B R O U T I N E =======================================


Map38_EntityEvent0:
                
                 
                txt     2137            ; "Welcome to Roft.{W2}"
                txt     2138            ; "Every peaceful person is{N}welcome!{W1}"
                rts

    ; End of function Map38_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map38_EntityEvent1:
                
                 
                txt     2139            ; "Mr. Petro and Mr. Paseran{N}came from the south.{W1}"
                rts

    ; End of function Map38_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map38_EntityEvent2:
                
                 
                txt     2140            ; "{NAME;26}, are you OK?{N}You were captured by the{N}devils!{W1}"
                rts

    ; End of function Map38_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map38_EntityEvent3:
                
                 
                txt     2141            ; "The devils kidnapped{N}Mr. Petro and stole the{N}Nazca Ship.{W1}"
                rts

    ; End of function Map38_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map38_EntityEvent4:
                
                 
                txt     2142            ; "Mr. Paseran came here{N}through the tunnel in the{N}south.{W2}"
                txt     2143            ; "We've been told that devils{N}live there.{W2}"
                txt     2144            ; "And we have seen many{N}devils here since he came{N}to Roft.{W1}"
                rts

    ; End of function Map38_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map38_EntityEvent5:
                
                 
                txt     2145            ; "Red Baron is a cruel killer.{W2}"
                txt     2146            ; "He has smeared his armor with{N}the blood of his enemies.{W1}"
                rts

    ; End of function Map38_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map38_EntityEvent6:
                
                 
                txt     2147            ; "Do you know of Mithril?{W2}"
                txt     2148            ; "Mithril weapons are awfully{N}strong.{W2}"
                txt     2149            ; "They may help you in your{N}battles.{W1}"
                rts

    ; End of function Map38_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map38_EntityEvent7:
                
                 
                txt     2150            ; "We were able to find Mithril{N}on Grans before.{W2}"
                txt     2151            ; "The Dwarven Blacksmith lives{N}in Grans Forest.{W1}"
                rts

    ; End of function Map38_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map38_EntityEvent8:
                
                 
                txt     2152            ; "Nobody but the Dwarven{N}Blacksmith can work with{N}Mithril.{W1}"
                rts

    ; End of function Map38_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map38_EntityEvent9:
                
                 
                chkFlg  910             ; Set after the initial scene on entering Roft (where the guy thinks you're Galam)
                beq.s   return_5DC54
                chkFlg  258             ; TEMP FLAG #02
                beq.s   byte_5DC34      
                chkFlg  911             ; Set after the Petro death scene in Roft
                beq.s   loc_5DC32
                chkFlg  256             ; TEMP FLAG #00
                bne.s   byte_5DC2E      
                txt     2161            ; "(Sob...sob...){N}He's gone....{W2}"
                txt     2162            ; "We never had a chance to fly{N}in the Nazca Ship!{W1}"
                setFlg  256             ; TEMP FLAG #00
                bra.s   loc_5DC32
byte_5DC2E:
                
                txt     2161            ; "(Sob...sob...){N}He's gone....{W2}"
loc_5DC32:
                
                bra.s   return_5DC54
byte_5DC34:
                
                chkFlg  911             ; Set after the Petro death scene in Roft
                beq.s   return_5DC54
                chkFlg  256             ; TEMP FLAG #00
                bne.s   byte_5DC50      
                txt     2165            ; "The Nazca Ship crashed?{W1}"
                txt     2166            ; "I hope Petro gets on the{N}Nazca Ship in the great{N}beyond.{W1}"
                setFlg  256             ; TEMP FLAG #00
                bra.w   return_5DC54
byte_5DC50:
                
                txt     2165            ; "The Nazca Ship crashed?{W1}"
return_5DC54:
                
                rts

    ; End of function Map38_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map38_EntityEvent10:
                
                 
                chkFlg  910             ; Set after the initial scene on entering Roft (where the guy thinks you're Galam)
                beq.s   return_5DCA2
                chkFlg  258             ; TEMP FLAG #02
                beq.s   byte_5DC82      
                chkFlg  911             ; Set after the Petro death scene in Roft
                beq.s   loc_5DC80
                chkFlg  257             ; TEMP FLAG #01
                bne.s   byte_5DC7C      
                txt     2163            ; "The devils killed Petro.{N}They lied to us!{W2}"
                txt     2164            ; "How cruel they are!{W1}"
                setFlg  257             ; TEMP FLAG #01
                bra.s   loc_5DC80
byte_5DC7C:
                
                txt     2163            ; "The devils killed Petro.{N}They lied to us!{W2}"
loc_5DC80:
                
                bra.s   return_5DCA2
byte_5DC82:
                
                chkFlg  911             ; Set after the Petro death scene in Roft
                beq.s   return_5DCA2
                chkFlg  257             ; TEMP FLAG #01
                bne.s   byte_5DC9E      
                txt     2167            ; "The devils lied, and then{N}killed Petro.{W2}"
                txt     2168            ; "Please defeat the devils for{N}him!{W1}"
                setFlg  257             ; TEMP FLAG #01
                bra.w   return_5DCA2
byte_5DC9E:
                
                txt     2167            ; "The devils lied, and then{N}killed Petro.{W2}"
return_5DCA2:
                
                rts

    ; End of function Map38_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map38_EntityEvent11:
                
                jsr     j_ChurchMenu
                rts

    ; End of function Map38_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map38_EntityEvent12:
                
                move.b  #SHOP_WEAPON_ROFT,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                rts

    ; End of function Map38_EntityEvent12


; =============== S U B R O U T I N E =======================================


Map38_EntityEvent13:
                
                move.b  #SHOP_ITEM_ROFT,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                rts

    ; End of function Map38_EntityEvent13


; =============== S U B R O U T I N E =======================================


Map38_EntityEvent14:
                
                 
                txt     2153            ; "Huh!  Huh!{W1}"
                rts

    ; End of function Map38_EntityEvent14


; =============== S U B R O U T I N E =======================================


Map38_DefaultEntityEvent:
                
                rts

    ; End of function Map38_DefaultEntityEvent

