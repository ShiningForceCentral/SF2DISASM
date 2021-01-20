
; ASM FILE code\common\maps\getbattle.asm :
; 0x799C..0x7A36 : GetNextBattleOnMap function

; =============== S U B R O U T I N E =======================================

; In: D0 = map index (if not supplied, will be pulled from CURRENT_MAP)
;     D1 = player X coord to check
;     D2 = player Y coord to check
; Out: D7 = battle index to trigger ($FFFF if none)
; ...more


CheckBattle:
                
                movem.l d1-d6/a0,-(sp)
                move.w  d1,d4
                move.w  d2,d5
                move.w  d0,-(sp)
                cmpi.b  #$FF,d0
                bne.s   loc_79B2
                clr.w   d0
                move.b  ((CURRENT_MAP-$1000000)).w,d0
loc_79B2:
                
                conditionalPc lea,BattleMapCoordinates,a0
                moveq   #44,d6          ; HARDCODED number of battles
                clr.w   d7
loc_79BA:
                
                cmp.b   (a0),d0
                bne.s   loc_7A24
                move.w  #$190,d1        ; "Battle unlocked" starting flag index
                add.w   d7,d1
                jsr     j_CheckFlag
                beq.s   loc_7A24
                cmpi.b  #$FF,5(a0)
                beq.w   loc_79DE
                cmp.b   5(a0),d4
                bne.w   loc_7A24
loc_79DE:
                
                cmpi.b  #$FF,6(a0)
                beq.w   loc_79F0
                cmp.b   6(a0),d5        ; if player is not on specified coords (bytes 5/6), then don't return battle index.
                bne.w   loc_7A24
loc_79F0:
                
                move.b  1(a0),((BATTLE_AREA_X-$1000000)).w
                move.b  2(a0),((BATTLE_AREA_Y-$1000000)).w
                move.b  3(a0),((BATTLE_AREA_WIDTH-$1000000)).w
                move.b  4(a0),((BATTLE_AREA_HEIGHT-$1000000)).w
                addi.w  #$64,d1 ; "Battle completed" flags
                jsr     j_CheckFlag
                beq.s   loc_7A1E
                subi.w  #$64,d1 
                jsr     j_ClearFlag
loc_7A1E:
                
                move.w  (sp)+,d1
                bra.w   loc_7A30
loc_7A24:
                
                addq.l  #7,a0
                addq.w  #1,d7
                dbf     d6,loc_79BA
                moveq   #$FFFFFFFF,d7
                move.w  (sp)+,d0
loc_7A30:
                
                movem.l (sp)+,d1-d6/a0
                rts

    ; End of function CheckBattle

