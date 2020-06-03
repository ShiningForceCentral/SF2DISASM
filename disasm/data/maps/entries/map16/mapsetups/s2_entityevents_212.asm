
; ASM FILE data\maps\entries\map16\mapsetups\s2_entityevents_212.asm :
; 0x61058..0x6114E : 
ms_map16_flag212_EntityEvents:
                msEntityEvent 128, UP, Map16_212_EntityEvent0-ms_map16_flag212_EntityEvents
                msEntityEvent 129, DOWN, Map16_212_EntityEvent1-ms_map16_flag212_EntityEvents
                msEntityEvent 130, UP, Map16_212_EntityEvent2-ms_map16_flag212_EntityEvents
                msEntityEvent 131, DOWN, Map16_212_EntityEvent3-ms_map16_flag212_EntityEvents
                msEntityEvent 132, DOWN, Map16_212_EntityEvent4-ms_map16_flag212_EntityEvents
                msEntityEvent 133, UP, Map16_212_EntityEvent5-ms_map16_flag212_EntityEvents
                msEntityEvent 134, UP, Map16_212_EntityEvent6-ms_map16_flag212_EntityEvents
                msEntityEvent 135, UP, Map16_212_EntityEvent7-ms_map16_flag212_EntityEvents
                msEntityEvent 136, UP, Map16_212_EntityEvent8-ms_map16_flag212_EntityEvents
                msEntityEvent 137, UP, Map16_212_EntityEvent9-ms_map16_flag212_EntityEvents
                msEntityEvent 138, UP, Map16_212_EntityEvent10-ms_map16_flag212_EntityEvents
                msEntityEvent 139, UP, Map16_212_EntityEvent11-ms_map16_flag212_EntityEvents
                msEntityEvent 140, UP, Map16_212_EntityEvent12-ms_map16_flag212_EntityEvents
                msEntityEvent 141, UP, Map16_212_EntityEvent13-ms_map16_flag212_EntityEvents
                msEntityEvent 142, RIGHT, Map16_212_EntityEvent14-ms_map16_flag212_EntityEvents
                msEntityEvent 143, UP, Map16_212_EntityEvent15-ms_map16_flag212_EntityEvents
                msEntityEvent 144, UP, Map16_212_EntityEvent16-ms_map16_flag212_EntityEvents
                msEntityEvent 145, RIGHT, Map16_212_EntityEvent17-ms_map16_flag212_EntityEvents
                msDefaultEntityEvent Map16_212_DefaultEntityEvent-ms_map16_flag212_EntityEvents

; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent0:
                
                 
                txt     $DA0            ; "Red Baron is {NAME;28}.{W2}"
                txt     $DA1            ; "He was running around and{N}crying for somebody to kill{N}him.{W1}"
                rts

    ; End of function Map16_212_EntityEvent0


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent1:
                
                 
                txt     $DA2            ; "{NAME;28} went south.{N}He was acting strange.{W1}"
                rts

    ; End of function Map16_212_EntityEvent1


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent2:
                
                 
                txt     $DA3            ; "King Galam has not returned{N}from the war against{N}Granseal.{W1}"
                rts

    ; End of function Map16_212_EntityEvent2


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent3:
                
                 
                txt     $DA4            ; "{NAME;28} made that hole.{W2}"
                txt     $DA5            ; "He jumped off the top of the{N}castle, but he didn't die!{W1}"
                rts

    ; End of function Map16_212_EntityEvent3


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent4:
                
                 
                txt     $DA6            ; "My boyfriend has not{N}returned from the war...{W2}"
                txt     $DA7            ; "I hope he's alive...{W1}"
                rts

    ; End of function Map16_212_EntityEvent4


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent5:
                
                 
                txt     $DA8            ; "I heard from a soldier that{N}Yeel is haunted.{W2}"
                txt     $DA9            ; "He said that he heard the{N}sound of a piano playing.{W1}"
                rts

    ; End of function Map16_212_EntityEvent5


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent6:
                
                 
                txt     $DAA            ; "From Granseal?  I didn't{N}know anyone survived that{N}earthquake.{W1}"
                rts

    ; End of function Map16_212_EntityEvent6


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent7:
                
                 
                txt     $DAB            ; "The priest of Yeel liked the{N}piano.  The ghost may be him.{W1}"
                rts

    ; End of function Map16_212_EntityEvent7


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent8:
                
                 
                txt     $DAC            ; "Do you know about the stautue{N}of the devil?  It appeared{N}at the Ancient Tower.{W1}"
                rts

    ; End of function Map16_212_EntityEvent8


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent9:
                
                move.b  #$1D,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenuActions
                rts

    ; End of function Map16_212_EntityEvent9


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent10:
                
                jsr     j_ChurchMenuActions
                rts

    ; End of function Map16_212_EntityEvent10


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent11:
                
                 
                txt     $DAD            ; "Red Baron was looking for{N}something at the Ancient{N}Tower.{W2}"
                txt     $DAE            ; "Nobody returned from that{N}trip.  I didn't go. I was{N}smart!{W1}"
                rts

    ; End of function Map16_212_EntityEvent11


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent12:
                
                 
                txt     $DB1            ; "I...I saw them...many devils{N}came from the tower....{W1}"
                rts

    ; End of function Map16_212_EntityEvent12


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent13:
                
                 
                txt     $DB6            ; "Good weapons and armor, huh?{W1}"
                rts

    ; End of function Map16_212_EntityEvent13


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent14:
                
                move.w  ((SPEECH_SFX-$1000000)).w,((SPEECH_SFX_BACKUP-$1000000)).w
                clr.w   ((SPEECH_SFX-$1000000)).w
                clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $1A7            ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
                txt     $FF2            ; "A hole.{W1}"
                rts

    ; End of function Map16_212_EntityEvent14


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent15:
                
                move.b  #$E,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenuActions
                rts

    ; End of function Map16_212_EntityEvent15


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent16:
                
                 
                txt     $DB3            ; "You want to enter the tower?{W2}"
                txt     $DB4            ; "Impossible.  It's buried in{N}the ground and there is no{N}door.{W1}"
                rts

    ; End of function Map16_212_EntityEvent16


; =============== S U B R O U T I N E =======================================

Map16_212_EntityEvent17:
                
                jsr     j_CaravanActions
Map16_212_DefaultEntityEvent:
                
                rts

    ; End of function Map16_212_EntityEvent17

