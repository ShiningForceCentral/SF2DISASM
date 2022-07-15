
; ASM FILE data\maps\entries\map07\mapsetups\s2_entityevents_805.asm :
; 0x55584..0x5579E : 
ms_map7_flag805_EntityEvents:
                msEntityEvent 128, DOWN, Map7_EntityEvent0-ms_map7_flag805_EntityEvents
                msEntityEvent 129, DOWN, Map7_EntityEvent1-ms_map7_flag805_EntityEvents
                msEntityEvent 130, DOWN, Map7_EntityEvent2-ms_map7_flag805_EntityEvents
                msEntityEvent 131, UP, Map7_EntityEvent3-ms_map7_flag805_EntityEvents
                msEntityEvent 132, DOWN, Map7_EntityEvent4-ms_map7_flag805_EntityEvents
                msEntityEvent 133, DOWN, Map7_EntityEvent5-ms_map7_flag805_EntityEvents
                msEntityEvent 134, UP, Map7_EntityEvent6-ms_map7_flag805_EntityEvents
                msEntityEvent 135, DOWN, Map7_EntityEvent7-ms_map7_flag805_EntityEvents
                msEntityEvent 136, DOWN, Map7_EntityEvent8-ms_map7_flag805_EntityEvents
                msEntityEvent 137, DOWN, Map7_EntityEvent9-ms_map7_flag805_EntityEvents
                msEntityEvent 138, DOWN, Map7_EntityEvent10-ms_map7_flag805_EntityEvents
                msDefaultEntityEvent Map7_DefaultEntityEvent-ms_map7_flag805_EntityEvents

; =============== S U B R O U T I N E =======================================


Map7_EntityEvent11:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   return_555E6
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_555CE      
                txt     1162            ; "Time goes by very quickly....{W2}"
                txt     1163            ; "Those two jewels around{N}your neck will always{N}remind me of that...!{W2}"
                txt     1164            ; "The chain is made of{N}Mithril.  It can't be cut!{W1}"
                bra.s   return_555E6
byte_555CE:
                
                chkFlg  256             ; TEMP FLAG #00
                bne.s   byte_555E2      
                txt     1188            ; "{LEADER}, you can't{N}understand my regret....{W2}"
                txt     1189            ; "It was the last chance to see{N}Volcanon in my{N}lifetime!{W1}"
                setFlg  256             ; TEMP FLAG #00
                bra.s   return_555E6
byte_555E2:
                
                txt     1190            ; "{LEADER}, I expect{N}you to find a lot of{N}allies!{W1}"
return_555E6:
                
                rts

    ; End of function Map7_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map7_EntityEvent1:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_55618      
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_55602      
                txt     1156            ; "I feel Elis is still alive....{W2}"
                txt     1157            ; "{LEADER}, please prepare{N}a ship for me.{W2}"
                txt     1158            ; "I would like to go back to{N}Grans to find her.{W1}"
                bra.s   loc_55616
byte_55602:
                
                chkFlg  703             ; Set after the scene where Bowie brings the plank above deck, also set after the initial Ribble scene, where the guy runs away
                bne.s   byte_55612      
                txt     1191            ; "Gee, Parmecia is full{N}of wonders!{W2}"
                txt     1192            ; "Phoenix, Volcanon...it's{N}like living a myth!{W1}"
                bra.s   loc_55616
byte_55612:
                
                txt     1193            ; "Elis is alive.{N}I can feel it!{W1}"
loc_55616:
                
                bra.s   return_5561C
byte_55618:
                
                txt     1237            ; "{LEADER}, please find{N}the Princess.{W1}"
return_5561C:
                
                rts

    ; End of function Map7_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map7_EntityEvent0:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_5563E      
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_55638      
                txt     1159            ; "Is everything OK,{N}{LEADER}?{W2}"
                txt     1160            ; "Can these young men guard{N}our new town?{W2}"
                txt     1161            ; "The King is no longer what{N}he was.{W1}"
                bra.s   loc_5563C
byte_55638:
                
                txt     1194            ; "The prosperity of Granseal{N}rests in your hands!{W1}"
loc_5563C:
                
                bra.s   return_55646
byte_5563E:
                
                txt     1238            ; "The King is unaware of{N}Sir Astral's idea.{W2}"
                txt     1239            ; "The most important thing is{N}to defeat the devils!{W1}"
return_55646:
                
                rts

    ; End of function Map7_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map7_EntityEvent2:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_55658      
                txt     1173            ; "I'm told to stand watch{N}here.{W2}"
                txt     1174            ; "But, look!  Nothing!{N}What am I watching?{W1}"
                bra.s   return_5565C
byte_55658:
                
                txt     1240            ; "How long should I keep{N}guard here?{W1}"
return_5565C:
                
                rts

    ; End of function Map7_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map7_EntityEvent3:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_5566E      
                txt     1176            ; "I can't believe it!{N}This isn't Granseal!{W2}"
                txt     1177            ; "I want to go back to{N}Grans Island.{W1}"
                bra.s   return_55672
byte_5566E:
                
                txt     1241            ; "To Grans Island?  But, I{N}like Parmecia now!{W1}"
return_55672:
                
                rts

    ; End of function Map7_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map7_EntityEvent4:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_556A0      
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_5569A      
                chkFlg  701             ; Set after the scene with Peter and the kids in New Granseal
                bne.s   byte_55694      
                txt     1168            ; "I envy you, {LEADER}.{W2}"
                txt     1169            ; "You can act freely, even{N}in the castle.{W2}"
                txt     1170            ; "I have to stand here{N}everyday. {W1}"
                bra.s   loc_55698
byte_55694:
                
                txt     1185            ; "{LEADER}, go see{N}Sir Astral!{W1}"
loc_55698:
                
                bra.s   loc_5569E
byte_5569A:
                
                txt     1195            ; "While {LEADER} is away,{N}we'll guard the castle!{W1}"
loc_5569E:
                
                bra.s   return_556B0
byte_556A0:
                
                chkFlg  805             ; Set after coming back to New Granseal after Creed's Mansion,when Astral joins
                bne.s   byte_556AC      
                txt     1185            ; "{LEADER}, go see{N}Sir Astral!{W1}"
                bra.s   return_556B0
byte_556AC:
                
                txt     1242            ; "We'll guard Granseal while{N}you're away!{W1}"
return_556B0:
                
                rts

    ; End of function Map7_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map7_EntityEvent5:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_556DA      
                chkFlg  701             ; Set after the scene with Peter and the kids in New Granseal
                bne.s   byte_556C4      
                txt     1178            ; "Granseal Castle!{N}Hee, hee...I'm cool!{W1}"
                bra.s   loc_556D8
byte_556C4:
                
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_556D4      
                txt     1181            ; "Grans...oh!{W2}"
                txt     1182            ; "{LEADER}, you're here!{N}Sir Astral is waiting.{W1}"
                bra.s   loc_556D8
byte_556D4:
                
                txt     1178            ; "Granseal Castle!{N}Hee, hee...I'm cool!{W1}"
loc_556D8:
                
                bra.s   return_556E2
byte_556DA:
                
                txt     1243            ; "Your pass, please!{W2}"
                txt     1244            ; "Of course, you don't have to{N}show one, {LEADER}!{N}Go ahead!{W1}"
return_556E2:
                
                rts

    ; End of function Map7_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map7_EntityEvent6:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_556FC      
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_556F6      
                txt     1175            ; "Tactical Base!{N}Ah, you knew that?{W1}"
                bra.s   loc_556FA
byte_556F6:
                
                txt     1196            ; "Tactical Base!{N}Nobody has visited here{N}lately....{W1}"
loc_556FA:
                
                bra.s   return_55700
byte_556FC:
                
                txt     1245            ; "Tactical Base!{N}Why don't you talk to your{N}friends, {LEADER}?{W1}"
return_55700:
                
                rts

    ; End of function Map7_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map7_EntityEvent7:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_5572A      
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_55724      
                chkFlg  701             ; Set after the scene with Peter and the kids in New Granseal
                bne.s   byte_5571E      
                txt     1171            ; "At least there is no danger{N}in the castle.{W2}"
                txt     1172            ; "I've never seen such strange{N}races!{W1}"
                bra.s   loc_55722
byte_5571E:
                
                txt     1185            ; "{LEADER}, go see{N}Sir Astral!{W1}"
loc_55722:
                
                bra.s   loc_55728
byte_55724:
                
                txt     1197            ; "I'll miss you, {LEADER}...{N}but do not worry!{W1}"
loc_55728:
                
                bra.s   return_5572E
byte_5572A:
                
                txt     1246            ; "{LEADER}, you'll be{N}surprised to see the results{N}of my practice!{W1}"
return_5572E:
                
                rts

    ; End of function Map7_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map7_EntityEvent8:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_55760      
                chkFlg  701             ; Set after the scene with Peter and the kids in New Granseal
                bne.s   byte_55746      
                txt     1179            ; "You need permission to enter!{W2}"
                txt     1180            ; "I was told to say that,{N}but nobody ever comes!{W1}"
                bra.s   loc_5575E
byte_55746:
                
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_55756      
                txt     1183            ; "The Minister and Sir{N}Astral are inside.{W2}"
                txt     1184            ; "They're giving a warm{N}reception to a guest.{W1}"
                bra.s   loc_5575E
byte_55756:
                
                txt     1179            ; "You need permission to enter!{W2}"
                txt     1180            ; "I was told to say that,{N}but nobody ever comes!{W1}"
loc_5575E:
                
                bra.s   return_55774
byte_55760:
                
                chkFlg  805             ; Set after coming back to New Granseal after Creed's Mansion,when Astral joins
                bne.s   byte_5576C      
                txt     1247            ; "Hello, {LEADER}.{N}The King is waiting.{W1}"
                bra.s   return_55774
byte_5576C:
                
                txt     1179            ; "You need permission to enter!{W2}"
                txt     1180            ; "I was told to say that,{N}but nobody ever comes!{W1}"
return_55774:
                
                rts

    ; End of function Map7_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map7_EntityEvent9:
                
                 
                txt     1165            ; "Oh, the King looks so sad.{W1}"
                rts

    ; End of function Map7_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map7_EntityEvent10:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_5578C      
                txt     1166            ; "(Yaaawn)...Oh, excuse me.{N}I'm tired because of the{N}Minister.{W2}"
                txt     1167            ; "He and Sir Astral talk{N}late every night.{W1}"
                bra.s   return_55790
byte_5578C:
                
                txt     1248            ; "See?  Our guards are getting{N}tougher day by day.{W1}"
return_55790:
                
                rts

    ; End of function Map7_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map7_2BD_EntityEvent12:
                
                 
                txt     1186            ; "{LEADER}, something{N}important is happening.{W1}"
                rts

    ; End of function Map7_2BD_EntityEvent12


; =============== S U B R O U T I N E =======================================


Map7_2BD_EntityEvent14:
                
                 
                txt     1187            ; "{LEADER}, Sir Astral is{N}over there. {W1}"
Map7_DefaultEntityEvent:
                
                rts

    ; End of function Map7_2BD_EntityEvent14

