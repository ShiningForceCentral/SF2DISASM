
; SCRIPT SECTION system\battles\battlevints :
; Battle VInt functions

; =============== S U B R O U T I N E =======================================

; init vint contextual functions

SetBattleVIntFunctions:
										
										jsr     (InitWindowProperties).w
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
										rts

	; End of function SetBattleVIntFunctions

