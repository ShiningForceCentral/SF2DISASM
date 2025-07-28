
; ASM FILE code\gameflow\battle\battlescenes\battlesceneengine_3.asm :
; 0x1A2A6..0x1A478 : Battlescene engine

; =============== S U B R O U T I N E =======================================

; In: d0.w = color to flash


ExecuteSpellcastFlashEffect:
                
                move.w  d0,d6
                moveq   #3,d7
@Loop:
                
                move.w  d6,((PALETTE_1_CURRENT-$1000000)).w
                move.w  d6,((PALETTE_3_CURRENT_02-$1000000)).w
                jsr     (ApplyVIntCramDma).w
                moveq   #4,d0
                jsr     (Sleep).w       
                clr.w   ((PALETTE_1_CURRENT-$1000000)).w
                clr.w   ((PALETTE_3_CURRENT_02-$1000000)).w
                jsr     (ApplyVIntCramDma).w
                moveq   #3,d0
                jsr     (Sleep).w       
                dbf     d7,@Loop
                
                rts

    ; End of function ExecuteSpellcastFlashEffect


; =============== S U B R O U T I N E =======================================

;     Clears a portion at RAM:b406 and RAM:b532 for spell properties.


ClearSpellanimationProperties:
                
                movem.l d7-a0,-(sp)
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a0
                moveq   #74,d7
@Loop1:
                
                clr.l   (a0)+
                dbf     d7,@Loop1
                
                lea     ((byte_FFB532-$1000000)).w,a0
                moveq   #3,d7
@Loop2:
                
                clr.l   (a0)+
                dbf     d7,@Loop2
                
                movem.l (sp)+,d7-a0
                rts

    ; End of function ClearSpellanimationProperties


; =============== S U B R O U T I N E =======================================

; Out: d0.w


sub_1A2F6:
                
                movem.l d6-d7,-(sp)
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a0
                clr.w   d6
                moveq   #$18,d7
loc_1A302:
                
                tst.w   (a0)
                bne.s   loc_1A316
                move.w  d0,(a0)
                clr.l   2(a0)
                clr.l   6(a0)
                clr.w   $A(a0)
                bra.s   loc_1A324
loc_1A316:
                
                lea     $C(a0),a0
                addq.w  #1,d6
                dbf     d7,loc_1A302
                move.w  #-1,d6
loc_1A324:
                
                move.w  d6,d0
                movem.l (sp)+,d6-d7
                rts

    ; End of function sub_1A2F6


; =============== S U B R O U T I N E =======================================

; code for invocations


LoadInvocationSpell:
                
                movem.l d0/a6,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #INVOCATION_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,((BATTLESCENE_ALLY_COPY-$1000000)).w
                lea     ((word_FFB562-$1000000)).w,a6
                move.w  #-1,(a6)
                clr.w   2(a6)
                bsr.w   bsc07_switchAllies
                movem.l (sp)+,d0/a6
                jsr     (WaitForVInt).w
                clr.w   d1
                bsr.w   LoadInvocationSpriteFrameToVram
                moveq   #8,d0
                jsr     (Sleep).w       
                bchg    #6,((byte_FFB56E-$1000000)).w
                jsr     (ApplyVIntCramDma).w
                bsr.w   LoadInvocationSprite
                jsr     (WaitForDmaQueueProcessing).w
                bset    #4,((byte_FFB56F-$1000000)).w
                rts

    ; End of function LoadInvocationSpell


; =============== S U B R O U T I N E =======================================


LoadInvocationSprite:
                
                lea     ((SPRITE_20-$1000000)).w,a1
                tst.w   VDPSPRITE_OFFSET_TILE(a0)
                bne.s   loc_1A39C
                bclr    #5,((byte_FFB56F-$1000000)).w
                moveq   #5,d1
                moveq   #2,d4
                lea     (table_1F776).l,a2
                bra.s   loc_1A3AC
loc_1A39C:
                
                bset    #5,((byte_FFB56F-$1000000)).w
                moveq   #3,d1
                moveq   #3,d4
                lea     (table_1F7BE).l,a2
loc_1A3AC:
                
                btst    #6,((byte_FFB56E-$1000000)).w
                beq.s   loc_1A3B8
                lea     $24(a2),a2
loc_1A3B8:
                
                lea     (byte_FFAFB4).l,a3
                move.w  (a0),d0
loc_1A3C0:
                
                move.w  2(a0),d2
                move.w  d4,d3
loc_1A3C6:
                
                move.w  d2,(a1)+     ; move y
                move.w  #$F00,(a1)+  ; move V4|H4|0
                move.w  (a2)+,(a1)+  ; move tile
                move.w  d0,(a1)+     ; move x
                move.b  #2,(a3)+
                addi.w  #$20,d2 
                dbf     d3,loc_1A3C6
                
                addi.w  #$20,d0 
                dbf     d1,loc_1A3C0
                
                jmp     (sub_1942).w    

    ; End of function LoadInvocationSprite


; =============== S U B R O U T I N E =======================================


sub_1A3E8:
                
                lea     ((SPRITE_20_VDPTILE-$1000000)).w,a0
                lea     (table_1F776).l,a1
                moveq   #$11,d0
                btst    #5,((byte_FFB56F-$1000000)).w
                beq.s   loc_1A402
                lea     $48(a1),a1
                moveq   #$F,d0
loc_1A402:
                
                btst    #6,((byte_FFB56E-$1000000)).w
                beq.s   loc_1A40E
                lea     $24(a1),a1
loc_1A40E:
                
                move.w  (a1)+,(a0)
                addq.w  #8,a0
                dbf     d0,loc_1A40E
                rts

    ; End of function sub_1A3E8


; START OF FUNCTION CHUNK FOR bsc05_makeAllyIdle

loc_1A418:
                
                btst    #4,((byte_FFB56F-$1000000)).w
                beq.s   return_1A474
                bsr.w   bsc0D_endAnimation
                move.b  #OUT_TO_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #1,((FADING_PALETTE_BITFIELD-$1000000)).w
loc_1A43E:
                
                tst.b   ((FADING_SETTING-$1000000)).w
                bne.s   loc_1A43E
                lea     ((SPRITE_20-$1000000)).w,a0
                moveq   #17,d0
loc_1A44A:
                
                move.w  #1,(a0)+
                clr.l   (a0)+
                move.w  #1,(a0)+
                dbf     d0,loc_1A44A
                
                move.l  a6,-(sp)
                lea     ((word_FFB562-$1000000)).w,a6
                move.w  ((BATTLESCENE_ALLY_COPY-$1000000)).w,(a6)
                move.w  #3,2(a6)
                bsr.w   bsc07_switchAllies
                movea.l (sp)+,a6
                bclr    #4,((byte_FFB56F-$1000000)).w
return_1A474:
                
                rts

; END OF FUNCTION CHUNK FOR bsc05_makeAllyIdle


; =============== S U B R O U T I N E =======================================


nullsub_1A476:
                
                rts

    ; End of function nullsub_1A476

