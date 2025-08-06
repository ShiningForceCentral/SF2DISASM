
; ASM FILE code\gameflow\battle\battlescenes\animation\gunnerblast.asm :
; 0x1AF8C..0x1B012 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_GunnerBlast:
                
                move.w  d1,-(sp)
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLTILESET_GUNNER_PROJECTILE,d0
                bsr.w   LoadSpellTileset
                move.w  (sp)+,d0
                lea     table_1B002(pc), a0
                lea     table_1AFEA(pc), a1
                btst    #SPELLANIMATION_BIT_MIRRORED,d0
                beq.s   loc_1AFAE
                addq.w  #VDP_SPELL_ENTRY_SIZE,a0
                lea     12(a1),a1
loc_1AFAE:
                
                lea     ((byte_FFB532-$1000000)).w,a2
                move.l  (a1)+,(a2)+
                move.l  (a1)+,(a2)+
                move.l  (a1),(a2)
                moveq   #$26,d0   ; offset to sprite_38
                bsr.w   ConstructSimpleGraphic
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                bsr.w   CopyPalettes
                move.w  #$11D,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_GUNNER_PROJECTILE,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   StoreBattlespritePalette

    ; End of function spellanimationSetup_GunnerBlast

table_1AFEA:    dc.w -$D00 ; x parameter
                dc.w 0     ; y parameter
                dc.w $180  ; x parameter
                dc.w $E8   ; y parameter
                dc.w $20   ; x parameter blast flash
                dc.w $38   ; y parameter blast flash
                
                ; mirror
                dc.w $D00
                dc.w 0
                dc.w $70
                dc.w $F0
                dc.w $88
                dc.w $48
                
table_1B002:    vdpSpell 318, 250, SPELLTILE1, V2|H2|VALUE1
                
                ; mirror
                vdpSpell 208, 224, SPELLTILE1, V2|H2|VALUE1
