
; ASM FILE code\gameflow\battle\battlescenes\animation\shotfire.asm :
; 0x1AF0A..0x1AF8C : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_ShotFire:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLTILESET_EXPLOSION,d0
                bsr.w   LoadSpellTileset
                move.w  (sp)+,d0
                lea     graphic_BurstShots(pc), a0
                lea     table_1AF64(pc), a1
                btst    #SPELLANIMATION_BIT_MIRRORED,d0
                beq.s   loc_1AF2C
                addq.w  #8,a0
                lea     12(a1),a1
loc_1AF2C:
                
                lea     ((byte_FFB532-$1000000)).w,a2
                move.l  (a1)+,(a2)+
                move.l  (a1)+,(a2)+
                move.l  (a1),(a2)
                moveq   #38,d0   ; offset to sprite_38
                bsr.w   ConstructSimpleGraphic
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$11D,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_SHOT_PROJECTILE,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   StoreBattlespritePalette

    ; End of function spellanimationSetup_ShotFire

table_1AF64:    dc.w -$C00 ; x parameter
                dc.w -$40  ; y parameter
                dc.w $180  ; x offset
                dc.w $E8   ; y offset
                dc.w $50   ; x parameter
                dc.w $60   ; y parameter
                
                ; mirror
                dc.w $C00
                dc.w $40
                dc.w $70
                dc.w $F0
                dc.w $B8
                dc.w $70
                
graphic_BurstShots:
                vdpSpell 288, 232, SPELLTILE77, V2|H2|VALUE1
                
                vdpSpell 200, 224, SPELLTILE77, V2|H2|VALUE1|MIRRORED
