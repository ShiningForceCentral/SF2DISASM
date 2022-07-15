
; ASM FILE data\maps\entries\map19\mapsetups\s2_entityevents.asm :
; 0x52E02..0x52F60 : 
ms_map19_EntityEvents:
                msEntityEvent 128, UP, Map19_EntityEvent0-ms_map19_EntityEvents
                msEntityEvent 129, UP, Map19_EntityEvent1-ms_map19_EntityEvents
                msEntityEvent 130, RIGHT, Map19_EntityEvent2-ms_map19_EntityEvents
                msEntityEvent 131, RIGHT, Map19_EntityEvent3-ms_map19_EntityEvents
                msEntityEvent 132, UP, Map19_EntityEvent4-ms_map19_EntityEvents
                msEntityEvent 133, DOWN, Map19_EntityEvent5-ms_map19_EntityEvents
                msEntityEvent 134, DOWN, Map19_EntityEvent6-ms_map19_EntityEvents
                msEntityEvent 135, UP, Map19_EntityEvent7-ms_map19_EntityEvents
                msEntityEvent 136, DOWN, Map19_EntityEvent8-ms_map19_EntityEvents
                msEntityEvent 137, DOWN, Map19_EntityEvent9-ms_map19_EntityEvents
                msEntityEvent 138, DOWN, Map19_EntityEvent10-ms_map19_EntityEvents
                msEntityEvent 139, DOWN, Map19_EntityEvent11-ms_map19_EntityEvents
                msEntityEvent 140, UP, Map19_EntityEvent12-ms_map19_EntityEvents
                msDefaultEntityEvent Map19_DefaultEntityEvent-ms_map19_EntityEvents

; =============== S U B R O U T I N E =======================================


Map19_EntityEvent0:
                
                 
                chkFlg  256             ; TEMP FLAG #00
                bne.s   byte_52E48      
                txt     543             ; "I hate fighting.{W2}{N}But I've almost forgotten{N}how to fight fight in this{N}peaceful kingdom.{W1}"
                setFlg  256             ; TEMP FLAG #00
byte_52E48:
                
                txt     544             ; "I'm going to the Ancient{N}Shrine in the south to{N}kill some rats.{W1}"
                rts

    ; End of function Map19_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map19_EntityEvent1:
                
                 
                chkFlg  257             ; TEMP FLAG #01
                bne.s   byte_52E5C      
                txt     545             ; "Northern Galam is a country{N}on our border, but we are{N}allies.{W2}{N}Do we really need to guard{N}our country?{W2}"
                setFlg  257             ; TEMP FLAG #01
byte_52E5C:
                
                txt     546             ; "Some younger soldiers{N}think that peace is boring,{N}but they're wrong.{W1}"
                rts

    ; End of function Map19_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map19_EntityEvent2:
                
                 
                txt     547             ; "Zzzzz....{N}Zzzzz....{W1}"
                rts

    ; End of function Map19_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map19_EntityEvent3:
                
                 
                txt     548             ; "Zz...huh...who are you?{N}I'm tired because I was{N}standing watch all night{W2}{N}long...zzzz....{W1}"
                rts

    ; End of function Map19_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map19_EntityEvent4:
                
                 
                chkFlg  258             ; TEMP FLAG #02
                bne.s   byte_52E7C      
                txt     549             ; "Weapons storage!{W2}"
                setFlg  258             ; TEMP FLAG #02
byte_52E7C:
                
                txt     550             ; "The weapons inside could{N}be rusty.  We haven't{N}opened the door for many{W2}{N}years.{W1}"
                rts

    ; End of function Map19_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map19_EntityEvent5:
                
                 
                chkFlg  259             ; TEMP FLAG #03
                bne.s   byte_52E90      
                txt     551             ; "This is King Granseal's{N}public room!{W2}{N}Oh, you must be pupils{N}of Sir Astral.{W2}{N}You look too young to work{N}for the King!{W2}"
                setFlg  259             ; TEMP FLAG #03
byte_52E90:
                
                txt     552             ; "Why don't you go back to{N}school?{W1}"
                rts

    ; End of function Map19_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map19_EntityEvent6:
                
                 
                chkFlg  260             ; TEMP FLAG #04
                bne.s   byte_52EA4      
                txt     553             ; "I saw Sir Astral going into{N}the King's bedroom.{W2}"
                setFlg  260             ; TEMP FLAG #04
byte_52EA4:
                
                txt     554             ; "He was in such a hurry.{N}Do you know why?{W1}"
                rts

    ; End of function Map19_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map19_EntityEvent7:
                
                 
                chkFlg  261             ; TEMP FLAG #05
                bne.s   byte_52EB8      
                txt     555             ; "What's wrong with the{N}King?  He is usually{N}down here by now.{W2}"
                setFlg  261             ; TEMP FLAG #05
byte_52EB8:
                
                txt     556             ; "I thought the King would{N}be the last person to{N}oversleep.{W1}"
                rts

    ; End of function Map19_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map19_EntityEvent8:
                
                 
                chkFlg  262             ; TEMP FLAG #06
                bne.s   byte_52ECC      
                txt     557             ; "How busy I am!  Soldiers{N}eat here everyday{N}without doing any work.{W2}"
                setFlg  262             ; TEMP FLAG #06
byte_52ECC:
                
                txt     558             ; "But I think that's OK.{N}A soldier's job is fighting.{W1}"
                rts

    ; End of function Map19_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map19_EntityEvent9:
                
                 
                txt     559             ; "What is she doing now?{N}She brought the King his{N}breakfast over an hour ago.{W1}"
                rts

    ; End of function Map19_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map19_EntityEvent10:
                
                 
                chkFlg  263             ; TEMP FLAG #07
                bne.s   byte_52EE6      
                txt     560             ; "I'm a messenger from Galam.{N}I came here to see the King.{W2}"
                setFlg  263             ; TEMP FLAG #07
byte_52EE6:
                
                txt     561             ; "But, he's still sleeping.{N}Did I arrive too early?{W1}"
                rts

    ; End of function Map19_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map19_EntityEvent11:
                
                 
                txt     562             ; "The cook said that the{N}King didn't eat today.{N}I wonder why?{W1}"
                rts

    ; End of function Map19_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map19_EntityEvent12:
                
                 
                chkFlg  607             ; Set after talking to Astral about going to the tower
                bne.s   byte_52F04
                script  cs_52F0C
                setFlg  607             ; Set after talking to Astral about going to the tower
                bra.s   Map19_DefaultEntityEvent
byte_52F04:
                
                script  cs_52F24
Map19_DefaultEntityEvent:
                
                rts

    ; End of function Map19_EntityEvent12

cs_52F0C:       textCursor 575
                nextText $0,140         ; "I didn't want to involve{N}you, my children...but{N}this might be a good{W2}{N}opportunity for you to{N}learn how to properly{N}serve your King.{W2}{N}Are you ready, {LEADER}?{W1}"
                yesNo
                jumpIfFlagSet 89,cs_52F40 ; YES/NO prompt answer
                nextSingleText $0,140   ; "Then, I'll wait for you here.{W2}{N}We have to hurry.{N}Come back when you're{N}ready.{W1}"
                csc_end
cs_52F24:       textCursor 577
                nextText $0,140         ; "Are you ready, {LEADER}?{W1}"
                yesNo
                jumpIfFlagSet 89,cs_52F40 ; YES/NO prompt answer
                textCursor 576
                nextSingleText $0,140   ; "Then, I'll wait for you here.{W2}{N}We have to hurry.{N}Come back when you're{N}ready.{W1}"
                csc_end
cs_52F40:       textCursor 578
                nextSingleText $0,140   ; "Good!{N}Let's go to the tower.{N}Follow me.{W1}"
                entityActionsWait 140
                 moveUp 1
                 moveLeft 8
                endActions
                setPos 140,63,63,LEFT
                setF 608                ; Set after agreeing to go to the tower with Astral
                csc_end
