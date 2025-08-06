
; ASM FILE code\gameflow\battle\battlescenes\animation\update\atlas.asm :
; 0x1E134..0x1E2D4 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Atlas:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_20-$1000000)).w,a4
                bsr.s   sub_1E160
                lea     12(a5),a5
                lea     $90(a4),a4 ; offset to sprite 38
                bsr.s   sub_1E160
                subq.w  #1,((byte_FFB53A-$1000000)).w
                bne.s   loc_1E152
                clr.b   ((byte_FFB588-$1000000)).w
loc_1E152:
                
                bsr.w   sub_1B90C       
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                beq.w   ReinitializeSceneAfterSpell
                rts

    ; End of function spellanimationUpdate_Atlas


; =============== S U B R O U T I N E =======================================


sub_1E160:
                
                tst.w   (a5)
                beq.w   return_1E25C
                addq.w  #1,(a5)
                tst.w   8(a5)
                bne.s   loc_1E17C
                lea     ((byte_FFB532-$1000000)).w,a3
                lea     layout_Invocation_Mirror(pc), a0
                move.w  #16,d0
                bra.s   loc_1E188
loc_1E17C:
                
                lea     ((dword_FFB536-$1000000)).w,a3
                lea     layout_Invocation(pc), a0
                move.w  #304,d0
loc_1E188:
                
                move.w  2(a5),d1
                bne.w   loc_1E1BC
                subq.w  #1,4(a5)
                bne.w   return_1E25C
                move.w  #1,(a5)
                addq.w  #1,2(a5)
                clr.l   4(a5)
                moveq   #24,d6
                jsr     (GenerateRandomNumber).w
                add.w   d7,d0 ; random x
                moveq   #48,d6 
                jsr     (GenerateRandomNumber).w
                move.w  d7,d2 ; random y
                addi.w  #16,d2
                bra.w   loc_1E268
loc_1E1BC:
                
                subq.w  #1,d1
                bne.w   loc_1E228
                move.w  (a3),d0
                add.w   4(a5),d0
                tst.w   d0
                bmi.s   loc_1E1D6
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                bra.s   loc_1E1E4
loc_1E1D6:
                
                neg.w   d0
                move.w  d0,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d0
                neg.w   d0
loc_1E1E4:
                
                move.w  d1,4(a5)
                add.w   6(a4),d0
                move.w  2(a3),d2
                add.w   6(a5),d2
                tst.w   d2
                bmi.s   loc_1E202
                move.w  d2,d1
                andi.w  #BYTE_MASK,d1
                asr.w   #BYTE_SHIFT_COUNT,d2
                bra.s   loc_1E210
loc_1E202:
                
                neg.w   d2
                move.w  d2,d1
                andi.w  #BYTE_MASK,d1
                neg.w   d1
                asr.w   #BYTE_SHIFT_COUNT,d2
                neg.w   d2
loc_1E210:
                
                move.w  d1,6(a5)
                add.w   (a4),d2
                cmpi.w  #12,(a5)
                bcs.s   loc_1E224
                addq.w  #1,2(a5)
                lea     $24(a0),a0
loc_1E224:
                
                bra.w   loc_1E268
loc_1E228:
                
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1E25E
                moveq   #2,d6
                jsr     (GenerateRandomNumber).w
                tst.w   d7
                bne.s   byte_1E240
                sndCom  SFX_HIT_1
                bra.s   loc_1E244
byte_1E240:
                
                sndCom  SFX_HIT_2
loc_1E244:
                
                bsr.w   sub_1B8FE
                clr.w   2(a5)
                move.w  #2,4(a5)
                moveq   #2,d6
                jsr     (GenerateRandomNumber).w
                move.w  d7,8(a5)
return_1E25C:
                
                rts
loc_1E25E:
                
                clr.w   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                moveq   #1,d0
                moveq   #1,d2
loc_1E268:
                
                move.l  a4,-(sp)
                moveq   #3,d1
@MoveInvocation_OuterLoop:
                
                moveq   #3,d3
@MoveInvocation_InnerLoop:
                
                move.w  d2,(a4)+
                move.w  #VDPSPELLPROP_V4|VDPSPELLPROP_H4,(a4)+
                move.w  (a0)+,(a4)+
                move.w  d0,(a4)+
                addi.w  #32,d2 
                dbf     d3,@MoveInvocation_InnerLoop
				
                addi.w  #32,d0 
                subi.w  #128,d2 
                dbf     d1,@MoveInvocation_OuterLoop
				
                movea.l (sp)+,a4
                rts

    ; End of function sub_1E160

                ; Reverse invocation layout
layout_Invocation_Mirror:
                dc.w $160|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $170|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $1F0|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $200|VDPTILE_PRIORITY|VDPTILE_MIRROR
				
                dc.w $140|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $150|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $1D0|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $1E0|VDPTILE_PRIORITY|VDPTILE_MIRROR
				
                dc.w $120|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $130|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $1B0|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $1C0|VDPTILE_PRIORITY|VDPTILE_MIRROR
				
                dc.w $100|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $110|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $190|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $1A0|VDPTILE_PRIORITY|VDPTILE_MIRROR
				
                dc.w 00
                dc.w 00
				
				; 
                dc.w $580|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $590|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $6D0|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $6E0|VDPTILE_PRIORITY|VDPTILE_MIRROR
				
                dc.w $560|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $570|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $5F0|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $6C0|VDPTILE_PRIORITY|VDPTILE_MIRROR
				
                dc.w $540|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $550|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $5D0|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $5E0|VDPTILE_PRIORITY|VDPTILE_MIRROR
				
                dc.w $520|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $530|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $5B0|VDPTILE_PRIORITY|VDPTILE_MIRROR
                dc.w $5C0|VDPTILE_PRIORITY|VDPTILE_MIRROR
