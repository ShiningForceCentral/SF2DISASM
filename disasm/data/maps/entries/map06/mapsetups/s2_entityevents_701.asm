
; ASM FILE data\maps\entries\map06\mapsetups\s2_entityevents_701.asm :
; 0x54984..0x54CD0 : 
ms_map6_flag701_EntityEvents:
                msEntityEvent 128, UP, Map6_EntityEvent0-ms_map6_flag701_EntityEvents
                msEntityEvent 129, UP, Map6_EntityEvent1-ms_map6_flag701_EntityEvents
                msEntityEvent 130, UP, Map6_EntityEvent2-ms_map6_flag701_EntityEvents
                msEntityEvent 131, UP, Map6_EntityEvent3-ms_map6_flag701_EntityEvents
                msEntityEvent 132, UP, Map6_EntityEvent4-ms_map6_flag701_EntityEvents
                msEntityEvent 133, UP, Map6_EntityEvent5-ms_map6_flag701_EntityEvents
                msEntityEvent 134, UP, Map6_EntityEvent6-ms_map6_flag701_EntityEvents
                msEntityEvent 135, UP, Map6_EntityEvent7-ms_map6_flag701_EntityEvents
                msEntityEvent 136, UP, Map6_EntityEvent8-ms_map6_flag701_EntityEvents
                msEntityEvent 137, UP, Map6_EntityEvent9-ms_map6_flag701_EntityEvents
                msEntityEvent 138, UP, Map6_EntityEvent10-ms_map6_flag701_EntityEvents
                msEntityEvent 139, UP, Map6_EntityEvent11-ms_map6_flag701_EntityEvents
                msEntityEvent 140, UP, Map6_EntityEvent12-ms_map6_flag701_EntityEvents
                msEntityEvent 141, UP, Map6_EntityEvent13-ms_map6_flag701_EntityEvents
                msDefaultEntityEvent Map6_DefaultEntityEvent-ms_map6_flag701_EntityEvents

; =============== S U B R O U T I N E =======================================


Map6_EntityEvent0:
                
                 
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_549D0      
                txt     1023            ; "May I help...oh, sorry.{W2}"
                txt     1024            ; "Old habits die hard.{W1}"
                bra.s   return_54A0C
byte_549D0:
                
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   loc_549F2
                cmpi.b  #1,((byte_FFB651-$1000000)).w
                bne.s   byte_549EC      
                move.b  #SHOP_ITEM_NEW_GRANSEAL_0,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                bra.s   loc_549F0
byte_549EC:
                
                txt     1036            ; "I'll miss you, {LEADER}.{N}I must find another customer.{W1}"
loc_549F0:
                
                bra.s   return_54A0C
loc_549F2:
                
                cmpi.b  #1,((byte_FFB651-$1000000)).w
                bne.s   byte_54A08      
                move.b  #SHOP_ITEM_NEW_GRANSEAL_1,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                bra.s   return_54A0C
byte_54A08:
                
                txt     1099            ; "I've a large stock 'cause I{N}heard about the war.  Buy now.{W1}"
return_54A0C:
                
                rts

    ; End of function Map6_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map6_EntityEvent1:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_54A2E      
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_54A24      
                txt     1021            ; "Papa is out now.{W2}"
                txt     1022            ; "He ran outside to see{N}the bird.{W1}"
                bra.s   loc_54A2C
byte_54A24:
                
                txt     1037            ; "My father said...you would{N}be a nice boy for me to{N}marry someday!{W2}"
                txt     1038            ; "Oh, it's embarrassing!{W1}"
loc_54A2C:
                
                bra.s   return_54A32
byte_54A2E:
                
                txt     1100            ; "You're back, darling!{N}Oh, you're leaving again?{W1}"
return_54A32:
                
                rts

    ; End of function Map6_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map6_EntityEvent2:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_54A60      
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_54A56      
                chkFlg  701             ; Set after the scene with Peter and the kids in New Granseal
                bne.s   byte_54A50      
                txt     1027            ; "{LEADER}!  Your father{N}was also very curious.{W2}"
                txt     1028            ; "He must be indigenous to{N}the mainland.{W1}"
                bra.s   loc_54A54
byte_54A50:
                
                txt     1057            ; "That was pretty fun!{N}I'm going home.{W1}"
loc_54A54:
                
                bra.s   loc_54A5E
byte_54A56:
                
                txt     1039            ; "You're leaving again?{N}Under King's order?{W2}"
                txt     1040            ; "Of course, I'll miss you,{N}but this'll be a good{N}experience for you.{W1}"
loc_54A5E:
                
                bra.s   return_54A68
byte_54A60:
                
                txt     1101            ; "You brought so many friends{N}this time.{W2}"
                txt     1102            ; "You're loved by everyone,{N}my son!{W1}"
return_54A68:
                
                rts

    ; End of function Map6_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map6_EntityEvent3:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_54A96      
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_54A8C      
                chkFlg  701             ; Set after the scene with Peter and the kids in New Granseal
                bne.s   byte_54A86      
                txt     1030            ; "Wow!  It's very big!{N}He doesn't wear anything!{W2}"
                txt     1031            ; "I've seen many animal-like{N}races here, but they all{N}wore clothes!{W1}"
                bra.s   loc_54A8A
byte_54A86:
                
                txt     1058            ; "It was surprising!{N}The bird spoke!{W1}"
loc_54A8A:
                
                bra.s   loc_54A94
byte_54A8C:
                
                txt     1041            ; "{LEADER}, you look so sad.{W2}"
                txt     1042            ; "Are you going somewhere?{W1}"
loc_54A94:
                
                bra.s   return_54A9A
byte_54A96:
                
                txt     1103            ; "You've grown up so quickly!{W1}"
return_54A9A:
                
                rts

    ; End of function Map6_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map6_EntityEvent4:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   loc_54AD0
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   loc_54ABA
                chkFlg  701             ; Set after the scene with Peter and the kids in New Granseal
                bne.s   byte_54AB4      
                txt     1032            ; "Mmmmm!  He's shining.{N}Is this a bird or a god?{W1}"
                bra.s   loc_54AB8
byte_54AB4:
                
                txt     1059            ; "See, that bird is special!{N}He belongs to a god!{W1}"
loc_54AB8:
                
                bra.s   loc_54ACE
loc_54ABA:
                
                cmpi.b  #1,((byte_FFB651-$1000000)).w
                bne.s   byte_54ACA      
                jsr     j_ChurchMenu
                bra.s   loc_54ACE
byte_54ACA:
                
                txt     1043            ; "I'd at least like to have{N}a roof.{W1}"
loc_54ACE:
                
                bra.s   return_54AD6
loc_54AD0:
                
                jsr     j_ChurchMenu
return_54AD6:
                
                rts

    ; End of function Map6_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map6_EntityEvent5:
                
                 
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_54AF4      
                chkFlg  701             ; Set after the scene with Peter and the kids in New Granseal
                bne.s   byte_54AEE      
                txt     1025            ; "You know, I never leave{N}my shop.{W2}"
                txt     1026            ; "I didn't know birds like{N}this existed!{W1}"
                bra.s   loc_54AF2
byte_54AEE:
                
                txt     1056            ; "The bird is gone.{N}Now, back to work!{W1}"
loc_54AF2:
                
                bra.s   return_54B34
byte_54AF4:
                
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   loc_54B1A
                cmpi.b  #1,((byte_FFB651-$1000000)).w
                bne.s   byte_54B10      
                move.b  #SHOP_WEAPON_NEW_GRANSEAL_0,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                bra.s   loc_54B18
byte_54B10:
                
                txt     1044            ; "I can't make any decent{N}weapons now.{W2}"
                txt     1045            ; "I want to go back to{N}Grans....{W1}"
loc_54B18:
                
                bra.s   return_54B34
loc_54B1A:
                
                cmpi.b  #1,((byte_FFB651-$1000000)).w
                bne.s   byte_54B30      
                move.b  #SHOP_WEAPON_NEW_GRANSEAL_1,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenu
                bra.s   return_54B34
byte_54B30:
                
                txt     1104            ; "We have various kinds of{N}weapons, thanks to the{N}trading.{W1}"
return_54B34:
                
                rts

    ; End of function Map6_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map6_EntityEvent6:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_54B4E      
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_54B48      
                txt     1029            ; "What a big bird!{N}How beautiful!{N}It's legendary!{W1}"
                bra.s   loc_54B4C
byte_54B48:
                
                txt     1046            ; "That's a phoenix!{N}I feel very lucky to{N}see him in my lifetime!{W1}"
loc_54B4C:
                
                bra.s   return_54B52
byte_54B4E:
                
                txt     1105            ; "Disaster again?{W1}"
return_54B52:
                
                rts

    ; End of function Map6_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map6_EntityEvent7:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_54B78      
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_54B72      
                chkFlg  701             ; Set after the scene with Peter and the kids in New Granseal
                bne.s   byte_54B6C      
                txt     1033            ; "Hey, why don't you touch it?{N}It may be a stuffed animal!{W1}"
                bra.s   loc_54B70
byte_54B6C:
                
                txt     1060            ; "Oh, it's you, {LEADER}.{N}I'll never forget you.{N}Thanks for saving me!{W1}"
loc_54B70:
                
                bra.s   loc_54B76
byte_54B72:
                
                txt     1047            ; "This house will be completed{N}by the time you return.{W1}"
loc_54B76:
                
                bra.s   return_54B7C
byte_54B78:
                
                txt     1106            ; "Hey, it's a nice house, isn't{N}it?{W1}"
return_54B7C:
                
                rts

    ; End of function Map6_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map6_EntityEvent8:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_54B96      
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_54B90      
                txt     1035            ; "This is boring!{W1}"
                bra.s   loc_54B94
byte_54B90:
                
                txt     1048            ; "Shhh...{N}I'm hiding here.{N}It's a secret!{W1}"
loc_54B94:
                
                bra.s   return_54B9E
byte_54B96:
                
                txt     1107            ; "Anything exciting?{W2}"
                txt     1108            ; "A war against the devils?{N}No, no!{N}I don't want to go.{W1}"
return_54B9E:
                
                rts

    ; End of function Map6_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map6_EntityEvent9:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_54BAC      
                txt     1049            ; "Are you ready?!{N}Hey, did you see my friends?{W1}"
                bra.s   return_54BB0
byte_54BAC:
                
                txt     1109            ; "Welcome back, {LEADER}.{N}I know, you're going away{N}again soon.{W1}"
return_54BB0:
                
                rts

    ; End of function Map6_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map6_EntityEvent10:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_54BC2      
                txt     1050            ; "I'm looking towards the{N}north.{W2}"
                txt     1051            ; "The northern half of this{N}landmass is always cloudy.{W1}"
                bra.s   return_54BCA
byte_54BC2:
                
                txt     1110            ; "I've been watching the{N}northern sky.{W2}"
                txt     1111            ; "I saw something big fall{N}from the sky to the north.{W1}"
return_54BCA:
                
                rts

    ; End of function Map6_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map6_EntityEvent11:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_54BF8      
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_54BEE      
                chkFlg  701             ; Set after the scene with Peter and the kids in New Granseal
                bne.s   byte_54BE4      
                txt     1034            ; "I can't see!{N}I can't see!{W1}"
                bra.s   loc_54BEC
byte_54BE4:
                
                txt     1061            ; "The Minister was upset...{W2}"
                txt     1062            ; "He looked at me scornfully.{N}I will be disciplined!{W1}"
loc_54BEC:
                
                bra.s   loc_54BF6
byte_54BEE:
                
                txt     1052            ; "There is a village to the{N}east of here.{W2}"
                txt     1053            ; "But everybody jumps into a{N}house when I try to talk{N}to them....{W1}"
loc_54BF6:
                
                bra.s   return_54BFC
byte_54BF8:
                
                txt     1112            ; "How have you been,{N}{LEADER}.{N}Oh, you look strong.{W1}"
return_54BFC:
                
                rts

    ; End of function Map6_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map6_EntityEvent12:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   byte_54C0A      
                txt     1054            ; "Are my friends still playing?{N}Nobody came to find me.{W1}"
                bra.s   return_54C0E
byte_54C0A:
                
                txt     1113            ; "I'm not allowed to go out{N}'cause it's so dangerous.{W1}"
return_54C0E:
                
                rts

    ; End of function Map6_EntityEvent12


; =============== S U B R O U T I N E =======================================


Map6_EntityEvent13:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.w   byte_54C32      
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   byte_54C24      
                txt     1055            ; "Mmmmmm....{W1}"
                bra.s   Map6_DefaultEntityEvent
byte_54C24:
                
                txt     1063            ; "Listen, I've invented{N}something!{N}An explosive!{W2}"
                txt     1064            ; "You can blow up the rocks{N}blocking the North Cave{N}with it!{W2}"
                txt     1065            ; "Ah...no you can't.{N}You'll be blown up too!{W1}"
Map6_DefaultEntityEvent:
                
                rts
byte_54C32:
                
                chkFlg  804             ; Set after the dwarf gives you dynamite
                bne.w   byte_54CC0      
                chkFlg  805             ; Set after coming back to New Granseal after Creed's Mansion,when Astral joins
                bne.s   loc_54C4C
                txt     1114            ; "Sir Astral forbids me to use{N}the dynamite.{W2}"
                txt     1115            ; "I need his permission to give{N}it to you.{W1}"
                bra.w   loc_54CBE
loc_54C4C:
                
                moveq   #ITEM_CANNON,d1
                jsr     j_GetItemInventoryLocation
                cmpi.w  #-1,d0
                bne.s   byte_54C8E      
                txt     1116            ; "Sir Astral, may I give him{N}the dynamite?{W1}"
                clsTxt
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                move.w  #FOLLOWER_B,d0
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                jsr     LoadAndDisplayCurrentPortrait
                txt     1117            ; "It's too dangerous to use it{N}as it is.{W2}"
                txt     1118            ; "We need some way to{N}detonate the dynamite{N}safely.{W1}"
                clsTxt
                bra.s   loc_54CBE
byte_54C8E:
                
                txt     1119            ; "Oh, that cannon would be{N}perfect!{W1}"
                clsTxt
                script  cs_54CC6
                txt     1120            ; "Sir Astral said it was OK!{N}Here is the explosive.{W1}"
                clsTxt
                move.w  #ITEM_DYNAMITE,d0
                moveq   #0,d1
                bsr.w   ReceiveMandatoryItem
                btst    #0,d0
                bne.s   byte_54CBA      
                setFlg  804             ; Set after the dwarf gives you dynamite
                bra.s   loc_54CBE
byte_54CBA:
                
                txt     1729            ; "Oh, your hands are full.{N}I'll give it to you later.{W1}"
loc_54CBE:
                
                bra.s   return_54CC4
byte_54CC0:
                
                txt     1122            ; "Please destroy the rocks{N}blocking the cave!{W1}"
return_54CC4:
                
                rts

    ; End of function Map6_EntityEvent13

cs_54CC6:       setFacing FOLLOWER_B,UP
                nod FOLLOWER_B
                csc_end
