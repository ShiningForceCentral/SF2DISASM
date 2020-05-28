
; ASM FILE data\maps\entries\map62\mapsetups\s2_entityevents.asm :
; 0x5C7B6..0x5C820 : 
ms_map62_EntityEvents:
                msEntityEvent 128, DOWN, Map62_EntityEvent0-ms_map62_EntityEvents
                msEntityEvent 129, DOWN, Map62_EntityEvent1-ms_map62_EntityEvents
                msDefaultEntityEvent Map62_DefaultEntityEvent-ms_map62_EntityEvents

; =============== S U B R O U T I N E =======================================

Map62_EntityEvent0:
                
                 
                chkFlg  $2DC            ; Set after the old man fails to open the way to Grans in the Wooden Panel shrine
                bne.s   byte_5C7F0      
                chkFlg  $102            ; TEMP FLAG #02
                bne.s   byte_5C7E6      
                txt     $E28            ; "He spent all his spare time{N}studying the Sky Orb.{W2}"
                txt     $E29            ; "It is quite old.{N}He deduced that our{N}ancestors could fly.{W2}"
                txt     $E2A            ; "The last known location of{N}the Nazca Ship was Grans.{W1}"
                chkFlg  $2D9            ; ???
                beq.s   loc_5C7E4
                setFlg  $102            ; TEMP FLAG #02
loc_5C7E4:
                
                bra.s   loc_5C7EE
byte_5C7E6:
                
                txt     $E37            ; "Good luck.{W2}"
                txt     $E38            ; "If you see my brother,{N}please tell him that I'm OK.{W1}"
loc_5C7EE:
                
                bra.s   return_5C7F4
byte_5C7F0:
                
                txt     $E39            ; "Oh, what a pity.{N}You can't go to Grans.{W1}"
return_5C7F4:
                
                rts

    ; End of function Map62_EntityEvent0


; =============== S U B R O U T I N E =======================================

Map62_EntityEvent1:
                
                 
                chkFlg  $2D9            ; ???
                bne.s   byte_5C81A      
                chkFlg  $2D8            ; ???
                bne.s   byte_5C80E
                script  cs_5C8D4
                setFlg  $2D8            ; ???
                bra.s   loc_5C818
byte_5C80E:
                
                script  cs_5C914
                setFlg  $2D9            ; ???
loc_5C818:
                
                bra.s   Map62_DefaultEntityEvent
byte_5C81A:
                
                txt     $9D0            ; "Sorry, guys!  We can't go to{N}Grans Island this way.{W1}"
Map62_DefaultEntityEvent:
                
                rts

    ; End of function Map62_EntityEvent1

