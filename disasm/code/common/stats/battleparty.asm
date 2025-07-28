
; ASM FILE code\common\stats\battleparty.asm :
; 0x9900..0x99DE : Join or Leave Force and battle party management functions

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
                bsr.s   CheckFlag
                beq.w   @NextMember
                move.b  d0,(a2)+
                addq.w  #1,d2
                move.w  d0,d1
                addi.w  #FORCEMEMBER_ACTIVE_FLAGS_START,d1
                bsr.s   CheckFlag
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


JoinForce:
                
                move.l  d1,-(sp)
                clr.w   d1
                move.b  d0,d1
                addi.w  #FORCEMEMBER_JOINED_FLAGS_START,d1
                bsr.w   SetFlag
                bsr.s   UpdateForce     
                cmpi.w  #FORCE_MAX_SIZE,((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w
                bcc.s   @SkipActiveForce
                bsr.w   JoinBattleParty 
@SkipActiveForce:
                
                move.l  (sp)+,d1
                rts

    ; End of function JoinForce


; =============== S U B R O U T I N E =======================================

; In: d0.b = ally index


LeaveForce:
                
                move.l  d1,-(sp)
                move.b  d0,d1
                andi.b  #BYTE_MASK,d1
                addi.w  #FORCEMEMBER_JOINED_FLAGS_START,d1
                bsr.w   ClearFlag
                move.w  #MAP_NULLPOSITION,d1
                jsr     SetCombatantX
                move.l  (sp)+,d1
                rts

    ; End of function LeaveForce


; =============== S U B R O U T I N E =======================================

; Is ally d0.b currently in battle party? Return CCR zero-bit set if true.


IsInBattleParty:
                
                movem.l d1,-(sp)
                move.b  d0,d1
                andi.b  #BYTE_MASK,d1
                addi.w  #FORCEMEMBER_ACTIVE_FLAGS_START,d1
                bsr.w   CheckFlag
                movem.l (sp)+,d1
                rts

    ; End of function IsInBattleParty


; =============== S U B R O U T I N E =======================================

; In: d0.b = ally index


JoinBattleParty:
                
                move.l  d1,-(sp)
                move.b  d0,d1
                andi.b  #BYTE_MASK,d1
                addi.w  #FORCEMEMBER_ACTIVE_FLAGS_START,d1
                bsr.w   SetFlag
                move.l  (sp)+,d1
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
                move.w  #-1,d1
                jsr     SetCombatantX
                move.l  (sp)+,d1
                rts

    ; End of function LeaveBattleParty

