
; ASM FILE code\gameflow\battle\battlescenes\animation\update\freeze.asm :
; 0x1BE9E..0x1C248 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Freeze:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                moveq   #38,d0 
                btst    #2,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.w   loc_1BF5C
                tst.w   (a5)
                beq.w   loc_1BF54
                tst.w   ((byte_FFB404-$1000000)).w
                bne.s   loc_1BEC8
                clr.l   (a5)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1BF54
loc_1BEC8:
                
                subq.w  #1,(a5)
                bne.w   loc_1BF54
                move.w  #2,(a5)
                tst.w   2(a5)
                bne.w   loc_1BF1E
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1BEEC
                move.w  #184,d1 
                move.w  #200,d2 
                bra.s   loc_1BEF4
loc_1BEEC:
                
                move.w  #288,d1
                move.w  #216,d2 
loc_1BEF4:
                
                moveq   #48,d6 
                jsr     (GenerateRandomNumber).w
                add.w   d7,d2
                move.w  d2,(a4)
                move.w  #VDPSPELLPROP_V3|VDPSPELLPROP_H1,VDPSPRITE_OFFSET_SIZE(a4)
                move.w  #VDPTILE_SPELLTILE81|VDPTILE_PALETTE3|VDPTILE_PRIORITY,VDPSPRITE_OFFSET_TILE(a4)
                moveq   #48,d6 
                jsr     (GenerateRandomNumber).w
                add.w   d7,d1
                move.w  d1,VDPSPRITE_OFFSET_X(a4)
                addq.w  #1,2(a5)
                bra.w   loc_1BF54
loc_1BF1E:
                
                cmpi.w  #3,2(a5)
                bcc.w   loc_1BF42
                move.w  #VDPTILE_SPELLTILE81|VDPTILE_PALETTE3|VDPTILE_PRIORITY,d1
                btst    #0,3(a5)
                beq.s   loc_1BF36
                addq.w  #3,d1
loc_1BF36:
                
                move.w  d1,VDPSPRITE_OFFSET_TILE(a4)
                addq.w  #1,2(a5)
                bra.w   loc_1BF54
loc_1BF42:
                
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                clr.w   2(a5)
loc_1BF54:
                
                lea     12(a5),a5
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                addq.w  #1,d0
loc_1BF5C:
                
                lea     ((byte_FFB532-$1000000)).w,a3
                addq.b  #1,12(a3)
                move.b  12(a3),13(a3)
                lea     (table_1C19A-42)(pc), a2
                lea     (table_1C18A-4)(pc), a1
                move.b  ((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w,d2
                andi.w  #7,d2
                move.w  d2,d1
                mulu.w  #42,d2 
                adda.w  d2,a2
                lsl.w   #2,d1
                adda.w  d1,a1
                moveq   #23,d1
loc_1BF88:
                
                movem.w d0-d1,-(sp)
                tst.w   (a5)
                beq.w   loc_1C136
                addq.w  #1,(a5)
                tst.b   2(a5)
                bne.w   loc_1BFF4
                lea     (byte_FFAFA0).l,a0
                moveq   #40,d6 
                jsr     (GenerateRandomNumber).w
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   loc_1BFBC
                addi.w  #140,d7 
                move.b  #1,(a0,d0.w)
                bra.s   loc_1BFC6
loc_1BFBC:
                
                addi.w  #156,d7 
                move.b  #2,(a0,d0.w)
loc_1BFC6:
                
                move.w  d7,10(a5)
                move.w  d7,(a4)
                move.l  (a1),VDPSPRITE_OFFSET_SIZE(a4)
                moveq   #8,d6
                jsr     (GenerateRandomNumber).w
                add.w   (a3),d7
                move.w  d7,VDPSPRITE_OFFSET_X(a4)
                addq.b  #1,2(a5)
                move.b  3(a3),3(a5)
                move.w  4(a3),4(a5)
                clr.l   6(a5)
                bra.w   loc_1C136
loc_1BFF4:
                
                cmpi.b  #1,2(a5)
                bne.w   loc_1C0BA
                cmpi.w  #28,(a5)
                bcs.s   loc_1C024
                addq.b  #1,2(a5)
                move.w  #256,d6
                jsr     (GenerateRandomNumber).w
                move.b  d7,3(a5)
                clr.w   6(a5)
                move.w  (a4),8(a5)
                addq.w  #8,8(a5)
                bra.w   loc_1C136
loc_1C024:
                
                clr.w   d0
                move.b  3(a5),d0
                move.b  8(a3),d1
                ext.w   d1
                add.w   d1,d0
                andi.w  #BYTE_MASK,d0
                move.b  d0,3(a5)
                jsr     (sub_179C).w    
                lsl.w   #3,d1
                add.w   6(a5),d1
                tst.w   d1
                bmi.s   loc_1C052
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1C060
loc_1C052:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1C060:
                
                move.w  d0,6(a5)
                add.w   d1,VDPSPRITE_OFFSET_X(a4)
                swap    d1
                lsl.w   #3,d1
                add.w   8(a5),d1
                tst.w   d1
                bmi.s   loc_1C07E
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                bra.s   loc_1C08C
loc_1C07E:
                
                neg.w   d1
                move.w  d1,d0
                andi.w  #BYTE_MASK,d0
                neg.w   d0
                asr.w   #BYTE_SHIFT_COUNT,d1
                neg.w   d1
loc_1C08C:
                
                move.w  d0,8(a5)
                add.w   d1,10(a5)
                cmpi.w  #4,(a5)
                bne.w   loc_1C136
                tst.w   ((byte_FFB404-$1000000)).w
                beq.w   loc_1C136
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                cmpi.w  #-1,d0
                beq.w   loc_1C136
                
                addq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1C136
loc_1C0BA:
                
                lea     (byte_FFAFA0).l,a0
                adda.w  d0,a0
                clr.w   d0
                move.b  3(a5),d0
                move.b  9(a3),d1
                ext.w   d1
                add.w   d1,d0
                andi.w  #BYTE_MASK,d0
                move.b  d0,3(a5)
                move.w  4(a5),d1
                lsr.w   #2,d1
                swap    d1
                move.w  4(a5),d1
                jsr     (sub_1812).w    
                add.w   10(a3),d2
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                swap    d2
                subq.w  #8,8(a5)
                add.w   8(a5),d2
                move.w  d2,10(a5)
                cmpi.b  #128,3(a5)
                bcc.s   loc_1C10C
                move.b  #0,(a0)
                bra.s   loc_1C110
loc_1C10C:
                
                move.b  #2,(a0)
loc_1C110:
                
                move.w  6(a3),d0
                add.w   d0,4(a5)
                cmpi.w  #46,(a5) 
                bcs.s   loc_1C136
                clr.l   (a5)
                move.w  #1,(a4)
                clr.l   VDPSPRITE_OFFSET_SIZE(a4)
                move.w  #1,VDPSPRITE_OFFSET_X(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                clr.b   ((byte_FFB588-$1000000)).w
loc_1C136:
                
                bchg    #0,$D(a3)
                bne.s   loc_1C144
                move.w  #1,(a4)
                bra.s   loc_1C148
loc_1C144:
                
                move.w  10(a5),(a4)
loc_1C148:
                
                lea     (a2),a0
                moveq   #6,d0
                bsr.w   sub_1B884
                movem.w (sp)+,d0-d1
                addq.w  #1,d0
                lea     12(a5),a5
                addq.w  #VDP_SPRITE_ENTRY_SIZE,a4
                dbf     d1,loc_1BF88
                
                subq.b  #1,14(a3)
                bne.s   loc_1C178
                sndCom  SFX_TINKLING
                moveq   #14,d6
                jsr     (GenerateRandomNumber).w
loc_1C170:
                
                addi.w  #10,d7
                move.b  d7,14(a3)
loc_1C178:
                
                lea     table_1C242(pc), a0
                bsr.w   sub_1B8B2
                tst.b   ((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1C184:
                
                beq.w   ReinitializeSceneAfterSpell
                rts

    ; End of function spellanimationUpdate_Freeze

table_1C18A:    dc.w VDPSPELLPROP_V1|VDPSPELLPROP_H1,VDPTILE_SPELLTILE1|VDPTILE_PALETTE3|VDPTILE_PRIORITY
                dc.w VDPSPELLPROP_V1|VDPSPELLPROP_H1,VDPTILE_SPELLTILE2|VDPTILE_PALETTE3|VDPTILE_PRIORITY
                dc.w VDPSPELLPROP_V2|VDPSPELLPROP_H2,VDPTILE_SPELLTILE3|VDPTILE_PALETTE3|VDPTILE_PRIORITY
                dc.w VDPSPELLPROP_V3|VDPSPELLPROP_H3,VDPTILE_SPELLTILE7|VDPTILE_PALETTE3|VDPTILE_PRIORITY
				
table_1C19A:    ; Level 1
                dc.w 8
                dc.w VDPSPELLPROP_V1|VDPSPELLPROP_H1
                dc.w 40
				
                dc.w 13
                dc.w VDPSPELLPROP_V1|VDPSPELLPROP_H1
                dc.w 1
				
                dc.w 18
                dc.w VDPSPELLPROP_V1|VDPSPELLPROP_H1
                dc.w 41
				
                dc.w 23
                dc.w VDPSPELLPROP_V2|VDPSPELLPROP_H2
                dc.w 2
				
                dc.w 28
                dc.w VDPSPELLPROP_V2|VDPSPELLPROP_H2
                dc.w 42
				
                dc.w 34
                dc.w VDPSPELLPROP_V3|VDPSPELLPROP_H3
                dc.w 6
				
                dc.w 40
                dc.w VDPSPELLPROP_V3|VDPSPELLPROP_H3
                dc.w 46
				
                ; Level 2
                dc.w 8
                dc.w VDPSPELLPROP_V1|VDPSPELLPROP_H1
                dc.w 41
				
                dc.w 13
                dc.w VDPSPELLPROP_V2|VDPSPELLPROP_H2
                dc.w 2
				
                dc.w 18
                dc.w VDPSPELLPROP_V2|VDPSPELLPROP_H2
                dc.w 42
				
                dc.w 23
                dc.w VDPSPELLPROP_V3|VDPSPELLPROP_H3
                dc.w 6
				
                dc.w 28
                dc.w VDPSPELLPROP_V3|VDPSPELLPROP_H3
                dc.w 46
				
                dc.w 34
                dc.w VDPSPELLPROP_V3|VDPSPELLPROP_H3
                dc.w 15
				
                dc.w 40
                dc.w VDPSPELLPROP_V3|VDPSPELLPROP_H3
                dc.w 55
				
                ; Level 3
                dc.w 8
                dc.w VDPSPELLPROP_V2|VDPSPELLPROP_H2
                dc.w 42
				
                dc.w 13
                dc.w VDPSPELLPROP_V3|VDPSPELLPROP_H3
                dc.w 6
				
                dc.w 18
                dc.w VDPSPELLPROP_V3|VDPSPELLPROP_H3
                dc.w 46
				
                dc.w 23
                dc.w VDPSPELLPROP_V3|VDPSPELLPROP_H3
                dc.w 15
				
                dc.w 28
                dc.w VDPSPELLPROP_V3|VDPSPELLPROP_H3
                dc.w 55
				
                dc.w 34
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 24
				
                dc.w 40
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 64
				
                ; Level 4
                dc.w 8
                dc.w VDPSPELLPROP_V3|VDPSPELLPROP_H3
                dc.w 46
				
                dc.w 13
                dc.w VDPSPELLPROP_V3|VDPSPELLPROP_H3
                dc.w 15
				
                dc.w 18
                dc.w VDPSPELLPROP_V3|VDPSPELLPROP_H3
                dc.w 55
				
                dc.w 23
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 24
				
                dc.w 28
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 64
				
                dc.w 34
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 24
				
                dc.w 40
                dc.w VDPSPELLPROP_V4|VDPSPELLPROP_H4
                dc.w 64
				
table_1C242:    dc.w $E44
                dc.w 8
                dc.w 1
