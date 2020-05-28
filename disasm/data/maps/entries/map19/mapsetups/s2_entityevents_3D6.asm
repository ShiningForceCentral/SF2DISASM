
; ASM FILE data\maps\entries\map19\mapsetups\s2_entityevents_3D6.asm :
; 0x62BCA..0x62C6C : 
ms_map19_flag3D6_EntityEvents:
                msEntityEvent 3, UP, Map19_3D6_EntityEvent0-ms_map19_flag3D6_EntityEvents
                msEntityEvent 2, UP, Map19_3D6_EntityEvent1-ms_map19_flag3D6_EntityEvents
                msEntityEvent 5, UP, Map19_3D6_EntityEvent2-ms_map19_flag3D6_EntityEvents
                msEntityEvent 7, UP, Map19_3D6_EntityEvent3-ms_map19_flag3D6_EntityEvents
                msEntityEvent 8, UP, Map19_3D6_EntityEvent4-ms_map19_flag3D6_EntityEvents
                msEntityEvent 11, UP, Map19_3D6_EntityEvent5-ms_map19_flag3D6_EntityEvents
                msEntityEvent 10, UP, Map19_3D6_EntityEvent6-ms_map19_flag3D6_EntityEvents
                msEntityEvent 19, UP, Map19_3D6_EntityEvent7-ms_map19_flag3D6_EntityEvents
                msEntityEvent 25, UP, Map19_3D6_EntityEvent8-ms_map19_flag3D6_EntityEvents
                msEntityEvent 27, UP, Map19_3D6_EntityEvent9-ms_map19_flag3D6_EntityEvents
                msEntityEvent 26, UP, Map19_3D6_EntityEvent10-ms_map19_flag3D6_EntityEvents
                msEntityEvent 128, DOWN, Map19_3D6_EntityEvent11-ms_map19_flag3D6_EntityEvents
                msEntityEvent 129, UP, Map19_3D6_EntityEvent12-ms_map19_flag3D6_EntityEvents
                msEntityEvent 130, DOWN, (Map19_21F_EntityEvent10-ms_map19_flag3D6_EntityEvents) & $FFFF
                msEntityEvent 131, UP, (Map19_21F_EntityEvent11-ms_map19_flag3D6_EntityEvents) & $FFFF
                msEntityEvent 132, UP, (Map19_21F_EntityEvent12-ms_map19_flag3D6_EntityEvents) & $FFFF
                msEntityEvent 133, RIGHT, (Map19_21F_EntityEvent13-ms_map19_flag3D6_EntityEvents) & $FFFF
                msEntityEvent 134, RIGHT, (Map19_21F_EntityEvent14-ms_map19_flag3D6_EntityEvents) & $FFFF
                msDefaultEntityEvent (Map19_21F_DefaultEntityEvent-ms_map19_flag3D6_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

Map19_3D6_EntityEvent11:
                
                 
                txt     $FA8            ; "The Minister is waiting{N}for you.{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent11


; =============== S U B R O U T I N E =======================================

Map19_3D6_EntityEvent12:
                
                 
                txt     $FA9            ; "Oh, {LEADER}!{N}I really respect you.{W2}"
                rts

    ; End of function Map19_3D6_EntityEvent12


; =============== S U B R O U T I N E =======================================

Map19_3D6_EntityEvent0:
                
                 
                txt     $FBD            ; "It's OK...{W2}{N}I'll find a girl someday!{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent0


; =============== S U B R O U T I N E =======================================

Map19_3D6_EntityEvent1:
                
                 
                txt     $F9D            ; "What does he mean?{N}I don't understand!{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent1


; =============== S U B R O U T I N E =======================================

Map19_3D6_EntityEvent2:
                
                 
                txt     $FBE            ; "Don't worry.{N}He's tough.{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent2


; =============== S U B R O U T I N E =======================================

Map19_3D6_EntityEvent3:
                
                 
                txt     $FBA            ; "Hurry, {LEADER}!{N}Princess Elis is upstairs!{W2}"
                txt     $FBB            ; "You were so cool in our{N}adventure two years ago!{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent3


; =============== S U B R O U T I N E =======================================

Map19_3D6_EntityEvent4:
                
                 
                txt     $F92            ; "{LEADER} is a human!{N}They will make a cute couple!{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent4


; =============== S U B R O U T I N E =======================================

Map19_3D6_EntityEvent5:
                
                 
                txt     $F9E            ; "They remind me of when I{N}was young.{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent5


; =============== S U B R O U T I N E =======================================

Map19_3D6_EntityEvent6:
                
                 
                txt     $FBC            ; "{LEADER}, go kiss her!{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent6


; =============== S U B R O U T I N E =======================================

Map19_3D6_EntityEvent7:
                
                 
                txt     $F94            ; "I think he's the best{N}choice.{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent7


; =============== S U B R O U T I N E =======================================

Map19_3D6_EntityEvent8:
                
                 
                txt     $FBF            ; "You're blushing!{N}Just be cool!{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent8


; =============== S U B R O U T I N E =======================================

Map19_3D6_EntityEvent9:
                
                 
                txt     $FA2            ; "{NAME;4} will take care{N}of {NAME;1}.{W2}"
                txt     $FA3            ; "Everything went as you{N}expected, huh?{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent9


; =============== S U B R O U T I N E =======================================

Map19_3D6_EntityEvent10:
                
                 
                txt     $FC0            ; "He was young before?{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent10

