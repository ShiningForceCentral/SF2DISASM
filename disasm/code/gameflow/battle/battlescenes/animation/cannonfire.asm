
; ASM FILE code\gameflow\battle\battlescenes\animation\cannonfire.asm :
; 0x1AEB0..0x1AF0A : 

; =============== S U B R O U T I N E =======================================


spellanimationSetup_CannonFire:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_CANNON_PROJECTILE,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d0
                lea     table_1AEFA(pc), a1
                btst    #7,d0
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
                bra.w   sub_1A028

    ; End of function spellanimationSetup_CannonFire

table_1AEFA:    dc.b $F3
                dc.b 0
                dc.b $FF
                dc.b $C0
                dc.b 1
                dc.b $80
                dc.b 0
                dc.b $E8
                dc.b $D
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $70
                dc.b 0
                dc.b $F0
