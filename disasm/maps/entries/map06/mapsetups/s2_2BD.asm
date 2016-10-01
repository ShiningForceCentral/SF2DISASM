
; SCRIPT SECTION maps\entries\map06\mapsetups\s2_2BD :
; 
ms_map6_flag2BD_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_549C0-ms_map6_flag2BD_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_54A0E-ms_map6_flag2BD_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_54A34-ms_map6_flag2BD_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_54A6A-ms_map6_flag2BD_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_54A9C-ms_map6_flag2BD_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_54AD8-ms_map6_flag2BD_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_54B36-ms_map6_flag2BD_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_54B54-ms_map6_flag2BD_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_54B7E-ms_map6_flag2BD_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_54BA0-ms_map6_flag2BD_EntityEvents
										dc.b $8A
										dc.b 1
										dc.w sub_54BB2-ms_map6_flag2BD_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_54BCC-ms_map6_flag2BD_EntityEvents
										dc.b $8C
										dc.b 1
										dc.w sub_54BFE-ms_map6_flag2BD_EntityEvents
										dc.b $8D
										dc.b 1
										dc.w sub_54C10-ms_map6_flag2BD_EntityEvents
										dc.w $FD00
										dc.w return_54C30-ms_map6_flag2BD_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_549C0:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_549D0
										trap    #TRAP_TEXTBOX
										dc.w $3FF               ; "May I help...oh, sorry.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $400               ; "Old habits die hard.{W1}"
										bra.s   return_54A0C
loc_549D0:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_549F2
										cmpi.b  #1,((byte_FFB651-$1000000)).w
										bne.s   loc_549EC
										move.b  #$11,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										bra.s   loc_549F0
loc_549EC:
										
										trap    #TRAP_TEXTBOX
										dc.w $40C               ; "I'll miss you, {LEADER}.{N}I must find another customer.{W1}"
loc_549F0:
										
										bra.s   return_54A0C
loc_549F2:
										
										cmpi.b  #1,((byte_FFB651-$1000000)).w
										bne.s   loc_54A08
										move.b  #$17,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										bra.s   return_54A0C
loc_54A08:
										
										trap    #TRAP_TEXTBOX
										dc.w $44B               ; "I've a large stock 'cause I{N}heard about the war.  Buy now.{W1}"
return_54A0C:
										
										rts

	; End of function sub_549C0


; =============== S U B R O U T I N E =======================================

sub_54A0E:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_54A2E
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_54A24
										trap    #TRAP_TEXTBOX
										dc.w $3FD               ; "Papa is out now.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $3FE               ; "He ran outside to see{N}the bird.{W1}"
										bra.s   loc_54A2C
loc_54A24:
										
										trap    #TRAP_TEXTBOX
										dc.w $40D               ; "My father said...you would{N}be a nice boy for me to{N}marry someday!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $40E               ; "Oh, it's embarrassing!{W1}"
loc_54A2C:
										
										bra.s   return_54A32
loc_54A2E:
										
										trap    #TRAP_TEXTBOX
										dc.w $44C               ; "You're back, darling!{N}Oh, you're leaving again?{W1}"
return_54A32:
										
										rts

	; End of function sub_54A0E


; =============== S U B R O U T I N E =======================================

sub_54A34:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_54A60
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_54A56
										trap    #TRAP_CHECKFLAG
										dc.w $2BD
										bne.s   loc_54A50
										trap    #TRAP_TEXTBOX
										dc.w $403               ; "{LEADER}!  Your father{N}was also very curious.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $404               ; "He must be indigenous to{N}the mainland.{W1}"
										bra.s   loc_54A54
loc_54A50:
										
										trap    #TRAP_TEXTBOX
										dc.w $421               ; "That was pretty fun!{N}I'm going home.{W1}"
loc_54A54:
										
										bra.s   loc_54A5E
loc_54A56:
										
										trap    #TRAP_TEXTBOX
										dc.w $40F               ; "You're leaving again?{N}Under King's order?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $410               ; "Of course, I'll miss you,{N}but this'll be a good{N}experience for you.{W1}"
loc_54A5E:
										
										bra.s   return_54A68
loc_54A60:
										
										trap    #TRAP_TEXTBOX
										dc.w $44D               ; "You brought so many friends{N}this time.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $44E               ; "You're loved by everyone,{N}my son!{W1}"
return_54A68:
										
										rts

	; End of function sub_54A34


; =============== S U B R O U T I N E =======================================

sub_54A6A:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_54A96
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_54A8C
										trap    #TRAP_CHECKFLAG
										dc.w $2BD
										bne.s   loc_54A86
										trap    #TRAP_TEXTBOX
										dc.w $406               ; "Wow!  It's very big!{N}He doesn't wear anything!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $407               ; "I've seen many animal-like{N}races here, but they all{N}wore clothes!{W1}"
										bra.s   loc_54A8A
loc_54A86:
										
										trap    #TRAP_TEXTBOX
										dc.w $422               ; "It was surprising!{N}The bird spoke!{W1}"
loc_54A8A:
										
										bra.s   loc_54A94
loc_54A8C:
										
										trap    #TRAP_TEXTBOX
										dc.w $411               ; "{LEADER}, you look so sad.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $412               ; "Are you going somewhere?{W1}"
loc_54A94:
										
										bra.s   return_54A9A
loc_54A96:
										
										trap    #TRAP_TEXTBOX
										dc.w $44F               ; "You've grown up so quickly!{W1}"
return_54A9A:
										
										rts

	; End of function sub_54A6A


; =============== S U B R O U T I N E =======================================

sub_54A9C:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_54AD0
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_54ABA
										trap    #TRAP_CHECKFLAG
										dc.w $2BD
										bne.s   loc_54AB4
										trap    #TRAP_TEXTBOX
										dc.w $408               ; "Mmmmm!  He's shining.{N}Is this a bird or a god?{W1}"
										bra.s   loc_54AB8
loc_54AB4:
										
										trap    #TRAP_TEXTBOX
										dc.w $423               ; "See, that bird is special!{N}He belongs to a god!{W1}"
loc_54AB8:
										
										bra.s   loc_54ACE
loc_54ABA:
										
										cmpi.b  #1,((byte_FFB651-$1000000)).w
										bne.s   loc_54ACA
										jsr     j_ChurchActions
										bra.s   loc_54ACE
loc_54ACA:
										
										trap    #TRAP_TEXTBOX
										dc.w $413               ; "I'd at least like to have{N}a roof.{W1}"
loc_54ACE:
										
										bra.s   return_54AD6
loc_54AD0:
										
										jsr     j_ChurchActions
return_54AD6:
										
										rts

	; End of function sub_54A9C


; =============== S U B R O U T I N E =======================================

sub_54AD8:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_54AF4
										trap    #TRAP_CHECKFLAG
										dc.w $2BD
										bne.s   loc_54AEE
										trap    #TRAP_TEXTBOX
										dc.w $401               ; "You know, I never leave{N}my shop.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $402               ; "I didn't know birds like{N}this existed!{W1}"
										bra.s   loc_54AF2
loc_54AEE:
										
										trap    #TRAP_TEXTBOX
										dc.w $420               ; "The bird is gone.{N}Now, back to work!{W1}"
loc_54AF2:
										
										bra.s   return_54B34
loc_54AF4:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_54B1A
										cmpi.b  #1,((byte_FFB651-$1000000)).w
										bne.s   loc_54B10
										move.b  #2,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										bra.s   loc_54B18
loc_54B10:
										
										trap    #TRAP_TEXTBOX
										dc.w $414               ; "I can't make any decent{N}weapons now.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $415               ; "I want to go back to{N}Grans....{W1}"
loc_54B18:
										
										bra.s   return_54B34
loc_54B1A:
										
										cmpi.b  #1,((byte_FFB651-$1000000)).w
										bne.s   loc_54B30
										move.b  #8,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										bra.s   return_54B34
loc_54B30:
										
										trap    #TRAP_TEXTBOX
										dc.w $450               ; "We have various kinds of{N}weapons, thanks to the{N}trading.{W1}"
return_54B34:
										
										rts

	; End of function sub_54AD8


; =============== S U B R O U T I N E =======================================

sub_54B36:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_54B4E
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_54B48
										trap    #TRAP_TEXTBOX
										dc.w $405               ; "What a big bird!{N}How beautiful!{N}It's legendary!{W1}"
										bra.s   loc_54B4C
loc_54B48:
										
										trap    #TRAP_TEXTBOX
										dc.w $416               ; "That's a phoenix!{N}I feel very lucky to{N}see him in my lifetime!{W1}"
loc_54B4C:
										
										bra.s   return_54B52
loc_54B4E:
										
										trap    #TRAP_TEXTBOX
										dc.w $451               ; "Disaster again?{W1}"
return_54B52:
										
										rts

	; End of function sub_54B36


; =============== S U B R O U T I N E =======================================

sub_54B54:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_54B78
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_54B72
										trap    #TRAP_CHECKFLAG
										dc.w $2BD
										bne.s   loc_54B6C
										trap    #TRAP_TEXTBOX
										dc.w $409               ; "Hey, why don't you touch it?{N}It may be a stuffed animal!{W1}"
										bra.s   loc_54B70
loc_54B6C:
										
										trap    #TRAP_TEXTBOX
										dc.w $424               ; "Oh, it's you, {LEADER}.{N}I'll never forget you.{N}Thanks for saving me!{W1}"
loc_54B70:
										
										bra.s   loc_54B76
loc_54B72:
										
										trap    #TRAP_TEXTBOX
										dc.w $417               ; "This house will be completed{N}by the time you return.{W1}"
loc_54B76:
										
										bra.s   return_54B7C
loc_54B78:
										
										trap    #TRAP_TEXTBOX
										dc.w $452               ; "Hey, it's a nice house, isn't{N}it?{W1}"
return_54B7C:
										
										rts

	; End of function sub_54B54


; =============== S U B R O U T I N E =======================================

sub_54B7E:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_54B96
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_54B90
										trap    #TRAP_TEXTBOX
										dc.w $40B               ; "This is boring!{W1}"
										bra.s   loc_54B94
loc_54B90:
										
										trap    #TRAP_TEXTBOX
										dc.w $418               ; "Shhh...{N}I'm hiding here.{N}It's a secret!{W1}"
loc_54B94:
										
										bra.s   return_54B9E
loc_54B96:
										
										trap    #TRAP_TEXTBOX
										dc.w $453               ; "Anything exciting?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $454               ; "A war against the devils?{N}No, no!{N}I don't want to go.{W1}"
return_54B9E:
										
										rts

	; End of function sub_54B7E


; =============== S U B R O U T I N E =======================================

sub_54BA0:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_54BAC
										trap    #TRAP_TEXTBOX
										dc.w $419               ; "Are you ready?!{N}Hey, did you see my friends?{W1}"
										bra.s   return_54BB0
loc_54BAC:
										
										trap    #TRAP_TEXTBOX
										dc.w $455               ; "Welcome back, {LEADER}.{N}I know, you're going away{N}again soon.{W1}"
return_54BB0:
										
										rts

	; End of function sub_54BA0


; =============== S U B R O U T I N E =======================================

sub_54BB2:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_54BC2
										trap    #TRAP_TEXTBOX
										dc.w $41A               ; "I'm looking towards the{N}north.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $41B               ; "The northern half of this{N}landmass is always cloudy.{W1}"
										bra.s   return_54BCA
loc_54BC2:
										
										trap    #TRAP_TEXTBOX
										dc.w $456               ; "I've been watching the{N}northern sky.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $457               ; "I saw something big fall{N}from the sky to the north.{W1}"
return_54BCA:
										
										rts

	; End of function sub_54BB2


; =============== S U B R O U T I N E =======================================

sub_54BCC:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_54BF8
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_54BEE
										trap    #TRAP_CHECKFLAG
										dc.w $2BD
										bne.s   loc_54BE4
										trap    #TRAP_TEXTBOX
										dc.w $40A               ; "I can't see!{N}I can't see!{W1}"
										bra.s   loc_54BEC
loc_54BE4:
										
										trap    #TRAP_TEXTBOX
										dc.w $425               ; "The Minister was upset...{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $426               ; "He looked at me scornfully.{N}I will be disciplined!{W1}"
loc_54BEC:
										
										bra.s   loc_54BF6
loc_54BEE:
										
										trap    #TRAP_TEXTBOX
										dc.w $41C               ; "There is a village to the{N}east of here.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $41D               ; "But everybody jumps into a{N}house when I try to talk{N}to them....{W1}"
loc_54BF6:
										
										bra.s   return_54BFC
loc_54BF8:
										
										trap    #TRAP_TEXTBOX
										dc.w $458               ; "How have you been,{N}{LEADER}.{N}Oh, you look strong.{W1}"
return_54BFC:
										
										rts

	; End of function sub_54BCC


; =============== S U B R O U T I N E =======================================

sub_54BFE:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.s   loc_54C0A
										trap    #TRAP_TEXTBOX
										dc.w $41E               ; "Are my friends still playing?{N}Nobody came to find me.{W1}"
										bra.s   return_54C0E
loc_54C0A:
										
										trap    #TRAP_TEXTBOX
										dc.w $459               ; "I'm not allowed to go out{N}'cause it's so dangerous.{W1}"
return_54C0E:
										
										rts

	; End of function sub_54BFE


; =============== S U B R O U T I N E =======================================

sub_54C10:
										
										trap    #TRAP_CHECKFLAG
										dc.w $322
										bne.w   loc_54C32
										trap    #TRAP_CHECKFLAG
										dc.w $2BE
										bne.s   loc_54C24
										trap    #TRAP_TEXTBOX
										dc.w $41F               ; "Mmmmmm....{W1}"
										bra.s   return_54C30
loc_54C24:
										
										trap    #TRAP_TEXTBOX
										dc.w $427               ; "Listen, I've invented{N}something!{N}An explosive!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $428               ; "You can blow up the rocks{N}blocking the North Cave{N}with it!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $429               ; "Ah...no you can't.{N}You'll be blown up too!{W1}"
return_54C30:
										
										rts
loc_54C32:
										
										trap    #TRAP_CHECKFLAG
										dc.w $324
										bne.w   loc_54CC0
										trap    #TRAP_CHECKFLAG
										dc.w $325
										bne.s   loc_54C4C
										trap    #TRAP_TEXTBOX
										dc.w $45A               ; "Sir Astral forbids me to use{N}the dynamite.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $45B               ; "I need his permission to give{N}it to you.{W1}"
										bra.w   loc_54CBE
loc_54C4C:
										
										moveq   #$72,d1 
										jsr     j_sub_9146
										cmpi.w  #$FFFF,d0
										bne.s   loc_54C8E
										trap    #TRAP_TEXTBOX
										dc.w $45C               ; "Sir Astral, may I give him{N}the dynamite?{W1}"
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										move.w  #$1F,d0
										jsr     GetEntityPortraitAndSpeechSound
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     LoadAndDisplayCurrentPortrait
										trap    #TRAP_TEXTBOX
										dc.w $45D               ; "It's too dangerous to use it{N}as it is.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $45E               ; "We need some way to{N}detonate the dynamite{N}safely.{W1}"
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										bra.s   loc_54CBE
loc_54C8E:
										
										trap    #TRAP_TEXTBOX
										dc.w $45F               ; "Oh, that cannon would be{N}perfect!{W1}"
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										lea     cs_54CC6(pc), a0
										trap    #6
										trap    #TRAP_TEXTBOX
										dc.w $460               ; "Sir Astral said it was OK!{N}Here is the explosive.{W1}"
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										move.w  #$74,d0 
										moveq   #0,d1
										bsr.w   sub_4F48A
										btst    #0,d0
										bne.s   loc_54CBA
										trap    #TRAP_SETFLAG
										dc.w $324               ; set after the dwarf gives you dynamite
										bra.s   loc_54CBE
loc_54CBA:
										
										trap    #TRAP_TEXTBOX
										dc.w $6C1               ; "Oh, your hands are full.{N}I'll give it to you later.{W1}"
loc_54CBE:
										
										bra.s   return_54CC4
loc_54CC0:
										
										trap    #TRAP_TEXTBOX
										dc.w $462               ; "Please destroy the rocks{N}blocking the cave!{W1}"
return_54CC4:
										
										rts

	; End of function sub_54C10

cs_54CC6:           dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
