
; ASM FILE code\gameflow\battle\battlefunctions\battlefunctions_3.asm :
; 0x25610..0x25790 : Battle functions

; =============== S U B R O U T I N E =======================================

; load all battle properties


LoadBattle:
                
                move.w  d0,-(sp)
                clr.w   d1
                move.b  ((CURRENT_MAP-$1000000)).w,d1
                bsr.w   FadeOutToBlackAll
                move.b  #$FF,((VIEW_TARGET_ENTITY-$1000000)).w
                jsr     (LoadMapTilesets).w
                bsr.w   WaitForFadeToFinish
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                jsr     (WaitForVInt).w
                jsr     j_MoveEntitiesToBattlePositions
                move.w  (sp)+,d0
                bsr.w   GetEntityIndexForCombatant
                move.b  d0,((VIEW_TARGET_ENTITY-$1000000)).w
                bpl.s   @Ally
                clr.w   d0
@Ally:
                
                andi.w  #$3F,d0 
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                adda.w  d0,a0           ; offset to appropriate entity
                move.w  (a0)+,d0        ; move x offset
                ext.l   d0
                divs.w  #$180,d0
                move.b  d0,((BATTLE_ENTITY_CHOSEN_X-$1000000)).w
                move.w  (a0)+,d0        ; move y offset
                ext.l   d0
                divs.w  #$180,d0
                move.b  d0,((BATTLE_ENTITY_CHOSEN_Y-$1000000)).w
                moveq   #$3F,d0 
                jsr     (InitSprites).w 
                move.w  #$FFFF,d0
                jsr     (LoadMap).w     
                jsr     (WaitForVInt).w
                jsr     (LoadMapEntitySprites).w
                bsr.w   SetBaseVIntFunctions
                jsr     j_LoadBattleTerrainData
                jsr     (PlayMapMusic).w
                jsr     (FadeInFromBlack).w
                cmpi.b  #BATTLE_FAIRY_WOODS,((CURRENT_BATTLE-$1000000)).w 
                                                        ; if battle 44, then special battle !
                bne.s   return_256A0
                jsr     j_DisplayTimerWindow
return_256A0:
                
                rts

    ; End of function LoadBattle

tbl_RelativeTileMoveX:
                dc.w 1
tbl_RelativeTileMoveY:
                dc.w 0
                dc.w 0
                dc.w -1
                dc.w -1
                dc.w 0
                dc.w 0
                dc.w 1

; =============== S U B R O U T I N E =======================================

; In: D0 = combatant index
; Out: D0 = new X
;      D1 = new Y


GetEntityPositionAfterApplyingFacing:
                
                movem.l d2-d3/a0,-(sp)
                jsr     j_GetXPos
                move.w  d1,d2
                jsr     j_GetYPos
                bsr.w   GetEntityIndexForCombatant_0
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                clr.w   d3
                move.b  ENTITYDEF_OFFSET_FACING(a0,d0.w),d3
                move.w  d2,d0
                lsl.w   #2,d3
                add.w   tbl_RelativeTileMoveX(pc,d3.w),d0
                add.w   tbl_RelativeTileMoveY(pc,d3.w),d1
                movem.l (sp)+,d2-d3/a0
                rts

    ; End of function GetEntityPositionAfterApplyingFacing


; =============== S U B R O U T I N E =======================================


sub_256E6:
                
                movem.l d0-d2/d7,-(sp)
                move.w  d0,d2
                move.w  d1,d3
                clr.w   d0
                move.w  #COMBATANTS_ALL_COUNTER,d7
loc_256F4:
                
                jsr     j_GetXPos
                cmp.w   d1,d2
                bne.w   loc_25712
                jsr     j_GetYPos
                cmp.w   d1,d3
                bne.w   loc_25712
                move.w  d0,d3
                bra.w   loc_25724
loc_25712:
                
                addq.w  #1,d0
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0
                bne.s   loc_2571E
                move.w  #COMBATANT_ENEMIES_START,d0
loc_2571E:
                
                dbf     d7,loc_256F4
                moveq   #$FFFFFFFF,d3
loc_25724:
                
                movem.l (sp)+,d0-d2/d7
                rts

    ; End of function sub_256E6


; =============== S U B R O U T I N E =======================================


PrintAllActivatedDefCons:
                
                moveq   #$5A,d1 
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                bsr.w   PrintActivatedDefCon
                clsTxt
                rts

    ; End of function PrintAllActivatedDefCons


; =============== S U B R O U T I N E =======================================

; if flag D1 is set, AI region active, display def-con textbox


PrintActivatedDefCon:
                
                move.w  d1,-(sp)
                jsr     j_CheckFlag
                beq.s   @RegionInactive
                subi.w  #BATTLE_REGION_FLAGS_START,d1
                ext.l   d1
                move.l  d1,((TEXT_NUMBER-$1000000)).w
                txt     463             ; "DEF-CON No. {#} has been{N}implemented.{D3}"
@RegionInactive:
                
                move.w  (sp)+,d1
                addq.w  #1,d1
                rts

    ; End of function PrintActivatedDefCon

