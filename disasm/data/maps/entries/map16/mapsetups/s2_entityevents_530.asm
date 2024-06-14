
; ASM FILE data\maps\entries\map16\mapsetups\s2_entityevents_530.asm :
; 0x61058..0x6114E : 
ms_map16_flag530_EntityEvents:
                msEntityEvent 128, UP, Map16_212_EntityEvent0-ms_map16_flag530_EntityEvents
                msEntityEvent 129, DOWN, Map16_212_EntityEvent1-ms_map16_flag530_EntityEvents
                msEntityEvent 130, UP, Map16_212_EntityEvent2-ms_map16_flag530_EntityEvents
                msEntityEvent 131, DOWN, Map16_212_EntityEvent3-ms_map16_flag530_EntityEvents
                msEntityEvent 132, DOWN, Map16_212_EntityEvent4-ms_map16_flag530_EntityEvents
                msEntityEvent 133, UP, Map16_212_EntityEvent5-ms_map16_flag530_EntityEvents
                msEntityEvent 134, UP, Map16_212_EntityEvent6-ms_map16_flag530_EntityEvents
                msEntityEvent 135, UP, Map16_212_EntityEvent7-ms_map16_flag530_EntityEvents
                msEntityEvent 136, UP, Map16_212_EntityEvent8-ms_map16_flag530_EntityEvents
                msEntityEvent 137, UP, Map16_212_EntityEvent9-ms_map16_flag530_EntityEvents
                msEntityEvent 138, UP, Map16_212_EntityEvent10-ms_map16_flag530_EntityEvents
                msEntityEvent 139, UP, Map16_212_EntityEvent11-ms_map16_flag530_EntityEvents
                msEntityEvent 140, UP, Map16_212_EntityEvent12-ms_map16_flag530_EntityEvents
                msEntityEvent 141, UP, Map16_212_EntityEvent13-ms_map16_flag530_EntityEvents
                msEntityEvent 142, RIGHT, Map16_212_EntityEvent14-ms_map16_flag530_EntityEvents
                msEntityEvent 143, UP, Map16_212_EntityEvent15-ms_map16_flag530_EntityEvents
                msEntityEvent 144, UP, Map16_212_EntityEvent16-ms_map16_flag530_EntityEvents
                msEntityEvent 145, RIGHT, Map16_212_EntityEvent17-ms_map16_flag530_EntityEvents
                msDefaultEntityEvent Map16_212_DefaultEntityEvent-ms_map16_flag530_EntityEvents

; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent0:
                
                 
                txt     3488            ; "Red Baron is {NAME;28}.{W2}"
                txt     3489            ; "He was running around and{N}crying for somebody to kill{N}him.{W1}"
                rts

    ; End of function Map16_212_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent1:
                
                 
                txt     3490            ; "{NAME;28} went south.{N}He was acting strange.{W1}"
                rts

    ; End of function Map16_212_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent2:
                
                 
                txt     3491            ; "King Galam has not returned{N}from the war against{N}Granseal.{W1}"
                rts

    ; End of function Map16_212_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent3:
                
                 
                txt     3492            ; "{NAME;28} made that hole.{W2}"
                txt     3493            ; "He jumped off the top of the{N}castle, but he didn't die!{W1}"
                rts

    ; End of function Map16_212_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent4:
                
                 
                txt     3494            ; "My boyfriend has not{N}returned from the war...{W2}"
                txt     3495            ; "I hope he's alive...{W1}"
                rts

    ; End of function Map16_212_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent5:
                
                 
                txt     3496            ; "I heard from a soldier that{N}Yeel is haunted.{W2}"
                txt     3497            ; "He said that he heard the{N}sound of a piano playing.{W1}"
                rts

    ; End of function Map16_212_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent6:
                
                 
                txt     3498            ; "From Granseal?  I didn't{N}know anyone survived that{N}earthquake.{W1}"
                rts

    ; End of function Map16_212_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent7:
                
                 
                txt     3499            ; "The priest of Yeel liked the{N}piano.  The ghost may be him.{W1}"
                rts

    ; End of function Map16_212_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent8:
                
                 
                txt     3500            ; "Do you know about the stautue{N}of the devil?  It appeared{N}at the Ancient Tower.{W1}"
                rts

    ; End of function Map16_212_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent9:
                
                move.b  #SHOP_ITEM_GALAM_1,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                rts

    ; End of function Map16_212_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent10:
                
                jsr     j_ChurchMenu
                rts

    ; End of function Map16_212_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent11:
                
                 
                txt     3501            ; "Red Baron was looking for{N}something at the Ancient{N}Tower.{W2}"
                txt     3502            ; "Nobody returned from that{N}trip.  I didn't go. I was{N}smart!{W1}"
                rts

    ; End of function Map16_212_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent12:
                
                 
                txt     3505            ; "I...I saw them...many devils{N}came from the tower....{W1}"
                rts

    ; End of function Map16_212_EntityEvent12


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent13:
                
                 
                txt     3510            ; "Good weapons and armor, huh?{W1}"
                rts

    ; End of function Map16_212_EntityEvent13


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent14:
                
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                clr.w   ((CURRENT_SPEECH_SFX-$1000000)).w
                clr.w   ((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     423             ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
                txt     4082            ; "A hole.{W1}"
                rts

    ; End of function Map16_212_EntityEvent14


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent15:
                
                move.b  #SHOP_WEAPON_GALAM_1,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                rts

    ; End of function Map16_212_EntityEvent15


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent16:
                
                 
                txt     3507            ; "You want to enter the tower?{W2}"
                txt     3508            ; "Impossible.  It's buried in{N}the ground and there is no{N}door.{W1}"
                rts

    ; End of function Map16_212_EntityEvent16


; =============== S U B R O U T I N E =======================================


Map16_212_EntityEvent17:
                
                jsr     j_CaravanMenu
Map16_212_DefaultEntityEvent:
                
                rts

    ; End of function Map16_212_EntityEvent17

