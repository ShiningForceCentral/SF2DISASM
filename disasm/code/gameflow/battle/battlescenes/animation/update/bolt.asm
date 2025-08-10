
; ASM FILE code\gameflow\battle\battlescenes\animation\update\bolt.asm :
; 0x1CE50..0x1CFFC : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Bolt:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                moveq   #38,d0   ; starting sprite link
                move.w  (a3),d1
                subq.w  #1,d1
loc_1CE62:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1CF84
                addq.w  #1,(a5)
                subq.w  #1,4(a5)
                bne.w   loc_1CF84
                move.w  2(a5),d1
                cmpi.w  #6,d1
                bcc.w   loc_1CEEE
                tst.w   d1
                bne.s   loc_1CEA0
loc_1CE86:
                
                move.w  #96,d6 
                jsr     (GenerateRandomNumber).w
                add.w   4(a3),d7
                move.w  d7,6(a5)
                moveq   #2,d6
                jsr     (GenerateRandomNumber).w
                move.b  d7,8(a5)
loc_1CEA0:
                
                cmpi.w  #2,d1
                bne.s   loc_1CEAA
                sndCom  SFX_BOLT_SPELL
loc_1CEAA:
                
                tst.b   8(a5)
                bne.s   loc_1CEB8
                movea.l (p_BoltAnimData_A).l,a0
                bra.s   loc_1CEBE
loc_1CEB8:
                
                movea.l (p_BoltAnimData_B).l,a0
loc_1CEBE:
                
                lsl.w   #3,d1
                move.w  d1,d2
                lsl.w   #2,d1
                add.w   d2,d1
                adda.w  d1,a0  ; offset by 40x 
                moveq   #5,d1
                move.w  6(a5),d2
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1CEDA
                clr.w   d3
                bra.s   loc_1CEDC
loc_1CEDA:
                
                moveq   #8,d3
loc_1CEDC:
                
                bsr.w   ConstructComplexGraphic       
                addq.w  #1,2(a5)
                move.w  #2,4(a5)
                bra.w   loc_1CF84
loc_1CEEE:
                
                bne.w   loc_1CF28
                move.l  a4,-(sp)
                moveq   #4,d1
loc_1CEF6:
                
                move.w  #1,(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                dbf     d1,loc_1CEF6 ; something to reset data?
                
                movea.l (sp)+,a4
                clr.b   ((byte_FFB588-$1000000)).w
                move.b  ((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w,d6
                andi.w  #7,d6 ; mask for variation (1/2/3/4)
                add.w   d6,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                addq.w  #1,2(a5)
                move.w  d7,4(a5)
                bra.w   loc_1CF84
loc_1CF28:
                
                cmpi.w  #12,d1
                bcc.w   loc_1CF42
                subq.w  #1,d1
                cmpi.w  #6,d1
                bne.w   loc_1CEAA
                sndCom  SFX_BOLT_SPELL
                bra.w   loc_1CE86
loc_1CF42:
                
                move.l  a4,-(sp)
                moveq   #4,d1
loc_1CF46:
                
                move.w  #1,(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                dbf     d1,loc_1CF46 ; something to reset data?
                
                movea.l (sp)+,a4
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1CF68
                clr.w   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1CF84
loc_1CF68:
                
                move.b  ((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w,d6
                andi.w  #7,d6
                lsl.w   #2,d6 ; 4x animation variant
                jsr     (GenerateRandomNumber).w
                addq.w  #2,d7
                clr.w   2(a5)
                move.w  d7,4(a5)
                bsr.w   sub_1B8FE
loc_1CF84:
                
                movem.w (sp)+,d0-d1
                addq.w  #5,d0
                lea     $28(a4),a4  ; offset of 5x sprite size
                lea     12(a5),a5
                dbf     d1,loc_1CE62 ; BoltStrike_Loop
                
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   ReinitializeSceneAfterSpell
                move.w  2(a3),d1
                beq.w   loc_1CFEA
                subq.w  #1,d1
@BoltOrb_Loop:
                
                tst.w   (a5)
                beq.w   @NextEntry_Orb
                addq.w  #1,(a5)
                move.w  2(a5),d2
                addq.w  #1,d2
                andi.w  #7,d2
                move.w  d2,2(a5)
                move.w  #VDPTILE_SPELLTILE148|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d3
                lsr.w   #1,d2
                bcc.s   @NotMirrored_Orb
                bset    #VDPTILE_MIRROR_BIT,d3
@NotMirrored_Orb:
                
                lsr.w   #1,d2
                bcc.s   @Continue_Orb
                addi.w  #16,d3 ; frame 2
@Continue_Orb:
                
                lsr.w   #1,d2
                bcc.s   @NotFlipped_Orb
                bset    #VDPTILE_FLIP_BIT,d3
@NotFlipped_Orb:
                
                move.w  d3,VDPSPRITE_OFFSET_TILE(a4)
@NextEntry_Orb:
                
                addq.w  #1,d0
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                lea     12(a5),a5 ; offset to next animation event
                dbf     d1,@BoltOrb_Loop
loc_1CFEA:
                
                bsr.w   sub_1B90C       
                lea     table_1CFF6(pc), a0
                bra.w   sub_1B8B2

    ; End of function spellanimationUpdate_Bolt

table_1CFF6:    dc.w $EAA
                dc.w 14
                dc.w 1
