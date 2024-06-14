
; ASM FILE code\gameflow\exploration\explorationvints.asm :
; 0x25AD6..0x25BFC : Exploration VInt functions

; =============== S U B R O U T I N E =======================================

; Manage debug actions, entity events, item finds, area descriptions, caravan or main menu


ProcessPlayerAction:
                
                move.b  ((PLAYER_1_INPUT-$1000000)).w,d7
                clr.w   d0
                jsr     j_MakeEntityIdle
                clr.w   d0
                jsr     j_WaitForEntityToStopMoving
                jsr     (WaitForViewScrollEnd).l
                btst    #INPUT_BIT_A,d7
                bne.w   loc_25BCC       
                btst    #INPUT_BIT_C,d7
                bne.w   loc_25B02       
                rts
loc_25B02:
                
                tst.b   ((DEBUG_MODE_TOGGLE-$1000000)).w ; BUTTON C PUSHED
                beq.s   loc_25B40       
                btst    #INPUT_BIT_B,((PLAYER_2_INPUT-$1000000)).w ; If Debug Mode and P1 C pushed while P2 B pushed, access Debug Flag Setter and then Chuch Actions
                beq.s   loc_25B22
                move.w  #$258,d0
                jsr     j_DebugSetFlag
                jsr     j_ChurchMenu
                rts
loc_25B22:
                
                btst    #INPUT_BIT_C,((PLAYER_2_INPUT-$1000000)).w
                bne.w   loc_25BF4       
                btst    #INPUT_BIT_A,((PLAYER_2_INPUT-$1000000)).w ; If Debug Mode and P1 C pushed while P2 A pushed, access Debug Mode Action Select
                beq.s   loc_25B40       
                jsr     (FadeOutToBlack).w
                jsr     j_DebugModeActionSelect
                rts
loc_25B40:
                
                lea     ((ENTITY_DATA-$1000000)).w,a0 ; Not in debug mode
            if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
                cmpi.w  #MAPSPRITE_CARAVAN,ENTITYDEF_SECOND_ENTITY_MAPSPRITE(a0)
            else
                cmpi.b  #MAPSPRITE_CARAVAN,ENTITYDEF_SECOND_ENTITY_MAPSPRITE(a0)
            endif
                bne.s   loc_25BAA
                move.w  ENTITYDEF_OFFSET_XDEST(a0),d0
                sub.w   ENTITYDEF_SECOND_ENTITY_XDEST(a0),d0
                bge.s   loc_25B58
                neg.w   d0
loc_25B58:
                
                move.w  ENTITYDEF_OFFSET_YDEST(a0),d1
                sub.w   ENTITYDEF_SECOND_ENTITY_YDEST(a0),d1
                bge.s   loc_25B64
                neg.w   d1
loc_25B64:
                
                add.w   d1,d0
                bne.s   loc_25BAA
                sndCom  SOUND_COMMAND_FADE_OUT ; CARAVAN ACTIONS
                bsr.w   j_j_ShrinkInBowieAndFollowers
                sndCom  MUSIC_HEADQUARTERS
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l VInt_UpdateEntities
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l VInt_UpdateViewData
                jsr     j_CaravanMenu
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ACTIVATE
                dc.l VInt_UpdateViewData
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ACTIVATE
                dc.l VInt_UpdateEntities
                sndCom  SOUND_COMMAND_FADE_OUT
                bsr.w   j_j_GrowOutBowieAndFollowers
                sndCom  SOUND_COMMAND_PLAY_PREVIOUS_MUSIC
                bra.w   return_25BF2
loc_25BAA:
                
                bsr.w   GetActivatedEntity
                tst.w   d0
                blt.s   loc_25BC0       
                bsr.w   GetEntityEventIndex
                jsr     j_RunMapSetupEntityEvent
                bra.w   return_25BF2
loc_25BC0:
                
                moveq   #1,d6           ; No entity event
                jsr     CheckArea       
                bne.w   return_25BF2
loc_25BCC:
                
                trap    #VINT_FUNCTIONS ; Button A pushed, or button C pushed with no other event : main menu
                dc.w VINTS_DEACTIVATE
                dc.l VInt_UpdateEntities
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l VInt_UpdateViewData
                jsr     j_FieldMenu
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ACTIVATE
                dc.l VInt_UpdateViewData
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ACTIVATE
                dc.l VInt_UpdateEntities
return_25BF2:
                
                rts
loc_25BF4:
                
                jsr     j_DebugMapScript ; If Debug Mode and P1 C pushed while P2 C pushed, execute debug cutscene
                rts

    ; End of function ProcessPlayerAction

