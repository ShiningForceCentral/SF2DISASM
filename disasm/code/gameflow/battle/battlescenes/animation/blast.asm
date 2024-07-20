
; ASM FILE code\gameflow\battle\battlescenes\animation\blast.asm :
; 0x1A928..0x1AA40 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Blast:
                
                bsr.w   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #BLAST_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_BLAST,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     ((byte_FFB532-$1000000)).w,a2
                bclr    #SPELLANIMATION_BIT_MIRRORED,d1
                bne.s   loc_1A96E
				
                move.w  #$D0,(a2) 
                move.w  #$E0,2(a2) 
                cmpi.w  #3,d1
                bcs.s   loc_1A96C
                move.w  #$40,d2 
                move.w  d2,4(a2)
                move.w  #$50,d3 
loc_1A96C:
                
                bra.s   loc_1A98A
loc_1A96E:
                
                move.w  #$138,(a2)
                move.w  #$F0,2(a2) 
                cmpi.w  #3,d1
                bcs.s   loc_1A98A
                move.w  #$A8,d2 
                move.w  d2,4(a2)
                move.w  #$60,d3 
loc_1A98A:
                
                btst    #0,d1
                bne.s   loc_1A996
                move.w  #1,6(a2)
loc_1A996:
                
                moveq   #7,d1
                lea     (byte_FFAFC6).l,a1
loc_1A99E:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.b  d7,2(a0)
                move.b  #2,(a1)+
                dbf     d1,loc_1A99E
				
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$301,2(a0)
                move.b  #2,(byte_FFAFCE).l
                tst.w   4(a2)
                beq.s   loc_1AA06
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.b  #1,3(a0)
                move.w  d3,4(a0)
                addi.w  #$B4,4(a0) 
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.b  #2,3(a0)
                move.b  #$1E,4(a0)
                moveq   #$2F,d0 
                moveq   #3,d1
                lea     graphic_BlastCycloneandDust(pc), a0
                bsr.w   sub_19FAA       
loc_1AA06:
                
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BLAST,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Blast

graphic_BlastCycloneandDust:
                vdpSpell 8, 48, SPELLTILE140, V2|H2|32  ; dust for cyclone
				vdpSpell 0, 0, SPELLTILE44, V4|H4|32
				vdpSpell 0, 32, SPELLTILE60, V4|H4|32
