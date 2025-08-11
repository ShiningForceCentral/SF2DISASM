
; ASM FILE code\gameflow\battle\battlescenes\animation\cannonfire.asm :
; 0x1AEB0..0x1AF0A : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_CannonFire:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLTILESET_CANNON_PROJECTILE,d0
                bsr.w   LoadSpellTileset
                move.w  (sp)+,d0
                lea     table_1AEFA(pc), a1
                btst    #SPELLANIMATION_BIT_MIRRORED,d0
                beq.s   loc_1AECA
                addq.w  #8,a1
loc_1AECA:
                
                lea     ((byte_FFB532-$1000000)).w,a2
                move.l  (a1)+,(a2)+
                move.l  (a1),(a2)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$11D,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_CANNON_PROJECTILE,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   StoreBattlespritePalette

    ; End of function spellanimationSetup_CannonFire

table_1AEFA:    dc.w -$D00 ; x parameter
                dc.w -$40  ; y parameter
                dc.w $180  ; x parameter
                dc.w $E8   ; y parameter
                
                ; mirror
                dc.w $D00
                dc.w $40
                dc.w $70
                dc.w $F0
