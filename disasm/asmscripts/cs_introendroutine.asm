
; SCRIPT SECTION cs_introendroutine :
; Subroutine launching intro and end cutscenes

; =============== S U B R O U T I N E =======================================

PlayIntroOrEndCutscene:
										
										move.w  d0,-(sp)
										jsr     (InitWindowProperties).w
										move.b  #$FF,((byte_FFB198-$1000000)).w
										move.b  #$FF,((WINDOW_HIDING_FORBIDDEN-$1000000)).w
										trap    #9
										dc.w 0
										trap    #9
										dc.w 1
										dc.l VInt_4744
										trap    #9
										dc.w 1
										dc.l VInt_UpdateEntities
										trap    #9
										dc.w 1
										dc.l VInt_AdjustCameraToPlayer
										trap    #9
										dc.w 1
										dc.l vintFunc_3930
										trap    #9
										dc.w 1
										dc.l VInt_UpdateSprites
										trap    #9
										dc.w 1
										dc.l VInt_UpdateWindows
										trap    #9
										dc.w 1
										dc.l VInt_UpdateAnimatingTiles
										move.b  #$FF,((RAM_CurrentBattleIdx-$1000000)).w
										jsr     (sub_4EC6).w
										move.w  (sp)+,d0
										bne.s   loc_47F72
										trap    #0
										dc.w MUSIC_INTRO
										lea     IntroCutscene1(pc), a0
										trap    #6
										lea     IntroCutscene2(pc), a0
										trap    #6
										lea     IntroCutscene3(pc), a0
										trap    #6
										lea     IntroCutscene4(pc), a0
										trap    #6
										bra.s   return_47F7C
loc_47F72:
										
										trap    #0
										dc.w MUSIC_PIANO_THEME
										lea     EndCutscene(pc), a0
										trap    #6
return_47F7C:
										
										rts

	; End of function PlayIntroOrEndCutscene

