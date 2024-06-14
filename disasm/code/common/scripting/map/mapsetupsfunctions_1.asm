
; ASM FILE code\common\scripting\map\mapsetupsfunctions_1.asm :
; 0x474FC..0x478C6 : Map setups functions

; =============== S U B R O U T I N E =======================================


RunMapSetupInitFunction:
                
                movem.l d0-a1,-(sp)
                bsr.w   GetCurrentMapSetup
                cmpi.w  #-1,(a0)
                bne.s   loc_4750E
                bra.w   loc_47514
loc_4750E:
                
                movea.l MAPSETUP_OFFSET_INIT_FUNCTION(a0),a0
                jsr     (a0)
loc_47514:
                
                movem.l (sp)+,d0-a1
                rts

    ; End of function RunMapSetupInitFunction


; =============== S U B R O U T I N E =======================================


RunMapSetupZoneEvent:
                
                movem.l d0-a1,-(sp)
                bsr.w   GetCurrentMapSetup
                cmpi.w  #-1,(a0)
                beq.w   loc_47576
                
                movea.l MAPSETUP_OFFSET_ZONE_EVENTS(a0),a0
                clr.w   d7
loc_47530:
                
                cmpi.b  #$FD,(a0,d7.w)
                bne.s   loc_4753E
                adda.w  2(a0,d7.w),a0
                bra.s   loc_4756A
loc_4753E:
                
                cmpi.b  #-1,(a0,d7.w)
                beq.w   loc_47550
                
                cmp.b   (a0,d7.w),d1
                bne.w   loc_47562
loc_47550:
                
                cmpi.b  #-1,1(a0,d7.w)
                beq.w   loc_47566
                
                cmp.b   1(a0,d7.w),d2
                beq.w   loc_47566
loc_47562:
                
                addq.w  #4,d7
                bra.s   loc_47530
loc_47566:
                
                adda.w  2(a0,d7.w),a0
loc_4756A:
                
                jsr     (a0)
                jsr     j_ClosePortraitWindow
                clsTxt
loc_47576:
                
                jsr     (WaitForVInt).w
                moveq   #0,d0
                bsr.w   WaitForEntityToStopMoving
                movem.l (sp)+,d0-a1
                rts

    ; End of function RunMapSetupZoneEvent


; =============== S U B R O U T I N E =======================================

; Trigger a map setup function according to up to 4 criterias in d1-d4.
; 
;  In: d1.w, d2.w, d3.w = first entity's X, Y and facing
;      d4.w, d5.w = item index, item slot


RunMapSetupItemEvent:
                
                movem.l d0-d5/d7-a1,-(sp)
                clr.w   ((CURRENT_SPEECH_SFX-$1000000)).w
                andi.w  #ITEMENTRY_MASK_INDEX,d4
                move.b  d2,((byte_FFB651-$1000000)).w
                moveq   #0,d6
                bsr.w   GetCurrentMapSetup
                cmpi.w  #-1,(a0)
                beq.w   loc_4760A
                
                movea.l MAPSETUP_OFFSET_ITEM_EVENTS(a0),a0
                clr.w   d7
loc_475AA:
                
                cmpi.b  #$FD,(a0,d7.w)
                bne.s   loc_475B8
                adda.w  4(a0,d7.w),a0
                bra.s   loc_475FE
loc_475B8:
                
                cmpi.b  #-1,(a0,d7.w)
                beq.w   loc_475CA
                
                cmp.b   (a0,d7.w),d1    ; x
                bne.w   loc_475F6       
loc_475CA:
                
                cmpi.b  #-1,1(a0,d7.w)
                beq.w   loc_475DC       
                
                cmp.b   1(a0,d7.w),d2   ; y
                bne.w   loc_475F6       
loc_475DC:
                
                cmpi.b  #-1,2(a0,d7.w)  ; if entry value $FF then don't care about facing value
                beq.w   loc_475EE       
                
                cmp.b   2(a0,d7.w),d3   ; facing
                bne.w   loc_475F6       
loc_475EE:
                
                cmp.b   3(a0,d7.w),d4   ; item
                beq.w   loc_475FA
loc_475F6:
                
                addq.w  #6,d7           ; next entry
                bra.s   loc_475AA
loc_475FA:
                
                adda.w  4(a0,d7.w),a0
loc_475FE:
                
                jsr     (a0)
                jsr     j_ClosePortraitWindow
                clsTxt
loc_4760A:
                
                jsr     (WaitForVInt).w
                moveq   #0,d0
                bsr.w   WaitForEntityToStopMoving
                movem.l (sp)+,d0-d5/d7-a1
                rts

    ; End of function RunMapSetupItemEvent


; =============== S U B R O U T I N E =======================================

; In: D0 = entity event index


RunMapSetupEntityEvent:
                
                movem.l d0-a1,-(sp)
                move.b  d2,((byte_FFB651-$1000000)).w
                bsr.w   GetCurrentMapSetup
                cmpi.w  #-1,(a0)
                beq.w   loc_476D6
                
                movem.w d1-d2,-(sp)
                movea.l MAPSETUP_OFFSET_ENTITY_EVENTS(a0),a0
                clr.w   d7
loc_47638:
                
                ; event check loop: see if next event matches index
                cmpi.b  #$FD,(a0,d7.w)
                bne.s   loc_4764A       ; not default case
                ; "default" case reached; execute this event
                move.b  1(a0,d7.w),d6
                adda.w  2(a0,d7.w),a0
                bra.s   loc_4765E
loc_4764A:
                
                cmp.b   (a0,d7.w),d0
                bne.s   loc_4765A       ; not the right event
                move.b  1(a0,d7.w),d6
                adda.w  2(a0,d7.w),a0
                bra.s   loc_4765E
loc_4765A:
                
                addq.w  #4,d7
                bra.s   loc_47638
loc_4765E:
                
                bsr.w   GetEntityPortaitAndSpeechSfx
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                blt.s   loc_47670
                bsr.w   LoadAndDisplayCurrentPortrait
loc_47670:
                
                ; get entity index that will trigger this event
                movem.w (sp)+,d1-d2
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a1
                tst.b   d0
                bpl.s   @Ally
                subi.b  #ENTITY_ENEMY_INDEX_DIFFERENCE,d0
@Ally:
                
                andi.w  #BYTE_MASK,d0
                move.b  (a1,d0.w),d0
                movem.w d0-d2/d6,-(sp)
                btst    #0,d6
                beq.s   loc_476A8
                jsr     (WaitForVInt).w
                addi.w  #2,d2
                andi.w  #3,d2
                move.w  d2,d1
                moveq   #-1,d2
                moveq   #-1,d3
                jsr     (UpdateEntityProperties).w
loc_476A8:
                
                trap    #VINT_FUNCTIONS
                dc.w CLEAR_FLAG
                dc.l VInt_UpdateEntities
                jsr     (a0)
                movem.w (sp)+,d0-d2/d6
                btst    #1,d6
                beq.s   loc_476C4
                ; finish event by closing windows
                moveq   #-1,d2
                moveq   #-1,d3
                jsr     (UpdateEntityProperties).w
loc_476C4:
                
                jsr     j_ClosePortraitWindow
                clsTxt
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ACTIVATE
                dc.l VInt_UpdateEntities
loc_476D6:
                
                movem.l (sp)+,d0-a1
                rts

    ; End of function RunMapSetupEntityEvent


; =============== S U B R O U T I N E =======================================

; unused


sub_476DC:
                
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ACTIVATE
                dc.l VInt_UpdateEntities
                bra.w   ExecuteMapScript

    ; End of function sub_476DC


; =============== S U B R O U T I N E =======================================

; Get index of current portrait for dialogue window and load it


LoadAndDisplayCurrentPortrait:
                
                movem.w d0-d2,-(sp)
                move.w  ((CURRENT_PORTRAIT-$1000000)).w,d0
                blt.s   loc_476FC
                clr.w   d1
                clr.w   d2
                jsr     j_OpenPortraitWindow
loc_476FC:
                
                movem.w (sp)+,d0-d2
                rts

    ; End of function LoadAndDisplayCurrentPortrait


; =============== S U B R O U T I N E =======================================


RunMapSetupAreaDescription:
                
                movem.l d0-a1,-(sp)
                bsr.w   GetCurrentMapSetup
                clr.w   d7
                cmpi.w  #-1,(a0)
                beq.w   loc_4771A
                
                movea.l MAPSETUP_OFFSET_AREA_DESCRIPTIONS(a0),a0
                jsr     (a0)
loc_4771A:
                
                tst.w   d7
                movem.l (sp)+,d0-a1
                rts

    ; End of function RunMapSetupAreaDescription


; =============== S U B R O U T I N E =======================================


DisplayAreaDescription:
                
                lsl.w   #BYTE_SHIFT_COUNT,d0
                andi.w  #BYTE_MASK,d1
                or.w    d1,d0
                clr.w   d7
loc_4772C:
                
                cmpi.b  #$FD,(a0,d7.w)
                bne.s   loc_47738       
                clr.w   d7
                rts
loc_47738:
                
                cmp.w   (a0,d7.w),d0    ; check coordinates
                bne.w   loc_4778C
                tst.b   2(a0,d7.w)
                beq.s   loc_4774C
                tst.w   d6              ; Case when byte 2 not clear, but what's the content of d6 ?
                bne.w   loc_4778C
loc_4774C:
                
                tst.b   3(a0,d7.w)
                bne.s   loc_4777C       
                clr.w   d0
                move.b  4(a0,d7.w),d0   ; byte 4 : Investigation line index
                clr.w   d1
                move.b  5(a0,d7.w),d1   ; byte 5 : Description line index
                addi.w  #$1A7,d0        ; HARDCODED investigation line start index
                                        ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
                                        ; Followed by all other "investigation" lines
                jsr     (DisplayText).w 
                move.w  d1,d0
                add.w   d3,d0
                jsr     (DisplayText).w 
loc_4776E:
                
                jsr     j_ClosePortraitWindow
                clsTxt
                moveq   #-1,d7
                rts
loc_4777C:
                
                adda.w  4(a0,d7.w),a0   ; when bytes 2-3 = $0001, execute function
                movem.w d6,-(sp)
                jsr     (a0)
                movem.w (sp)+,d6
                bra.s   loc_4776E
loc_4778C:
                
                addq.w  #6,d7
                bra.s   loc_4772C

    ; End of function DisplayAreaDescription


; =============== S U B R O U T I N E =======================================

; Returns entity list of map setup in a0.


GetMapSetupEntityList:
                
                bsr.w   GetCurrentMapSetup
                cmpi.w  #-1,(a0)
                beq.s   @Return
                
                movea.l (a0),a0
@Return:
                
                rts

    ; End of function GetMapSetupEntityList


; =============== S U B R O U T I N E =======================================

; Returns map setup address in a0.


GetCurrentMapSetup:
                
                movem.l d0-d1/a1,-(sp)
                clr.w   d0
                getSavedByte CURRENT_MAP, d0
            if (STANDARD_BUILD=1)
                getPointer p_MapSetups, a1
            else
                lea     MapSetups(pc), a1
            endif
loc_477AC:
                
                cmpi.w  #-1,(a1)
                bne.s   loc_477BA
                
                lea     ms_Void(pc), a0
                bra.w   loc_477E2
loc_477BA:
                
                cmp.w   (a1)+,d0
                bne.s   loc_477DA
                movea.l (a1)+,a0
loc_477C0:
                
                move.w  (a1)+,d1
                cmpi.w  #$FFFD,d1
                beq.w   loc_477E2
                jsr     j_CheckFlag
                beq.s   loc_477D4
                movea.l (a1),a0
loc_477D4:
                
                adda.w  #4,a1
                bra.s   loc_477C0
loc_477DA:
                
                cmpi.w  #$FFFD,(a1)+
                bne.s   loc_477DA
                bra.s   loc_477AC
loc_477E2:
                
                movem.l (sp)+,d0-d1/a1
                rts

    ; End of function GetCurrentMapSetup

ms_Void:        dc.w $FFFF

; =============== S U B R O U T I N E =======================================


MoveEntityOutOfMap:
                
                movem.l d0-d3,-(sp)
                jsr     j_GetEntityIndexForCombatant
                move.w  #$7000,d1
                move.w  #$7000,d2
                jsr     j_SetEntityPosition
                movem.l (sp)+,d0-d3
                rts

    ; End of function MoveEntityOutOfMap


; =============== S U B R O U T I N E =======================================


MakeEntityWalk:
                
                move.l  d0,-(sp)
                jsr     j_GetEntityIndexForCombatant
                jsr     SetWalkingActscript
                move.l  (sp)+,d0
                rts

    ; End of function MakeEntityWalk


; =============== S U B R O U T I N E =======================================

; reset entity flags and sprite


sub_4781A:
                
                movem.l d0-d3,-(sp)
                jsr     j_GetEntityIndexForCombatant
                moveq   #-1,d2
                moveq   #-1,d3
                jsr     (UpdateEntityProperties).w
                movem.l (sp)+,d0-d3
                rts

    ; End of function sub_4781A


; =============== S U B R O U T I N E =======================================

; reset entity flags and sprite and facing ?


sub_47832:
                
                movem.l d0-d3,-(sp)
                jsr     j_GetEntityIndexForCombatant
                move.b  ((byte_FFB651-$1000000)).w,d1
                addi.w  #2,d1
                andi.w  #3,d1
                moveq   #-1,d2
                moveq   #-1,d3
                jsr     (UpdateEntityProperties).w
                movem.l (sp)+,d0-d3
                rts

    ; End of function sub_47832


; =============== S U B R O U T I N E =======================================

; In: d0.w = battle index


CheckRandomBattle:
                
            if (STANDARD_BUILD&NO_RANDOM_BATTLES=1)
                ; Do nothing
            else
                movem.l d1/d6-d7,-(sp)
                move.w  #BATTLE_COMPLETED_FLAGS_START,d1
                add.w   d0,d1
                jsr     j_CheckFlag
                bne.s   loc_4786E
                moveq   #-1,d1
                bra.w   loc_47896
loc_4786E:
                
                tst.w   ((word_FFB196-$1000000)).w
                beq.s   loc_4787A
                clr.w   d1
                bra.w   loc_47896
loc_4787A:
                
                moveq   #8,d6
                jsr     (GenerateRandomNumber).w
                tst.w   d7
                bne.s   loc_47888
                moveq   #-1,d1
                bra.s   loc_47896
loc_47888:
                
                clr.w   d1
                moveq   #4,d6
                jsr     (GenerateRandomNumber).w
                addq.l  #2,d7
                move.w  d7,((word_FFB196-$1000000)).w
loc_47896:
                
                tst.w   d1
                beq.s   loc_478C0
                move.w  #BATTLE_UNLOCKED_FLAGS_START,d1
                add.w   d0,d1
                jsr     j_SetFlag
                move.l  #MAP_EVENT_RELOADMAP,((MAP_EVENT_TYPE-$1000000)).w
                move.w  #$7530,((word_FFB196-$1000000)).w
                jsr     (WaitForViewScrollEnd).w
                sndCom  SFX_BOOST
                bsr.w   ExecuteFlashScreenScript
loc_478C0:
                
                movem.l (sp)+,d1/d6-d7
            endif
                rts

    ; End of function CheckRandomBattle

