
; ASM FILE code\common\menus\equipmenu.asm :
; 0x113C6..0x114BE : Menu engine, part 2 : Battlefield equip menu actions

; =============== S U B R O U T I N E =======================================


OpenBattleEquipWindow:
                
                movem.l d0-a2,-(sp)
                move.w  #WINDOW_BATTLEEQUIP_SIZE,d0
                move.w  #$F612,d1
                jsr     (CreateWindow).w
                move.w  d0,((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w
                lea     layout_BattleEquipWindow(pc), a0
                move.w  #180,d7
                jsr     (CopyBytes).w   
                bsr.w   BuildBattleEquipWindow
                move.w  ((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w,d0
                move.w  #$212,d1
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function OpenBattleEquipWindow


; =============== S U B R O U T I N E =======================================


HideBattleEquipWindow:
                
                movem.l d0-a2,-(sp)
                bsr.w   BuildBattleEquipWindow
                move.w  ((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function HideBattleEquipWindow


; =============== S U B R O U T I N E =======================================


CloseBattleEquipWindow:
                
                movem.l d0-a2,-(sp)
                move.w  ((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w,d0
                move.w  #$F612,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  ((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w,d0
                jsr     (DeleteWindow).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function CloseBattleEquipWindow


; =============== S U B R O U T I N E =======================================

windowLayoutStartAddress = -4

BuildBattleEquipWindow:
                
                link    a6,#-4
                move.w  ((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w,d0
                move.w  #WINDOW_BATTLEEQUIP_STATS_TILE_COORDS,d1
                jsr     (GetWindowTileAddress).w
                move.l  a1,windowLayoutStartAddress(a6)
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentAtt
                move.w  d1,d0
                movea.l windowLayoutStartAddress(a6),a1
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentDef
                move.w  d1,d0
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #40,a1          ; second stat offset
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentAgi
                move.w  d1,d0
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #80,a1          ; third stat offset
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentMov
                move.w  d1,d0
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #120,a1         ; fourth stat offset
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                unlk    a6
                rts

    ; End of function BuildBattleEquipWindow

