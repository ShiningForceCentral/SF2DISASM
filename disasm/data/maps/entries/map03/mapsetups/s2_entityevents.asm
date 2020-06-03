
; ASM FILE data\maps\entries\map03\mapsetups\s2_entityevents.asm :
; 0x50F10..0x5105C : 
ms_map3_EntityEvents:
                msEntityEvent 1, DOWN, Map3_EntityEvent0-ms_map3_EntityEvents
                msEntityEvent 2, RIGHT, Map3_EntityEvent1-ms_map3_EntityEvents
                msEntityEvent 128, UP, Map3_EntityEvent2-ms_map3_EntityEvents
                msEntityEvent 129, DOWN, Map3_EntityEvent3-ms_map3_EntityEvents
                msEntityEvent 130, UP, Map3_EntityEvent4-ms_map3_EntityEvents
                msEntityEvent 131, UP, Map3_EntityEvent5-ms_map3_EntityEvents
                msEntityEvent 132, RIGHT, Map3_EntityEvent6-ms_map3_EntityEvents
                msEntityEvent 133, UP, Map3_EntityEvent7-ms_map3_EntityEvents
                msEntityEvent 134, UP, Map3_EntityEvent8-ms_map3_EntityEvents
                msEntityEvent 137, UP, Map3_EntityEvent9-ms_map3_EntityEvents
                msEntityEvent 138, UP, Map3_EntityEvent10-ms_map3_EntityEvents
                msEntityEvent 139, UP, Map3_EntityEvent11-ms_map3_EntityEvents
                msEntityEvent 140, UP, Map3_EntityEvent12-ms_map3_EntityEvents
                msEntityEvent 141, UP, Map3_EntityEvent13-ms_map3_EntityEvents
                msEntityEvent 144, UP, Map3_EntityEvent8-ms_map3_EntityEvents
                msEntityEvent 142, DOWN, Map3_EntityEvent15-ms_map3_EntityEvents
                msDefaultEntityEvent Map3_DefaultEntityEvent-ms_map3_EntityEvents

; =============== S U B R O U T I N E =======================================

Map3_EntityEvent0:
                
                 
                chkFlg  $25B            ; Set after the messenger scene
                bne.s   byte_50F8A      
                chkFlg  $25A            ; Set after Astral's second basement line
                bne.s   byte_50F84      
                chkFlg  $100            ; TEMP FLAG #00
                bne.s   byte_50F6A      
                txt     $200            ; "Hi, {LEADER}!{N}How are you?{W2}"
byte_50F6A:
                
                txt     $1E0            ; "Sir Astral is in the{N}basement, but he looks{N}"
                txt     $1E1            ; "strange today.{W1}"
                chkFlg  $100            ; TEMP FLAG #00
                bne.s   loc_50F82
                script  cs_513D6
                setFlg  $100            ; TEMP FLAG #00
loc_50F82:
                
                bra.s   loc_50F88
byte_50F84:
                
                txt     $1F6            ; "What's wrong with you?{N}Your seat is next to{N}{NAME;2}!{W1}"
loc_50F88:
                
                bra.s   return_50F96
byte_50F8A:
                
                chkFlg  $42             ; Sarah + Chester are followers
                bne.s   return_50F96
                script  cs_513E2
return_50F96:
                
                rts

    ; End of function Map3_EntityEvent0


; =============== S U B R O U T I N E =======================================

Map3_EntityEvent1:
                
                 
                chkFlg  $25B            ; Set after the messenger scene
                bne.s   byte_50FB4      
                chkFlg  $25A            ; Set after Astral's second basement line
                bne.s   byte_50FAA      
                txt     $1E2            ; "Hooo...I'm sleepy.{N}{NAME;3} must be sleeping{N}soundly about now.{W1}"
                bra.s   loc_50FB2
byte_50FAA:
                
                txt     $1F7            ; "Zzzzz...zzzzz...{N}...ye...yes!{W1}"
                txt     $1F8            ; "Oh, it's you, {LEADER}.{N}I thought it was Sir Astral!{W1}"
loc_50FB2:
                
                bra.s   return_50FB8
byte_50FB4:
                
                txt     $1FB            ; "Yeah, I do want to go to{N}the castle, but {LEADER},{N}how about you?{W1}"
return_50FB8:
                
                rts

    ; End of function Map3_EntityEvent1


; =============== S U B R O U T I N E =======================================

Map3_EntityEvent2:
                
                 
                chkFlg  $25A            ; Set after Astral's second basement line
                bne.s   byte_50FC6      
                txt     $1E3            ; "Hurry to school!{N}Sir Astral and {NAME;1} must{N}be waiting.{W1}"
                bra.s   return_50FCA
byte_50FC6:
                
                txt     $1F9            ; "I'm busy!{N}The storm last night{N}messed up the house.{W1}"
return_50FCA:
                
                rts

    ; End of function Map3_EntityEvent2


; =============== S U B R O U T I N E =======================================

Map3_EntityEvent3:
                
                 
                txt     $1E4            ; "He thinks of you as his own{N}grandson.{W2}"
                txt     $1E5            ; "Sometimes he may badger{N}you, but that's because he{N}loves you.{W1}"
                rts

    ; End of function Map3_EntityEvent3


; =============== S U B R O U T I N E =======================================

Map3_EntityEvent4:
                
                 
                txt     $1E6            ; "Hi, boy!  Good morning.{N}Are you going to school?{W2}"
                txt     $1E7            ; "Say, Sir Astral certainly{N}is a great person.{W2}"
                txt     $1E8            ; "He even teaches a{N}mischievous kid like you.{W1}"
                rts

    ; End of function Map3_EntityEvent4


; =============== S U B R O U T I N E =======================================

Map3_EntityEvent5:
                
                 
                txt     $1E9            ; "Good morning {LEADER}!{N}It's a wonderful day,{N}isn't it?{W1}"
                rts

    ; End of function Map3_EntityEvent5


; =============== S U B R O U T I N E =======================================

Map3_EntityEvent6:
                
                 
                txt     $1EA            ; "Zzzzz...zzzzz....{W1}"
                rts

    ; End of function Map3_EntityEvent6


; =============== S U B R O U T I N E =======================================

Map3_EntityEvent7:
                
                 
                txt     $1EB            ; "Sir Astral is the wisest{N}person in Granseal.{W2}"
                txt     $1EC            ; "He's such a great man, he{N}opened a school all{N}by himself.{W2}"
                txt     $1ED            ; "You must realize how lucky{N}you are.{W1}"
                rts

    ; End of function Map3_EntityEvent7


; =============== S U B R O U T I N E =======================================

Map3_EntityEvent8:
                
                 
                txt     $1EE            ; "Hi, would-be customer!{N}Sorry, we are not open yet.{W1}"
                rts

    ; End of function Map3_EntityEvent8


; =============== S U B R O U T I N E =======================================

Map3_EntityEvent9:
                
                 
                txt     $1EF            ; "Granseal's harbor is behind{N}me.{W2}"
                txt     $1F0            ; "All ships left early this{N}morning.{W1}"
                rts

    ; End of function Map3_EntityEvent9


; =============== S U B R O U T I N E =======================================

Map3_EntityEvent10:
                
                 
                chkFlg  $25C            ; Set after the guards have listened to Sarah and allowed you into the castle
                bne.s   byte_5101A      
                txt     $1F1            ; "You cannot enter the castle{N}of Granseal.  Go away!{W1}"
                bra.s   return_5101E
byte_5101A:
                
                txt     $1FC            ; "To deliver him a package?{N}Really?{W1}"
return_5101E:
                
                rts

    ; End of function Map3_EntityEvent10


; =============== S U B R O U T I N E =======================================

Map3_EntityEvent11:
                
                 
                chkFlg  $25C            ; Set after the guards have listened to Sarah and allowed you into the castle
                bne.s   byte_5102C      
                txt     $1F1            ; "You cannot enter the castle{N}of Granseal.  Go away!{W1}"
                bra.s   return_51030
byte_5102C:
                
                txt     $1FD            ; "(Cough!)  Be good in the{N}castle, OK?{W1}"
return_51030:
                
                rts

    ; End of function Map3_EntityEvent11


; =============== S U B R O U T I N E =======================================

Map3_EntityEvent12:
                
                 
                txt     $1F2            ; "You unruly boy!{N}Where on earth are you{N}going?{W2}"
                txt     $1F3            ; "There is no school outside!{N}Go to school!{W1}"
                rts

    ; End of function Map3_EntityEvent12


; =============== S U B R O U T I N E =======================================

Map3_EntityEvent13:
                
                jsr     j_ChurchMenuActions
                rts

    ; End of function Map3_EntityEvent13


; =============== S U B R O U T I N E =======================================

Map3_EntityEvent15:
                
                 
                chkFlg  $105            ; TEMP FLAG #05
                bne.s   byte_51052      
                txt     $1F4            ; "Oh, morning {LEADER}.{N}When did you come in?{W2}"
                setFlg  $105            ; TEMP FLAG #05
byte_51052:
                
                txt     $1F5            ; "Is it time to start school?{N}OK, I'm coming up soon.{W1}"
                setFlg  $25A            ; Set after Astral's second basement line
Map3_DefaultEntityEvent:
                
                rts

    ; End of function Map3_EntityEvent15

