
; ASM FILE data\maps\entries\map19\mapsetups\s2_entityevents_21F.asm :
; 0x62AFE..0x62BCA : 
ms_map19_flag21F_EntityEvents:
                msEntityEvent 5, UP, Map19_21F_EntityEvent0-ms_map19_flag21F_EntityEvents
                msEntityEvent 7, UP, Map19_21F_EntityEvent1-ms_map19_flag21F_EntityEvents
                msEntityEvent 8, UP, Map19_21F_EntityEvent2-ms_map19_flag21F_EntityEvents
                msEntityEvent 11, UP, Map19_21F_EntityEvent3-ms_map19_flag21F_EntityEvents
                msEntityEvent 10, UP, Map19_21F_EntityEvent4-ms_map19_flag21F_EntityEvents
                msEntityEvent 19, UP, Map19_21F_EntityEvent5-ms_map19_flag21F_EntityEvents
                msEntityEvent 25, UP, Map19_21F_EntityEvent6-ms_map19_flag21F_EntityEvents
                msEntityEvent 27, UP, Map19_21F_EntityEvent7-ms_map19_flag21F_EntityEvents
                msEntityEvent 26, UP, Map19_21F_EntityEvent8-ms_map19_flag21F_EntityEvents
                msEntityEvent 128, DOWN, Map19_21F_EntityEvent9-ms_map19_flag21F_EntityEvents
                msEntityEvent 130, DOWN, Map19_21F_EntityEvent10-ms_map19_flag21F_EntityEvents
                msEntityEvent 131, UP, Map19_21F_EntityEvent11-ms_map19_flag21F_EntityEvents
                msEntityEvent 132, UP, Map19_21F_EntityEvent12-ms_map19_flag21F_EntityEvents
                msEntityEvent 133, RIGHT, Map19_21F_EntityEvent13-ms_map19_flag21F_EntityEvents
                msEntityEvent 134, RIGHT, Map19_21F_EntityEvent14-ms_map19_flag21F_EntityEvents
                msDefaultEntityEvent Map19_21F_DefaultEntityEvent-ms_map19_flag21F_EntityEvents

; =============== S U B R O U T I N E =======================================

Map19_21F_DefaultEntityEvent:
                
                rts

    ; End of function Map19_21F_DefaultEntityEvent


; =============== S U B R O U T I N E =======================================

Map19_21F_EntityEvent9:
                
                 
                txt     $F7D            ; "Why is she still sleeping?{W2}"
                txt     $F7E            ; "Astral said he knew who...{W1}"
                rts

    ; End of function Map19_21F_EntityEvent9


; =============== S U B R O U T I N E =======================================

Map19_21F_EntityEvent0:
                
                 
                txt     $F69            ; "{LEADER}, how are you?{W2}"
                txt     $F6A            ; "I received an invitation{N}for todays festivities.{W2}"
                txt     $F6B            ; "I'm happy to say that{N}everyone looks well.{W1}"
                rts

    ; End of function Map19_21F_EntityEvent0


; =============== S U B R O U T I N E =======================================

Map19_21F_EntityEvent1:
                
                 
                txt     $F6C            ; "Hi, {LEADER}!{N}I'm serving Volcanon again.{W2}"
                txt     $F6D            ; "I got an invitation to a{N}wedding party.{N}Who's getting married?{W1}"
                rts

    ; End of function Map19_21F_EntityEvent1


; =============== S U B R O U T I N E =======================================

Map19_21F_EntityEvent2:
                
                 
                txt     $F6E            ; "Granseal is beautiful!{W2}"
                txt     $F6F            ; "{NAME;2} told me about{N}it, but it's better than I{N}pictured!{W1}"
                rts

    ; End of function Map19_21F_EntityEvent2


; =============== S U B R O U T I N E =======================================

Map19_21F_EntityEvent3:
                
                 
                txt     $F70            ; "Hello, {LEADER}!{N}You look good!{W2}"
                txt     $F71            ; "The Caravan is working well!{N}I found some more ruins!{N}Ha, ha, ha!{W1}"
                rts

    ; End of function Map19_21F_EntityEvent3


; =============== S U B R O U T I N E =======================================

Map19_21F_EntityEvent4:
                
                 
                txt     $F72            ; "Sir Astral invited{N}{NAME;7} and I.{W2}"
                txt     $F73            ; "It's hard to believe there{N}was ever a threat of evil!{W1}"
                rts

    ; End of function Map19_21F_EntityEvent4


; =============== S U B R O U T I N E =======================================

Map19_21F_EntityEvent5:
                
                 
                txt     $F74            ; "King Pacalon asked me to say{N}hello to you.{W2}"
                txt     $F75            ; "He should see this beautiful{N}castle.{W1}"
                rts

    ; End of function Map19_21F_EntityEvent5


; =============== S U B R O U T I N E =======================================

Map19_21F_EntityEvent6:
                
                 
                txt     $F76            ; "Two years...since that{N}battle....{W2}"
                txt     $F77            ; "I hope {NAME;28} is OK.{W1}"
                rts

    ; End of function Map19_21F_EntityEvent6


; =============== S U B R O U T I N E =======================================

Map19_21F_EntityEvent7:
                
                 
                txt     $F78            ; "This is wonderful!{W2}"
                txt     $F79            ; "{LEADER}, you were{N}younger than the Princess,{N}but now you're older!{W1}"
                txt     $F7A            ; "But, age doesn't matter.{W1}"
                rts

    ; End of function Map19_21F_EntityEvent7


; =============== S U B R O U T I N E =======================================

Map19_21F_EntityEvent8:
                
                 
                txt     $F7B            ; "{NAME;11} is crazy, but{N}he's the greatest!{W2}"
                txt     $F7C            ; "He's living his dream of{N}continuous adventure.{N}{LEADER}, will you join us?{W1}"
                rts

    ; End of function Map19_21F_EntityEvent8


; =============== S U B R O U T I N E =======================================

Map19_21F_EntityEvent10:
                
                 
                txt     $FB1            ; "I'll make a delicious meal{N}for them!{W1}"
                rts

    ; End of function Map19_21F_EntityEvent10


; =============== S U B R O U T I N E =======================================

Map19_21F_EntityEvent11:
                
                 
                txt     $FB2            ; "We have a lot of guests{N}today.{W1}"
                rts

    ; End of function Map19_21F_EntityEvent11


; =============== S U B R O U T I N E =======================================

Map19_21F_EntityEvent12:
                
                 
                txt     $FB3            ; "It's my responsibility to{N}guard everybody!{W1}"
                rts

    ; End of function Map19_21F_EntityEvent12


; =============== S U B R O U T I N E =======================================

Map19_21F_EntityEvent13:
                
                 
                txt     $FB4            ; "Is it time to stand guard?{N}Oh, it's you, {LEADER}!{N}Let me sleep.{W1}"
                rts

    ; End of function Map19_21F_EntityEvent13


; =============== S U B R O U T I N E =======================================

Map19_21F_EntityEvent14:
                
                 
                txt     $FB5            ; "...zzz...earthquake...{N}go...to...ship...{N}hurry...zzzzzz....{W1}"
                rts

    ; End of function Map19_21F_EntityEvent14

