
; ASM FILE code\common\stats\statsengine_3.asm :
; 0x9736..0x9A9A : Character stats engine

; =============== S U B R O U T I N E =======================================


NewGame:
                
                movem.w d0-d1/d7,-(sp)
                bsr.w   InitGameSettings
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@Loop:
                
                moveq   #COMBATANT_ALLIES_COUNTER,d0
                sub.w   d7,d0
                bsr.w   InitAllyCombatantEntry
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


InitAllyCombatantEntry:
                
                movem.l d0-d3/a0-a1,-(sp)
                move.w  d0,d1
                mulu.w  #COMBATANT_ENTRY_SIZE,d1
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
                readStartingItemEntry
                move.w  d3,COMBATANT_OFFSET_ITEM_0(a1)
                readStartingItemEntry
                move.w  d3,COMBATANT_OFFSET_ITEM_1(a1)
                readStartingItemEntry
                move.w  d3,COMBATANT_OFFSET_ITEM_2(a1)
                readStartingItemEntry
                move.w  d3,COMBATANT_OFFSET_ITEM_3(a1)
                move.l  #$3F3F3F3F,COMBATANT_OFFSET_SPELLS_START(a1) 
                                                        ; spell entries default to nothing
                bsr.w   LoadAllyClassData
                move.w  (sp)+,d1        ; D1 <- pull starting level
                bsr.w   InitAllyStats   
                bsr.w   ApplyStatusEffectsAndItemsOnStats
                movem.l (sp)+,d0-d3/a0-a1
                rts

    ; End of function InitAllyCombatantEntry


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index
;     D1 = class index


LoadAllyClassData:
                
                movem.l d0-d1/a0-a1,-(sp)
                mulu.w  #COMBATANT_ENTRY_SIZE,d0
                lea     ((COMBATANT_ENTRIES-$1000000)).w,a1
                adda.w  d0,a1
                movea.l (p_tbl_ClassDefs).l,a0
                andi.w  #CLASS_MASK_INDEX,d1
                mulu.w  #CLASSDEF_ENTRY_SIZE,d1
                adda.w  d1,a0
                move.b  (a0)+,COMBATANT_OFFSET_MOV_BASE(a1)
                move.b  (a0)+,COMBATANT_OFFSET_RESIST_BASE1(a1)
                move.b  (a0)+,COMBATANT_OFFSET_RESIST_BASE2(a1)
                move.b  (a0)+,COMBATANT_OFFSET_MOVETYPE(a1)
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


InitGameSettings:
                
                movem.l d0/d7-a0,-(sp)
                moveq   #0,d0
                lea     ((GAME_FLAGS-$1000000)).w,a0
                moveq   #$1F,d7
loc_9850:
                
                move.l  d0,(a0)+
                dbf     d7,loc_9850
                lea     ((DEALS_ITEMS-$1000000)).w,a0
                moveq   #$F,d7
loc_985C:
                
                move.l  d0,(a0)+
                dbf     d7,loc_985C
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    move.l  #$FFFFFFFF,d0
                else
                    move.l  #$7F7F7F7F,d0
                endif
                lea     ((CARAVAN_ITEMS-$1000000)).w,a0
                moveq   #$F,d7
loc_986E:
                
                move.l  d0,(a0)+
                dbf     d7,loc_986E
                moveq   #0,d0
                move.w  d0,((CARAVAN_ITEMS_NUMBER-$1000000)).w
                move.w  d0,((CURRENT_GOLD-$1000000)).w
                move.b  d0,((PLAYER_TYPE-$1000000)).w
                move.b  d0,((CURRENT_MAP-$1000000)).w
                move.b  d0,((CURRENT_BATTLE-$1000000)).w
                move.b  d0,((DISPLAY_BATTLE_MESSAGES-$1000000)).w
                move.b  d0,((EGRESS_MAP_INDEX-$1000000)).w
                move.l  #359999,((SPECIAL_BATTLE_RECORD-$1000000)).w
                move.b  #2,((MESSAGE_SPEED-$1000000)).w
                move.l  #$FFFFFFFF,((FOLLOWERS_LIST-$1000000)).w
                move.w  #$FFFF,((byte_FFAF26-$1000000)).w
                movem.l (sp)+,d0/d7-a0
                rts

    ; End of function InitGameSettings


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

; determine who is in the force or not based on flags and update RAM lists


UpdateForce:
                
                movem.l d0-d4/d7/a2-a4,-(sp)
                lea     ((TARGETS_LIST-$1000000)).w,a2
                lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a3
                lea     ((RESERVE_MEMBERS-$1000000)).w,a4
                moveq   #0,d2
                moveq   #0,d3
                moveq   #0,d4
                moveq   #0,d0
                moveq   #COMBATANT_ALLIES_COUNTER,d7 ; HARDCODED number of allies
loc_991A:
                
                move.w  d0,d1
                addi.w  #0,d1
                bsr.s   CheckFlag
                beq.w   loc_993E
                move.b  d0,(a2)+
                addq.w  #1,d2
                move.w  d0,d1
                addi.w  #$20,d1 
                bsr.s   CheckFlag
                beq.s   loc_993A
                move.b  d0,(a3)+
                addq.w  #1,d3
                bra.s   loc_993E
loc_993A:
                
                move.b  d0,(a4)+
                addq.w  #1,d4
loc_993E:
                
                addq.b  #1,d0
                dbf     d7,loc_991A
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
                addi.w  #0,d1
                bsr.w   SetFlag
                bsr.s   UpdateForce     
                cmpi.w  #FORCE_MAX_SIZE,((BATTLE_PARTY_MEMBERS_NUMBER-$1000000)).w
                bcc.s   loc_9972
                bsr.w   JoinBattleParty 
loc_9972:
                
                move.l  (sp)+,d1
                rts

    ; End of function JoinForce


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index


LeaveForce:
                
                move.l  d1,-(sp)
                move.b  d0,d1
                andi.b  #$FF,d1
                addi.w  #0,d1
                bsr.w   ClearFlag
                move.w  #MAP_NULLPOSITION,d1
                jsr     SetXPos
                move.l  (sp)+,d1
                rts

    ; End of function LeaveForce


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index


IsInBattleParty:
                
                movem.l d1,-(sp)
                move.b  d0,d1
                andi.b  #$FF,d1
                addi.w  #FLAG_COUNT_FORCEMEMBERS_JOINED,d1
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
                addi.w  #FLAG_COUNT_FORCEMEMBERS_JOINED,d1
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
                addi.w  #FLAG_COUNT_FORCEMEMBERS_JOINED,d1
                bsr.w   ClearFlag
                move.w  #$FFFF,d1
                jsr     SetXPos
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
                beq.s   loc_99FC
                add.b   d0,(a0)
loc_99FC:
                
                movem.l (sp)+,d0-d2/a0
                rts

    ; End of function AddItemToDeals


; =============== S U B R O U T I N E =======================================

; In: D1 = item index


RemoveItemFromDeals:
                
                movem.l d0-d2/a0,-(sp)
                bsr.w   GetDealsItemInfo
                tst.b   d2
                beq.s   loc_9A10
                sub.b   d0,(a0)
loc_9A10:
                
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
                btst    #DEALS_BIT_REMAINDER,d1
                bne.s   loc_9A34
                lsr.b   #BITS_HALFBYTE,d2
                moveq   #DEALS_ADD_AMOUNT_ODD,d0
                bra.s   return_9A3A
loc_9A34:
                
                andi.b  #DEALS_MAX_NUMBER_PER_ITEM,d2
                moveq   #DEALS_ADD_AMOUNT_EVEN,d0
return_9A3A:
                
                rts

    ; End of function GetDealsItemInfo


; =============== S U B R O U T I N E =======================================

; In: D1 = item index (only the actual index is used, the status bits are cut out)


AddItemToCaravan:
                
                movem.l d0-d1/a0,-(sp)
                moveq   #CARAVAN_MAX_ITEMS_NUMBER_MINUS_ONE,d0
                cmp.w   ((CARAVAN_ITEMS_NUMBER-$1000000)).w,d0
                bcs.s   @Skip           ; skip adding item if no room
                lea     ((CARAVAN_ITEMS-$1000000)).w,a0
                move.w  ((CARAVAN_ITEMS_NUMBER-$1000000)).w,d0
                andi.w  #ITEMENTRY_MASK_INDEX,d1
                move.b  d1,(a0,d0.w)
                addq.w  #1,((CARAVAN_ITEMS_NUMBER-$1000000)).w
@Skip:
                
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function AddItemToCaravan


; =============== S U B R O U T I N E =======================================


RemoveItemFromCaravan:
                
                movem.l d0/d7-a1,-(sp)
                moveq   #0,d0
                lea     ((CARAVAN_ITEMS-$1000000)).w,a0
                movea.l a0,a1
                move.w  ((CARAVAN_ITEMS_NUMBER-$1000000)).w,d7
                subq.w  #1,d7
                bcs.w   loc_9A94
loc_9A78:
                
                cmp.w   d0,d1
                bne.s   loc_9A84
                addq.l  #1,a1
                subq.w  #1,((CARAVAN_ITEMS_NUMBER-$1000000)).w
                bra.s   loc_9A86
loc_9A84:
                
                move.b  (a1)+,(a0)+
loc_9A86:
                
                addq.w  #1,d0
                dbf     d7,loc_9A78
                cmpa.l  a1,a0
                beq.s   loc_9A94
                move.b  #ITEM_NOTHING,(a0)
loc_9A94:
                
                movem.l (sp)+,d0/d7-a1
                rts

    ; End of function RemoveItemFromCaravan

