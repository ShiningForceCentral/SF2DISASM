
; ASM FILE data\maps\entries\map13\mapsetups\s2_entityevents.asm :
; 0x5801E..0x5814C : 
ms_map13_EntityEvents:
                msEntityEvent ALLY_GERHALT, UP, Map13_EntityEvent0-ms_map13_EntityEvents
                msEntityEvent 128, UP, Map13_EntityEvent1-ms_map13_EntityEvents
                msEntityEvent 129, UP, Map13_EntityEvent2-ms_map13_EntityEvents
                msEntityEvent 130, RIGHT, Map13_EntityEvent3-ms_map13_EntityEvents
                msEntityEvent 131, UP, Map13_EntityEvent4-ms_map13_EntityEvents
                msEntityEvent 132, UP, Map13_EntityEvent5-ms_map13_EntityEvents
                msEntityEvent 133, DOWN, Map13_EntityEvent6-ms_map13_EntityEvents
                msEntityEvent 134, DOWN, Map13_EntityEvent7-ms_map13_EntityEvents
                msEntityEvent 135, UP, Map13_EntityEvent8-ms_map13_EntityEvents
                msEntityEvent 136, UP, Map13_EntityEvent9-ms_map13_EntityEvents
                msEntityEvent 137, DOWN, Map13_EntityEvent10-ms_map13_EntityEvents
                msEntityEvent 138, DOWN, Map13_EntityEvent11-ms_map13_EntityEvents
                msEntityEvent 140, RIGHT, Map13_EntityEvent12-ms_map13_EntityEvents
                msDefaultEntityEvent Map13_DefaultEntityEvent-ms_map13_EntityEvents

; =============== S U B R O U T I N E =======================================


Map13_EntityEvent1:
                
                 
                chkFlg  256             ; TEMP FLAG #00
                bne.s   byte_58068      
                txt     1420            ; "How did you come to{N}Polca Village?{W2}"
                txt     1421            ; "Through the cave?{N}Nobody has come to this{N}village since...{W2}"
                setFlg  256             ; TEMP FLAG #00
byte_58068:
                
                txt     1422            ; "Oh, you defeated that{N}hobgoblin?  Wow!{W2}"
                txt     1423            ; "Now we can use that tunnel{N}to travel between Polca and{N}the wilderness area!{W1}"
                rts

    ; End of function Map13_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map13_EntityEvent2:
                
                 
                txt     1424            ; "Breathe deeply....{W2}{N}Wonderful air, huh?{W1}"
                rts

    ; End of function Map13_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map13_EntityEvent3:
                
                 
                chkFlg  711             ; Set after you dislodge the turtle/fairy in Polca, also set after you speak to Volcanon
                bne.s   byte_5808A      
                script  cs_58512
                setFlg  711             ; Set after you dislodge the turtle/fairy in Polca, also set after you speak to Volcanon
                bra.s   return_5808E
byte_5808A:
                
                txt     1425            ; "In ancient times, there{N}were magic tunnels.{W2}{N}People traveled easily{N}through the tunnels.{W1}"
return_5808E:
                
                rts

    ; End of function Map13_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map13_EntityEvent4:
                
                move.b  #SHOP_WEAPON_POLCA,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                rts

    ; End of function Map13_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map13_EntityEvent5:
                
                move.b  #SHOP_ITEM_POLCA,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                rts

    ; End of function Map13_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map13_EntityEvent6:
                
                 
                chkFlg  710             ; Set after Oddler wanders down from the mountain
                bne.s   byte_580B8      
                txt     1426            ; "To the east is the sacred{N}area of Volcanon.{W1}"
                bra.s   return_580C4
byte_580B8:
                
                txt     1465            ; "He came down from the{N}mountain....{W2}"
                txt     1466            ; "He's not from Polca, or{N}Bedoe....{W2}"
                txt     1467            ; "Where did he come from?{W1}"
return_580C4:
                
                rts

    ; End of function Map13_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map13_EntityEvent7:
                
                jsr     j_ChurchMenu
                rts

    ; End of function Map13_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map13_EntityEvent8:
                
                 
                txt     1427            ; "Mt. Volcano is home to{N}beastmen.{W2}{N}We were a warlike tribe, but{N}we've almost forgotten how{N}to fight.{W1}"
                rts

    ; End of function Map13_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map13_EntityEvent9:
                
                 
                txt     1428            ; "Young men these days are{N}lucky!  I wish I was young{N}again!{W1}"
                rts

    ; End of function Map13_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map13_EntityEvent10:
                
                 
                chkFlg  710             ; Set after Oddler wanders down from the mountain
                bne.s   byte_580FC      
                chkFlg  257             ; TEMP FLAG #01
                bne.s   byte_580F2      
                script  cs_58116
                setFlg  257             ; TEMP FLAG #01
                bra.s   loc_580FA
byte_580F2:
                
                txt     1431            ; "Whoa!  Mt. Volcano erupted!{W2}"
                txt     1432            ; "It's an evil omen.{W1}"
loc_580FA:
                
                bra.s   return_58100
byte_580FC:
                
                txt     1463            ; "Oh, this is serious!{N}I hope he survives the night.{W1}"
return_58100:
                
                rts

    ; End of function Map13_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map13_EntityEvent11:
                
                 
                txt     1433            ; "Clank!  Clank!{N}All of our weapons are made{N}by me!{W2}{N}But, who uses them in this{N}peaceful country?{W1}"
                rts

    ; End of function Map13_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map13_EntityEvent0:
                
                 
                txt     1434            ; "Hirsute?  'Cause I'm a{N}beastman.{W2}{N}I'm not hairy enough though.{N}I envy those hairy guys!{W1}"
                rts

    ; End of function Map13_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map13_EntityEvent12:
                
                 
                txt     1464            ; "Ah...stop...no!{N}I don't want...to see....{N}My...head...aches....{W1}"
                rts

    ; End of function Map13_EntityEvent12


; =============== S U B R O U T I N E =======================================


Map13_DefaultEntityEvent:
                
                rts

    ; End of function Map13_DefaultEntityEvent

cs_58116:       textCursor 1429
                nextSingleText $0,137   ; "You're not aware, but{N}Volcanon has become{N}irritated...{W1}"
                csWait 30
                setQuake 32770
                setQuake 16386
                nextSingleText $0,137   ; "...like that!  And, it's getting{N}worse.{N}What's wrong you ask?{W1}"
                csWait 60
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 5
                flashScreenWhite $46
                setQuake 0
                headshake 137
                nextText $0,137         ; "Whoa!  Mt. Volcano erupted!{W2}"
                nextSingleText $0,137   ; "It's an evil omen.{W1}"
                csc_end
