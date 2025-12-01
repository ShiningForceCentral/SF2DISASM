
; ASM FILE code\gameflow\battle\getbattlespritesetsubsection.asm :
; 0x1B1630..0x1B169E : Battle spriteset subsection getter function

; =============== S U B R O U T I N E =======================================

; In: d1.w = subsection index
; Out: a0 = subsection address, d1.w = subsection size


GetBattleSpritesetSubsection:
                
                movem.l d0/d2/a1,-(sp)
                move.b  d1,d2
                clr.w   d1
                clr.w   d0
                move.b  ((CURRENT_BATTLE-$1000000)).w,d0
                lsl.w   #INDEX_SHIFT_COUNT,d0
                conditionalPc lea,pt_BattleSpritesets,a0
                nop
                movea.l (a0,d0.w),a0
                tst.b   d2
                beq.w   @ReturnInfo     ; 0 = Section sizes
                
                movea.l a0,a1           ; a1 = pointer to section sizes
                move.b  (a1),d1         ; allies size
                lea     BATTLESPRITESET_OFFSET_ALLY_ENTRIES(a0),a0
                subq.b  #1,d2
                beq.w   @ReturnInfo     ; 1 = Allies
                
                clr.l   d0
                move.b  BATTLESPRITESET_SIZEOFFSET_ENEMIES(a1),d1
                move.b  (a1),d0
                mulu.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,d0 ; allies number * entry size
                adda.l  d0,a0
                subq.b  #1,d2
                beq.w   @ReturnInfo     ; 2 = Enemies
                
                clr.l   d0
                move.b  BATTLESPRITESET_SIZEOFFSET_REGIONS(a1),d1
                move.b  BATTLESPRITESET_SIZEOFFSET_ENEMIES(a1),d0
                mulu.w  #BATTLESPRITESET_ENTITY_ENTRY_SIZE,d0 ; enemies number * entry size
                adda.l  d0,a0
                subq.b  #1,d2
                beq.w   @ReturnInfo     ; 3 = AI-regions
                
                clr.l   d0
                move.b  BATTLESPRITESET_SIZEOFFSET_AI_POINTS(a1),d1
                move.b  BATTLESPRITESET_SIZEOFFSET_REGIONS(a1),d0
                mulu.w  #BATTLESPRITESET_REGION_ENTRY_SIZE,d0 ; regions number * entry size
                adda.l  d0,a0           ; 4 = AI-points
@ReturnInfo:
                
                movem.l (sp)+,d0/d2/a1
                rts

    ; End of function GetBattleSpritesetSubsection

