
; ASM FILE code\gameflow\battle\battlescenes\animation\prismlaser.asm :
; 0x1B406..0x1B488 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_PrismLaser:
                
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLTILESET_PRSIM_LASER,d0
                bsr.w   LoadSpellTileset
                moveq   #1,d0
                jsr     sub_1A2F6(pc)   
                cmpi.w  #ENEMYBATTLESPRITE_PRISM_FLOWER,((BATTLESCENE_ENEMYBATTLESPRITE-$1000000)).w 
                                                        ; HARDCODED Prism Flower enemy battle sprite
                bne.s   loc_1B426
                move.w  #40,4(a0) ; a0 references some iteration of SPELLANIMATION_PROPERTIES
                bra.s   loc_1B42C
loc_1B426:
                
                move.w  #5,2(a0)
loc_1B42C:
                
                moveq   #4,d1
loc_1B42E:
                
                moveq   #1,d0
                jsr     sub_1A2F6(pc)   
                moveq   #16,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,2(a0)
                dbf     d1,loc_1B42E
                
                lea     graphic_LaserSphere(pc), a0
                moveq   #38,d0   ; offset to sprite_38
                bsr.w   ConstructSimpleGraphic
                lea     (byte_FFAFC6).l,a1
                moveq   #15,d0
loc_1B456:
                
                move.b  #2,(a1)+
                dbf     d0,loc_1B456
                
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_PRISM_LASER,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((BATTLESCENE_ACTOR_SWITCH_STATE-$1000000)).w
                bra.w   StoreBattlespritePalette

    ; End of function spellanimationSetup_PrismLaser

graphic_LaserSphere:
                vdpSpell 184, 212, SPELLTILE4, V4|H4|VALUE2
