
; ASM FILE code\gameflow\battle\battlescenes\animation\cutoff.asm :
; 0x1B4F6..0x1B618 : 

; =============== S U B R O U T I N E =======================================


spellanimationSetup_CutOff:
                
                module
                andi.w  #7,d1
                subq.w  #1,d1
                beq.w   loc_1B508
                subq.w  #1,d1
                beq.w   loc_1B53E
                rts
loc_1B508:
                
                bclr    #3,((byte_FFB56E-$1000000)).w
                move.w  #CUTOFF_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                move.l  #table_CutOffBattlespriteModification,((BATTLESCENE_BATTLESPRITE_MODIFICATION_POINTER-$1000000)).w
                move.w  #1,((word_FFB3CA-$1000000)).w
                move.b  #$A,((byte_FFB583-$1000000)).w
loc_1B52A:
                
                tst.w   ((word_FFB3CA-$1000000)).w
                bne.s   loc_1B52A
                clr.l   ((BATTLESCENE_BATTLESPRITE_MODIFICATION_POINTER-$1000000)).w
                clr.b   ((byte_FFB583-$1000000)).w
                rts

    ; End of function spellanimationSetup_CutOff

table_CutOffBattlespriteModification:
                dc.b 1
                dc.b 40
                dc.b 104
                dc.b 24

; START OF FUNCTION CHUNK FOR spellanimationSetup_CutOff

loc_1B53E:
                
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   @NotMirrored
                cmpi.w  #ENEMYBATTLESPRITE_ZEON,((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w 
                                                        ; HARDCODED Zeon enemy battle sprite
                bne.s   @Continue
                rts
@Continue:
                
                btst    #2,((byte_FFB56F-$1000000)).w
                beq.s   loc_1B55A
                rts
loc_1B55A:
                
                bra.s   loc_1B570
@NotMirrored:
                
                cmpi.b  #BATTLEBACKGROUND_OVERWORLD,((BATTLESCENE_GROUND-$1000000)).w
                bne.s   @OverworldBackground
                rts
@OverworldBackground:
                
                btst    #1,((byte_FFB56F-$1000000)).w
                beq.s   loc_1B570
                rts
loc_1B570:
                
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_CUTOFF,d0
                bsr.w   LoadSpellGraphics
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((BATTLESCENE_ALLY_X_SPEED-$1000000)).w,a3
                lea     table_1B608(pc), a0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   @NotMirroredGraphics
                addq.w  #8,a0
                lea     ((BATTLESCENE_ENEMY_X_SPEED-$1000000)).w,a3
@NotMirroredGraphics:
                
                move.w  2(a0),6(a5)
                moveq   #$26,d0 
                bsr.w   sub_19F5E
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
                
                bra.w   sub_1A00A

; END OF FUNCTION CHUNK FOR spellanimationSetup_CutOff

                modend
                
table_1B608:    dc.w $138
                dc.w $110
                dc.w $520
                dc.w $520
                dc.w $C0
                dc.w $100
                dc.w $520
                dc.w $520
