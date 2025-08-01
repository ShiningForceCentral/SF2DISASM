
; ASM FILE code\gameflow\battle\battlescenes\animation\execution.asm :
; 0x1B4F6..0x1B618 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_CutOffAndDodge:
                
                module
                andi.w  #7,d1
                subq.w  #1,d1
                beq.w   SetupCutoff
                subq.w  #1,d1
                beq.w   SetupDodge
                rts

    ; End of function spellanimationSetup_CutOffandDodge

; =============== S U B R O U T I N E =======================================


SetupCutoff:
                
                bclr    #3,((byte_FFB56E-$1000000)).w
                move.w  #CUTOFF_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                move.l  #table_CutOffBattlespriteModification,((BATTLESCENE_BATTLESPRITE_MODIFICATION_POINTER-$1000000)).w
                move.w  #1,((word_FFB3CA-$1000000)).w
                move.b  #10,((byte_FFB583-$1000000)).w
loc_1B52A:
                
                tst.w   ((word_FFB3CA-$1000000)).w
                bne.s   loc_1B52A
                clr.l   ((BATTLESCENE_BATTLESPRITE_MODIFICATION_POINTER-$1000000)).w
                clr.b   ((byte_FFB583-$1000000)).w
                rts

    ; End of function SetupCutOff


table_CutOffBattlespriteModification:
                dc.b 1
                dc.b 40
                dc.b 104
                dc.b 24


; =============== S U B R O U T I N E =======================================


SetupDodge:
                
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   @NotMirrored
                cmpi.w  #ENEMYBATTLESPRITE_ZEON,((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w 
                bne.s   @Continue
                rts
@Continue:
                
                btst    #2,((byte_FFB56F-$1000000)).w
                beq.s   loc_1B55A
                rts
loc_1B55A:
                
                bra.s   loc_1B570
@NotMirrored:
                
                cmpi.b  #-1,((BATTLESCENE_GROUND-$1000000)).w
                bne.s   @SpriteOnGround
                rts
@SpriteOnGround:
                
                btst    #1,((byte_FFB56F-$1000000)).w
                beq.s   loc_1B570
                rts
loc_1B570:
                
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLTILESET_CUTOFF,d0
                bsr.w   LoadSpellTileset
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((BATTLESCENE_ALLY_X_SPEED-$1000000)).w,a3
                lea     table_1B608(pc), a0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   @NotMirroredGraphics
                addq.w  #VDP_SPELL_ENTRY_SIZE,a0
                lea     ((BATTLESCENE_ENEMY_X_SPEED-$1000000)).w,a3
@NotMirroredGraphics:
                
                move.w  VDPSPELL_OFFSET_Y(a0),6(a5)
                moveq   #38,d0  ; offset to sprite_38
                bsr.w   ConstructSimpleGraphic
                jsr     (sub_1942).w    
                sndCom  SFX_PSHHH
                move.w  #5,4(a5)
                lea     ((SPRITE_38-$1000000)).w,a4
loc_1B5B2:
                
                jsr     (WaitForVInt).w
                addq.w  #1,(a5)
                btst    #0,1(a5)
                bne.s   loc_1B5CA
                move.w  #1,(a4)
                move.w  #1,(a3)
                bra.s   loc_1B5D2
loc_1B5CA:
                
                move.w  6(a5),(a4)
                move.w  #-1,(a3)
loc_1B5D2:
                
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   @MirroredAnimation
                addq.w  #1,VDPSPRITE_OFFSET_X(a4)
                bra.s   loc_1B5E4
@MirroredAnimation:
                
                subq.w  #1,VDPSPRITE_OFFSET_X(a4)
loc_1B5E4:
                
                subq.w  #1,4(a5)
                bne.s   loc_1B5B2
                move.w  #5,4(a5)
                addq.w  #1,2(a5)
                cmpi.w  #3,2(a5)
                bcc.w   loc_1B604
                addq.w  #4,VDPSPRITE_OFFSET_TILE(a4)
                bra.s   loc_1B5B2
loc_1B604:
                
                bra.w   ClearSpellGraphics

    ; End of function SetupDodge

                modend
                
table_1B608:    vdpSpell 312, 272, SPELLTILE1, V2|H2|VALUE2
                
                vdpSpell 192, 256, SPELLTILE1, V2|H2|VALUE2
