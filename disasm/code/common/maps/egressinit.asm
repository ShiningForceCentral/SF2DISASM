
; ASM FILE code\common\maps\egressinit.asm :
; 0x75EC..0x764E : Egress map init function

; =============== S U B R O U T I N E =======================================

; In: D0 = from map index
; Out: D0 = to map index
;      D1 = X
;      D2 = Y
;      D3 = facing


GetSavePointForMap:
                
                 
                module
                chkFlg  399             ; Set after first battle's cutscene OR first save? Checked at witch screens
                bne.s   @Continue
                
                ; Go back to Bowie's room if the gizmos cutscene has not been triggered
                moveq   #MAP_GRANSEAL,d0 ; HARDCODED initial egress position : map, x, y, facing
                moveq   #56,d1
                moveq   #3,d2
                moveq   #DOWN,d3
                rts
@Continue:
                
                move.l  a0,-(sp)
                moveq   #1,d1
                moveq   #1,d2
                moveq   #UP,d3
                conditionalPc lea,SavepointMapCoordinates,a0
@FindEgressEntry_Loop:
                
                cmpi.b  #CODE_TERMINATOR_BYTE,(a0)
                beq.w   byte_7620       ; No match
                cmp.b   (a0),d0
                beq.s   @EgressEntryFound
                addq.l  #4,a0
                bra.s   @FindEgressEntry_Loop
@EgressEntryFound:
                
                move.b  (a0)+,d0        ; map
                move.b  (a0)+,d1        ; x
                move.b  (a0)+,d2        ; y
                move.b  (a0)+,d3        ; facing
byte_7620:
                
                ; No match
                chkFlg  64              ; Raft is unlocked
                beq.s   @Done
                conditionalPc lea,RaftResetMapCoordinates-4,a0 ; Some egress locations imply to put the raft back in an initial place
@FindRaftEntry_Loop:
                
                addq.l  #4,a0
                cmpi.b  #MAP_NONE,(a0)
                beq.w   @RaftEntryNotFound
                cmp.b   (a0),d0         ; If found egress map matches entry map, then move raft back to given location
                bne.s   @FindRaftEntry_Loop
@RaftEntryNotFound:
                
                setSavedByte 1(a0), RAFT_MAP
                setSavedByte 2(a0), RAFT_X
                setSavedByte 3(a0), RAFT_Y
@Done:
                
                movea.l (sp)+,a0
                rts

    ; End of function GetSavePointForMap

                modend
