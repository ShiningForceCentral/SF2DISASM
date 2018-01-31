
; ASM FILE code\gameflow\exploration\explorationvints.asm :
; 0x25AD6..0x25BFC : Exploration VInt functions

; =============== S U B R O U T I N E =======================================

SetExplorationVIntFunctions:
		
		move.b  ((P1_INPUT-$1000000)).w,d7
		clr.w   d0
		jsr     j_MakeEntityIdle
		clr.w   d0
		jsr     j_WaitForEntityToStopMoving
		jsr     (WaitForCameraToCatchUp).l
		btst    #6,d7
		bne.w   loc_25BCC
		btst    #5,d7
		bne.w   loc_25B02
		rts
loc_25B02:
		tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
		beq.s   loc_25B40
		btst    #INPUT_A_B_BIT,((P2_INPUT-$1000000)).w
		beq.s   loc_25B22
		move.w  #$258,d0
		jsr     j_DebugFlagSetter
		jsr     j_ChurchActions
		rts
loc_25B22:
		btst    #INPUT_A_C_BIT,((P2_INPUT-$1000000)).w
		bne.w   loc_25BF4
		btst    #INPUT_A_A_BIT,((P2_INPUT-$1000000)).w
		beq.s   loc_25B40
		jsr     (FadeOutToBlack).w
		jsr     j_DebugModeSelectAction
		rts
loc_25B40:
		lea     ((ENTITY_DATA-$1000000)).w,a0
		cmpi.b  #$3E,$33(a0) 
		bne.s   loc_25BAA
		move.w  $C(a0),d0
		sub.w   $2C(a0),d0
		bge.s   loc_25B58
		neg.w   d0
loc_25B58:
		move.w  $E(a0),d1
		sub.w   $2E(a0),d1
		bge.s   loc_25B64
		neg.w   d1
loc_25B64:
		add.w   d1,d0
		bne.s   loc_25BAA
		trap    #SOUND_COMMAND
		dc.w SOUND_COMMAND_FADE_OUT
		bsr.w   sub_25A6C
		trap    #SOUND_COMMAND
		dc.w MUSIC_HEADQUARTERS ; headquarters
		trap    #VINT_FUNCTIONS
		dc.w VINTS_DEACTIVATE
		dc.l VInt_UpdateEntities
		trap    #VINT_FUNCTIONS
		dc.w VINTS_DEACTIVATE
		dc.l VInt_AdjustCameraToPlayer
		jsr     j_CaravanActions
		trap    #VINT_FUNCTIONS
		dc.w VINTS_ACTIVATE
		dc.l VInt_AdjustCameraToPlayer
		trap    #VINT_FUNCTIONS
		dc.w VINTS_ACTIVATE
		dc.l VInt_UpdateEntities
		trap    #SOUND_COMMAND
		dc.w SOUND_COMMAND_FADE_OUT
		bsr.w   sub_25A74
		trap    #SOUND_COMMAND
		dc.w SOUND_COMMAND_PLAY_PREVIOUS_MUSIC
		bra.w   return_25BF2
loc_25BAA:
		bsr.w   GetActivatedEntity
		tst.w   d0
		blt.s   loc_25BC0
		bsr.w   GetEntityEventIdx
		jsr     j_ExecuteEntityEvent
		bra.w   return_25BF2
loc_25BC0:
		moveq   #1,d6
		jsr     sub_23862
		bne.w   return_25BF2
loc_25BCC:
		trap    #VINT_FUNCTIONS
		dc.w VINTS_DEACTIVATE
		dc.l VInt_UpdateEntities
		trap    #VINT_FUNCTIONS
		dc.w VINTS_DEACTIVATE
		dc.l VInt_AdjustCameraToPlayer
		jsr     j_MainMenuActions
		trap    #VINT_FUNCTIONS
		dc.w VINTS_ACTIVATE
		dc.l VInt_AdjustCameraToPlayer
		trap    #VINT_FUNCTIONS
		dc.w VINTS_ACTIVATE
		dc.l VInt_UpdateEntities
return_25BF2:
		rts
loc_25BF4:
		jsr     j_ExecuteDebugMapScript
		rts

	; End of function SetExplorationVIntFunctions

