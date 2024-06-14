
; ASM FILE code\common\maps\egressinit.asm :
; 0x75EC..0x764E : Egress map init function

; =============== S U B R O U T I N E =======================================

; In: d0.b = From map index
; Out: d0.b = To map index, d1.b = X, d2.b = Y, d3.b = Facing


GetSavepointForMap:
                
                 
                module
                chkFlg  399             ; Set after first battle's cutscene OR first save? Checked at witch screens
                bne.s   @Continue
                
                ; Go back to Bowie's room if the gizmos cutscene has not been triggered
                ; HARDCODED initial egress position : map, x, y, facing
                moveq   #GAMESTART_MAP,d0           ; 3: Granseal
                moveq   #GAMESTART_SAVEPOINT_X,d1   ; 56
                moveq   #GAMESTART_SAVEPOINT_Y,d2   ; 3
                moveq   #GAMESTART_FACING,d3        ; 3: Down
                rts
@Continue:
                
                move.l  a0,-(sp)
                
                ; Load default position in case map is not found
                moveq   #1,d1
                moveq   #1,d2
                moveq   #UP,d3
            if (STANDARD_BUILD=1)
                getPointer p_table_SavepointMapCoordinates, a0
            else
                lea     table_SavepointMapCoordinates(pc), a0
            endif
@FindEgressEntry_Loop:
                
                cmpi.b  #-1,(a0)
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
                
            if (STANDARD_BUILD=1)
                getPointer p_table_RaftResetMapCoordinates, a0
@FindRaftEntry_Loop:
                
                cmpi.b  #MAP_CURRENT,(a0)
                beq.s   @RaftEntry
                cmp.b   (a0),d0
                beq.s   @RaftEntry
                addq.l  #4,a0
                bra.s   @FindRaftEntry_Loop
            else
                lea     table_RaftResetMapCoordinates-4(pc), a0 ; Some egress locations imply to put the raft back in an initial place
@FindRaftEntry_Loop:
                
                addq.l  #4,a0
                cmpi.b  #MAP_CURRENT,(a0)
                beq.w   @RaftEntry
                cmp.b   (a0),d0         ; If found egress map matches entry map, then move raft back to given location
                bne.s   @FindRaftEntry_Loop
            endif
@RaftEntry:
                
                setSavedByte 1(a0), RAFT_MAP
                setSavedByte 2(a0), RAFT_X
                setSavedByte 3(a0), RAFT_Y
@Done:
                
                movea.l (sp)+,a0
                rts

    ; End of function GetSavepointForMap

                modend
