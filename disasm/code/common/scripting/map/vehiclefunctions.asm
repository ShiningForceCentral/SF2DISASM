
; ASM FILE code\common\scripting\map\vehiclefunctions.asm :
; 0x45268..0x45638 : Mapscripts and functions for Caravan and Raft

; =============== S U B R O U T I N E =======================================

; Control Caravan


MapEventType2:
                
                clr.w   d0
                bsr.w   MakeEntityIdle
                script  cs_45284
                lea     byte_45316(pc), a1
                bsr.s   ApplyActscriptToFollowers
                bsr.s   WaitForFollowersStopped
                move.b  #1,((PLAYER_TYPE-$1000000)).w
                rts

    ; End of function MapEventType2

cs_45284:       setActscriptWait FOLLOWER_A,eas_452A4
                setActscriptWait ALLY_BOWIE,eas_452B2
                setPos FOLLOWER_A,64,64,DOWN
                setActscriptWait ALLY_BOWIE,eas_45308
                csc_end
eas_452A4:       ac_moveEntFacRelPos 0,0,1
                 ac_waitDest
word_452AE:      ac_branch
                dc.w (eas_Idle-word_452AE) & $FFFF
eas_452B2:       ac_moveEntFacRelPos 1,0,0
eas_452BA:       ac_wait 6
                 ac_resizable ON
                 ac_soundCommand SFX_WARP
                 ac_setSize 22
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 20
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 18
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 16
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 14
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 12
                 ac_updateSprite
                 ac_waitDest
                 ac_clonePos $1
word_45304:      ac_branch
                dc.w (eas_Idle-word_45304) & $FFFF
eas_45308:       ac_setSprite MAPSPRITE_CARAVAN
                 ac_resizable OFF
                 ac_updateSprite
word_45312:      ac_branch
                dc.w (eas_Idle-word_45312) & $FFFF
byte_45316:      ac_moveEntFacRelPos 0,0,0
word_4531E:      ac_branch
                dc.w (eas_452BA-word_4531E) & $FFFF

; =============== S U B R O U T I N E =======================================


MapEventType4:
                
                clr.w   d0
                bsr.w   MakeEntityIdle
                script  cs_45348
                lea     byte_45368(pc), a1
                bsr.w   ApplyActscriptToFollowers
                bsr.w   WaitForFollowersStopped
                jsr     InitializeFollowerActscripts
                move.b  #0,((PLAYER_TYPE-$1000000)).w
                rts

    ; End of function MapEventType4

cs_45348:       setActscriptWait FOLLOWER_A,eas_45360
                setSprite ALLY_BOWIE,ALLY_BOWIE
                setActscriptWait ALLY_BOWIE,eas_4536C
                csc_end
eas_45360:       ac_clonePos $0
word_45364:      ac_branch
                dc.w (eas_Idle-word_45364) & $FFFF
byte_45368:      ac_clonePos $1
eas_4536C:       ac_moveFacRelPos 0,1
                 ac_resizable ON
                 ac_soundCommand SFX_WARP
                 ac_setSize 12
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 14
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 16
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 18
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 20
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 22
                 ac_updateSprite
                 ac_wait 1
                 ac_resizable OFF
                 ac_setSize 16
                 ac_updateSprite
                 ac_waitDest
word_453C2:      ac_branch
                dc.w (eas_Idle-word_453C2) & $FFFF

; =============== S U B R O U T I N E =======================================

; Control Raft


MapEventType3:
                
                bsr.w   sub_454AC
                bne.w   return_453F0
                clr.w   d0
                bsr.w   MakeEntityIdle
                clr.b   ((byte_FFAFB0-$1000000)).w
                script  cs_453F2
                lea     byte_45434(pc), a1
                bsr.w   ApplyActscriptToHeroAndFollowers
                bsr.w   WaitForHeroAndFollowersStopped
                move.b  #2,((PLAYER_TYPE-$1000000)).w
return_453F0:
                
                rts

    ; End of function MapEventType3

cs_453F2:       setActscriptWait ALLY_BOWIE,eas_4540C
                setPos 159,64,64,DOWN
                setActscriptWait ALLY_BOWIE,eas_45426
                csc_end

; =============== S U B R O U T I N E =======================================


nullsub_4540A:
                
                rts

    ; End of function nullsub_4540A

eas_4540C:       ac_moveEntFacRelPos 31,0,0
byte_45414:      ac_wait 6
                 ac_soundCommand SFX_WARP
                 ac_waitDest
                 ac_clonePos $1F
word_45422:      ac_branch
                dc.w (eas_Idle-word_45422) & $FFFF
eas_45426:       ac_setSprite MAPSPRITE_RAFT
                 ac_resizable OFF
                 ac_updateSprite
word_45430:      ac_branch
                dc.w (eas_Idle-word_45430) & $FFFF
byte_45434:      ac_moveEntFacRelPos 0,0,0
word_4543C:      ac_branch
                dc.w (byte_45414-word_4543C) & $FFFF

; =============== S U B R O U T I N E =======================================


MapEventType5:
                
                bsr.w   sub_454E4
                clr.w   d0
                bsr.w   MakeEntityIdle
                move.b  #1,((byte_FFAFB0-$1000000)).w
                script  cs_45470
                lea     byte_45488(pc), a1
                bsr.w   ApplyActscriptToHeroAndFollowers
                bsr.w   WaitForHeroAndFollowersStopped
                jsr     InitializeFollowerActscripts
                move.b  #0,((PLAYER_TYPE-$1000000)).w
                rts

    ; End of function MapEventType5

cs_45470:       setActscriptWait 159,eas_45360
                setSprite ALLY_BOWIE,ALLY_BOWIE
                setActscriptWait ALLY_BOWIE,eas_4548C
                csc_end
byte_45488:      ac_clonePos $1F
eas_4548C:       ac_moveFacRelPos 0,1
                 ac_soundCommand SFX_WARP
                 ac_waitDest
word_45498:      ac_branch
                dc.w (eas_Idle-word_45498) & $FFFF
word_4549C:     dc.w $180
word_4549E:     dc.w 0
                dc.w 0
                dc.w $FE80
                dc.w $FE80
                dc.w 0
                dc.w 0
                dc.w $180

; =============== S U B R O U T I N E =======================================


sub_454AC:
                
                movem.l d0-d1/a0,-(sp)
                lea     ((ENTITY_DATA-$1000000)).w,a0
                move.w  $C(a0),d0
                move.w  $E(a0),d1
                clr.w   d3
                move.b  $10(a0),d3
                lsl.w   #2,d3
                add.w   word_4549C(pc,d3.w),d0
                add.w   word_4549E(pc,d3.w),d1
                sub.w   $3EC(a0),d0
                bpl.s   loc_454D4
                neg.w   d0
loc_454D4:
                
                sub.w   $3EE(a0),d1
                bpl.s   loc_454DC
                neg.w   d1
loc_454DC:
                
                add.w   d1,d0
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function sub_454AC


; =============== S U B R O U T I N E =======================================


sub_454E4:
                
                movem.l d0-d1/a0,-(sp)
                lea     ((ENTITY_DATA-$1000000)).w,a0
                move.w  $C(a0),d0
                move.w  $E(a0),d1
                ext.l   d0
                ext.l   d1
                divs.w  #$180,d0
                divs.w  #$180,d1
                move.b  ((CURRENT_MAP-$1000000)).w,((RAFT_MAP_INDEX-$1000000)).w
                move.b  d0,((RAFT_X-$1000000)).w
                move.b  d1,((RAFT_Y-$1000000)).w
                movem.l (sp)+,d0-d1/a0
                rts

    ; End of function sub_454E4


; =============== S U B R O U T I N E =======================================


ShrinkIntoCaravanBowieAndFollowers:
                
                move.b  #$FF,((VIEW_TARGET_ENTITY-$1000000)).w
                clr.w   d0
                bsr.w   MakeEntityIdle
                moveq   #1,d0
                bsr.w   MakeEntityIdle
                script  ms_BowieShrinkIn
                lea     eas_ShrinkIn(pc), a1
                bsr.w   ApplyActscriptToFollowers
                bsr.w   WaitForFollowersStopped
                move.b  #1,((PLAYER_TYPE-$1000000)).w
                moveq   #3,d0
                jsr     (Sleep).w       
                rts

    ; End of function ShrinkIntoCaravanBowieAndFollowers

ms_BowieShrinkIn:
                setActscriptWait ALLY_BOWIE,eas_ShrinkIn
                setPos ALLY_BOWIE,64,64,DOWN
                csc_end
eas_ShrinkIn:    ac_moveEntFacRelPos 1,0,0
                 ac_wait 6
                 ac_resizable ON
                 ac_soundCommand SFX_WARP
                 ac_setSize 22
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 20
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 18
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 16
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 14
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 12
                 ac_updateSprite
                 ac_waitDest
                 ac_clonePos $0
word_455A8:      ac_branch
                dc.w (eas_Idle-word_455A8) & $FFFF

; =============== S U B R O U T I N E =======================================


GrowOutBowieAndFollowers:
                
                clr.w   d0
                bsr.w   MakeEntityIdle
                script  ms_BowieGrowOut
                lea     eas_GrowOut(pc), a1
                bsr.w   ApplyActscriptToFollowers
                bsr.w   WaitForFollowersStopped
                jsr     InitializeFollowerActscripts
                move.b  #0,((PLAYER_TYPE-$1000000)).w
                rts

    ; End of function GrowOutBowieAndFollowers

ms_BowieGrowOut:setActscriptWait ALLY_BOWIE,eas_GrowOut
                csc_end
eas_GrowOut:     ac_clonePos $1
                 ac_resizable ON
                 ac_soundCommand SFX_WARP
                 ac_setSize 12
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 14
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 16
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 18
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 20
                 ac_updateSprite
                 ac_wait 1
                 ac_setSize 22
                 ac_updateSprite
                 ac_wait 1
                 ac_resizable OFF
                 ac_setSize 16
                 ac_updateSprite
                 ac_waitDest
word_45630:      ac_branch
                dc.w (eas_Idle-word_45630) & $FFFF

; =============== S U B R O U T I N E =======================================


sub_45634:
                
                clr.w   d0
                rts

    ; End of function sub_45634

