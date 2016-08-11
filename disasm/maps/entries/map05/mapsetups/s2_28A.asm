
; SCRIPT SECTION maps\entries\map05\mapsetups\s2_28A :
; 
ms_map5_flag28A_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_51B1E-ms_map5_flag28A_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_51BB8-ms_map5_flag28A_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_51BC2-ms_map5_flag28A_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_51BCC-ms_map5_flag28A_EntityEvents
										dc.b $84
										dc.b 3
										dc.w sub_51BD2-ms_map5_flag28A_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_51B50-ms_map5_flag28A_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_51B56-ms_map5_flag28A_EntityEvents
										dc.b $87
										dc.b 3
										dc.w sub_51BDC-ms_map5_flag28A_EntityEvents
										dc.b $88
										dc.b 3
										dc.w sub_51BE2-ms_map5_flag28A_EntityEvents
										dc.b $89
										dc.b 3
										dc.w sub_51BF0-ms_map5_flag28A_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_51BFA-ms_map5_flag28A_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_51C04-ms_map5_flag28A_EntityEvents
										dc.b $8C
										dc.b 3
										dc.w sub_51C0E-ms_map5_flag28A_EntityEvents
										dc.b $8D
										dc.b 3
										dc.w sub_51BAE-ms_map5_flag28A_EntityEvents
										dc.b $8E
										dc.b 1
										dc.w sub_51C1C-ms_map5_flag28A_EntityEvents
										dc.w $FD00
										dc.w nullsub_113-ms_map5_flag28A_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_51AC2:
										
										trap    #TRAP_TEXTBOX
										dc.w $310               ; "What can I do for you?{N}Oh, you would like to see my{N}master?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $311               ; "I am studying at his house.{N}Please follow me.{W1}"
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										jsr     j_HidePortraitWindow
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $312               ; "{CLEAR}{LEADER} decided to{N}follow {NAME;4}.{W1}{CLEAR}"
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										move.w  #4,d0
										jsr     GetEntityPortraitAndSpeechSound
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     LoadAndDisplayCurrentPortrait
										trap    #TRAP_TEXTBOX
										dc.w $313               ; "Sir Hawel lives just outside{N}of this village.{W1}"
										lea     cs_51B14(pc), a0
										trap    #6
										trap    #2
										dc.w $48
										rts

	; End of function sub_51AC2

cs_51B14:           dc.w $2C                ; 002C FOLLOW ENTITY 4 0 2
										dc.w 4
										dc.w 0
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_51B1E:
										
										trap    #TRAP_TEXTBOX
										dc.w $2F8               ; "Welcome to Yeel.{W1}"
										rts

	; End of function sub_51B1E


; =============== S U B R O U T I N E =======================================

sub_51B24:
										
										trap    #TRAP_TEXTBOX
										dc.w $2F9               ; "This village is peaceful{N}but boring.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $2FA               ; "I'm tired of living in such a{N}rustic small village.{W1}"
										rts

	; End of function sub_51B24


; =============== S U B R O U T I N E =======================================

sub_51B2E:
										
										trap    #TRAP_TEXTBOX
										dc.w $2FB               ; "There are no soldiers, no{N}rules, and no noise here.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $2FC               ; "I don't understand those who{N}want to leave this town.{W1}"
										rts

	; End of function sub_51B2E


; =============== S U B R O U T I N E =======================================

sub_51B38:
										
										trap    #TRAP_TEXTBOX
										dc.w $2FD               ; "Young people nowadays{N}don't know the value of peace.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $2FE               ; "War is not fun, but they{N}think it is.{N}{W1}"
										rts

	; End of function sub_51B38


; =============== S U B R O U T I N E =======================================

sub_51B42:
										
										trap    #TRAP_TEXTBOX
										dc.w $2FF               ; "May I help you?{N}Oh, hi kids.{N}Hawel?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $300               ; "Yes, I know him.{N}He's famous, and he's kind{N}of a screwball.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $301               ; "He lives northwest{N}of this village.{N}You can't miss it.{W1}"
										rts

	; End of function sub_51B42


; =============== S U B R O U T I N E =======================================

sub_51B50:
										
										trap    #TRAP_TEXTBOX
										dc.w $302               ; "Bok-bok-bok...{N}...(scratch)....{W1}"
										rts

	; End of function sub_51B50


; =============== S U B R O U T I N E =======================================

sub_51B56:
										
										trap    #TRAP_TEXTBOX
										dc.w $303               ; "Cock-a-doodle-dooo....{W1}"
										rts

	; End of function sub_51B56


; =============== S U B R O U T I N E =======================================

sub_51B5C:
										
										trap    #TRAP_TEXTBOX
										dc.w $304               ; "That's my hen!{N}Don't torment her!{W1}"
										rts

	; End of function sub_51B5C


; =============== S U B R O U T I N E =======================================

sub_51B62:
										
										trap    #TRAP_TEXTBOX
										dc.w $305               ; "Oh, you came from{N}Granseal?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $306               ; "My son is working in{N}Granseal.{N}Do you know him?{W1}"
										rts

	; End of function sub_51B62


; =============== S U B R O U T I N E =======================================

sub_51B6C:
										
										trap    #TRAP_TEXTBOX
										dc.w $307               ; "Are you from Galam, too?{N}No?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $308               ; "Many Galam soldiers asked{N}me where Hawel lives.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $309               ; "Hawel, Hawel, Hawel!{N}Why is he so important?{N}He's just an old man.{W1}"
										rts

	; End of function sub_51B6C


; =============== S U B R O U T I N E =======================================

sub_51B7A:
										
										trap    #TRAP_TEXTBOX
										dc.w $30A               ; "Soldiers are so cool!{N}That's neat armor!{W1}"
										rts

	; End of function sub_51B7A


; =============== S U B R O U T I N E =======================================

sub_51B80:
										
										trap    #TRAP_TEXTBOX
										dc.w $30B               ; "I once travelled to Galam{N}and saw Mr. {NAME;28} there.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $30C               ; "Mr. {NAME;28} is the leader{N}of the Galam Army, but he{N}is a very kind man.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $30D               ; "I'm a big fan of{N}Mr. {NAME;28}.{N}He's so cute!{W1}"
										rts

	; End of function sub_51B80


; =============== S U B R O U T I N E =======================================

sub_51B8E:
										
										trap    #1
										dc.w $48
										bne.s   loc_51B9E
										trap    #TRAP_TEXTBOX
										dc.w $30E               ; "Want to see Hawel?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $30F               ; "Then why don't you go with{N}him?{W1}"
										bra.s   return_51BA6
loc_51B9E:
										
										trap    #TRAP_TEXTBOX
										dc.w $314               ; "Hawel is eccentric.{N}He seldom comes to this{N}village.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $315               ; "Shhh...keep this a secret.{N}I like the boy who is always{N}with him.{W1}"
return_51BA6:
										
										rts

	; End of function sub_51B8E


; =============== S U B R O U T I N E =======================================

sub_51BA8:
										
										trap    #TRAP_TEXTBOX
										dc.w $32A               ; "Meow!{W1}"
										rts

	; End of function sub_51BA8


; =============== S U B R O U T I N E =======================================

sub_51BAE:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_51BAE


; =============== S U B R O U T I N E =======================================

nullsub_113:
										
										rts

	; End of function nullsub_113


; =============== S U B R O U T I N E =======================================

sub_51BB8:
										
										trap    #TRAP_TEXTBOX
										dc.w $316               ; "They say that Galam and{N}Granseal are at war!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $317               ; "I love peace.{N}I love Yeel!{W1}"
										rts

	; End of function sub_51BB8


; =============== S U B R O U T I N E =======================================

sub_51BC2:
										
										trap    #TRAP_TEXTBOX
										dc.w $318               ; "You had better not return{N}to Granseal.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $319               ; "You don't have to die at{N}your age.{W1}"
										rts

	; End of function sub_51BC2


; =============== S U B R O U T I N E =======================================

sub_51BCC:
										
										trap    #TRAP_TEXTBOX
										dc.w $31A               ; "A war always takes place{N}so suddenly.{N}But we're neutral.{W1}"
										rts

	; End of function sub_51BCC


; =============== S U B R O U T I N E =======================================

sub_51BD2:
										
										trap    #TRAP_TEXTBOX
										dc.w $31B               ; "Nobody has seen Hawel{N}since Galam soilders went{N}to see him.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $31C               ; "Was he...kidnapped?{N}Or...or...?{W1}"
										rts

	; End of function sub_51BD2


; =============== S U B R O U T I N E =======================================

sub_51BDC:
										
										trap    #TRAP_TEXTBOX
										dc.w $31D               ; "I heard that you are being{N}pursued by Galam.{N}Are you a criminal?{W1}"
										rts

	; End of function sub_51BDC


; =============== S U B R O U T I N E =======================================

sub_51BE2:
										
										trap    #TRAP_TEXTBOX
										dc.w $31E               ; "You're from Granseal!{N}Please, please tell my son{N}to come back!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $31F               ; "Where is he now?{N}What is he doing now?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $320               ; "Ah, why did I let him{N}leave?{W1}"
										rts

	; End of function sub_51BE2


; =============== S U B R O U T I N E =======================================

sub_51BF0:
										
										trap    #TRAP_TEXTBOX
										dc.w $321               ; "That storm made me uneasy.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $322               ; "But I didn't foresee a{N}war.{W1}"
										rts

	; End of function sub_51BF0


; =============== S U B R O U T I N E =======================================

sub_51BFA:
										
										trap    #TRAP_TEXTBOX
										dc.w $323               ; "Hawel must have been{N}killed by Galam....{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $324               ; "I wanted to be a soldier{N}like them.  I've changed my{N}mind.{W1}"
										rts

	; End of function sub_51BFA


; =============== S U B R O U T I N E =======================================

sub_51C04:
										
										trap    #TRAP_TEXTBOX
										dc.w $325               ; "{NAME;28}!  I saw him leading{N}his army!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $326               ; "I thought Mr. {NAME;28} was{N}a gentleman....{W1}"
										rts

	; End of function sub_51C04


; =============== S U B R O U T I N E =======================================

sub_51C0E:
										
										trap    #TRAP_TEXTBOX
										dc.w $327               ; "Yeel remains neutral.{N}We are pacifists.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $328               ; "Fugitives from the war come{N}here to live in peace.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $329               ; "Of course, we welcome you{N}and your people anytime.{W1}"
										rts

	; End of function sub_51C0E


; =============== S U B R O U T I N E =======================================

sub_51C1C:
										
										trap    #TRAP_TEXTBOX
										dc.w $32A               ; "Meow!{W1}"
										rts

	; End of function sub_51C1C

