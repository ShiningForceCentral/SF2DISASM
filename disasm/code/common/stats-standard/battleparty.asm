
; ASM FILE code\common\stats-standard\battleparty.asm :
; Join or Leave Force and battle party management functions

; =============== S U B R O U T I N E =======================================

; In: d3 = check airborne movetype toggle
;
; Out: d0.w = ally index (or CCR negative-bit set if no one is eligible)


FindFirstLivingBattlePartyMember:
                
                movem.l d1/d7-a0,-(sp)
                bsr.s   UpdateForce
                clr.w   d0
                lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a0
                move.w  ((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w,d7
                bra.s   @FindAlly
@FindAlly_Loop:
                
                move.b  (a0)+,d0
                bsr.w   GetCurrentHp
                beq.s   @FindAlly
                
                tst.w   d3
                beq.s   @Found
                
                bsr.w   IsAirborneMoveType
                bcs.s   @Found
@FindAlly:
                
                dbf     d7,@FindAlly_Loop
@Found:
                
                tst.w   d7
                movem.l (sp)+,d1/d7-a0
                rts

    ; End of function FindFirstLivingBattlePartyMember


; =============== S U B R O U T I N E =======================================

; Determine who is in the force or not based on flags and update RAM lists.


UpdateForce:
                
                movem.l d0-d4/d7/a2-a4,-(sp)
                lea     ((TARGETS_LIST-$1000000)).w,a2
                lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a3
                lea     ((RESERVE_MEMBERS-$1000000)).w,a4
                moveq   #0,d2
                moveq   #0,d3
                moveq   #0,d4
                moveq   #COMBATANT_ALLIES_START,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@MemberStatus_Loop:
                
                move.w  d0,d1
                addi.w  #FORCEMEMBER_JOINED_FLAGS_START,d1
                bsr.w   CheckFlag
                beq.s   @NextMember
                
                move.b  d0,(a2)+
                addq.w  #1,d2
                move.w  d0,d1
                addi.w  #FORCEMEMBER_ACTIVE_FLAGS_START,d1
                bsr.w   CheckFlag
                beq.s   @InReserve
                
                move.b  d0,(a3)+
                addq.w  #1,d3
                bra.s   @NextMember
@InReserve:
                
                move.b  d0,(a4)+
                addq.w  #1,d4
@NextMember:
                
                addq.b  #1,d0
                dbf     d7,@MemberStatus_Loop
                
                move.w  d2,((TARGETS_LIST_LENGTH-$1000000)).w
                move.w  d3,((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w
                move.w  d4,((OTHER_PARTY_MEMBERS_NUMBER-$1000000)).w
                movem.l (sp)+,d0-d4/d7/a2-a4
                rts

    ; End of function UpdateForce


; =============== S U B R O U T I N E =======================================

; In: d0.b = ally index

JoinForceSkipBattleParty:
                
                module
                
                move.w  d1,-(sp)
                move.l  d2,-(sp)
                moveq   #-1,d2          ; set skip join battle party toggle
                bra.s   @Continue
JoinForce:
                
                move.w  d1,-(sp)
                move.l  d2,-(sp)
                clr.w   d2              ; clear skip join battle party toggle
                
@Continue:      clr.w   d1
                move.b  d0,d1
                addi.w  #FORCEMEMBER_JOINED_FLAGS_START,d1
                bsr.w   SetFlag
                tst.w   d2
                bmi.s   @SkipActiveForce
                
                bsr.s   UpdateForce
                cmpi.w  #FORCE_MAX_SIZE,((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w
                bhs.s   @SkipActiveForce
                
                bsr.s   JoinBattleParty 
@SkipActiveForce:
                
                move.l  (sp)+,d2
                move.w  (sp)+,d1
                rts

    ; End of function JoinForce

                modend

; =============== S U B R O U T I N E =======================================

; In: d0.b = ally index


LeaveForce:
                
                move.w  d1,-(sp)
                clr.w   d1
                move.b  d0,d1
                addi.w  #FORCEMEMBER_JOINED_FLAGS_START,d1
                bsr.w   ClearFlag
                bsr.w   UpdateForce
                bsr.s   LeaveBattleParty
                move.w  (sp)+,d1
                rts

    ; End of function LeaveForce


; =============== S U B R O U T I N E =======================================

; Is ally d0.b currently in battle party? Return CCR zero-bit set if true.


IsInBattleParty:
                
                move.w  d1,-(sp)
                move.b  d0,d1
                andi.b  #BYTE_MASK,d1
                addi.w  #FORCEMEMBER_ACTIVE_FLAGS_START,d1
                bsr.w   CheckFlag
                movem.w (sp)+,d1
                rts

    ; End of function IsInBattleParty


; =============== S U B R O U T I N E =======================================

; In: d0.b = ally index


JoinBattleParty:
                
                move.w  d1,-(sp)
                move.b  d0,d1
                andi.b  #BYTE_MASK,d1
                addi.w  #FORCEMEMBER_ACTIVE_FLAGS_START,d1
                bsr.w   SetFlag
                move.w  (sp)+,d1
                rts

    ; End of function JoinBattleParty


; =============== S U B R O U T I N E =======================================

; In: d0.b = ally index


LeaveBattleParty:
                
                move.l  d1,-(sp)
                move.b  d0,d1
                andi.b  #BYTE_MASK,d1
                addi.w  #FORCEMEMBER_ACTIVE_FLAGS_START,d1
                bsr.w   ClearFlag
                moveq   #-1,d1
                bsr.w   SetCombatantX
                move.l  (sp)+,d1
                rts

    ; End of function LeaveBattleParty

