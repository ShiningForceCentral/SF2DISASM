
; ASM FILE code\common\scripting\map\mapscriptengine_2.asm :
; 0x4712C..0x474FC : Mapscript engine, part 2

; =============== S U B R O U T I N E =======================================

; In: A0 = script address


ExecuteMapScript:
                
                move.l  #FF9004_LOADING_SPACE,(dword_FFB1A4).l
                movem.l d0-a6,-(sp)
                movea.l a0,a6
                clr.b   ((SKIP_CUTSCENE_TEXT-$1000000)).w
loc_47140:
                
                btst    #INPUT_BIT_START,((PLAYER_2_INPUT-$1000000)).w 
                                                        ; if P2 START and DEBUG MODE, DEACTIVATE DIALOGS
                beq.s   loc_47156
                tst.b   (DEBUG_MODE_TOGGLE).l
                beq.s   loc_47156
                move.b  #-1,((SKIP_CUTSCENE_TEXT-$1000000)).w
loc_47156:
                
                move.w  (a6)+,d0
                cmpi.w  #-1,d0
                beq.w   loc_47234
                
                tst.w   d0
                bpl.s   loc_47174
                tst.b   ((SKIP_CUTSCENE_TEXT-$1000000)).w
                bne.s   loc_47172       ; if cmd > $8000 and dialogs activated, SLEEP CMD
                andi.w  #BYTE_MASK,d0
                jsr     (Sleep).w       
loc_47172:
                
                bra.s   loc_47140       
loc_47174:
                
                add.w   d0,d0
                move.w  rjt_cutsceneScriptCommands(pc,d0.w),d0
                jsr     rjt_cutsceneScriptCommands(pc,d0.w)
                bra.s   loc_47140       
rjt_cutsceneScriptCommands:
                
                dc.w csc00_displaySingleTextbox-rjt_cutsceneScriptCommands 
                                                        ; csc for Cutscene Script Command
                dc.w csc01_displaySingleTextboxWithVars-rjt_cutsceneScriptCommands
                dc.w csc02_displayTextbox-rjt_cutsceneScriptCommands
                dc.w csc03_displayTextboxWithVars-rjt_cutsceneScriptCommands
                dc.w csc04_setTextIndex-rjt_cutsceneScriptCommands
                dc.w csc05_playSound-rjt_cutsceneScriptCommands
                dc.w csc06_doNothing-rjt_cutsceneScriptCommands
                dc.w csc07_warp-rjt_cutsceneScriptCommands
                dc.w csc08_joinForce-rjt_cutsceneScriptCommands
                dc.w csc09_hideDialogueAndPortraitWindows-rjt_cutsceneScriptCommands
                dc.w csc0A_executeSubroutine-rjt_cutsceneScriptCommands 
                                                        ; execute subroutine xxxxxxxx
                dc.w csc0B_jump-rjt_cutsceneScriptCommands
                dc.w csc0C_jumpIfFlagSet-rjt_cutsceneScriptCommands
                dc.w csc0D_jumpIfFlagClear-rjt_cutsceneScriptCommands
                dc.w csc0E_jumpIfForceMemberInList-rjt_cutsceneScriptCommands
                dc.w csc0F_jumpIfCharacterDead-rjt_cutsceneScriptCommands
                dc.w csc10_toggleFlag-rjt_cutsceneScriptCommands
                dc.w csc11_promptYesNoForStoryFlow-rjt_cutsceneScriptCommands
                dc.w csc12_executeContextMenu-rjt_cutsceneScriptCommands
                dc.w csc13_setStoryFlag-rjt_cutsceneScriptCommands
                dc.w (csc14_setEntityActscriptManual-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc15_setEntityActscript-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc16_waitUntilEntityIdle-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc17_setEntityPosAndFacingWithFlash-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc18_flashEntityWhite-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc19_setEntityPosAndFacing-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc1A_setEntitySprite-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc1B_startEntityAnim-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc1C_stopEntityAnim-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc1D_showPortrait-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc1E_hidePortrait-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc1F_addDefeatedAlly-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc20_updateDefeatedAllies-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc21_reviveAlly-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc22_animateEntityFadeInOrOut-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc23_setEntityFacing-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc24_setCameraTargetEntity-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc25_cloneEntity-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc26_entityNodHead-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc27_entityShakeHead-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc28_moveEntityNextToPlayer-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc29_setEntityDest-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc2A_entityShiver-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc2B_initializeNewEntity-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc2C_followEntity-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc2D_entityActionSequence-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc2E_hideEntity-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc2F_fly-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc30_removeEntityShadow-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc31_moveEntityAboveEntity-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc32_setCameraDestInTiles-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc33_setQuakeAmount-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc34_setBlocks-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc35_setBlocksVar-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc36_resetMap-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc37_loadMapAndFadeIn-rjt_cutsceneScriptCommands) & $FFFF
                dc.w csc_doNothing-rjt_cutsceneScriptCommands
                dc.w (csc39_fadeInFromBlack-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc3A_fadeOutToBlack-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc3B_slowFadeInFromBlack-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc3C_slowFadeOutToBlack-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc3D_tintMap-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc3E_FlickerOnce-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc3F_fadeMapOutToWhite-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc40_fadeMapInFromWhite-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc41_flashScreenWhite-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc42_loadMapEntities-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc43_RoofEvent-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc44_reloadEntities-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc45_cameraSpeed-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc46_reloadMap-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc47_StepEvent-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc48_loadMap-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc49_loadEntitiesFromMapSetup-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc4A_fadeInFromBlackHalf-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc4B_fadeOutToBlackHalf-rjt_cutsceneScriptCommands) & $FFFF
                dc.w csc_doNothing-rjt_cutsceneScriptCommands
                dc.w csc_doNothing-rjt_cutsceneScriptCommands
                dc.w csc_doNothing-rjt_cutsceneScriptCommands
                dc.w csc_doNothing-rjt_cutsceneScriptCommands
                dc.w (csc50_setEntitySize-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc51_joinBattleParty-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc52_faceEntity-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc53_setPriority-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc54_joinForceAI-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc55_resetCharacterBattleStats-rjt_cutsceneScriptCommands) & $FFFF
                dc.w (csc56_addFollower-rjt_cutsceneScriptCommands) & $FFFF
                dc.w csc_doNothing-rjt_cutsceneScriptCommands
                dc.w csc_doNothing-rjt_cutsceneScriptCommands
                dc.w csc_doNothing-rjt_cutsceneScriptCommands
loc_47234:
                
                tst.w   ((DIALOGUE_WINDOW_INDEX-$1000000)).w
                beq.s   loc_4723E
                jsr     (WaitForViewScrollEnd).w
loc_4723E:
                
                clr.w   ((VIEW_SCROLLING_SPEED-$1000000)).w
                movem.l (sp)+,d0-a6
                rts

    ; End of function ExecuteMapScript


; =============== S U B R O U T I N E =======================================


csc_doNothing:
                
                rts

    ; End of function csc_doNothing


; =============== S U B R O U T I N E =======================================


csc00_displaySingleTextbox:
                
                tst.b   ((SKIP_CUTSCENE_TEXT-$1000000)).w
                bne.s   loc_47298
                cmpi.w  #-1,(a6)
                beq.s   loc_4726A
                
                move.l  a6,-(sp)
                bsr.w   csc1D_showPortrait
                movea.l (sp)+,a6
                move.w  (a6),d0
                bsr.w   GetEntityPortaitAndSpeechSfx
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                bra.s   loc_47270
loc_4726A:
                
                move.w  #0,((CURRENT_SPEECH_SFX-$1000000)).w
loc_47270:
                
                adda.w  #2,a6
                move.w  ((CUTSCENE_DIALOG_INDEX-$1000000)).w,d0
                jsr     (WaitForViewScrollEnd).w
                jsr     (DisplayText).l 
                addq.w  #1,((CUTSCENE_DIALOG_INDEX-$1000000)).w ; increment script number (move forward in script bank)
                jsr     j_ClosePortraitWindow
                clsTxt
                moveq   #10,d0
                jsr     (Sleep).w       
                bra.s   return_4729C
loc_47298:
                
                adda.w  #2,a6
return_4729C:
                
                rts

    ; End of function csc00_displaySingleTextbox


; =============== S U B R O U T I N E =======================================


csc01_displaySingleTextboxWithVars:
                
                cmpi.w  #-1,(a6)
                beq.s   loc_472B8
                
                move.l  a6,-(sp)
                bsr.w   csc1D_showPortrait
                movea.l (sp)+,a6
                move.w  (a6),d0
                bsr.w   GetEntityPortaitAndSpeechSfx
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                bra.s   loc_472BE
loc_472B8:
                
                move.w  #0,((CURRENT_SPEECH_SFX-$1000000)).w
loc_472BE:
                
                adda.w  #2,a6
                move.w  (a6)+,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  (a6)+,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                move.w  ((CUTSCENE_DIALOG_INDEX-$1000000)).w,d0
                jsr     (WaitForViewScrollEnd).w
                jsr     (DisplayText).l 
                addq.w  #1,((CUTSCENE_DIALOG_INDEX-$1000000)).w
                jsr     j_ClosePortraitWindow
                clsTxt
                moveq   #10,d0
                jsr     (Sleep).w       
                rts

    ; End of function csc01_displaySingleTextboxWithVars


; =============== S U B R O U T I N E =======================================


csc02_displayTextbox:
                
                tst.b   ((SKIP_CUTSCENE_TEXT-$1000000)).w
                bne.s   loc_4732C
                cmpi.w  #-1,(a6)
                beq.s   loc_4730E
                
                move.l  a6,-(sp)
                bsr.w   csc1D_showPortrait
                movea.l (sp)+,a6
                move.w  (a6),d0
                bsr.w   GetEntityPortaitAndSpeechSfx
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                bra.s   loc_47314
loc_4730E:
                
                move.w  #0,((CURRENT_SPEECH_SFX-$1000000)).w
loc_47314:
                
                adda.w  #2,a6
                move.w  ((CUTSCENE_DIALOG_INDEX-$1000000)).w,d0
                jsr     (WaitForViewScrollEnd).w
                jsr     (DisplayText).l 
                addq.w  #1,((CUTSCENE_DIALOG_INDEX-$1000000)).w
                bra.s   return_47330
loc_4732C:
                
                adda.w  #2,a6
return_47330:
                
                rts

    ; End of function csc02_displayTextbox


; =============== S U B R O U T I N E =======================================


csc03_displayTextboxWithVars:
                
                cmpi.w  #-1,(a6)
                beq.s   loc_4734C
                
                move.l  a6,-(sp)
                bsr.w   csc1D_showPortrait
                movea.l (sp)+,a6
                move.w  (a6),d0
                bsr.w   GetEntityPortaitAndSpeechSfx
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                bra.s   loc_47352
loc_4734C:
                
                move.w  #0,((CURRENT_SPEECH_SFX-$1000000)).w
loc_47352:
                
                adda.w  #2,a6
                move.w  (a6)+,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  (a6)+,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                move.w  ((CUTSCENE_DIALOG_INDEX-$1000000)).w,d0
                jsr     (WaitForViewScrollEnd).w
                jsr     (DisplayText).l 
                addq.w  #1,((CUTSCENE_DIALOG_INDEX-$1000000)).w
                rts

    ; End of function csc03_displayTextboxWithVars


; =============== S U B R O U T I N E =======================================


csc04_setTextIndex:
                
                move.w  (a6)+,((CUTSCENE_DIALOG_INDEX-$1000000)).w
                rts

    ; End of function csc04_setTextIndex


; =============== S U B R O U T I N E =======================================


csc05_playSound:
                
                move.w  (a6)+,d0
                sndCom  SOUND_COMMAND_GET_D0_PARAMETER
                rts

    ; End of function csc05_playSound


; =============== S U B R O U T I N E =======================================


csc06_doNothing:
                
                rts

    ; End of function csc06_doNothing


; =============== S U B R O U T I N E =======================================


csc07_warp:
                
                lea     ((MAP_EVENT_TYPE-$1000000)).w,a0
                move.w  #1,(a0)+
                move.b  #0,(a0)+
                move.b  (a6)+,(a0)+
                move.b  (a6)+,(a0)+
                move.b  (a6)+,(a0)+
                move.b  (a6)+,(a0)+
                rts

    ; End of function csc07_warp


; =============== S U B R O U T I N E =======================================

; make 00xx character join force with bit 15 set for sad join music


csc08_joinForce:
                
                move.w  #0,((CURRENT_SPEECH_SFX-$1000000)).w
            if (MUSIC_RESUMING&RESUME_MUSIC_AFTER_JOIN_JINGLE=1)
                activateMusicResuming
            endif
                jsr     (WaitForViewScrollEnd).w
                move.w  (a6)+,d0
                bclr    #15,d0
                bne.s   byte_473B0
                sndCom  MUSIC_JOIN
                bra.s   loc_473B4       
byte_473B0:
                
                sndCom  MUSIC_SAD_JOIN
loc_473B4:
                
                cmpi.w  #128,d0         ; HARDCODED use case
                bne.s   loc_473D4
                move.w  #ALLY_SARAH,d0  ; make sarah and chester join at the same time
                jsr     j_JoinForce
                move.w  #ALLY_CHESTER,d0
                jsr     j_JoinForce
                txt     447             ; "{NAME;1} the PRST and{N}{NAME;2} the KNTE{N}have joined the force."
                bra.s   loc_473EC
loc_473D4:
                
                jsr     j_JoinForce
                jsr     j_GetClass
                move.w  d0,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  d1,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     446             ; "{NAME} the {CLASS} {N}has joined the force."
loc_473EC:
                
                jsr     j_FadeOut_WaitForP1Input
                clsTxt
            if (MUSIC_RESUMING&RESUME_MUSIC_AFTER_JOIN_JINGLE=1)
                deactivateMusicResuming
            endif
                moveq   #10,d0
                jsr     (Sleep).w       
                rts

    ; End of function csc08_joinForce


; =============== S U B R O U T I N E =======================================


csc09_hideDialogueAndPortraitWindows:
                
                jsr     j_ClosePortraitWindow
                clsTxt
                rts

    ; End of function csc09_hideDialogueAndPortraitWindows


; =============== S U B R O U T I N E =======================================


csc0A_executeSubroutine:
                
                movea.l (a6)+,a1
                move.l  a0,-(sp)
                jsr     (a1)
                movea.l (sp)+,a0
                rts

    ; End of function csc0A_executeSubroutine


; =============== S U B R O U T I N E =======================================


csc0B_jump:
                
                movea.l (a6),a6
                rts

    ; End of function csc0B_jump


; =============== S U B R O U T I N E =======================================

; xxxx yyyyyyyy


csc0C_jumpIfFlagSet:
                
                move.w  (a6)+,d1
                jsr     j_CheckFlag
                beq.w   loc_47428
                movea.l (a6),a6
                bra.s   return_4742A
loc_47428:
                
                addq.w  #4,a6
return_4742A:
                
                rts

    ; End of function csc0C_jumpIfFlagSet


; =============== S U B R O U T I N E =======================================

; xxxx yyyyyyyy


csc0D_jumpIfFlagClear:
                
                move.w  (a6)+,d1
                jsr     j_CheckFlag
                bne.w   loc_4743C
                movea.l (a6),a6
                bra.s   return_4743E
loc_4743C:
                
                addq.w  #4,a6
return_4743E:
                
                rts

    ; End of function csc0D_jumpIfFlagClear


; =============== S U B R O U T I N E =======================================


csc0E_jumpIfForceMemberInList:
                
                move.w  (a6)+,d0
                lea     ((DEAD_COMBATANTS_LIST-$1000000)).w,a1
                move.w  ((DEAD_COMBATANTS_LIST_LENGTH-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   return_47462
loc_47450:
                
                cmp.b   (a1)+,d0
                beq.w   loc_47460
                dbf     d7,loc_47450
                addq.w  #4,a6
                bra.w   return_47462
loc_47460:
                
                movea.l (a6),a6
return_47462:
                
                rts

    ; End of function csc0E_jumpIfForceMemberInList


; =============== S U B R O U T I N E =======================================

; xxxx yyyyyyyy


csc0F_jumpIfCharacterDead:
                
                move.w  (a6)+,d0
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.w   loc_47476       ; <-- Branch if character's current HP != 0, i.e., is alive.
                movea.l (a6),a6
                bra.s   return_47478
loc_47476:
                
                addq.w  #4,a6
return_47478:
                
                rts

    ; End of function csc0F_jumpIfCharacterDead


; =============== S U B R O U T I N E =======================================

; xxxx yyyy


csc10_toggleFlag:
                
                move.w  (a6)+,d1
                move.w  (a6)+,d0
                bne.s   loc_47488
                jsr     j_ClearFlag
                bra.s   return_4748E
loc_47488:
                
                jsr     j_SetFlag
return_4748E:
                
                rts

    ; End of function csc10_toggleFlag


; =============== S U B R O U T I N E =======================================


csc11_promptYesNoForStoryFlow:
                
                move.l  a6,-(sp)
                jsr     j_YesNoPrompt
                movea.l (sp)+,a6
                moveq   #FLAG_INDEX_YES_NO_PROMPT,d1
                tst.w   d0
                bne.s   loc_474A8
                jsr     j_SetFlag
                bra.s   loc_474AE
loc_474A8:
                
                jsr     j_ClearFlag
loc_474AE:
                
                moveq   #10,d0
                jsr     (Sleep).w       
                rts

    ; End of function csc11_promptYesNoForStoryFlow


; =============== S U B R O U T I N E =======================================


csc12_executeContextMenu:
                
                move.w  (a6)+,d0
                move.l  a6,-(sp)
                tst.w   d0
                bne.s   loc_474C4
                jsr     j_ChurchMenu    ; xxxx = 0
loc_474C4:
                
                cmpi.w  #1,d0
                bne.s   loc_474D0
                jsr     j_ShopMenu      ; xxxx = 1
loc_474D0:
                
                cmpi.w  #2,d0
                bne.s   loc_474DC
                jsr     j_BlacksmithMenu ; xxxx = 2
loc_474DC:
                
                movea.l (sp)+,a6
                rts

    ; End of function csc12_executeContextMenu


; =============== S U B R O U T I N E =======================================

; xxxx


csc13_setStoryFlag:
                
                move.w  (a6)+,d1
                addi.w  #BATTLE_UNLOCKED_FLAGS_START,d1
                jsr     j_SetFlag
                rts

    ; End of function csc13_setStoryFlag


; =============== S U B R O U T I N E =======================================

; unused


sub_474EE:
                
                moveq   #0,d0
                setSavedByte #MAP_GALAM_CASTLE_INNER, CURRENT_MAP
                bsr.w   RunMapSetupEntityEvent
                rts

    ; End of function sub_474EE

