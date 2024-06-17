
; ASM FILE data\maps\entries\map39\mapsetups\s2_entityevents.asm :
; 0x5E038..0x5E0B2 : 
ms_map39_EntityEvents:
                msEntityEvent ALLY_ZYNK, RIGHT, Map39_EntityEvent0-ms_map39_EntityEvents
                msEntityEvent 128, UP, Map39_EntityEvent1-ms_map39_EntityEvents
                msEntityEvent 129, UP, Map39_EntityEvent2-ms_map39_EntityEvents
                msEntityEvent 130, UP, Map39_EntityEvent3-ms_map39_EntityEvents
                msEntityEvent 131, DOWN, Map39_EntityEvent4-ms_map39_EntityEvents
                msEntityEvent 132, DOWN, Map39_EntityEvent5-ms_map39_EntityEvents
                msEntityEvent 133, UP, Map39_EntityEvent6-ms_map39_EntityEvents
                msEntityEvent 134, UP, Map39_EntityEvent7-ms_map39_EntityEvents
                msDefaultEntityEvent Map39_DefaultEntityEvent-ms_map39_EntityEvents

; =============== S U B R O U T I N E =======================================


Map39_EntityEvent0:
                
                 
                chkFlg  830             ; Set after the Gyan join scene in the Moun underground
                beq.s   return_5E070
                script  cs_5E20A
                setFlg  76              ; Zynk is a follower
                setFlg  836             ; Set after the scene where Zynk stops you as you leave the Moun underground
return_5E070:
                
                rts

    ; End of function Map39_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map39_EntityEvent1:
                
                 
                txt     2043            ; "Pacalon abandoned us!{W1}"
                rts

    ; End of function Map39_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map39_EntityEvent2:
                
                 
                txt     2044            ; "Can you imagine how many{N}people were killed?{W1}"
                rts

    ; End of function Map39_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map39_EntityEvent3:
                
                 
                txt     2045            ; "The devils were defeated?{N}Is it true?{W2}"
                txt     2046            ; "I can go outside now!{W1}"
                rts

    ; End of function Map39_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map39_EntityEvent4:
                
                 
                txt     2047            ; "I wasn't scared!  It was{N}hard for me not to go out{N}and fight.{W1}"
                rts

    ; End of function Map39_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map39_EntityEvent5:
                
                 
                txt     2048            ; "Tom is lying!{N}I know he wet his pants{N}just now.{W1}"
                rts

    ; End of function Map39_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map39_EntityEvent6:
                
                 
                txt     2049            ; "{NAME;26} hid us here{N}when the devils invaded.{W1}"
                rts

    ; End of function Map39_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map39_EntityEvent7:
                
                 
                chkFlg  830             ; Set after the Gyan join scene in the Moun underground
                bne.s   byte_5E0AA      
                txt     2050            ; "{NAME;24} of Ribble is{N}behind me.{W2}"
                txt     2051            ; "He stood guard at the west{N}gate.{W1}"
                bra.s   return_5E0AE
byte_5E0AA:
                
                txt     2052            ; "{NAME;24} fought against{N}the devils at the west gate.{W1}"
return_5E0AE:
                
                rts

    ; End of function Map39_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map39_DefaultEntityEvent:
                
                rts

    ; End of function Map39_DefaultEntityEvent

