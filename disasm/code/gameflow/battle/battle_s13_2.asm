
; ASM FILE code\gameflow\battle\battle_s13_2.asm :
; 0x1AC9FC..0x1AD104 : Battle init, terrain, AI stuff to split more properly

; =============== S U B R O U T I N E =======================================

; AI-related
; 
; In: d0.b = 
; Out: d1.w = 


sub_1AC9FC:
                
                movem.l d0/d2-a6,-(sp)
                cmpi.b  #$FF,d0
                bne.s   loc_1ACA0C
                clr.w   d6
                bra.w   loc_1ACA6A
loc_1ACA0C:
                
                move.w  d0,d7
                move.b  #BATTLESPRITESET_SUBSECTION_AI_REGIONS,d1
                bsr.w   GetBattleSpritesetSubsection
                cmp.b   d1,d7
                ble.s   loc_1ACA1E
                bra.w   loc_1ACA6A
loc_1ACA1E:
                
                move.w  d7,d0
                mulu.w  #$C,d0
                adda.w  d0,a0
                move.b  (a0),d0
                cmpi.b  #3,d0
                bne.s   loc_1ACA40
                move.w  2(a0),d2
                move.w  4(a0),d3
                move.w  6(a0),d4
                bsr.w   sub_1ACA72      
                bra.s   loc_1ACA6A
loc_1ACA40:
                
                move.w  2(a0),d2
                move.w  4(a0),d3
                move.w  8(a0),d4
                bsr.w   sub_1ACA72      
                cmpi.b  #0,d6
                beq.s   loc_1ACA5A
                bra.w   loc_1ACA6A
loc_1ACA5A:
                
                move.w  6(a0),d2
                move.w  4(a0),d3
                move.w  8(a0),d4
                bsr.w   sub_1ACA72      
loc_1ACA6A:
                
                move.w  d6,d1
                movem.l (sp)+,d0/d2-a6
                rts

    ; End of function sub_1AC9FC


; =============== S U B R O U T I N E =======================================

; AI-related


sub_1ACA72:
                
                movem.l d0-d5/d7-a6,-(sp)
                move.w  #COMBATANT_ALLIES_COUNTER,d7
                clr.w   d0
loc_1ACA7C:
                
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.s   loc_1ACA88
                bpl.s   loc_1ACA8C
loc_1ACA88:
                
                bra.w   loc_1ACABC
loc_1ACA8C:
                
                jsr     j_GetCombatantX
                tst.b   d1
                bpl.s   loc_1ACA9A
                bra.w   loc_1ACABC
loc_1ACA9A:
                
                clr.w   d5
                move.b  d1,d5
                lsl.w   #8,d5
                jsr     j_GetCombatantY
                tst.b   d1
                bpl.s   loc_1ACAAE
                bra.w   loc_1ACABC
loc_1ACAAE:
                
                or.b    d1,d5
                bsr.w   sub_1ACAD6      
                tst.w   d6
                bne.s   loc_1ACABC
                bra.w   loc_1ACACC
loc_1ACABC:
                
                addi.w  #1,d0
                dbf     d7,loc_1ACA7C
                move.w  #0,d6
                bra.w   loc_1ACAD0
loc_1ACACC:
                
                move.w  #$FFFF,d6
loc_1ACAD0:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function sub_1ACA72


; =============== S U B R O U T I N E =======================================

; AI-related

var_9 = -9
var_8 = -8
var_7 = -7
var_6 = -6
var_5 = -5
var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

sub_1ACAD6:
                
                movem.l d0-d5/d7-a6,-(sp)
                link    a6,#-10
                move.w  d2,d0
                andi.w  #$FF,d0
                move.b  d0,var_2(a6)
                move.w  d2,d0
                lsr.w   #8,d0
                move.b  d0,var_1(a6)
                move.w  d3,d0
                andi.w  #$FF,d0
                move.b  d0,var_4(a6)
                move.w  d3,d0
                lsr.w   #8,d0
                move.b  d0,var_3(a6)
                move.w  d4,d0
                andi.w  #$FF,d0
                move.b  d0,var_6(a6)
                move.w  d4,d0
                lsr.w   #8,d0
                move.b  d0,var_5(a6)
                move.w  d5,d0
                andi.w  #$FF,d0
                move.b  d0,var_8(a6)
                move.w  d5,d0
                lsr.w   #8,d0
                move.b  d0,var_7(a6)
                clr.w   d1
                clr.w   d2
                clr.w   d3
                clr.w   d4
                clr.w   d5
                clr.w   d6
                move.b  var_1(a6),d1
                move.b  var_2(a6),d2
                move.b  var_3(a6),d3
                move.b  var_4(a6),d4
                move.b  var_7(a6),d5
                move.b  var_8(a6),d6
                bsr.w   sub_1ACC26
                cmpi.b  #1,d0
                bne.s   loc_1ACB58
                bra.w   loc_1ACC10
loc_1ACB58:
                
                btst    #0,d0
                beq.s   loc_1ACB62
                bra.w   loc_1ACB7C
loc_1ACB62:
                
                move.b  d0,var_9(a6)
                move.b  var_5(a6),d5
                move.b  var_6(a6),d6
                bsr.w   sub_1ACC26
                cmp.b   var_9(a6),d0
                beq.s   loc_1ACB7C
                bra.w   loc_1ACC1A
loc_1ACB7C:
                
                move.b  var_5(a6),d1
                move.b  var_6(a6),d2
                move.b  var_1(a6),d3
                move.b  var_2(a6),d4
                move.b  var_7(a6),d5
                move.b  var_8(a6),d6
                bsr.w   sub_1ACC26
                cmpi.b  #1,d0
                bne.s   loc_1ACBA2
                bra.w   loc_1ACC10
loc_1ACBA2:
                
                btst    #0,d0
                beq.s   loc_1ACBAC
                bra.w   loc_1ACBC6
loc_1ACBAC:
                
                move.b  d0,var_9(a6)
                move.b  var_3(a6),d5
                move.b  var_4(a6),d6
                bsr.w   sub_1ACC26
                cmp.b   var_9(a6),d0
                beq.s   loc_1ACBC6
                bra.w   loc_1ACC1A
loc_1ACBC6:
                
                move.b  var_5(a6),d1
                move.b  var_6(a6),d2
                move.b  var_3(a6),d3
                move.b  var_4(a6),d4
                move.b  var_7(a6),d5
                move.b  var_8(a6),d6
                bsr.w   sub_1ACC26
                cmpi.b  #1,d0
                bne.s   loc_1ACBEC
                bra.w   loc_1ACC10
loc_1ACBEC:
                
                btst    #0,d0
                beq.s   loc_1ACBF6
                bra.w   loc_1ACC1A
loc_1ACBF6:
                
                move.b  d0,var_9(a6)
                move.b  var_1(a6),d5
                move.b  var_2(a6),d6
                bsr.w   sub_1ACC26
                cmp.b   var_9(a6),d0
                beq.s   loc_1ACC10
                bra.w   loc_1ACC1A
loc_1ACC10:
                
                clr.w   d6
                unlk    a6
                movem.l (sp)+,d0-d5/d7-a6
                rts
loc_1ACC1A:
                
                move.b  #$FF,d6
                unlk    a6
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function sub_1ACAD6


; =============== S U B R O U T I N E =======================================

var_6 = -6
var_5 = -5
var_4 = -4
var_3 = -3
var_2 = -2
var_1 = -1

sub_1ACC26:
                
                movem.l d1-a6,-(sp)
                link    a6,#-6
                move.b  d1,var_1(a6)
                move.b  d2,var_2(a6)
                move.b  d3,var_3(a6)
                move.b  d4,var_4(a6)
                move.b  d5,var_5(a6)
                move.b  d6,var_6(a6)
                move.b  var_2(a6),d1
                move.b  var_4(a6),d0
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                bpl.s   loc_1ACC58
                neg.w   d0
loc_1ACC58:
                
                move.b  var_1(a6),d2
                move.b  var_3(a6),d1
                ext.w   d1
                ext.w   d2
                sub.w   d2,d1
                bpl.s   loc_1ACC6A
                neg.w   d1
loc_1ACC6A:
                
                cmp.w   d0,d1
                bcc.s   loc_1ACC72
                bra.w   loc_1ACD60
loc_1ACC72:
                
                move.b  var_4(a6),d0
                move.b  var_2(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                move.w  d0,d6
                move.b  var_3(a6),d1
                move.b  var_5(a6),d0
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                ext.l   d0
                ext.l   d6
                muls.w  d0,d6
                move.b  var_3(a6),d0
                move.b  var_1(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                bne.s   loc_1ACCAA
                bra.w   loc_1ACD60
loc_1ACCAA:
                
                ext.l   d0
                ext.l   d6
                divs.w  d0,d6
                move.b  var_4(a6),d0
                ext.w   d0
                add.w   d6,d0
                bpl.s   loc_1ACCBE
                bra.w   loc_1ACE22
loc_1ACCBE:
                
                move.b  var_6(a6),d1
                ext.w   d1
                sub.w   d1,d0
                beq.s   loc_1ACCCC
                bra.w   loc_1ACD32
loc_1ACCCC:
                
                move.b  var_1(a6),d0
                move.b  var_3(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACCE0
                bra.w   loc_1ACD08
loc_1ACCE0:
                
                move.b  var_5(a6),d1
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACCEE
                bra.w   loc_1ACD5A
loc_1ACCEE:
                
                move.b  var_5(a6),d0
                move.b  var_3(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACD02
                bra.w   loc_1ACD5A
loc_1ACD02:
                
                eor.w   d0,d0
                bra.w   loc_1ACD32
loc_1ACD08:
                
                move.b  var_3(a6),d0
                move.b  var_5(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACD1C
                bra.w   loc_1ACD5A
loc_1ACD1C:
                
                move.b  var_5(a6),d0
                move.b  var_1(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACD30
                bra.w   loc_1ACD5A
loc_1ACD30:
                
                eor.w   d0,d0
loc_1ACD32:
                
                bne.s   loc_1ACD3C
                bset    #0,d0
                bra.w   loc_1ACD40
loc_1ACD3C:
                
                bclr    #0,d0
loc_1ACD40:
                
                bcc.s   loc_1ACD4A
                bset    #1,d0
                bra.w   loc_1ACD4E
loc_1ACD4A:
                
                bclr    #1,d0
loc_1ACD4E:
                
                andi.w  #3,d0
                unlk    a6
                movem.l (sp)+,d1-a6
                rts
loc_1ACD5A:
                
                move    #1,ccr
                bra.s   loc_1ACD32
loc_1ACD60:
                
                move.b  var_3(a6),d0
                move.b  var_1(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                move.w  d0,d6
                move.b  var_6(a6),d0
                move.b  var_4(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                ext.l   d0
                ext.l   d6
                muls.w  d0,d6
                move.b  var_4(a6),d0
                move.b  var_2(a6),d1
                ext.w   d0
                ext.w   d1
                sub.w   d1,d0
                bne.s   loc_1ACD98
                bra.w   loc_1ACE2A
loc_1ACD98:
                
                ext.l   d0
                ext.l   d6
                divs.w  d0,d6
                move.b  var_3(a6),d0
                ext.w   d0
                add.w   d6,d0
                bpl.s   loc_1ACDAC
                bra.w   loc_1ACE22
loc_1ACDAC:
                
                move.b  var_5(a6),d1
                ext.w   d1
                sub.w   d1,d0
                beq.s   loc_1ACDBA
                bra.w   loc_1ACD32
loc_1ACDBA:
                
                move.b  var_2(a6),d0
                move.b  var_4(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACDCE
                bra.w   loc_1ACDF4
loc_1ACDCE:
                
                move.b  var_6(a6),d1
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACDDA
                bra.s   loc_1ACD5A
loc_1ACDDA:
                
                move.b  var_6(a6),d0
                move.b  var_4(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACDEE
                bra.w   loc_1ACD5A
loc_1ACDEE:
                
                eor.w   d0,d0
                bra.w   loc_1ACD32
loc_1ACDF4:
                
                move.b  var_4(a6),d0
                move.b  var_6(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACE08
                bra.w   loc_1ACD5A
loc_1ACE08:
                
                move.b  var_6(a6),d0
                move.b  var_2(a6),d1
                ext.w   d0
                ext.w   d1
                cmp.w   d1,d0
                bcc.s   loc_1ACE1C
                bra.w   loc_1ACD5A
loc_1ACE1C:
                
                eor.w   d0,d0
                bra.w   loc_1ACD32
loc_1ACE22:
                
                move    #1,ccr
                bra.w   loc_1ACD32
loc_1ACE2A:
                
                ori     #1,ccr
                bra.w   loc_1ACD32

    ; End of function sub_1ACC26


; =============== S U B R O U T I N E =======================================

; In: d0.b = region index


CheckTriggerRegionFlag:
                
                movem.l d0-a6,-(sp)
                clr.w   d1
                move.b  d0,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_CheckFlag
                movem.l (sp)+,d0-a6
                rts

    ; End of function CheckTriggerRegionFlag


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index


UpdateTriggeredRegionsAndAi:
                
                movem.l d0-a6,-(sp)
                move.w  d0,d7           ; save combatant index
                move.w  #BATTLESPRITESET_SUBSECTION_AI_REGIONS,d1
                bsr.w   GetBattleSpritesetSubsection
                tst.w   d1
                bne.s   @Continue
                bra.w   @Done
@Continue:
                
                move.w  d1,d2
                subi.w  #1,d2
                clr.w   d0
@TriggerRegionFlags_Loop:
                
                lea     (BATTLE_REGION_FLAGS_TO_BE_TRIGGERED).l,a0
                move.w  (a0),d1
                btst    d0,d1
                bne.s   @Next
                bsr.w   sub_1AC9FC      
                tst.b   d1
                beq.s   @Next
                clr.w   d1
                move.b  d0,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_SetFlag
@Next:
                
                move.w  (a0),d1
                bset    d0,d1
                move.w  d1,(a0)
                addi.w  #1,d0
                dbf     d2,@TriggerRegionFlags_Loop
                
                move.w  d7,d0           ; restore combatant index
                jsr     j_GetAiRegion
                cmpi.w  #15,d1
                bne.s   @CheckActivationRegion1
                cmpi.w  #15,d2
                bne.s   @CheckActivationRegion1
                bra.w   @Done
@CheckActivationRegion1:
                
                move.b  d0,d7           ; save combatant index
                move.b  d2,d6           ; save AI activation region 2
                move.b  d1,d5           ; save AI activation region 1
                cmpi.b  #15,d5
                bne.s   @IsActivationRegion1Triggered
                bra.w   @CheckActivationRegion2
@IsActivationRegion1Triggered:
                
                clr.w   d1
                move.b  d5,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_CheckFlag
                bne.s   @ActivateAi1
                bra.w   @CheckActivationRegion2
@ActivateAi1:
                
                clr.w   d0
                move.w  d7,d0
                jsr     j_GetAiActivationFlag
                andi.w  #$FFFE,d1
                bset    #0,d1
                jsr     j_SetAiActivationFlag
                bra.w   @Done
@CheckActivationRegion2:
                
                cmpi.b  #15,d6
                bne.s   @IsActivationRegion2Triggered
                bra.w   @Done
@IsActivationRegion2Triggered:
                
                clr.w   d1
                move.b  d6,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_CheckFlag
                bne.s   @ActivateAi2
                bra.w   @Done
@ActivateAi2:
                
                clr.w   d0
                move.w  d7,d0
                jsr     j_GetAiActivationFlag
                andi.w  #$FFFC,d1
                bset    #0,d1
                bset    #1,d1
                jsr     j_SetAiActivationFlag
@Done:
                
                movem.l (sp)+,d0-a6
                rts

    ; End of function UpdateTriggeredRegionsAndAi


; =============== S U B R O U T I N E =======================================


PopulateTargetsListWithRespawningEnemies:
                
                movem.l d0-a6,-(sp)
                move.w  #COMBATANT_ENEMIES_NUMBER,d7
                move.w  #COMBATANT_ENEMIES_START,d4
                move.w  d4,d0
                lea     ((TARGETS_LIST-$1000000)).w,a0
                clr.w   d5
loc_1ACF44:
                
                jsr     j_GetAiActivationFlag
                andi.w  #$F00,d1
                tst.w   d1
                bne.s   loc_1ACF56      
                bra.w   loc_1ACFEA
loc_1ACF56:
                
                cmpi.w  #$200,d1        ; 0x200 - region-triggered spawn - check if triggered and if not spawned yet
                bne.w   loc_1ACF92      
                bsr.w   UpdateEnemyActivationIfDead
                tst.w   d0
                beq.s   loc_1ACF6A
                bra.w   loc_1ACFEA
loc_1ACF6A:
                
                move.w  d4,d0
                jsr     j_GetMaxHp
                tst.w   d1
                beq.s   loc_1ACF7A
                bra.w   loc_1ACFEA
loc_1ACF7A:
                
                move.w  d4,d0
                jsr     j_GetAiActivationFlag
                bsr.w   ResetEnemyStatsForRespawn
                bcs.w   loc_1ACFEA
                move.b  d4,(a0,d5.w)
                addi.w  #1,d5
loc_1ACF92:
                
                cmpi.w  #$100,d1        ; 0x100 - respawn - check if dead
                bne.w   loc_1ACFC0      
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.s   loc_1ACFA8
                bra.w   loc_1ACFEA
loc_1ACFA8:
                
                move.w  d4,d0
                jsr     j_GetAiActivationFlag
                bsr.w   ResetEnemyStatsForRespawn
                bcs.w   loc_1ACFEA
                move.b  d4,(a0,d5.w)
                addi.w  #1,d5
loc_1ACFC0:
                
                cmpi.w  #$300,d1        ; 0x300 - region-triggered respawn - check if dead and triggered
                bne.s   loc_1ACFEA
                bsr.w   UpdateEnemyActivationIfDead
                tst.w   d0
                beq.s   loc_1ACFD2
                bra.w   loc_1ACFEA
loc_1ACFD2:
                
                move.w  d4,d0
                jsr     j_GetAiActivationFlag
                bsr.w   ResetEnemyStatsForRespawn
                bcs.w   loc_1ACFEA
                move.b  d4,(a0,d5.w)
                addi.w  #1,d5
loc_1ACFEA:
                
                addi.w  #1,d4
                move.w  d4,d0
                subq.w  #1,d7
                bne.w   loc_1ACF44
                lea     ((TARGETS_LIST_LENGTH-$1000000)).w,a0
                move.w  d5,(a0)
                movem.l (sp)+,d0-a6
                rts

    ; End of function PopulateTargetsListWithRespawningEnemies


; =============== S U B R O U T I N E =======================================

; In: D0 = character index
;     D4 = character index (same as D0)
; 
; Out: D0 = 0000 if activated and dead, $FFFF if not


UpdateEnemyActivationIfDead:
                
                movem.l d1-a6,-(sp)
                jsr     j_GetCurrentHp
                tst.w   d1
                beq.s   loc_1AD014
                bra.w   loc_1AD07E
loc_1AD014:
                
                jsr     j_GetAiRegion
                cmpi.b  #$F,d1
                beq.s   loc_1AD044
                move.w  d1,d6
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_CheckFlag
                beq.s   loc_1AD044
                move.w  d4,d0
                jsr     j_GetAiActivationFlag
                bset    #0,d1
                jsr     j_SetAiActivationFlag
                bra.w   loc_1AD088
loc_1AD044:
                
                move.w  d4,d0
                jsr     j_GetAiRegion
                cmpi.b  #$F,d2
                beq.w   loc_1AD07E
                move.w  d2,d6
                move.w  d2,d1
                addi.w  #BATTLE_REGION_FLAGS_START,d1
                jsr     j_CheckFlag
                beq.s   loc_1AD07E
                move.w  d4,d0
                jsr     j_GetAiActivationFlag
                bset    #0,d1
                bset    #1,d1
                jsr     j_SetAiActivationFlag
                bra.w   loc_1AD088
loc_1AD07E:
                
                move.w  #$FFFF,d0
                movem.l (sp)+,d1-a6
                rts
loc_1AD088:
                
                clr.w   d0
                movem.l (sp)+,d1-a6
                rts

    ; End of function UpdateEnemyActivationIfDead


; =============== S U B R O U T I N E =======================================


GenerateRandomValueSigned:
                
                movem.l d0-d5/a0-a6,-(sp)
                lea     (RANDOM_WAITING_FOR_INPUT).l,a0
                clr.w   d7
                move.b  (a0),d7
                ext.w   d7
                mulu.w  #541,d7
                addi.w  #12345,d7
                andi.w  #$FF,d7
                move.b  d7,(a0)
                movem.l (sp)+,d0-d5/a0-a6
                rts

    ; End of function GenerateRandomValueSigned


; =============== S U B R O U T I N E =======================================


GenerateRandomNumberUnderD6:
                
                movem.l d0-d5/a0-a6,-(sp)
                move.b  d6,d1
loc_1AD0BA:
                
                bsr.s   GenerateRandomValueSigned
                cmpi.b  #1,d1
                beq.s   loc_1AD0C4
                bpl.s   loc_1AD0C8
loc_1AD0C4:
                
                bra.w   loc_1AD0D4
loc_1AD0C8:
                
                cmp.b   d1,d7
                bcs.s   loc_1AD0CE
                bra.s   loc_1AD0BA
loc_1AD0CE:
                
                movem.l (sp)+,d0-d5/a0-a6
                rts
loc_1AD0D4:
                
                clr.b   d7
                movem.l (sp)+,d0-d5/a0-a6
                rts

    ; End of function GenerateRandomNumberUnderD6


; =============== S U B R O U T I N E =======================================


LoadBattleTerrainData:
                
                movem.l d0-d6/a0-a5,-(sp)
                conditionalPc lea,pt_BattleTerrainData,a0
                nop
                lea     ((CURRENT_BATTLE-$1000000)).w,a1
                clr.l   d1
                move.b  (a1),d1
                lsl.l   #2,d1
                movea.l (a0,d1.w),a0
                lea     (BATTLE_TERRAIN_ARRAY).l,a1
                jsr     (LoadCompressedData).w
                movem.l (sp)+,d0-d6/a0-a5
                rts

    ; End of function LoadBattleTerrainData

