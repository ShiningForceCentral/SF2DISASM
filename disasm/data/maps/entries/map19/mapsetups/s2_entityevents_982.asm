
; ASM FILE data\maps\entries\map19\mapsetups\s2_entityevents_982.asm :
; 0x62BCA..0x62C6C : 
ms_map19_flag982_EntityEvents:
                msEntityEvent ALLY_JAHA, UP, Map19_3D6_EntityEvent0-ms_map19_flag982_EntityEvents
                msEntityEvent ALLY_CHESTER, UP, Map19_3D6_EntityEvent1-ms_map19_flag982_EntityEvents
                msEntityEvent ALLY_SLADE, UP, Map19_3D6_EntityEvent2-ms_map19_flag982_EntityEvents
                msEntityEvent ALLY_PETER, UP, Map19_3D6_EntityEvent3-ms_map19_flag982_EntityEvents
                msEntityEvent ALLY_MAY, UP, Map19_3D6_EntityEvent4-ms_map19_flag982_EntityEvents
                msEntityEvent ALLY_ROHDE, UP, Map19_3D6_EntityEvent5-ms_map19_flag982_EntityEvents
                msEntityEvent ALLY_LUKE, UP, Map19_3D6_EntityEvent6-ms_map19_flag982_EntityEvents
                msEntityEvent ALLY_HIGINS, UP, Map19_3D6_EntityEvent7-ms_map19_flag982_EntityEvents
                msEntityEvent ALLY_SHEELA, UP, Map19_3D6_EntityEvent8-ms_map19_flag982_EntityEvents
                msEntityEvent ALLY_CHAZ, UP, Map19_3D6_EntityEvent9-ms_map19_flag982_EntityEvents
                msEntityEvent ALLY_ZYNK, UP, Map19_3D6_EntityEvent10-ms_map19_flag982_EntityEvents
                msEntityEvent 128, DOWN, Map19_3D6_EntityEvent11-ms_map19_flag982_EntityEvents
                msEntityEvent 129, UP, Map19_3D6_EntityEvent12-ms_map19_flag982_EntityEvents
                msEntityEvent 130, DOWN, (Map19_21F_EntityEvent10-ms_map19_flag982_EntityEvents) & $FFFF
                msEntityEvent 131, UP, (Map19_21F_EntityEvent11-ms_map19_flag982_EntityEvents) & $FFFF
                msEntityEvent 132, UP, (Map19_21F_EntityEvent12-ms_map19_flag982_EntityEvents) & $FFFF
                msEntityEvent 133, RIGHT, (Map19_21F_EntityEvent13-ms_map19_flag982_EntityEvents) & $FFFF
                msEntityEvent 134, RIGHT, (Map19_21F_EntityEvent14-ms_map19_flag982_EntityEvents) & $FFFF
                msDefaultEntityEvent (Map19_21F_DefaultEntityEvent-ms_map19_flag982_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================


Map19_3D6_EntityEvent11:
                
                 
                txt     4008            ; "The Minister is waiting{N}for you.{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map19_3D6_EntityEvent12:
                
                 
                txt     4009            ; "Oh, {LEADER}!{N}I really respect you.{W2}"
                rts

    ; End of function Map19_3D6_EntityEvent12


; =============== S U B R O U T I N E =======================================


Map19_3D6_EntityEvent0:
                
                 
                txt     4029            ; "It's OK...{W2}{N}I'll find a girl someday!{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map19_3D6_EntityEvent1:
                
                 
                txt     3997            ; "What does he mean?{N}I don't understand!{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map19_3D6_EntityEvent2:
                
                 
                txt     4030            ; "Don't worry.{N}He's tough.{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map19_3D6_EntityEvent3:
                
                 
                txt     4026            ; "Hurry, {LEADER}!{N}Princess Elis is upstairs!{W2}"
                txt     4027            ; "You were so cool in our{N}adventure two years ago!{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map19_3D6_EntityEvent4:
                
                 
                txt     3986            ; "{LEADER} is a human!{N}They will make a cute couple!{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map19_3D6_EntityEvent5:
                
                 
                txt     3998            ; "They remind me of when I{N}was young.{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map19_3D6_EntityEvent6:
                
                 
                txt     4028            ; "{LEADER}, go kiss her!{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map19_3D6_EntityEvent7:
                
                 
                txt     3988            ; "I think he's the best{N}choice.{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map19_3D6_EntityEvent8:
                
                 
                txt     4031            ; "You're blushing!{N}Just be cool!{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map19_3D6_EntityEvent9:
                
                 
                txt     4002            ; "{NAME;4} will take care{N}of {NAME;1}.{W2}"
                txt     4003            ; "Everything went as you{N}expected, huh?{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map19_3D6_EntityEvent10:
                
                 
                txt     4032            ; "He was young before?{W1}"
                rts

    ; End of function Map19_3D6_EntityEvent10

