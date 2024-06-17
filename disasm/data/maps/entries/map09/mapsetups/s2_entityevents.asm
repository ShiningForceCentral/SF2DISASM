
; ASM FILE data\maps\entries\map09\mapsetups\s2_entityevents.asm :
; 0x56722..0x56856 : 
ms_map9_EntityEvents:
                msEntityEvent ALLY_ROHDE, RIGHT, Map9_EntityEvent0-ms_map9_EntityEvents
                msEntityEvent ALLY_RICK, DOWN, Map9_EntityEvent1-ms_map9_EntityEvents
                msEntityEvent 128, UP, Map9_EntityEvent2-ms_map9_EntityEvents
                msEntityEvent 129, UP, Map9_EntityEvent3-ms_map9_EntityEvents
                msEntityEvent 130, UP, Map9_EntityEvent4-ms_map9_EntityEvents
                msEntityEvent 131, UP, Map9_EntityEvent5-ms_map9_EntityEvents
                msEntityEvent 132, UP, Map9_EntityEvent6-ms_map9_EntityEvents
                msEntityEvent 133, DOWN, Map9_EntityEvent7-ms_map9_EntityEvents
                msEntityEvent 134, UP, Map9_EntityEvent8-ms_map9_EntityEvents
                msEntityEvent 135, UP, Map9_EntityEvent9-ms_map9_EntityEvents
                msEntityEvent 136, UP, Map9_EntityEvent10-ms_map9_EntityEvents
                msEntityEvent 137, UP, Map9_EntityEvent11-ms_map9_EntityEvents
                msDefaultEntityEvent Map9_DefaultEntityEvent-ms_map9_EntityEvents

; =============== S U B R O U T I N E =======================================


Map9_EntityEvent2:
                
                 
                txt     1363            ; "Hassan is a port town.{W2}{N}But, we've had no trading{N}recently.{W1}"
                rts

    ; End of function Map9_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map9_EntityEvent3:
                
                 
                txt     1364            ; "Our ancestors came here from{N}Rune by way of the sea.{W2}{N}They should've avoided such{N}an inconvenient place like{N}this.{W1}"
                rts

    ; End of function Map9_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map9_EntityEvent4:
                
                 
                txt     1381            ; "I think I'll take a nap{N}now.  Bye.{W1}"
                rts

    ; End of function Map9_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map9_EntityEvent5:
                
                move.b  #SHOP_WEAPON_HASSAN_0,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                rts

    ; End of function Map9_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map9_EntityEvent6:
                
                move.b  #SHOP_ITEM_HASSAN,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                rts

    ; End of function Map9_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map9_EntityEvent7:
                
                jsr     j_ChurchMenu
                rts

    ; End of function Map9_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map9_EntityEvent8:
                
                 
                chkFlg  725             ; Set after telling Rohde that you're going to get the Caravan
                bne.s   byte_567C2      
                txt     1365            ; "Dr. {NAME;11} lives in the{N}house over there.{W2}"
                move.w  #$86,d0 
                moveq   #3,d1
                jsr     sub_4781A       
                moveq   #40,d0
                jsr     (Sleep).w       
                move.w  #$86,d0 
                move.b  ((byte_FFB651-$1000000)).w,d1
                addq.w  #2,d1
                andi.w  #3,d1
                jsr     sub_4781A       
                txt     1366            ; "He is eccentric.{N}He hates talking, but...{W2}{N}a historical topic may{N}interest him.{W1}"
                bra.s   return_567C6
byte_567C2:
                
                txt     1370            ; "Dr. {NAME;11}!  Hmmm,{N}are you a magician?{W1}"
return_567C6:
                
                rts

    ; End of function Map9_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map9_EntityEvent9:
                
                 
                txt     1367            ; "How on earth did you come{N}to Hassan?{W2}"
                txt     1368            ; "By raft?  Wow!{N}You killed the Kraken?!{W1}"
                rts

    ; End of function Map9_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map9_EntityEvent10:
                
                 
                txt     1369            ; "The river is drying up{N}because of the drought.{W2}{N}To the west?{N}If you really want to go,{N}ask Dr. {NAME;11}....{W1}"
                rts

    ; End of function Map9_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map9_EntityEvent11:
                
                move.b  #SHOP_WEAPON_HASSAN_1,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                rts

    ; End of function Map9_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map9_EntityEvent0:
                
                 
                chkFlg  727             ; Set after presenting the Achilles Sword to Rohde (yes/no to the Caravan regardless)
                bne.s   byte_5682A      
                moveq   #ITEM_ACHILLES_SWORD,d1
                jsr     j_GetItemInventoryLocation
                cmpi.w  #-1,d0
                bne.s   byte_56804      
                txt     1371            ; "Yes, I'm {NAME;11}.{N}I'm really busy now.{W2}{N}Time is dear to me.{N}Please don't bother me.{W1}"
                setFlg  798             ; Set after talking to Rohde in Hassan if you DON'T have the Achilles Sword?
                bra.s   loc_56828
byte_56804:
                
                chkFlg  798             ; Set after talking to Rohde in Hassan if you DON'T have the Achilles Sword?
                bne.s   byte_5681E
                txt     1371            ; "Yes, I'm {NAME;11}.{N}I'm really busy now.{W2}{N}Time is dear to me.{N}Please don't bother me.{W1}"
                jsr     j_ClosePortraitWindow
                clsTxt
                moveq   #40,d0
                jsr     (Sleep).w       
byte_5681E:
                
                script  cs_569BC
                setFlg  727             ; Set after presenting the Achilles Sword to Rohde (yes/no to the Caravan regardless)
loc_56828:
                
                bra.s   return_56840
byte_5682A:
                
                chkFlg  725             ; Set after telling Rohde that you're going to get the Caravan
                bne.s   return_56840
                move.w  #$B,d0
                jsr     sub_47832       
                script  cs_56AE6
return_56840:
                
                rts

    ; End of function Map9_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map9_EntityEvent1:
                
                 
                chkFlg  256             ; TEMP FLAG #00
                bne.s   return_56852
                script  cs_56B02
                setFlg  256             ; TEMP FLAG #00
return_56852:
                
                rts

    ; End of function Map9_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map9_DefaultEntityEvent:
                
                rts

    ; End of function Map9_DefaultEntityEvent

