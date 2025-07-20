
; ASM FILE code\gameflow\battle\battlescenes\animation\update\attackspell.asm :
; 0x1E958..0x1EA0C : 

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_AttackSpell:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((SPRITE_38-$1000000)).w,a4
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   loc_1CD70
                addq.w  #1,(a5)
                cmpi.w  #2,(a3)
                beq.w   loc_1E994
                tst.w   (a3)
                bne.w   loc_1E9B4
                lea     table_1CE0C(pc), a0
                moveq   #5,d0
                bsr.w   sub_1B884
                cmpi.w  #$26,(a5) 
                bcs.w   loc_1E9B4
                move.w  #1,(a3)
                bra.w   loc_1E9B4
loc_1E994:
                
                lea     table_1CE2A(pc), a0
                moveq   #5,d0
                bsr.w   sub_1B884
                cmpi.w  #$26,(a5) 
                bcs.w   loc_1E9B4
                clr.w   (a5)
                move.w  #1,(a4)
                subq.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   loc_1CD70
loc_1E9B4:
                
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   loc_1E9D0
                btst    #2,((byte_FFB56F-$1000000)).w
                bne.s   loc_1E9CA
                move.w  #$D0,d3 
                bra.s   loc_1E9CE
loc_1E9CA:
                
                move.w  #$130,d3
loc_1E9CE:
                
                bra.s   loc_1E9E2
loc_1E9D0:
                
                btst    #1,((byte_FFB56F-$1000000)).w
                bne.s   loc_1E9DE
                move.w  #$138,d3
                bra.s   loc_1E9E2
loc_1E9DE:
                
                move.w  #$C8,d3 
loc_1E9E2:
                
                move.w  2(a5),d0
                subq.w  #8,d0
                andi.w  #BYTE_MASK,d0
                move.w  d0,2(a5)
                move.l  #$12003800,d1
                jsr     (sub_1812).w    
                add.w   d3,d2
                move.w  d2,VDPSPRITE_OFFSET_X(a4)
                swap    d2
                addi.w  #$D0,d2 
                move.w  d2,(a4)
                bra.w   loc_1CD10

    ; End of function spellanimationUpdate_AttackSpell

