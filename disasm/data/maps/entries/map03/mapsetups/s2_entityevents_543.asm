
; ASM FILE data\maps\entries\map03\mapsetups\s2_entityevents_543.asm :
; 0x62738..0x62820 : 
ms_map3_flag543_EntityEvents:
                msEntityEvent 128, DOWN, Map3_21F_EntityEvent0-ms_map3_flag543_EntityEvents
                msEntityEvent 129, DOWN, Map3_21F_EntityEvent1-ms_map3_flag543_EntityEvents
                msEntityEvent 130, UP, Map3_21F_EntityEvent2-ms_map3_flag543_EntityEvents
                msEntityEvent 131, UP, Map3_21F_EntityEvent3-ms_map3_flag543_EntityEvents
                msEntityEvent 132, UP, Map3_21F_EntityEvent4-ms_map3_flag543_EntityEvents
                msEntityEvent 133, DOWN, Map3_21F_EntityEvent5-ms_map3_flag543_EntityEvents
                msEntityEvent 134, DOWN, Map3_21F_EntityEvent6-ms_map3_flag543_EntityEvents
                msEntityEvent 135, UP, Map3_21F_EntityEvent7-ms_map3_flag543_EntityEvents
                msEntityEvent 136, UP, Map3_21F_EntityEvent8-ms_map3_flag543_EntityEvents
                msEntityEvent 137, UP, Map3_21F_EntityEvent9-ms_map3_flag543_EntityEvents
                msEntityEvent 138, UP, Map3_21F_EntityEvent10-ms_map3_flag543_EntityEvents
                msEntityEvent ALLY_SARAH, UP, Map3_21F_EntityEvent11-ms_map3_flag543_EntityEvents
                msEntityEvent ALLY_CHESTER, UP, Map3_21F_EntityEvent12-ms_map3_flag543_EntityEvents
                msEntityEvent ALLY_JAHA, UP, Map3_21F_EntityEvent13-ms_map3_flag543_EntityEvents
                msEntityEvent ALLY_KAZIN, UP, Map3_21F_EntityEvent14-ms_map3_flag543_EntityEvents
                msDefaultEntityEvent Map3_21F_DefaultEntityEvent-ms_map3_flag543_EntityEvents

; =============== S U B R O U T I N E =======================================


Map3_21F_DefaultEntityEvent:
                
                rts

    ; End of function Map3_21F_DefaultEntityEvent


; =============== S U B R O U T I N E =======================================


Map3_21F_EntityEvent0:
                
                 
                txt     3919            ; "{LEADER}, did you hear?{W2}"
                txt     3920            ; "The Princess' face turned{N}pink!{W1}"
                rts

    ; End of function Map3_21F_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map3_21F_EntityEvent1:
                
                 
                txt     3921            ; "Ah, {LEADER}!{N}I'm so happy!{W2}"
                txt     3922            ; "I heard Princess Elis is{N}going to awaken today!{W1}"
                rts

    ; End of function Map3_21F_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map3_21F_EntityEvent2:
                
                 
                txt     3923            ; "Thanks to Galam and{N}Pacalon, Granseal is{N}now the same as before!{W1}"
                rts

    ; End of function Map3_21F_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map3_21F_EntityEvent3:
                
                 
                txt     3924            ; "Galam is making a statue of{N}{NAME;28} as a memorial.{W1}"
                rts

    ; End of function Map3_21F_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map3_21F_EntityEvent4:
                
                 
                txt     3925            ; "{LEADER}, you...will...{N}kiss...her...?{W2}"
                txt     3926            ; "I don't like you anymore.{N}(Sigh){W1}"
                rts

    ; End of function Map3_21F_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map3_21F_EntityEvent5:
                
                 
                txt     3927            ; "I'm so happy.  I'll get to{N}see Elis again!{W1}"
                rts

    ; End of function Map3_21F_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map3_21F_EntityEvent6:
                
                 
                txt     3928            ; "{NAME;2} had better not{N}be the one who kisses her.{W2}"
                txt     3929            ; "If he kisses her, he'll have{N}my hoofprints on his rump!{W1}"
                rts

    ; End of function Map3_21F_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map3_21F_EntityEvent7:
                
                 
                script  cs_628C8
                rts

    ; End of function Map3_21F_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map3_21F_EntityEvent8:
                
                 
                txt     3930            ; "I heard a rumor!{N}Are you going to kiss her?{W2}"
                txt     3931            ; "Shucks, I wish I were as{N}young as you.{W1}"
                rts

    ; End of function Map3_21F_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map3_21F_EntityEvent9:
                
                 
                txt     3910            ; "Why am I here?{W2}"
                txt     3911            ; "We have no more enemies.{W1}"
                rts

    ; End of function Map3_21F_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map3_21F_EntityEvent10:
                
                 
                txt     3932            ; "Morning, {LEADER}.{W2}"
                txt     3933            ; "Are you ready to go to{N}the castle?{W1}"
                jsr     j_YesNoPrompt
                tst.w   d0
                bne.s   byte_627F2      
                txt     4033            ; "Now, let's go see the King!{W1}"
                setFlg  981
                script  cs_6290C
                bra.s   return_627F6
byte_627F2:
                
                txt     4034            ; "No?  You said NO?{N}We have no time to waste!{W1}"
return_627F6:
                
                rts

    ; End of function Map3_21F_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map3_21F_EntityEvent11:
                
                 
                txt     3934            ; "I know somebody must kiss{N}her....{W2}"
                txt     3935            ; "Who will it be?{N}What will I do if...{N}it's...?{W1}"
                rts

    ; End of function Map3_21F_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map3_21F_EntityEvent12:
                
                 
                txt     3936            ; "I don't think it's going to{N}be me 'cause I'm a centaur.{W2}"
                txt     3937            ; "Who will it be?{N}Does Sir Astral know?{W1}"
                rts

    ; End of function Map3_21F_EntityEvent12


; =============== S U B R O U T I N E =======================================


Map3_21F_EntityEvent13:
                
                 
                txt     3938            ; "I will do anything for{N}Princess Elis!!{W2}"
                txt     3939            ; "I hope Sir Astral chooses{N}me!{W1}"
                rts

    ; End of function Map3_21F_EntityEvent13


; =============== S U B R O U T I N E =======================================


Map3_21F_EntityEvent14:
                
                 
                txt     3940            ; "She's no longer poisoned,{N}but she's still asleep.{W2}"
                txt     3941            ; "And Sir Astral called us{N}here!{N}Who's going to kiss her?{W1}"
                rts

    ; End of function Map3_21F_EntityEvent14

