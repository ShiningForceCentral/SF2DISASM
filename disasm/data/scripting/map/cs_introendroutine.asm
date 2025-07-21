
; ASM FILE data\scripting\map\cs_introendroutine.asm :
; 0x47EF8..0x47F7E : Subroutine launching intro and end cutscenes

; =============== S U B R O U T I N E =======================================


PlayIntroOrEndCutscene:
                
                move.w  d0,-(sp)
                jsr     (InitializeWindowProperties).w
                move.b  #-1,((MOUTH_CONTROL_TOGGLE-$1000000)).w
                move.b  #-1,((DEACTIVATE_WINDOW_HIDING-$1000000)).w
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
                setSavedByte #NOT_CURRENTLY_IN_BATTLE, CURRENT_BATTLE
                jsr     (InitializeExplorationSpritesFrameCounter).w    
                move.w  (sp)+,d0
                bne.s   byte_47F72
                sndCom  MUSIC_INTRO
                script  IntroCutscene1
                script  IntroCutscene2
                script  IntroCutscene3
                script  IntroCutscene4
                bra.s   return_47F7C
byte_47F72:
                
                sndCom  MUSIC_PIANO_THEME
                script  EndCutscene
return_47F7C:
                
                rts

    ; End of function PlayIntroOrEndCutscene

