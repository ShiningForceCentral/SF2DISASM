
; ASM FILE data\scripting\map\cs_introendroutine.asm :
; 0x47EF8..0x47F7E : Subroutine launching intro and end cutscenes

; =============== S U B R O U T I N E =======================================

PlayIntroOrEndCutscene:
		
		move.w  d0,-(sp)
		jsr     (InitWindowProperties).w
		move.b  #$FF,((byte_FFB198-$1000000)).w
		move.b  #$FF,((WINDOW_HIDING_FORBIDDEN-$1000000)).w
		trap    #VINT_FUNCTIONS
		dc.w VINTS_CLEAR
		trap    #VINT_FUNCTIONS
		dc.w VINTS_ADD
		dc.l VInt_4744
		trap    #VINT_FUNCTIONS
		dc.w VINTS_ADD
		dc.l VInt_UpdateEntities
		trap    #VINT_FUNCTIONS
		dc.w VINTS_ADD
		dc.l VInt_AdjustCameraToPlayer
		trap    #VINT_FUNCTIONS
		dc.w VINTS_ADD
		dc.l VInt_3930          
		trap    #VINT_FUNCTIONS
		dc.w VINTS_ADD
		dc.l VInt_UpdateSprites
		trap    #VINT_FUNCTIONS
		dc.w VINTS_ADD
		dc.l VInt_UpdateWindows
		trap    #VINT_FUNCTIONS
		dc.w VINTS_ADD
		dc.l VInt_UpdateAnimatingTiles
		move.b  #$FF,((CURRENT_BATTLE-$1000000)).w
		jsr     (sub_4EC6).w
		move.w  (sp)+,d0
		bne.s   loc_47F72
		trap    #SOUND_COMMAND
		dc.w MUSIC_INTRO
		lea     IntroCutscene1(pc), a0
		trap    #MAPSCRIPT
		lea     IntroCutscene2(pc), a0
		trap    #MAPSCRIPT
		lea     IntroCutscene3(pc), a0
		trap    #MAPSCRIPT
		lea     IntroCutscene4(pc), a0
		trap    #MAPSCRIPT
		bra.s   return_47F7C
loc_47F72:
		
		trap    #SOUND_COMMAND
		dc.w MUSIC_PIANO_THEME
		lea     EndCutscene(pc), a0
		trap    #MAPSCRIPT
return_47F7C:
		
		rts

	; End of function PlayIntroOrEndCutscene

