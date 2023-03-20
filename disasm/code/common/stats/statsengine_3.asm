
; ASM FILE code\common\stats\statsengine_3.asm :
; 0x9736..0x9A3C : Character stats engine

; =============== S U B R O U T I N E =======================================


NewGame:
                
                movem.w d0-d1/d7,-(sp)
                bsr.w   InitializeGameSettings
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@Loop:
                
                moveq   #COMBATANT_ALLIES_COUNTER,d0
                sub.w   d7,d0
                bsr.w   InitializeAllyCombatantEntry
                dbf     d7,@Loop
                
                moveq   #GOLD_STARTING_AMOUNT,d1 ; starting gold value
                bsr.w   SetGold
                moveq   #ALLY_BOWIE,d0  ; starting character
                bsr.w   JoinForce       
                movem.w (sp)+,d0-d1/d7
                rts

    ; End of function NewGame


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index


InitializeAllyCombatantEntry:
                
                movem.l d0-d3/a0-a1,-(sp)
                move.w  d0,d1
                mulu.w  #COMBATANT_ENTRY_REAL_SIZE,d1
                lea     ((COMBATANT_ENTRIES-$1000000)).w,a1
                adda.w  d1,a1
                movea.l (p_tbl_AllyNames).l,a0
                move.w  d0,d1
                subq.w  #1,d1
                blt.s   @GetNameCounter
@FindName_Loop:
                
                clr.w   d2
                move.b  (a0)+,d2
                lea     (a0,d2.w),a0
                dbf     d1,@FindName_Loop
@GetNameCounter:
                
                move.b  (a0)+,d2
                moveq   #ALLYNAME_MAX_LENGTH,d3
                sub.w   d2,d3
                subq.w  #1,d2
                blt.s   @GetRemainingNameBytesCounter
@LoadName_Loop:
                
                move.b  (a0)+,(a1)+
                dbf     d2,@LoadName_Loop
@GetRemainingNameBytesCounter:
                
                subq.w  #1,d3
                blt.s   @LoadAllyStartData
@ClearRemainingNameBytes_Loop:
                
                clr.b   (a1)+
                dbf     d3,@ClearRemainingNameBytes_Loop
@LoadAllyStartData:
                
                move.w  d0,d1
                mulu.w  #ALLYSTARTDEF_ENTRY_SIZE,d1
                movea.l (p_tbl_AllyStartDefs).l,a0
                adda.w  d1,a0
                suba.w  #ALLYNAME_MAX_LENGTH,a1
                move.b  (a0)+,d1
                move.b  d1,COMBATANT_OFFSET_CLASS(a1)
                move.b  (a0)+,d2
                move.b  d2,COMBATANT_OFFSET_LEVEL(a1)
                ext.w   d2
                move.w  d2,-(sp)        ; -> push starting level
                clr.w   d3
                move.b  (a0)+,d3
                move.w  d3,COMBATANT_OFFSET_ITEM_0(a1)
                move.b  (a0)+,d3
                move.w  d3,COMBATANT_OFFSET_ITEM_1(a1)
                move.b  (a0)+,d3
                move.w  d3,COMBATANT_OFFSET_ITEM_2(a1)
                move.b  (a0)+,d3
                move.w  d3,COMBATANT_OFFSET_ITEM_3(a1)
                move.l  #$3F3F3F3F,COMBATANT_OFFSET_SPELLS(a1) ; spell entries default to nothing
                bsr.w   LoadAllyClassData
                move.w  (sp)+,d1        ; D1 <- pull starting level
                bsr.w   InitializeAllyStats
                bsr.w   ApplyStatusEffectsAndItemsOnStats
                movem.l (sp)+,d0-d3/a0-a1
                rts

    ; End of function InitializeAllyCombatantEntry


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index
;     D1 = class index


LoadAllyClassData:
                
                movem.l d0-d1/a0-a1,-(sp)
                mulu.w  #COMBATANT_ENTRY_REAL_SIZE,d0
                lea     ((COMBATANT_ENTRIES-$1000000)).w,a1
                adda.w  d0,a1
                movea.l (p_tbl_ClassDefs).l,a0
                andi.w  #CLASS_MASK_INDEX,d1
                mulu.w  #CLASSDEF_ENTRY_SIZE,d1
                adda.w  d1,a0
                move.b  (a0)+,COMBATANT_OFFSET_MOV_BASE(a1)
                move.b  (a0)+,COMBATANT_OFFSET_RESIST_BASE(a1)
                move.b  (a0)+,COMBATANT_OFFSET_RESIST_BASE_LOW_BYTE(a1)
                move.b  (a0)+,COMBATANT_OFFSET_MOVETYPE_AND_AI(a1)
                move.b  (a0)+,COMBATANT_OFFSET_PROWESS_BASE(a1)
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function LoadAllyClassData


; =============== S U B R O U T I N E =======================================


Promote:
                
                movem.w d1,-(sp)
                bsr.w   GetClass        
                bsr.s   LoadAllyClassData
                bsr.w   ApplyStatusEffectsAndItemsOnStats
                movem.w (sp)+,d1
                rts

    ; End of function Promote


; =============== S U B R O U T I N E =======================================

; Clear all flags and important game variables.


InitializeGameSettings:
                
                movem.l d0/d7-a0,-(sp)
                moveq   #LONGWORD_GAMEFLAGS_INITVALUE,d0
                lea     ((GAME_FLAGS-$1000000)).w,a0
                moveq   #LONGWORD_GAMEFLAGS_COUNTER,d7
@ClearGameFlags_Loop:
                
                move.l  d0,(a0)+
                dbf     d7,@ClearGameFlags_Loop
                
                lea     ((DEALS_ITEMS-$1000000)).w,a0
                moveq   #LONGWORD_DEALS_COUNTER,d7
@ClearDealsItems_Loop:
                
                move.l  d0,(a0)+
                dbf     d7,@ClearDealsItems_Loop
                
                move.l  #LONGWORD_CARAVAN_INITVALUE,d0
                lea     ((CARAVAN_ITEMS-$1000000)).w,a0
                moveq   #LONGWORD_CARAVAN_COUNTER,d7
@ClearCaravanItems_Loop:
                
                move.l  d0,(a0)+
                dbf     d7,@ClearCaravanItems_Loop
                
                moveq   #0,d0
                move.w  d0,((CARAVAN_ITEMS_NUMBER-$1000000)).w
                move.w  d0,((CURRENT_GOLD-$1000000)).w
                move.b  d0,((PLAYER_TYPE-$1000000)).w
                move.b  d0,((CURRENT_MAP-$1000000)).w
                move.b  d0,((CURRENT_BATTLE-$1000000)).w
                move.b  d0,((DISPLAY_BATTLE_MESSAGES-$1000000)).w
                move.b  d0,((EGRESS_MAP-$1000000)).w
                move.l  #359999,((SPECIAL_BATTLE_RECORD-$1000000)).w
                move.b  #2,((MESSAGE_SPEED-$1000000)).w
                move.l  #$FFFFFFFF,((FOLLOWERS_LIST-$1000000)).w
                move.w  #$FFFF,((byte_FFAF26-$1000000)).w
                movem.l (sp)+,d0/d7-a0
                rts

    ; End of function InitializeGameSettings


; =============== S U B R O U T I N E =======================================


CheckFlag:
                
                movem.l d0-d1/a0,-(sp)
                bsr.w   GetFlag         
                and.b   (a0),d0
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function CheckFlag


; =============== S U B R O U T I N E =======================================


SetFlag:
                
                movem.l d0-d1/a0,-(sp)
                bsr.w   GetFlag         
                or.b    d0,(a0)
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function SetFlag


; =============== S U B R O U T I N E =======================================


ClearFlag:
                
                movem.l d0-d1/a0,-(sp)
                bsr.w   GetFlag         
                eori.b  #$FF,d0
                and.b   d0,(a0)
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function ClearFlag


; =============== S U B R O U T I N E =======================================

; flag bit check pattern based on bit number D1 -> D0


GetFlag:
                
                andi.l  #FLAG_MASK,d1
                divu.w  #8,d1           ; get the byte in which the flag is stored
                lea     ((GAME_FLAGS-$1000000)).w,a0 ; go to the flag location in RAM
                adda.w  d1,a0           ; go to the concerned byte
                swap    d1
                moveq   #$FFFFFF80,d0
                lsr.b   d1,d0
                rts

    ; End of function GetFlag


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
                moveq   #0,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@MemberStatus_Loop:
                
                move.w  d0,d1
                addi.w  #FORCEMEMBER_JOINED_FLAGS_START,d1
                bsr.s   CheckFlag
                beq.w   @CheckNextMember
                move.b  d0,(a2)+
                addq.w  #1,d2
                move.w  d0,d1
                addi.w  #FORCEMEMBER_ACTIVE_FLAGS_START,d1
                bsr.s   CheckFlag
                beq.s   @InReserve
                move.b  d0,(a3)+
                addq.w  #1,d3
                bra.s   @CheckNextMember
@InReserve:
                
                move.b  d0,(a4)+
                addq.w  #1,d4
@CheckNextMember:
                
                addq.b  #1,d0
                dbf     d7,@MemberStatus_Loop
                
                move.w  d2,((TARGETS_LIST_LENGTH-$1000000)).w
                move.w  d3,((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w
                move.w  d4,((OTHER_PARTY_MEMBERS_NUMBER-$1000000)).w
                movem.l (sp)+,d0-d4/d7/a2-a4
                rts

    ; End of function UpdateForce


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index


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

; In: D0 = ally index


LeaveForce:
                
                move.l  d1,-(sp)
                move.b  d0,d1
                andi.b  #$FF,d1
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
                andi.b  #$FF,d1
                addi.w  #FORCEMEMBER_ACTIVE_FLAGS_START,d1
                bsr.w   CheckFlag
                movem.l (sp)+,d1
                rts

    ; End of function IsInBattleParty


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index


JoinBattleParty:
                
                move.l  d1,-(sp)
                move.b  d0,d1
                andi.b  #$FF,d1
                addi.w  #FORCEMEMBER_ACTIVE_FLAGS_START,d1
                bsr.w   SetFlag
                move.l  (sp)+,d1
                rts

    ; End of function JoinBattleParty


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index


LeaveBattleParty:
                
                move.l  d1,-(sp)
                move.b  d0,d1
                andi.b  #$FF,d1
                addi.w  #FORCEMEMBER_ACTIVE_FLAGS_START,d1
                bsr.w   ClearFlag
                move.w  #$FFFF,d1
                jsr     SetCombatantX
                move.l  (sp)+,d1
                rts

    ; End of function LeaveBattleParty


; =============== S U B R O U T I N E =======================================

; In: D1 = item index
; 
; Out: D2 = number of item index in deals


GetDealsItemAmount:
                
                movem.l d0-d1/a0,-(sp)
                bsr.w   GetDealsItemInfo
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function GetDealsItemAmount


; =============== S U B R O U T I N E =======================================

; In: D1 = item index


AddItemToDeals:
                
                movem.l d0-d2/a0,-(sp)
                bsr.w   GetDealsItemInfo
                cmpi.b  #DEALS_MAX_NUMBER_PER_ITEM,d2
                beq.s   @DumpItem
                add.b   d0,(a0)
@DumpItem:
                
                movem.l (sp)+,d0-d2/a0
                rts

    ; End of function AddItemToDeals


; =============== S U B R O U T I N E =======================================

; In: D1 = item index


RemoveItemFromDeals:
                
                movem.l d0-d2/a0,-(sp)
                bsr.w   GetDealsItemInfo
                tst.b   d2
                beq.s   @Skip
                sub.b   d0,(a0)
@Skip:
                
                movem.l (sp)+,d0-d2/a0
                rts

    ; End of function RemoveItemFromDeals


; =============== S U B R O U T I N E =======================================

; In: D1 = item index
; 
; Out: A0 = RAM address of deals slot
;      D0 = amount to add to deals slot (0x10 or 0x01)
;      D2 = number of item index in deals


GetDealsItemInfo:
                
                andi.l  #ITEMENTRY_MASK_INDEX,d1
                lea     ((DEALS_ITEMS-$1000000)).w,a0
                divu.w  #2,d1
                adda.w  d1,a0
                move.b  (a0),d2
                btst    #DEALS_BIT_REMAINDER,d1 ; since deals are stacked 2 to a byte, this is the bit index that stores whether we are an even or odd item index
                bne.s   @OddIndex
                lsr.b   #BITS_HALFBYTE,d2
                moveq   #DEALS_ADD_AMOUNT_EVEN,d0
                bra.s   @Return
@OddIndex:
                
                andi.b  #DEALS_MAX_NUMBER_PER_ITEM,d2
                moveq   #DEALS_ADD_AMOUNT_ODD,d0
@Return:
                
                rts

    ; End of function GetDealsItemInfo

