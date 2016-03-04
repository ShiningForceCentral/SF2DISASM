
; SCRIPT SECTION scripting\cutscenes\cs_introendroutine :
; Subroutine launching intro and end cutscenes

; =============== S U B R O U T I N E =======================================

PlayIntroOrEndCutscene:
										
										move.w  d0,-(sp)
										jsr     (InitWindowProperties).w
										move.b  #$FF,((byte_FFB198-$1000000)).w
										move.b  #$FF,((WINDOW_HIDING_FORBIDDEN-$1000000)).w
										trap    #TRAP_VINTFUNCTIONS
										dc.w 0
										trap    #TRAP_VINTFUNCTIONS
										dc.w 1
										dc.l VInt_4744
										trap    #TRAP_VINTFUNCTIONS
										dc.w 1
										dc.l VInt_UpdateEntities
										trap    #TRAP_VINTFUNCTIONS
										dc.w 1
										dc.l VInt_AdjustCameraToPlayer
										trap    #TRAP_VINTFUNCTIONS
										dc.w 1
										dc.l VintFunc_3930      
										trap    #TRAP_VINTFUNCTIONS
										dc.w 1
										dc.l VInt_UpdateSprites
										trap    #TRAP_VINTFUNCTIONS
										dc.w 1
										dc.l VInt_UpdateWindows
										trap    #TRAP_VINTFUNCTIONS
										dc.w 1
										dc.l VInt_UpdateAnimatingTiles
										move.b  #$FF,((CURRENT_BATTLE-$1000000)).w
										jsr     (sub_4EC6).w
										move.w  (sp)+,d0
										bne.s   loc_47F72
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_INTRO
										lea     IntroCutscene1(pc), a0
										trap    #TRAP_MAPSCRIPT
										lea     IntroCutscene2(pc), a0
										trap    #TRAP_MAPSCRIPT
										lea     IntroCutscene3(pc), a0
										trap    #TRAP_MAPSCRIPT
										lea     IntroCutscene4(pc), a0
										trap    #TRAP_MAPSCRIPT
										bra.s   return_47F7C
loc_47F72:
										
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_PIANO_THEME
										lea     EndCutscene(pc), a0
										trap    #TRAP_MAPSCRIPT
return_47F7C:
										
										rts

	; End of function PlayIntroOrEndCutscene

