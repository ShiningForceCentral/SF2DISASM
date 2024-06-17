
; ASM FILE data\maps\entries\map03\mapsetups\s2_entityevents_506.asm :
; 0x511CA..0x512E0 : 
ms_map3_flag506_EntityEvents:
                msEntityEvent 128, RIGHT, Map3_1FA_EntityEvent0-ms_map3_flag506_EntityEvents
                msEntityEvent 129, RIGHT, Map3_1FA_EntityEvent0-ms_map3_flag506_EntityEvents
                msEntityEvent 130, DOWN, Map3_1FA_EntityEvent2-ms_map3_flag506_EntityEvents
                msEntityEvent 131, DOWN, Map3_1FA_EntityEvent3-ms_map3_flag506_EntityEvents
                msEntityEvent 132, RIGHT, Map3_1FA_EntityEvent4-ms_map3_flag506_EntityEvents
                msEntityEvent 133, DOWN, Map3_1FA_EntityEvent5-ms_map3_flag506_EntityEvents
                msEntityEvent 134, DOWN, Map3_1FA_EntityEvent6-ms_map3_flag506_EntityEvents
                msEntityEvent 135, DOWN, Map3_1FA_EntityEvent7-ms_map3_flag506_EntityEvents
                msEntityEvent 136, DOWN, Map3_1FA_EntityEvent8-ms_map3_flag506_EntityEvents
                msEntityEvent 137, DOWN, (Map3_261_EntityEvent21-ms_map3_flag506_EntityEvents) & $FFFF
                msEntityEvent 138, DOWN, (Map3_261_EntityEvent3-ms_map3_flag506_EntityEvents) & $FFFF
                msEntityEvent 139, RIGHT, Map3_1FA_EntityEvent0-ms_map3_flag506_EntityEvents
                msEntityEvent 140, DOWN, Map3_1FA_EntityEvent12-ms_map3_flag506_EntityEvents
                msEntityEvent 141, DOWN, Map3_1FA_EntityEvent13-ms_map3_flag506_EntityEvents
                msEntityEvent 142, DOWN, (Map3_261_EntityEvent26-ms_map3_flag506_EntityEvents) & $FFFF
                msEntityEvent ALLY_KIWI, RIGHT, Map3_1FA_EntityEvent15-ms_map3_flag506_EntityEvents
                msDefaultEntityEvent (Map3_DefaultEntityEvent-ms_map3_flag506_EntityEvents) & $FFFF
                dc.b $FF
                dc.b $FF

; =============== S U B R O U T I N E =======================================


Map3_1FA_EntityEvent0:
                
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                clr.w   ((CURRENT_SPEECH_SFX-$1000000)).w
                txt     678             ; "Already passed away...{N}{LEADER} feels pity.{W1}"
                rts

    ; End of function Map3_1FA_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map3_1FA_EntityEvent2:
                
                 
                txt     665             ; "(Shiver)....{N}The Galam Army was so{N}rude.{W1}"
                rts

    ; End of function Map3_1FA_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map3_1FA_EntityEvent3:
                
                 
                txt     666             ; "Galam soldiers rushed into{N}the castle.  What's going{N}on?{W1}"
                rts

    ; End of function Map3_1FA_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map3_1FA_EntityEvent4:
                
                 
                txt     667             ; "Be quiet when the Galam{N}Army comes in!  Got it?{W1}"
                rts

    ; End of function Map3_1FA_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map3_1FA_EntityEvent5:
                
                 
                txt     668             ; "I'm not afraid of Galam!{N}Grown-ups are cowards.{W1}"
                rts

    ; End of function Map3_1FA_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map3_1FA_EntityEvent6:
                
                 
                txt     669             ; "It has been so quiet since{N}they forced their way into{N}the castle.{W2}{N}What's going on?{W1}"
                rts

    ; End of function Map3_1FA_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map3_1FA_EntityEvent7:
                
                 
                txt     670             ; "Why did Galam invade our{N}country so suddenly?  Why?{N}We are allies.{W1}"
                rts

    ; End of function Map3_1FA_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map3_1FA_EntityEvent8:
                
                 
                txt     671             ; "I can't believe it!{W2}{N}The Galam Army went into{N}the castle with Mr. {NAME;28}{N}in the lead.{W1}"
                rts

    ; End of function Map3_1FA_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map3_1FA_EntityEvent12:
                
                 
                txt     672             ; "See, see!{N}Galam soldiers destroyed{N}the cages!{W2}{N}The strange animals ran{N}away!{W1}"
                rts

    ; End of function Map3_1FA_EntityEvent12


; =============== S U B R O U T I N E =======================================


Map3_1FA_EntityEvent13:
                
                 
                txt     673             ; "{LEADER}, are you{N}alright?{W2}{N}Please do not go into{N}the castle, {LEADER}.{W1}"
                rts

    ; End of function Map3_1FA_EntityEvent13


; =============== S U B R O U T I N E =======================================


Map3_1FA_EntityEvent15:
                
                 
                chkFlg  6               ; Kiwi joined
                bne.s   return_512B8
                txt     674             ; "(Shiver)...ooouu....{W1}"
                clsTxt
                jsr     j_ClosePortraitWindow
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                clr.w   ((CURRENT_SPEECH_SFX-$1000000)).w
                txt     675             ; "{CLEAR}He is shivering.{N}Will you name him?"
                jsr     j_YesNoPrompt
                clsTxt
                tst.w   d0
                bne.s   return_512B8
                move.w  #ALLY_KIWI,d0
                jsr     j_NameAlly
                txt     676             ; "{LEADER} named him{N}{NAME;6} and beckoned.{W1}"
                clsTxt
                move.w  ((SPEECH_SFX_COPY-$1000000)).w,((CURRENT_SPEECH_SFX-$1000000)).w
                jsr     LoadAndDisplayCurrentPortrait
                txt     677             ; "Oooo!  Ooooo!{W1}"
                clsTxt
                jsr     j_ClosePortraitWindow
                script  cs_512BA
return_512B8:
                
                rts

    ; End of function Map3_1FA_EntityEvent15

cs_512BA:       setFacing ALLY_KIWI,DOWN
                setActscriptWait ALLY_KIWI,eas_Jump
                setActscriptWait ALLY_KIWI,eas_Jump
                setActscriptWait ALLY_KIWI,eas_Jump
                join ALLY_KIWI
                addNewFollower ALLY_KIWI
                csc_end
