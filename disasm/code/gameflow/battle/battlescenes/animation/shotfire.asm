
; ASM FILE code\gameflow\battle\battlescenes\animation\shotfire.asm :
; 0x1AF0A..0x1AF8C : 

; =============== S U B R O U T I N E =======================================


spellanimationSetup_ShotFire:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_EXPLOSION,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d0
                lea     table_1AF7C(pc), a0
                lea     table_1AF64(pc), a1
                btst    #7,d0
                beq.s   loc_1AF2C
                addq.w  #8,a0
                lea     $C(a1),a1
loc_1AF2C:
                
                lea     ((byte_FFB532-$1000000)).w,a2
                move.l  (a1)+,(a2)+
                move.l  (a1)+,(a2)+
                move.l  (a1),(a2)
                moveq   #$26,d0 
                bsr.w   sub_19F5E
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$11D,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_SHOT_PROJECTILE,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_ShotFire

table_1AF64:    dc.b $F4
                dc.b 0
                dc.b $FF
                dc.b $C0
                dc.b 1
                dc.b $80
                dc.b 0
                dc.b $E8
                dc.b 0
                dc.b $50
                dc.b 0
                dc.b $60
                dc.b $C
                dc.b 0
                dc.b 0
                dc.b $40
                dc.b 0
                dc.b $70
                dc.b 0
                dc.b $F0
                dc.b 0
                dc.b $B8
                dc.b 0
                dc.b $70
table_1AF7C:    dc.b 1
                dc.b $20
                dc.b 0
                dc.b $E8
                dc.b 5
                dc.b $6C
                dc.b 5
                dc.b $10
                dc.b 0
                dc.b $C8
                dc.b 0
                dc.b $E0
                dc.b 5
                dc.b $6C
                dc.b 5
                dc.b $11
