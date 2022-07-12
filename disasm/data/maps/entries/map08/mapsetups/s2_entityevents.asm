
; ASM FILE data\maps\entries\map08\mapsetups\s2_entityevents.asm :
; 0x56084..0x561AE : 
ms_map8_EntityEvents:
                msEntityEvent 128, UP, Map8_EntityEvent0-ms_map8_EntityEvents
                msEntityEvent 129, UP, Map8_EntityEvent1-ms_map8_EntityEvents
                msDefaultEntityEvent Map8_DefaultEntityEvent-ms_map8_EntityEvents

; =============== S U B R O U T I N E =======================================


Map8_EntityEvent0:
                
                 
                chkFlg  256             ; TEMP FLAG #00
                bne.s   byte_560A6      
                setFlg  256             ; TEMP FLAG #00
                txt     1321            ; "Our ancestors came from{N}Rune, a southern island,{N}long ago.{W2}"
                txt     1322            ; "Since then, we've travelled{N}up here.{W2}"
                txt     1323            ; "The mountains to the north{N}block our journey.{W2}"
byte_560A6:
                
                txt     1324            ; "Are you going to{N}Mt. Volcano?{N}That's {NAME;7}'s hometown?{W1}"
                rts

    ; End of function Map8_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map8_EntityEvent1:
                
                 
                txt     1325            ; "We won't hide from you{N}anymore.  Ribble has many{N}ancient ruins.{W1}"
                rts

    ; End of function Map8_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map8_2C4_EntityEvent2:
                
                 
                txt     1326            ; "Men are so selfish.{N}My husband has gone to the{N}east to work.  What about me?{W1}"
                rts

    ; End of function Map8_2C4_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map8_2C4_EntityEvent3:
                
                jmp     j_ChurchMenuActions

    ; End of function Map8_2C4_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map8_2C4_EntityEvent4:
                
                 
                txt     1327            ; "Keseran is a historian.{N}But Mr. {NAME;11} is smarter{N}than him!{W2}"
                txt     1328            ; "I saw a strange hollow in a{N}tree.  Does something go{N}there?{W2}"
                txt     1329            ; "Is what you're looking for in{N}Ribble?{W1}"
                rts

    ; End of function Map8_2C4_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map8_2C4_EntityEvent5:
                
                 
                chkFlg  731             ; Set after you open the tree in Ribble with the wooden plank
                bne.s   byte_560DC      
                txt     1330            ; "I can't find it!{W2}"
                txt     1331            ; "The hidden door to the{N}ancient ruins must be near{N}this tree!{W1}"
                bra.s   return_560E0
byte_560DC:
                
                txt     1349            ; "Wow, the ancient door!{N}I knew it was there!  I did!{W1}"
return_560E0:
                
                rts

    ; End of function Map8_2C4_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map8_2C4_EntityEvent6:
                
                move.b  #3,((CURRENT_SHOP_INDEX-$1000000)).w
                jmp     j_ShopMenuActions

    ; End of function Map8_2C4_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map8_2C4_EntityEvent7:
                
                 
                script  cs_56172
                rts

    ; End of function Map8_2C4_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map8_2C4_EntityEvent8:
                
                 
                txt     1337            ; "Paseran and I are pupils{N}of Mr. {NAME;11} of Hassan.{W2}"
                txt     1338            ; "The ancient ruins around here{N}are very interesting to us!{W2}"
                txt     1339            ; "We're sure there are ruins{N}under Ribble, but we can't{N}find the door?{W2}"
                txt     1340            ; "I'll find it before Paseran!{N}I think that tree has{N}something to do with it.{W1}"
                rts

    ; End of function Map8_2C4_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map8_2C4_EntityEvent9:
                
                 
                txt     1341            ; "We recently came from Hassan.{N}Hassan is a port in the south.{W2}"
                txt     1342            ; "It was once very prosperous,{N}but now it's desolate.{W1}"
                rts

    ; End of function Map8_2C4_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map8_2C4_EntityEvent10:
                
                 
                txt     1343            ; "My dad went to the cave in{N}the north.{W2}"
                txt     1344            ; "But, I'm not worried!{N}He's very strong.{W1}"
                rts

    ; End of function Map8_2C4_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map8_2C4_EntityEvent11:
                
                 
                txt     1345            ; "My dear husband never{N}returned from the cave.{W2}"
                txt     1346            ; "The cave was somehow{N}blocked.  How can I explain{N}this to my son?{W1}"
                rts

    ; End of function Map8_2C4_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map8_2C4_EntityEvent13:
                
                move.b  #3,((CURRENT_SHOP_INDEX-$1000000)).w
                move.b  #$12,((CURRENT_SHOP_INDEX-$1000000)).w
                jmp     j_ShopMenuActions

    ; End of function Map8_2C4_EntityEvent13


; =============== S U B R O U T I N E =======================================


Map8_2C4_EntityEvent12:
                
                 
                chkFlg  8               ; May joined
                bne.s   Map8_DefaultEntityEvent
                script  cs_56146
Map8_DefaultEntityEvent:
                
                rts

    ; End of function Map8_2C4_EntityEvent12

cs_56146:       setActscriptWait ALLY_MAY,eas_Init
                setActscriptWait ALLY_MAY,eas_StopMoving
                faceEntity ALLY_MAY,ALLY_BOWIE
                textCursor 1347
                nextSingleText $0,ALLY_MAY ; "The people in this village{N}are cowards!{W2}{N}When do they ever go{N}adventuring?{N}I can't take it anymore!{W2}{N}Hey, would you mind if I{N}joined you?{W1}"
                join ALLY_MAY
                nextSingleText $0,ALLY_MAY ; "Now, let's go!{W1}"
                addNewFollower ALLY_MAY
                csc_end
cs_56172:       textCursor 1332
                nextSingleText $0,135   ; "To Mt. Volcano?{W1}"
                setActscript 135,eas_Jump
                setActscriptWait 134,eas_Jump
                setFacing 134,RIGHT
                setFacing 135,LEFT
                csWait 57
                setFacing 134,DOWN
                nextText $0,134         ; "Go east and then go north{N}along the river.  A cave is{N}there.{W2}"
                nextSingleText $0,134   ; "But, I don't recommend you{N}enter such a terrible place!{W1}"
                setFacing 135,DOWN
                nextText $0,135         ; "We call it the Cave of{N}Darkness.  You can't see{N}anything inside.{W2}"
                nextSingleText $0,135   ; "The cave is the only way to{N}get to Mt. Volcano.{W1}"
                csc_end
