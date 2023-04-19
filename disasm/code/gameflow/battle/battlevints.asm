
; ASM FILE code\gameflow\battle\battlevints.asm :
; 0x25A94..0x25AD6 : Battle VInt functions

; =============== S U B R O U T I N E =======================================


SetBaseVIntFunctions:
                
                jsr     (InitWindowProperties).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateMapPlanes
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateEntities
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateViewData
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateScrollingData
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateSprites
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateWindows
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateMapAnimations
                rts

    ; End of function SetBaseVIntFunctions

