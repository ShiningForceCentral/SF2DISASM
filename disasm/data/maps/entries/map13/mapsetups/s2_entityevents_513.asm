
; ASM FILE data\maps\entries\map13\mapsetups\s2_entityevents_513.asm :
; 0x5814C..0x5822A : 
ms_map13_flag513_EntityEvents:
                msEntityEvent 128, UP, Map13_201_EntityEvent0-ms_map13_flag513_EntityEvents
                msEntityEvent 129, UP, Map13_201_EntityEvent1-ms_map13_flag513_EntityEvents
                msEntityEvent 130, RIGHT, (Map13_EntityEvent3-ms_map13_flag513_EntityEvents) & $FFFF
                msEntityEvent 131, UP, (Map13_EntityEvent4-ms_map13_flag513_EntityEvents) & $FFFF
                msEntityEvent 132, UP, (Map13_EntityEvent5-ms_map13_flag513_EntityEvents) & $FFFF
                msEntityEvent 133, DOWN, Map13_201_EntityEvent5-ms_map13_flag513_EntityEvents
                msEntityEvent 134, DOWN, (Map13_EntityEvent7-ms_map13_flag513_EntityEvents) & $FFFF
                msEntityEvent 135, UP, Map13_201_EntityEvent7-ms_map13_flag513_EntityEvents
                msEntityEvent 136, UP, Map13_201_EntityEvent8-ms_map13_flag513_EntityEvents
                msEntityEvent 137, RIGHT, Map13_201_EntityEvent9-ms_map13_flag513_EntityEvents
                msEntityEvent 138, DOWN, Map13_201_EntityEvent10-ms_map13_flag513_EntityEvents
                msEntityEvent 139, UP, Map13_201_EntityEvent11-ms_map13_flag513_EntityEvents
                msEntityEvent 140, UP, Map13_201_EntityEvent12-ms_map13_flag513_EntityEvents
                msDefaultEntityEvent (Map13_DefaultEntityEvent-ms_map13_flag513_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================


Map13_201_EntityEvent0:
                
                 
                txt     1439            ; "I've been to a desolate{N}port town in the south....{W1}"
                rts

    ; End of function Map13_201_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map13_201_EntityEvent1:
                
                 
                txt     1440            ; "They say, a huge monster{N}lives in the river.{W1}"
                rts

    ; End of function Map13_201_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map13_201_EntityEvent5:
                
                 
                txt     1441            ; "You saw Volcanon?{N}Are you serious?{W2}{N}I've never met him, though{N}I've lived here all my life.{W1}"
                rts

    ; End of function Map13_201_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map13_201_EntityEvent7:
                
                 
                txt     1442            ; "There's a desert in the south.{W2}{N}Ancient ruins lay in the{N}desert.{W1}"
                rts

    ; End of function Map13_201_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map13_201_EntityEvent8:
                
                 
                txt     1443            ; "I could help you if I were{N}younger.{W2}{N}But now I'm too darn old.{N}Drat!{W1}"
                rts

    ; End of function Map13_201_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map13_201_EntityEvent9:
                
                 
                chkFlg  718             ; Set after Oddler runs after you as you leave Polca, and tags along
                bne.s   byte_58212      
                chkFlg  717             ; Set after the mayor first tries to have you take Oddler with you (Peter declines)
                bne.s   byte_5820C      
                chkFlg  716             ; Set after your raft-giving conversation with the mayor in Polca
                bne.s   byte_58206      
                chkFlg  260             ; TEMP FLAG #04
                bne.s   byte_581C4      
                txt     1448            ; "Pl...please...take that boy{N}with you!{W1}"
                setFlg  260             ; TEMP FLAG #04
                bra.s   loc_58204
byte_581C4:
                
                chkFlg  261             ; TEMP FLAG #05
                bne.s   byte_581D4      
                txt     1449            ; "Ddddd...don't kill me!{W1}"
                setFlg  261             ; TEMP FLAG #05
                bra.s   loc_58204
byte_581D4:
                
                chkFlg  262             ; TEMP FLAG #06
                bne.s   byte_581E4
                txt     1450            ; "Please, take him!{W1}"
                setFlg  262             ; TEMP FLAG #06
                bra.s   loc_58204
byte_581E4:
                
                script  cs_58856
                setFlg  716             ; Set after your raft-giving conversation with the mayor in Polca
                setFlg  64              ; Raft is unlocked
                move.b  #$48,((RAFT_MAP_INDEX-$1000000)).w 
                move.b  #$2B,((RAFT_X-$1000000)).w 
                move.b  #$30,((RAFT_Y-$1000000)).w 
loc_58204:
                
                bra.s   loc_5820A
byte_58206:
                
                txt     1512            ; "Why don't you take a look{N}at it right now?{W1}"
loc_5820A:
                
                bra.s   loc_58210
byte_5820C:
                
                txt     1451            ; "Do I have to ask you to{N}take him with you again?{W1}"
loc_58210:
                
                bra.s   return_58216
byte_58212:
                
                txt     1444            ; "Before we knew...we tried{N}to avoid the fighting....{W1}"
return_58216:
                
                rts

    ; End of function Map13_201_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map13_201_EntityEvent10:
                
                 
                txt     1445            ; "Clank!  Clank!{W2}{N}I heard that blacksmiths in{N}ancient times made special{N}weapons from a rare metal.{W1}"
                rts

    ; End of function Map13_201_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map13_201_EntityEvent11:
                
                 
                txt     1446            ; "I need more hair and more{N}courage!{W2}{N}I couldn't move when I{N}saw the devils....{W1}"
                rts

    ; End of function Map13_201_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map13_201_EntityEvent12:
                
                 
                txt     1447            ; "Who are you?{N}Excuse me, but...{N}I'm blind.{W1}"
                rts

    ; End of function Map13_201_EntityEvent12

