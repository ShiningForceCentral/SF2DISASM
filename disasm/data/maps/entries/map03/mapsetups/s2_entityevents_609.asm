
; ASM FILE data\maps\entries\map03\mapsetups\s2_entityevents_609.asm :
; 0x5105C..0x511CA : 
ms_map3_flag609_EntityEvents:
                msEntityEvent 128, DOWN, Map3_261_EntityEvent0-ms_map3_flag609_EntityEvents
                msEntityEvent 129, UP, Map3_261_EntityEvent1-ms_map3_flag609_EntityEvents
                msEntityEvent 130, DOWN, Map3_261_EntityEvent2-ms_map3_flag609_EntityEvents
                msEntityEvent 131, DOWN, Map3_261_EntityEvent3-ms_map3_flag609_EntityEvents
                msEntityEvent 132, DOWN, Map3_261_EntityEvent4-ms_map3_flag609_EntityEvents
                msEntityEvent 133, UP, Map3_261_EntityEvent5-ms_map3_flag609_EntityEvents
                msEntityEvent 134, UP, Map3_261_EntityEvent6-ms_map3_flag609_EntityEvents
                msEntityEvent 135, DOWN, Map3_261_EntityEvent7-ms_map3_flag609_EntityEvents
                msEntityEvent 136, DOWN, Map3_261_EntityEvent8-ms_map3_flag609_EntityEvents
                msEntityEvent 137, DOWN, Map3_261_EntityEvent9-ms_map3_flag609_EntityEvents
                msEntityEvent 138, DOWN, Map3_261_EntityEvent10-ms_map3_flag609_EntityEvents
                msEntityEvent 139, DOWN, Map3_261_EntityEvent10-ms_map3_flag609_EntityEvents
                msEntityEvent 140, DOWN, Map3_261_EntityEvent12-ms_map3_flag609_EntityEvents
                msEntityEvent 141, DOWN, Map3_261_EntityEvent13-ms_map3_flag609_EntityEvents
                msEntityEvent 142, UP, Map3_261_EntityEvent14-ms_map3_flag609_EntityEvents
                msEntityEvent 143, UP, Map3_261_EntityEvent15-ms_map3_flag609_EntityEvents
                msEntityEvent 144, DOWN, Map3_261_EntityEvent16-ms_map3_flag609_EntityEvents
                msEntityEvent 145, UP, Map3_261_EntityEvent17-ms_map3_flag609_EntityEvents
                msEntityEvent 146, UP, Map3_261_EntityEvent18-ms_map3_flag609_EntityEvents
                msEntityEvent 147, UP, Map3_261_EntityEvent19-ms_map3_flag609_EntityEvents
                msEntityEvent ALLY_KIWI, UP, Map3_261_EntityEvent20-ms_map3_flag609_EntityEvents
                msEntityEvent 148, DOWN, Map3_261_EntityEvent21-ms_map3_flag609_EntityEvents
                msEntityEvent 149, DOWN, Map3_261_EntityEvent22-ms_map3_flag609_EntityEvents
                msEntityEvent 150, UP, Map3_261_EntityEvent23-ms_map3_flag609_EntityEvents
                msEntityEvent 151, DOWN, Map3_261_EntityEvent24-ms_map3_flag609_EntityEvents
                msEntityEvent 152, UP, Map3_261_EntityEvent25-ms_map3_flag609_EntityEvents
                msEntityEvent 153, DOWN, Map3_261_EntityEvent26-ms_map3_flag609_EntityEvents
                msDefaultEntityEvent (Map3_DefaultEntityEvent-ms_map3_flag609_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent0:
                
                 
                chkFlg  256             ; TEMP FLAG #00
                bne.s   byte_510DA      
                txt     627             ; "The castle guard said the{N}King chose you to lead a{N}mission.{N}{LEADER}, my dear,{W2}{N}I didn't know you were old{N}enough to work for the{N}King.{W1}"
                setFlg  256             ; TEMP FLAG #00
byte_510DA:
                
                txt     628             ; "Good luck, {LEADER}.{N}Your father would have{N}been proud of you.{W1}"
                rts

    ; End of function Map3_261_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent1:
                
                 
                chkFlg  257             ; TEMP FLAG #01
                bne.s   byte_510EE      
                txt     629             ; "I knew your father very{N}well.{N}He was a great leader.{W2}"
                setFlg  257             ; TEMP FLAG #01
byte_510EE:
                
                txt     630             ; "{LEADER}, you have to{N}study hard and be a fine{N}man like him.{W1}"
                rts

    ; End of function Map3_261_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent2:
                
                 
                txt     631             ; "He thinks of you as his{N}grandson.{W2}{N}Sometimes he may annoy{N}you, but it's because he{N}loves you.{W1}"
                rts

    ; End of function Map3_261_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent3:
                
                move.b  #SHOP_WEAPON_GRANSEAL,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                rts

    ; End of function Map3_261_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent4:
                
                 
                txt     632             ; "Why don't you stop by my{N}shop before you set out{N}on your journey?{W1}"
                rts

    ; End of function Map3_261_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent5:
                
                 
                txt     633             ; "That Galam messenger rushed{N}out of town.{N}He looked pale.{W1}"
                rts

    ; End of function Map3_261_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent6:
                
                 
                txt     634             ; "Don't listen to what that{N}fortune teller says.{N}She's a liar.{W1}"
                rts

    ; End of function Map3_261_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent7:
                
                 
                txt     635             ; "Hear what I have to say!{N}I can see the ruins in my{N}crystal!{W2}"
                txt     636             ; "The war!  Granseal will{N}fall in the war! {N}Believe me!{W1}"
                rts

    ; End of function Map3_261_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent8:
                
                 
                txt     637             ; "You heard about it?{N}The King was sick.{W1}"
                rts

    ; End of function Map3_261_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent9:
                
                 
                txt     638             ; "Yes, I heard about it.{N}Soldiers of the castle{N}were talking about it.{W2}{N}It must be true!{W1}"
                rts

    ; End of function Map3_261_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent10:
                
                 
                txt     639             ; "The Minister said you{N}could enter anytime you{N}want.{W1}"
                rts

    ; End of function Map3_261_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent12:
                
                 
                txt     640             ; "Welcome!{N}We have very novel animals{N}from the mainland!!{W2}"
                txt     641             ; "You don't want a pet?{N}I'll lower my prices for{N}you!{W1}"
                rts

    ; End of function Map3_261_EntityEvent12


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent13:
                
                 
                txt     642             ; "He looks so sad...{N}I feel sorry for him.{W1}"
                rts

    ; End of function Map3_261_EntityEvent13


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent14:
                
                 
                txt     643             ; "Bok-bok-bok.{N}Bok-gawk!{W1}"
                rts

    ; End of function Map3_261_EntityEvent14


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent15:
                
                 
                txt     644             ; "Watch out!{N}Don't loiter around here!{N}Ever!{W1}"
                rts

    ; End of function Map3_261_EntityEvent15


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent16:
                
                 
                txt     645             ; "Sorry, my husband is{N}angry.  He didn't catch any{N}fish today.{W1}"
                rts

    ; End of function Map3_261_EntityEvent16


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent17:
                
                 
                txt     646             ; "Granseal harbor is behind{N}me.{W2}{N}A ship just docked a few{N}minutes ago.{W1}"
                rts

    ; End of function Map3_261_EntityEvent17


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent18:
                
                 
                txt     647             ; "The human caught me when{N}I was taking a walk in{N}Parmecia.{W1}"
                rts

    ; End of function Map3_261_EntityEvent18


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent19:
                
                 
                txt     648             ; "Release me! Get me out of{N}here or I shall eat you up!!{W1}"
                rts

    ; End of function Map3_261_EntityEvent19


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent20:
                
                 
                txt     649             ; "Me...(sob)...so hungry.{N}Hungry....{W1}"
                rts

    ; End of function Map3_261_EntityEvent20


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent21:
                
                jsr     j_ChurchMenu
                rts

    ; End of function Map3_261_EntityEvent21


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent22:
                
                 
                txt     650             ; "I envy you!  You saw{N}the beautiful Princess Elis!{W1}"
                rts

    ; End of function Map3_261_EntityEvent22


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent23:
                
                 
                chkFlg  278             ; TEMP FLAG #16
                bne.s   byte_5118E      
                txt     651             ; "A pet shop has newly opened,{N}but Mom never lets me go?{N}Why?{W1}"
                setFlg  278             ; TEMP FLAG #16
                bra.s   return_51192
byte_5118E:
                
                txt     657             ; "Well, {LEADER}!{N}Come and play with me{N}later!  Promise?{W1}"
return_51192:
                
                rts

    ; End of function Map3_261_EntityEvent23


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent24:
                
                 
                chkFlg  279             ; TEMP FLAG #17
                bne.s   byte_511A2      
                txt     658             ; "Strangers from the mainland{N}opened a pet shop.{W2}"
                setFlg  279             ; TEMP FLAG #17
byte_511A2:
                
                txt     659             ; "I don't think it's right{N}to hold animals captive.{W1}"
                rts

    ; End of function Map3_261_EntityEvent24


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent25:
                
                 
                chkFlg  280             ; TEMP FLAG #18
                bne.s   byte_511B6      
                txt     660             ; "(Sniff, sniff)...have you{N}seen or smelt any sulfur?{W2}"
                setFlg  280             ; TEMP FLAG #18
byte_511B6:
                
                txt     661             ; "I'm an inventor.{N}I'm looking for some sulfur.{W1}"
                rts

    ; End of function Map3_261_EntityEvent25


; =============== S U B R O U T I N E =======================================


Map3_261_EntityEvent26:
                
                move.b  #SHOP_ITEM_GRANSEAL,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                rts

    ; End of function Map3_261_EntityEvent26

