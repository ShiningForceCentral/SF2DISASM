
; ASM FILE data\maps\entries\map24\mapsetups\s6_initfunction.asm :
; 0x59C36..0x59D08 : 

; =============== S U B R O U T I N E =======================================

ms_map24_InitFunction:
                
                 
                sndCom  MUSIC_HEADQUARTERS
                jsr     (FadeInFromBlack).w
                move.w  #$46,((SPEECH_SFX-$1000000)).w 
                chkFlg  $220            ; Battle 44 completed
                bne.w   loc_59CB2
                txt     $1D3            ; "Welcome to the fairy woods{N}special stage!{W2}"
                txt     $1D4            ; "How quickly can you defeat{N}all the hidden monsters?{W2}"
                txt     $1D5            ; "Now, set a new record.{W2}"
                move.l  ((SPECIAL_BATTLE_RECORD-$1000000)).w,d0
                divs.w  #$3C,d0 
                move.w  d0,d1
                ext.l   d1
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     $1D6            ; "Best record so far is{N}{#} min."
                swap    d0
                ext.l   d0
                move.l  d0,((TEXT_NUMBER-$1000000)).w
                txt     $1D7            ; "{DICT} {#} sec.{W2}"
                txt     $1D8            ; "Are you ready?"
                jsr     j_YesNoChoiceBox
                tst.w   d0
                bne.s   byte_59C92      
                txt     $1D9            ; "...set...GO!{W2}"
                script  cs_StartSpecialBattle
                bra.s   return_59C9C
byte_59C92:
                
                txt     $1DA            ; "Oh, what a pity!{N}Please visit me anytime!!{W1}"
                script  cs_LeaveSpecialBattle
return_59C9C:
                
                rts
cs_StartSpecialBattle:
                
                setStoryFlag $2C        ; Battle 44 unlocked
                warp MAP_SECRET_MONK_FOREST_BATTLEFIELD,1,24,LEFT
                csc_end
cs_LeaveSpecialBattle:
                
                warp MAP_SECRET_MONK_FOREST,30,24,LEFT
                csc_end
loc_59CB2:
                
                move.l  ((SPECIAL_BATTLE_TIME-$1000000)).w,d0
                divs.w  #$3C,d0 
                move.w  d0,d1
                ext.l   d1
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     $1DB            ; "You recorded{N}{#} min."
                swap    d0
                ext.l   d0
                move.l  d0,((TEXT_NUMBER-$1000000)).w
                txt     $1DC            ; "{DICT} {#} sec.{W2}"
                move.l  ((SPECIAL_BATTLE_TIME-$1000000)).w,d0
                cmp.l   ((SPECIAL_BATTLE_RECORD-$1000000)).w,d0
                bcc.s   byte_59CF0      
                txt     $1DD            ; "Congratulations!{N}You made it!"
                move.l  d0,((SPECIAL_BATTLE_RECORD-$1000000)).w
                sndCom  MUSIC_ITEM
                jsr     j_FadeOut_WaitForP1Input ; fade out music and wait for P2 input ?!
                bra.s   byte_59CF4      
byte_59CF0:
                
                txt     $1DE            ; "It was close!{W2}"
byte_59CF4:
                
                txt     $1DF            ; "Come back again!{N}See ya!{W1}"
                clsTxt
                script  cs_LeaveSpecialBattle
                clrFlg  $220            ; Battle 44 completed
                rts

    ; End of function ms_map24_InitFunction

