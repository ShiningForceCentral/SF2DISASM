
; ASM FILE code\gameflow\battle\battlescenes\animation\gunnerblast.asm :
; 0x1AF8C..0x1B012 : 

; =============== S U B R O U T I N E =======================================


spellanimationSetup_GunnerBlast:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_GUNNER_PROJECTILE,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d0
                lea     table_1B002(pc), a0
                lea     table_1AFEA(pc), a1
                btst    #SPELLANIMATION_BIT_MIRRORED,d0
                beq.s   loc_1AFAE
                addq.w  #8,a0
                lea     $C(a1),a1
loc_1AFAE:
                
                lea     ((byte_FFB532-$1000000)).w,a2
                move.l  (a1)+,(a2)+
                move.l  (a1)+,(a2)+
                move.l  (a1),(a2)
                moveq   #$26,d0   ; offset to sprite_38
                bsr.w   sub_19F5E
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                bsr.w   CopyPalettes
                move.w  #$11D,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_GUNNER_PROJECTILE,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_GunnerBlast

table_1AFEA:    dc.l $F3000000
                dc.l $18000E8
                dc.l $200038
                
                ; mirror
                dc.l $D000000
                dc.l $7000F0
                dc.l $880048
                
table_1B002:    vdpSpell 318, 250, SPELLTILE1, V2|H2|16
                
                ; mirror
                vdpSpell 208, 224, SPELLTILE1, V2|H2|16
