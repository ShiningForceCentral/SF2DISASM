
; ASM FILE code\gameflow\battle\battlescenes\updateanimation\desoul.asm :
; 0x1C248..0x1C53E : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Desoul:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   4(a3)
                bne.w   loc_1C362
                clr.w   d0
                move.b  4(a5),d0
                btst    #2,6(a5)
                bne.s   loc_1C27A
                addq.w  #1,d0
                cmpi.w  #$D0,d0 
                bcs.s   loc_1C278
                bset    #2,6(a5)
loc_1C278:
                
                bra.s   loc_1C288
loc_1C27A:
                
                subq.w  #1,d0
                cmpi.w  #$80,d0 
                bhi.s   loc_1C288
                bclr    #2,6(a5)
loc_1C288:
                
                move.b  d0,4(a5)
                lsr.w   #6,d0
                add.w   2(a5),d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,2(a5)
                btst    #1,6(a5)
                bne.s   loc_1C2C0
                tst.b   5(a5)
                beq.s   loc_1C2D2
                cmpi.w  #$80,d0 
                bcs.s   loc_1C2BE
                bset    #1,6(a5)
loc_1C2B4:
                
                lea     graphic_ReaperMirror(pc), a0
                moveq   #2,d4
                bsr.w   sub_1C4D8
loc_1C2BE:
                
                bra.s   loc_1C2DC
loc_1C2C0:
                
                tst.b   5(a5)
                beq.s   loc_1C2B4
                cmpi.w  #$80,d0 
                bhi.s   loc_1C2DC
                bclr    #1,6(a5)
loc_1C2D2:
                
                lea     graphic_Reaper(pc), a0
                moveq   #1,d4
                bsr.w   sub_1C4D8
loc_1C2DC:
                
                clr.w   d2
                move.b  7(a5),d2
                btst    #3,6(a5)
                bne.s   loc_1C2F6
                subq.b  #1,d2
                bne.s   loc_1C2F4
                bset    #3,6(a5)
loc_1C2F4:
                
                bra.s   loc_1C304
loc_1C2F6:
                
                addq.b  #1,d2
                cmpi.b  #$FE,d2
                bcs.s   loc_1C304
                bclr    #3,6(a5)
loc_1C304:
                
                move.b  d2,7(a5)
                lsl.w   #3,d2
                move.w  #$1000,d1
                add.w   d2,d1
                swap    d1
                lsl.w   #2,d2
                move.w  #$3000,d1
                add.w   d2,d1
                jsr     (sub_1812).w    
                add.w   (a3),d2
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                move.w  d2,$E(a4)
                addi.w  #$20,d2 
                move.w  d2,$16(a4)
                move.w  d2,$1E(a4)
                swap    d2
                subq.b  #1,5(a5)
                bne.s   loc_1C348
                move.b  #$1C,5(a5)
                bchg    #0,6(a5)
loc_1C348:
                
                add.w   2(a3),d2
                move.w  d2,(a4)
                move.w  d2,$10(a4)
                addi.w  #$20,d2 
                move.w  d2,8(a4)
                move.w  d2,$18(a4)
                bra.w   loc_1C43A
loc_1C362:
                
                cmpi.w  #1,4(a3)
                bne.w   loc_1C3C4
                move.w  (a3),d0
                subi.w  #$20,d0 
                move.w  d0,VDPSPRITE_OFFSET_X(a4)
                move.w  d0,$E(a4)
                addi.w  #$20,d0 
                move.w  d0,$16(a4)
                move.w  d0,$1E(a4)
                move.w  2(a3),d0
                addi.w  #$10,d0
                move.w  d0,(a4)
                move.w  d0,$10(a4)
                addi.w  #$20,d0 
                move.w  d0,8(a4)
                move.w  d0,$18(a4)
                addq.w  #1,4(a3)
                btst    #1,6(a5)
                bne.s   loc_1C3B4
                move.w  #$40,2(a5) 
                bra.s   loc_1C3BA
loc_1C3B4:
                
                move.w  #$C0,2(a5) 
loc_1C3BA:
                
                move.b  #$14,5(a5)
                bra.w   loc_1C43A
loc_1C3C4:
                
                cmpi.w  #2,4(a3)
                bne.w   loc_1C42A
                subq.b  #1,5(a5)
                bne.w   loc_1C43A
                lea     graphic_Reaper(pc), a0
                btst    #1,6(a5)
                beq.s   loc_1C3E6
                lea     $20(a0),a0
loc_1C3E6:
                
                moveq   #$26,d0 
                moveq   #4,d1
                move.w  6(a4),d2
                subi.w  #$80,d2 
                move.w  (a4),d3
                subi.w  #$70,d3 
                bsr.w   sub_19FAA       
                addi.w  #GRAPHIC_DESOUL_REAPER1,VDPSPELL_OFFSET_GRAPHIC(a4) 
                addi.w  #GRAPHIC_DESOUL_REAPER1,(VDPSPELL_OFFSET_GRAPHIC+VDP_SPRITE_ENTRY_SIZE)(a4) 
                addi.w  #GRAPHIC_DESOUL_REAPER1,(VDPSPELL_OFFSET_GRAPHIC+VDP_SPRITE_ENTRY_SIZE*2)(a4) 
                addi.w  #GRAPHIC_DESOUL_REAPER1,(VDPSPELL_OFFSET_GRAPHIC+VDP_SPRITE_ENTRY_SIZE*3)(a4) 
                addq.w  #1,4(a3)
                move.b  #$20,5(a5) 
                sndCom  SFX_DESOUL
                bsr.w   sub_1B8FE
                bra.w   loc_1C43A
loc_1C42A:
                
                bsr.w   sub_1B90C       
                subq.b  #1,5(a5)
                bne.w   loc_1C43A
                clr.w   4(a3)
loc_1C43A:
                
                btst    #1,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.w   loc_1C464
                lea     $C(a5),a5
                lea     $20(a4),a4
                move.w  #$FFF0,d2
                lea     ((SPRITE_38-$1000000)).w,a0
                bsr.w   sub_1C46E
                lea     $C(a5),a5
                addq.w  #8,a4
                moveq   #$20,d2 
                bsr.w   sub_1C46E
loc_1C464:
                
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   sub_1B82A
                rts

    ; End of function spellanimationUpdate_Desoul


; =============== S U B R O U T I N E =======================================


sub_1C46E:
                
                tst.w   (a5)
                beq.w   return_1C4D6
                addq.w  #1,(a5)
                move.w  2(a5),d0
                btst    #0,6(a5)
                bne.s   loc_1C486
                subq.w  #1,d0
                bra.s   loc_1C488
loc_1C486:
                
                addq.w  #1,d0
loc_1C488:
                
                move.w  d0,2(a5)
                asr.w   #1,d0
                add.w   VDPSPRITE_OFFSET_X(a0),d0
                move.w  d0,VDPSPRITE_OFFSET_X(a4)
                add.w   (a0),d2
                move.w  d2,(a4)
                subq.b  #1,7(a5)
                bne.s   loc_1C4BC
                move.b  #6,7(a5)
                bchg    #1,6(a5)
                bne.s   loc_1C4B6
                addi.w  #4,VDPSPRITE_OFFSET_TILE(a4)
                bra.s   loc_1C4BC
loc_1C4B6:
                
                subi.w  #4,VDPSPRITE_OFFSET_TILE(a4)
loc_1C4BC:
                
                subq.w  #1,4(a5)
                bne.w   return_1C4D6
                move.w  #$3C,4(a5) 
                bchg    #0,6(a5)
                bchg    #3,VDPSPRITE_OFFSET_TILE(a4)
return_1C4D6:
                
                rts

    ; End of function sub_1C46E


; =============== S U B R O U T I N E =======================================


sub_1C4D8:
                
                move.w  d0,-(sp)
                moveq   #$26,d0 
                moveq   #4,d1
                bsr.w   sub_19FAA       
                lea     (byte_FFAFC6).l,a0
                move.b  d4,(a0)+
                move.b  d4,(a0)+
                move.b  d4,(a0)+
                move.b  d4,(a0)
                move.b  #$E,5(a5)
                sndCom  SFX_DESOUL_HOVERING
                move.w  (sp)+,d0
                rts

    ; End of function sub_1C4D8

graphic_Reaper: vdpSpell 0, 0, SPELLTILE1, V4|H4|32
				vdpSpell 0, 32, SPELLTILE17, V2|H4|32
				vdpSpell 32, 0, SPELLTILE25, V4|H4|32
				vdpSpell 32, 32, SPELLTILE41, V2|H4|32
				
graphic_ReaperMirror:
                vdpSpell 0, 0, SPELLTILE25, V4|H4|33
				vdpSpell 0, 32, SPELLTILE41, V2|H4|33
				vdpSpell 32, 0, SPELLTILE1, V4|H4|33
				vdpSpell 32, 32, SPELLTILE17, V2|H4|33
