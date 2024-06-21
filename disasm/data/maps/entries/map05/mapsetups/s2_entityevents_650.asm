
; ASM FILE data\maps\entries\map05\mapsetups\s2_entityevents_650.asm :
; 0x51A82..0x51C22 : 
ms_map5_flag650_EntityEvents:
                msEntityEvent 128, UP, Map5_EntityEvent1-ms_map5_flag650_EntityEvents
                msEntityEvent 129, UP, Map5_28A_EntityEvent1-ms_map5_flag650_EntityEvents
                msEntityEvent 130, DOWN, Map5_28A_EntityEvent2-ms_map5_flag650_EntityEvents
                msEntityEvent 131, DOWN, Map5_28A_EntityEvent3-ms_map5_flag650_EntityEvents
                msEntityEvent 132, DOWN, Map5_28A_EntityEvent4-ms_map5_flag650_EntityEvents
                msEntityEvent 133, UP, Map5_EntityEvent6-ms_map5_flag650_EntityEvents
                msEntityEvent 134, UP, Map5_EntityEvent7-ms_map5_flag650_EntityEvents
                msEntityEvent 135, DOWN, Map5_28A_EntityEvent7-ms_map5_flag650_EntityEvents
                msEntityEvent 136, DOWN, Map5_28A_EntityEvent8-ms_map5_flag650_EntityEvents
                msEntityEvent 137, DOWN, Map5_28A_EntityEvent9-ms_map5_flag650_EntityEvents
                msEntityEvent 138, DOWN, Map5_28A_EntityEvent10-ms_map5_flag650_EntityEvents
                msEntityEvent 139, UP, Map5_28A_EntityEvent11-ms_map5_flag650_EntityEvents
                msEntityEvent 140, DOWN, Map5_28A_EntityEvent12-ms_map5_flag650_EntityEvents
                msEntityEvent 141, DOWN, Map5_EntityEvent14-ms_map5_flag650_EntityEvents
                msEntityEvent 142, UP, Map5_28A_EntityEvent14-ms_map5_flag650_EntityEvents
                msDefaultEntityEvent Map5_DefaultEntityEvent-ms_map5_flag650_EntityEvents

; =============== S U B R O U T I N E =======================================


Map5_EntityEvent0:
                
                 
                txt     784             ; "What can I do for you?{N}Oh, you would like to see my{N}master?{W2}"
                txt     785             ; "I am studying at his house.{N}Please follow me.{W1}"
                clsTxt
                jsr     j_ClosePortraitWindow
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                clr.w   ((CURRENT_SPEECH_SFX-$1000000)).w
                txt     786             ; "{CLEAR}{LEADER} decided to{N}follow {NAME;4}.{W1}{CLEAR}"
                clsTxt
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                move.w  #4,d0
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                jsr     LoadAndDisplayCurrentPortrait
                txt     787             ; "Sir Hawel lives just outside{N}of this village.{W1}"
                script  cs_51B14
                setFlg  72              ; Kazin is a follower
                rts

    ; End of function Map5_EntityEvent0

cs_51B14:       followEntity ALLY_KAZIN,ALLY_BOWIE,2
                csc_end

; =============== S U B R O U T I N E =======================================


Map5_EntityEvent1:
                
                 
                txt     760             ; "Welcome to Yeel.{W1}"
                rts

    ; End of function Map5_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map5_EntityEvent2:
                
                 
                txt     761             ; "This village is peaceful{N}but boring.{W2}"
                txt     762             ; "I'm tired of living in such a{N}rustic small village.{W1}"
                rts

    ; End of function Map5_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map5_EntityEvent3:
                
                 
                txt     763             ; "There are no soldiers, no{N}rules, and no noise here.{W2}"
                txt     764             ; "I don't understand those who{N}want to leave this town.{W1}"
                rts

    ; End of function Map5_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map5_EntityEvent4:
                
                 
                txt     765             ; "Young people nowadays{N}don't know the value of peace.{W2}"
                txt     766             ; "War is not fun, but they{N}think it is.{N}{W1}"
                rts

    ; End of function Map5_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map5_EntityEvent5:
                
                 
                txt     767             ; "May I help you?{N}Oh, hi kids.{N}Hawel?{W2}"
                txt     768             ; "Yes, I know him.{N}He's famous, and he's kind{N}of a screwball.{W2}"
                txt     769             ; "He lives northwest{N}of this village.{N}You can't miss it.{W1}"
                rts

    ; End of function Map5_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map5_EntityEvent6:
                
                 
                txt     770             ; "Bok-bok-bok...{N}...(scratch)....{W1}"
                rts

    ; End of function Map5_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map5_EntityEvent7:
                
                 
                txt     771             ; "Cock-a-doodle-dooo....{W1}"
                rts

    ; End of function Map5_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map5_EntityEvent8:
                
                 
                txt     772             ; "That's my hen!{N}Don't torment her!{W1}"
                rts

    ; End of function Map5_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map5_EntityEvent9:
                
                 
                txt     773             ; "Oh, you came from{N}Granseal?{W2}"
                txt     774             ; "My son is working in{N}Granseal.{N}Do you know him?{W1}"
                rts

    ; End of function Map5_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map5_EntityEvent10:
                
                 
                txt     775             ; "Are you from Galam, too?{N}No?{W2}"
                txt     776             ; "Many Galam soldiers asked{N}me where Hawel lives.{W2}"
                txt     777             ; "Hawel, Hawel, Hawel!{N}Why is he so important?{N}He's just an old man.{W1}"
                rts

    ; End of function Map5_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map5_EntityEvent11:
                
                 
                txt     778             ; "Soldiers are so cool!{N}That's neat armor!{W1}"
                rts

    ; End of function Map5_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map5_EntityEvent12:
                
                 
                txt     779             ; "I once travelled to Galam{N}and saw Mr. {NAME;28} there.{W2}"
                txt     780             ; "Mr. {NAME;28} is the leader{N}of the Galam Army, but he{N}is a very kind man.{W2}"
                txt     781             ; "I'm a big fan of{N}Mr. {NAME;28}.{N}He's so cute!{W1}"
                rts

    ; End of function Map5_EntityEvent12


; =============== S U B R O U T I N E =======================================


Map5_EntityEvent13:
                
                 
                chkFlg  72              ; Kazin is a follower
                bne.s   byte_51B9E      
                txt     782             ; "Want to see Hawel?{W2}"
                txt     783             ; "Then why don't you go with{N}him?{W1}"
                bra.s   return_51BA6
byte_51B9E:
                
                txt     788             ; "Hawel is eccentric.{N}He seldom comes to this{N}village.{W2}"
                txt     789             ; "Shhh...keep this a secret.{N}I like the boy who is always{N}with him.{W1}"
return_51BA6:
                
                rts

    ; End of function Map5_EntityEvent13


; =============== S U B R O U T I N E =======================================


Map5_EntityEvent15:
                
                 
                txt     810             ; "Meow!{W1}"
                rts

    ; End of function Map5_EntityEvent15


; =============== S U B R O U T I N E =======================================


Map5_EntityEvent14:
                
                jsr     j_ChurchMenu
                rts

    ; End of function Map5_EntityEvent14


; =============== S U B R O U T I N E =======================================


Map5_DefaultEntityEvent:
                
                rts

    ; End of function Map5_DefaultEntityEvent


; =============== S U B R O U T I N E =======================================


Map5_28A_EntityEvent1:
                
                 
                txt     790             ; "They say that Galam and{N}Granseal are at war!{W2}"
                txt     791             ; "I love peace.{N}I love Yeel!{W1}"
                rts

    ; End of function Map5_28A_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map5_28A_EntityEvent2:
                
                 
                txt     792             ; "You had better not return{N}to Granseal.{W2}"
                txt     793             ; "You don't have to die at{N}your age.{W1}"
                rts

    ; End of function Map5_28A_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map5_28A_EntityEvent3:
                
                 
                txt     794             ; "A war always takes place{N}so suddenly.{N}But we're neutral.{W1}"
                rts

    ; End of function Map5_28A_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map5_28A_EntityEvent4:
                
                 
                txt     795             ; "Nobody has seen Hawel{N}since Galam soilders went{N}to see him.{W2}"
                txt     796             ; "Was he...kidnapped?{N}Or...or...?{W1}"
                rts

    ; End of function Map5_28A_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map5_28A_EntityEvent7:
                
                 
                txt     797             ; "I heard that you are being{N}pursued by Galam.{N}Are you a criminal?{W1}"
                rts

    ; End of function Map5_28A_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map5_28A_EntityEvent8:
                
                 
                txt     798             ; "You're from Granseal!{N}Please, please tell my son{N}to come back!{W2}"
                txt     799             ; "Where is he now?{N}What is he doing now?{W2}"
                txt     800             ; "Ah, why did I let him{N}leave?{W1}"
                rts

    ; End of function Map5_28A_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map5_28A_EntityEvent9:
                
                 
                txt     801             ; "That storm made me uneasy.{W2}"
                txt     802             ; "But I didn't foresee a{N}war.{W1}"
                rts

    ; End of function Map5_28A_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map5_28A_EntityEvent10:
                
                 
                txt     803             ; "Hawel must have been{N}killed by Galam....{W2}"
                txt     804             ; "I wanted to be a soldier{N}like them.  I've changed my{N}mind.{W1}"
                rts

    ; End of function Map5_28A_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map5_28A_EntityEvent11:
                
                 
                txt     805             ; "{NAME;28}!  I saw him leading{N}his army!{W2}"
                txt     806             ; "I thought Mr. {NAME;28} was{N}a gentleman....{W1}"
                rts

    ; End of function Map5_28A_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map5_28A_EntityEvent12:
                
                 
                txt     807             ; "Yeel remains neutral.{N}We are pacifists.{W2}"
                txt     808             ; "Fugitives from the war come{N}here to live in peace.{W2}"
                txt     809             ; "Of course, we welcome you{N}and your people anytime.{W1}"
                rts

    ; End of function Map5_28A_EntityEvent12


; =============== S U B R O U T I N E =======================================


Map5_28A_EntityEvent14:
                
                 
                txt     810             ; "Meow!{W1}"
                rts

    ; End of function Map5_28A_EntityEvent14

