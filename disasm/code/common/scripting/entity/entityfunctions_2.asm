
; ASM FILE code\common\scripting\entity\entityfunctions_2.asm :
; 0x44B4A..0x44DE2 : Entity functions

; =============== S U B R O U T I N E =======================================

; In: d0.w = entity index


SetEntityActscript:
                
                move.w  d0,-(sp)
                move.l  a0,-(sp)
                bsr.w   GetEntityEntryAddress
                move.l  a1,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                movea.l (sp)+,a0
                move.w  (sp)+,d0
                rts

    ; End of function SetEntityActscript


; =============== S U B R O U T I N E =======================================

; In: d0.w = entity index


SetControlledEntityActScript:
                
                move.w  d0,-(sp)
                move.l  a0,-(sp)
                bsr.w   GetEntityEntryAddress
                checkSavedByte #PLAYERTYPE_BOWIE, PLAYER_TYPE
                beq.s   loc_44B86
                checkSavedByte #PLAYERTYPE_CARAVAN, PLAYER_TYPE
                bne.s   loc_44B7C
                move.l  #eas_Raft,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                bra.s   loc_44B84
loc_44B7C:
                
                move.l  #eas_Caravan,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
loc_44B84:
                
                bra.s   loc_44B8E
loc_44B86:
                
                move.l  #eas_ControlledCharacter,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
loc_44B8E:
                
                movea.l (sp)+,a0
                move.w  (sp)+,d0
                rts

    ; End of function SetControlledEntityActScript


; =============== S U B R O U T I N E =======================================

; In: d0.w = entity index


SetCursorEntitySpeedx2:
                
                move.w  d0,-(sp)
                move.l  a0,-(sp)
                bsr.w   GetEntityEntryAddress
                move.l  #eas_CursorSpeedx2,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                movea.l (sp)+,a0
                move.w  (sp)+,d0
                rts

    ; End of function SetCursorEntitySpeedx2


; =============== S U B R O U T I N E =======================================

; In: d0.w = entity index


SetCursorEntityActscript:
                
                move.w  d0,-(sp)
                move.l  a0,-(sp)
                bsr.w   GetEntityEntryAddress
                move.l  #eas_Cursor,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                movea.l (sp)+,a0
                move.w  (sp)+,d0
                rts

    ; End of function SetCursorEntityActscript


; =============== S U B R O U T I N E =======================================

; In: d0.w = entity index


sub_44BC0:
                
                move.w  d0,-(sp)
                move.l  a0,-(sp)
                bsr.w   GetEntityEntryAddress
                move.l  #eas_44EF6,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                movea.l (sp)+,a0
                move.w  (sp)+,d0
                rts

    ; End of function sub_44BC0


; =============== S U B R O U T I N E =======================================

; In: d0.w = entity index


sub_44BD6:
                
                move.w  d0,-(sp)
                move.l  a0,-(sp)
                bsr.w   GetEntityEntryAddress
                move.l  #eas_44F16,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                movea.l (sp)+,a0
                move.w  (sp)+,d0
                rts

    ; End of function sub_44BD6


; =============== S U B R O U T I N E =======================================

; In: d0.w = entity index


MakeEntityIdle:
                
                move.w  d0,-(sp)
                move.l  a0,-(sp)
                bsr.w   GetEntityEntryAddress
                move.l  #eas_Idle,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                movea.l (sp)+,a0
                move.w  (sp)+,d0
                rts

    ; End of function MakeEntityIdle


; =============== S U B R O U T I N E =======================================

; In: d0.w = entity index


ApplyInitActscript:
                
                move.w  d0,-(sp)
                move.l  a0,-(sp)
                bsr.w   GetEntityEntryAddress
                move.l  #eas_Init,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                movea.l (sp)+,a0
                move.w  (sp)+,d0
                rts

    ; End of function ApplyInitActscript


; =============== S U B R O U T I N E =======================================

; In: d0.w = entity index


SetEntityMovescriptToIdle:
                
                move.w  d0,-(sp)
                move.l  a0,-(sp)
                bsr.w   GetEntityEntryAddress
                move.l  #eas_Standing,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                movea.l (sp)+,a0
                move.w  (sp)+,d0
                rts

    ; End of function SetEntityMovescriptToIdle


; =============== S U B R O U T I N E =======================================

; In: d0.w = entity index, d1.w, d2.w, d3.w


AddFollower:
                
                movem.l a0-a1,-(sp)
                move.w  d0,-(sp)
                bsr.w   GetEntityEntryAddress
                movea.l (ENTITY_WALKING_PARAMETERS).l,a1
                move.l  a1,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                lea     eas_Follower1(pc), a0
                move.w  #42,d7
                jsr     (CopyBytes).w   
                addi.l  #42,(ENTITY_WALKING_PARAMETERS).l
                move.w  d1,$1E(a1)
                move.w  d2,$20(a1)
                move.w  d3,$22(a1)
                lea     ((EXPLORATION_ENTITIES-$1000000)).w,a0
                move.w  (sp)+,d0
loc_44C6A:
                
                cmp.b   (a0),d0
                beq.w   loc_44C7E
                cmpi.b  #-1,(a0)+
                bne.s   loc_44C6A
                move.b  d0,-1(a0)
                move.b  #-1,(a0)
loc_44C7E:
                
                movem.l (sp)+,a0-a1
                rts

    ; End of function AddFollower


; =============== S U B R O U T I N E =======================================

; In: d0.w = entity index


HideEntity:
                
                movem.l a0-a1,-(sp)
                move.w  d0,-(sp)
                bsr.w   GetEntityEntryAddress
                move.l  #$70007000,(a0)
                move.l  (a0),ENTITYDEF_OFFSET_XDEST(a0)
                move.w  (sp)+,d0
                lea     ((ENTITY_EVENT_INDEX_LIST-$1000000)).w,a0
                moveq   #ENTITIES_TOTAL_COUNTER,d7
@Loop_EntityEvent:
                
                cmp.b   (a0)+,d0
                bne.s   @NextEntity
                move.b  #-1,-1(a0)
@NextEntity:
                
                dbf     d7,@Loop_EntityEvent
                
                lea     ((EXPLORATION_ENTITIES-$1000000)).w,a0
@Loop_Follower:
                
                cmpi.b  #-1,(a0)
                beq.w   @Done
                cmp.b   (a0)+,d0
                bne.s   @Loop_Follower
@ShiftFollowers:
                
                move.b  (a0),-1(a0)
                bmi.w   @Done
                addq.l  #1,a0
                bra.s   @ShiftFollowers
@Done:
                
                movem.l (sp)+,a0-a1
                rts

    ; End of function HideEntity


; =============== S U B R O U T I N E =======================================

; In: d0.w = entity index


SetWalkingActscript:
                
                move.w  d0,-(sp)
                movem.l a0-a1,-(sp)
                bsr.w   GetEntityEntryAddress
                movea.l (ENTITY_WALKING_PARAMETERS).l,a1
                move.l  a1,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                lea     eas_Walking(pc), a0
                move.w  #50,d7
                jsr     (CopyBytes).w   
                addi.l  #50,(ENTITY_WALKING_PARAMETERS).l
                move.w  d1,$22(a1)
                move.w  d2,$24(a1)
                move.w  d3,$26(a1)
                movem.l (sp)+,a0-a1
                move.w  (sp)+,d0
                rts

    ; End of function SetWalkingActscript


; =============== S U B R O U T I N E =======================================

; In: d0.w = entity index


sub_44D0E:
                
                andi.l  #$FFFFFF,d5
                move.w  d0,-(sp)
                movem.l a0-a2,-(sp)
                bsr.w   GetEntityEntryAddress
                movea.l (ENTITY_WALKING_PARAMETERS).l,a1
                move.l  a1,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
                lea     eas_Walking(pc), a0
                move.w  #32,d7
                jsr     (CopyBytes).w   
                addi.l  #32,(ENTITY_WALKING_PARAMETERS).l
                movea.l (ENTITY_WALKING_PARAMETERS).l,a1
                movea.l d5,a2
                move.l  a1,d5
loc_44D48:
                
                clr.w   d1
                move.b  (a2)+,d1
                bmi.w   loc_44D90
                move.w  #4,(a1)+
                tst.b   d1
                bne.s   loc_44D5E
                move.l  #$10000,(a1)+
loc_44D5E:
                
                cmpi.b  #1,d1
                bne.s   loc_44D6A
                move.l  #$FFFF,(a1)+
loc_44D6A:
                
                cmpi.b  #2,d1
                bne.s   loc_44D76
                move.l  #$FFFF0000,(a1)+
loc_44D76:
                
                cmpi.b  #3,d1
                bne.s   loc_44D82
                move.l  #1,(a1)+
loc_44D82:
                
                move.w  #1,(a1)+
                move.w  #0,(a1)+
                move.w  #$A,(a1)+
                bra.s   loc_44D48
loc_44D90:
                
                move.w  #$34,(a1)+ 
                move.l  d5,(a1)+
                move.l  a1,(ENTITY_WALKING_PARAMETERS).l
                movem.l (sp)+,a0-a2
                move.w  (sp)+,d0
                rts

    ; End of function sub_44D0E


; =============== S U B R O U T I N E =======================================

; In: d0.w = entity index


WaitForEntityToStopMoving:
                
                movem.w d0-d7,-(sp)
                move.l  a0,-(sp)
                bsr.w   GetEntityEntryAddress
loc_44DAE:
                
                move.w  (a0),d0
                move.w  ENTITYDEF_OFFSET_Y(a0),d1
                move.w  ENTITYDEF_OFFSET_XDEST(a0),d2
                move.w  ENTITYDEF_OFFSET_YDEST(a0),d3
                move.w  d2,d4
                move.w  d3,d5
                sub.w   d0,d4
                sub.w   d1,d5
                move.w  d5,d6
                or.w    d4,d6
                beq.s   loc_44DD0
                jsr     (WaitForVInt).w
                bra.s   loc_44DAE
loc_44DD0:
                
                movea.l (sp)+,a0
                movem.w (sp)+,d0-d7
                rts

    ; End of function WaitForEntityToStopMoving


; =============== S U B R O U T I N E =======================================

; Get RAM address of entity d0.w -> a0


GetEntityEntryAddress:
                
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0 ; start of entity information
                adda.w  d0,a0
                rts

    ; End of function GetEntityEntryAddress

