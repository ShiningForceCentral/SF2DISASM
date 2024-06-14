
; ASM FILE data\maps\entries\map24\mapsetups\s6_initfunction.asm :
; 0x59C36..0x59D08 : 

; =============== S U B R O U T I N E =======================================


ms_map24_InitFunction:
                
                 
                sndCom  MUSIC_HEADQUARTERS
                jsr     (FadeInFromBlack).w
                move.w  #$46,((CURRENT_SPEECH_SFX-$1000000)).w 
                chkFlg  544             ; Battle 44 completed - BATTLE_FAIRY_WOODS                 
                bne.w   loc_59CB2
                txt     467             ; "Welcome to the fairy woods{N}special stage!{W2}"
                txt     468             ; "How quickly can you defeat{N}all the hidden monsters?{W2}"
                txt     469             ; "Now, set a new record.{W2}"
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                lea     (SPECIAL_BATTLE_RECORD).l,a0
                movep.l 0(a0),d0
                movea.l (sp)+,a0
            else
                move.l  ((SPECIAL_BATTLE_RECORD-$1000000)).w,d0
            endif
                divs.w  #$3C,d0 
                move.w  d0,d1
                ext.l   d1
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     470             ; "Best record so far is{N}{#} min."
                swap    d0
                ext.l   d0
                move.l  d0,((DIALOGUE_NUMBER-$1000000)).w
                txt     471             ; "{DICT} {#} sec.{W2}"
                txt     472             ; "Are you ready?"
                jsr     j_alt_YesNoPrompt
                tst.w   d0
                bne.s   byte_59C92      
                txt     473             ; "...set...GO!{W2}"
                script  cs_StartSpecialBattle
                bra.s   return_59C9C
byte_59C92:
                
                txt     474             ; "Oh, what a pity!{N}Please visit me anytime!!{W1}"
                script  cs_LeaveSpecialBattle
return_59C9C:
                
                rts
cs_StartSpecialBattle:
                
                setStoryFlag 44         ; Battle 44 unlocked - BATTLE_FAIRY_WOODS               
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
                move.l  d1,((DIALOGUE_NUMBER-$1000000)).w
                txt     475             ; "You recorded{N}{#} min."
                swap    d0
                ext.l   d0
                move.l  d0,((DIALOGUE_NUMBER-$1000000)).w
                txt     476             ; "{DICT} {#} sec.{W2}"
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                lea     (SPECIAL_BATTLE_RECORD).l,a0
                movep.l 0(a0),d0
                cmp.l   ((SPECIAL_BATTLE_TIME-$1000000)).w,d0
                movea.l (sp)+,a0
                blo.s   byte_59CF0  
            else
                move.l  ((SPECIAL_BATTLE_TIME-$1000000)).w,d0
                cmp.l   ((SPECIAL_BATTLE_RECORD-$1000000)).w,d0
                bhs.s   byte_59CF0  
            endif
                
                txt     477             ; "Congratulations!{N}You made it!"
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.l  a0,-(sp)
                lea     (SPECIAL_BATTLE_RECORD).l,a0
                movep.l d0,0(a0)
                movea.l (sp)+,a0
            else
                move.l  d0,((SPECIAL_BATTLE_RECORD-$1000000)).w
            endif
                sndCom  MUSIC_ITEM
                jsr     j_FadeOut_WaitForP1Input ; fade out music and wait for P2 input ?!
                bra.s   byte_59CF4      
byte_59CF0:
                
                txt     478             ; "It was close!{W2}"
byte_59CF4:
                
                txt     479             ; "Come back again!{N}See ya!{W1}"
                clsTxt
                script  cs_LeaveSpecialBattle
                clrFlg  544             ; Battle 44 completed - BATTLE_FAIRY_WOODS                 
                rts

    ; End of function ms_map24_InitFunction

