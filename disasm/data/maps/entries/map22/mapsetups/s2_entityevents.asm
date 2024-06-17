
; ASM FILE data\maps\entries\map22\mapsetups\s2_entityevents.asm :
; 0x59474..0x595DE : 
ms_map22_EntityEvents:
                msEntityEvent ALLY_ERIC, UP, Map22_EntityEvent0-ms_map22_EntityEvents
                msEntityEvent ALLY_KARNA, UP, Map22_EntityEvent1-ms_map22_EntityEvents
                msEntityEvent 128, RIGHT, Map22_EntityEvent2-ms_map22_EntityEvents
                msEntityEvent 129, DOWN, Map22_EntityEvent3-ms_map22_EntityEvents
                msEntityEvent 130, DOWN, Map22_EntityEvent4-ms_map22_EntityEvents
                msEntityEvent 131, UP, Map22_EntityEvent5-ms_map22_EntityEvents
                msEntityEvent 132, UP, Map22_EntityEvent6-ms_map22_EntityEvents
                msEntityEvent 133, UP, Map22_EntityEvent7-ms_map22_EntityEvents
                msEntityEvent 134, DOWN, Map22_EntityEvent8-ms_map22_EntityEvents
                msEntityEvent 135, DOWN, Map22_EntityEvent9-ms_map22_EntityEvents
                msEntityEvent 136, DOWN, Map22_EntityEvent10-ms_map22_EntityEvents
                msEntityEvent 137, RIGHT, Map22_EntityEvent11-ms_map22_EntityEvents
                msEntityEvent 138, RIGHT, Map22_EntityEvent12-ms_map22_EntityEvents
                msEntityEvent 139, RIGHT, Map22_EntityEvent13-ms_map22_EntityEvents
                msEntityEvent 140, RIGHT, Map22_EntityEvent13-ms_map22_EntityEvents
                msEntityEvent 141, RIGHT, Map22_EntityEvent15-ms_map22_EntityEvents
                msEntityEvent 142, RIGHT, Map22_EntityEvent15-ms_map22_EntityEvents
                msEntityEvent 143, RIGHT, Map22_EntityEvent17-ms_map22_EntityEvents
                msEntityEvent 144, RIGHT, Map22_EntityEvent17-ms_map22_EntityEvents
                msEntityEvent 145, RIGHT, Map22_EntityEvent12-ms_map22_EntityEvents
                msEntityEvent 146, RIGHT, Map22_EntityEvent12-ms_map22_EntityEvents
                msEntityEvent 147, RIGHT, Map22_EntityEvent21-ms_map22_EntityEvents
                msEntityEvent 148, RIGHT, Map22_EntityEvent21-ms_map22_EntityEvents
                msEntityEvent 149, RIGHT, Map22_EntityEvent21-ms_map22_EntityEvents
                msEntityEvent 150, RIGHT, Map22_EntityEvent21-ms_map22_EntityEvents
                msEntityEvent 151, RIGHT, Map22_EntityEvent21-ms_map22_EntityEvents
                msEntityEvent 152, RIGHT, Map22_EntityEvent21-ms_map22_EntityEvents
            if (STANDARD_BUILD&MINIATURES_SHOP=1)
                msEntityEvent 153, RIGHT, Map22_EntityEvent22-ms_map22_EntityEvents
            endif
                msDefaultEntityEvent Map22_DefaultEntityEvent-ms_map22_EntityEvents

; =============== S U B R O U T I N E =======================================


Map22_EntityEvent2:
                
                jsr     j_CaravanMenu
                rts

    ; End of function Map22_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent3:
                
                 
                txt     1766            ; "Creed is a fine gentleman.{W2}"
                txt     1767            ; "His magic saved us a long time{N}ago during a natural disaster.{W1}"
                rts

    ; End of function Map22_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent4:
                
                 
                txt     1768            ; "Devils cannot use their magic{N}to affect human lives.{W2}"
                txt     1769            ; "Supposedly, it's one of their{N}rules.{W1}"
                rts

    ; End of function Map22_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent5:
                
                 
                txt     1770            ; "This Kingdom was made by{N}Creed.  There's no concept{N}of TIME here.{W2}"
                txt     1771            ; "We never get old.{N}We never die.{N}What is the meaning of life?{W1}"
                rts

    ; End of function Map22_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent0:
                
                 
                txt     1772            ; "I was there during the{N}disaster.{W2}"
                txt     1773            ; "I was looking for the{N}legendary sword.{N}I hate it here!{W1}"
                rts

    ; End of function Map22_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent1:
                
                 
                txt     1774            ; "Are you from the outside?{N}Why did you come here?{W2}"
                txt     1775            ; "Ah, a mistake.  I see.{W2}"
                txt     1776            ; "I suggest you see King{N}Ponpei.{N}He's a good man.{W1}"
                rts

    ; End of function Map22_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent6:
                
                jsr     j_ChurchMenu
                rts

    ; End of function Map22_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent7:
                
                 
                chkFlg  522             ; Battle 22 completed - BATTLE_CHESSBOARD                  
                bne.s   byte_59536      
                txt     1777            ; "I'm sure King Ponpei will{N}help you.{W1}"
                bra.s   return_59552
byte_59536:
                
                chkFlg  256             ; TEMP FLAG #00
                bne.s   byte_5954A      
                txt     1798            ; "He's just kidding, but to{N}tell the truth, the Cotton{W2}"
                txt     1799            ; "Balloon is a very special{N}treasure.{W1}"
                setFlg  256             ; TEMP FLAG #00
                bra.s   return_59552
byte_5954A:
                
                txt     1800            ; "Some adventurers live in the{N}north-east part of Floor{W2}"
                txt     1801            ; "World.  Please visit them?{W1}"
return_59552:
                
                rts

    ; End of function Map22_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent8:
                
                 
                chkFlg  522             ; Battle 22 completed - BATTLE_CHESSBOARD                  
                bne.s   byte_59576      
                chkFlg  777             ; Set after the Desktop King tells you to fight on the chessboard
                bne.s   byte_5956C      
                txt     1778            ; "So, you were not able to see{N}Creed?{W2}"
                txt     1779            ; "Somewhere in Floor World,{N}there's a tunnel that leads{N}to Creed.{W2}"
                txt     1780            ; "OK, I'll let you go if you{N}win a game against my army.{W2}"
byte_5956C:
                
                txt     1781            ; "You may go to the chessboard{N}now.{W1}"
                setFlg  777             ; Set after the Desktop King tells you to fight on the chessboard
                bra.s   return_5957A
byte_59576:
                
                txt     1797            ; "Bravo!  I'd give you an army{N}if you'd stay here.{W1}"
return_5957A:
                
                rts

    ; End of function Map22_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent9:
                
                 
                chkFlg  777             ; Set after the Desktop King tells you to fight on the chessboard
                bne.s   byte_5958C      
                txt     1783            ; "The Chess Army is very{N}strong.{W2}"
                txt     1784            ; "It will be good training for{N}you.{W1}"
                bra.s   return_59590
byte_5958C:
                
                txt     1782            ; "The army won't attack until{N}you reach the center of the{N}board.{W1}"
return_59590:
                
                rts

    ; End of function Map22_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent10:
                
                 
                chkFlg  212             ; Cotton Balloon (chest on chessboard, Desktop Kingdom)
                bne.s   byte_5959E      
                txt     1802            ; "Halt!  I can't let you{N}pass without the King's{N}permission.{W1}"
                bra.s   return_595B2
byte_5959E:
                
                txt     1803            ; "Floor World is very{N}dangerous.  Take care!{W1}"
                chkFlg  258             ; TEMP FLAG #02
                bne.s   return_595B2
                script  cs_599A4
                setFlg  258             ; TEMP FLAG #02
return_595B2:
                
                rts

    ; End of function Map22_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent17:
                
                 
                txt     1785            ; "Mr. Creed gave me this solid,{N}armored body!{W1}"
                rts

    ; End of function Map22_EntityEvent17


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent21:
                
                 
                txt     1786            ; "My attack power is the best{N}in the army!{W1}"
                rts

    ; End of function Map22_EntityEvent21


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent15:
                
                 
                txt     1787            ; "We knights are always ready{N}to fight!{W1}"
                rts

    ; End of function Map22_EntityEvent15


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent13:
                
            if (STANDARD_BUILD&MINIATURES_SHOP=1)
                chkFlg  522             ; Battle 22 completed - BATTLE_CHESSBOARD
                bne.s   Map22_EntityEvent22
            endif
                txt     1788            ; "Is healing is my only ability?{N}Ha, ha!  You have a lot to{N}learn!{W1}"
                rts

    ; End of function Map22_EntityEvent13


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent12:
                
                 
                txt     1789            ; "I lead the army with the King.{W1}"
                rts

    ; End of function Map22_EntityEvent12


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent11:
                
                 
                txt     1790            ; "The Chess Army of Desktop{N}Kingdom is a well balanced{N}force!{W2}"
                txt     1791            ; "If it is King Ponpei's wish,{N}we will accept your{N}challenge!{W1}"
                rts

    ; End of function Map22_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map22_EntityEvent22:

            if (STANDARD_BUILD&MINIATURES_SHOP=1)
                move.b  #SHOP_MINATURES_ROOM,((CURRENT_SHOP_INDEX-$1000000)).w
                jmp     ShopMenu
            endif

Map22_DefaultEntityEvent:
                
                rts

    ; End of function Map22_DefaultEntityEvent

