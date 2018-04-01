
; ASM FILE code\common\scripting\map\vehiclefunctions.asm :
; 0x45268..0x45634 : Mapscripts and functions for Caravan and Raft

; =============== S U B R O U T I N E =======================================

; related to Caravan ... warp into Caravan ?

MapEventType2:
		
		clr.w   d0
		bsr.w   MakeEntityIdle
		lea     word_45284(pc), a0
		trap    #MAPSCRIPT
		lea     byte_45316(pc), a1
		bsr.s   ApplyActscriptToFollowers
		bsr.s   WaitForFollowersStopped
		move.b  #1,((PLAYER_TYPE-$1000000)).w
		rts

	; End of function MapEventType2

word_45284:     dc.w $15                ; mapscript
		dc.b $1E
		dc.b $FF
		dc.l eas_452A4
		dc.w $15
		dc.b 0
		dc.b $FF
		dc.l eas_452B2
		dc.w $19
		dc.b $1E
		dc.b $40
		dc.b $40
		dc.b 3
		dc.w $15
		dc.b 0
		dc.b $FF
		dc.l eas_45308
		dc.w $FFFF
eas_452A4:       ac_0E $0,$0,$1
		 ac_waitDest
word_452AE:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FF4E
		dc.w (eas_Idle-word_452AE) & $FFFF
eas_452B2:       ac_0E $1,$0,$0
eas_452BA:       ac_wait 6
		 ac_set1Db3 $FFFF
		 ac_soundCommand $59
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
word_45304:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FEF8
		dc.w (eas_Idle-word_45304) & $FFFF
eas_45308:       ac_setSprite 62
		 ac_set1Db3 $0
		 ac_updateSprite
word_45312:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FEEA
		dc.w (eas_Idle-word_45312) & $FFFF
byte_45316:      ac_0E $0,$0,$0
word_4531E:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FF9C
		dc.w (eas_452BA-word_4531E) & $FFFF

; =============== S U B R O U T I N E =======================================

MapEventType4:
		
		clr.w   d0
		bsr.w   MakeEntityIdle
		lea     word_45348(pc), a0
		trap    #MAPSCRIPT
		lea     byte_45368(pc), a1
		bsr.w   ApplyActscriptToFollowers
		bsr.w   WaitForFollowersStopped
		jsr     InitializeFollowerActscripts
		move.b  #0,((PLAYER_TYPE-$1000000)).w
		rts

	; End of function MapEventType4

word_45348:     dc.w $15
		dc.w $1EFF
		dc.l eas_45360
		dc.w $1A
		dc.w 0
		dc.w 0
		dc.w $15
		dc.b 0
		dc.b $FF
		dc.l eas_4536C
		dc.w $FFFF
eas_45360:       ac_clonePos $0
word_45364:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FE98
		dc.w (eas_Idle-word_45364) & $FFFF
byte_45368:      ac_clonePos $1
eas_4536C:       ac_09 $0,$1
		 ac_set1Db3 $FFFF
		 ac_soundCommand $59
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
		 ac_set1Db3 $0
		 ac_setSize 16
		 ac_updateSprite
		 ac_waitDest
word_453C2:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FE3A
		dc.w (eas_Idle-word_453C2) & $FFFF

; =============== S U B R O U T I N E =======================================

MapEventType3:
		
		bsr.w   sub_454AC
		bne.w   return_453F0
		clr.w   d0
		bsr.w   MakeEntityIdle
		clr.b   ((byte_FFAFB0-$1000000)).w
		lea     word_453F2(pc), a0
		trap    #MAPSCRIPT
		lea     byte_45434(pc), a1
		bsr.w   ApplyActscriptToHeroAndFollowers
		bsr.w   WaitForHeroAndFollowersStopped
		move.b  #2,((PLAYER_TYPE-$1000000)).w
return_453F0:
		rts

	; End of function MapEventType3

word_453F2:     dc.w $15
		dc.b 0
		dc.b $FF
		dc.l eas_4540C
		dc.w $19
		dc.b $9F
		dc.b $40
		dc.b $40
		dc.b 3
		dc.w $15
		dc.b 0
		dc.b $FF
		dc.l eas_45426
		dc.w $FFFF

; =============== S U B R O U T I N E =======================================

sub_4540A:
		rts

	; End of function sub_4540A

eas_4540C:       ac_0E $1F,$0,$0
byte_45414:      ac_wait 6
		 ac_soundCommand $59
		 ac_waitDest
		 ac_clonePos $1F
word_45422:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FDDA
		dc.w (eas_Idle-word_45422) & $FFFF
eas_45426:       ac_setSprite 61
		 ac_set1Db3 $0
		 ac_updateSprite
word_45430:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FDCC
		dc.w (eas_Idle-word_45430) & $FFFF
byte_45434:      ac_0E $0,$0,$0
word_4543C:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFD8
		dc.w (byte_45414-word_4543C) & $FFFF

; =============== S U B R O U T I N E =======================================

MapEventType5:
		
		bsr.w   sub_454E4
		clr.w   d0
		bsr.w   MakeEntityIdle
		move.b  #1,((byte_FFAFB0-$1000000)).w
		lea     word_45470(pc), a0
		trap    #MAPSCRIPT
		lea     byte_45488(pc), a1
		bsr.w   ApplyActscriptToHeroAndFollowers
		bsr.w   WaitForHeroAndFollowersStopped
		jsr     InitializeFollowerActscripts
		move.b  #0,((PLAYER_TYPE-$1000000)).w
		rts

	; End of function MapEventType5

word_45470:     dc.w $15
		dc.b $9F
		dc.b $FF
		dc.l eas_45360
		dc.w $1A
		dc.w 0
		dc.w 0
		dc.w $15
		dc.b 0
		dc.b $FF
		dc.l eas_4548C
		dc.w $FFFF
byte_45488:      ac_clonePos $1F
eas_4548C:       ac_09 $0,$1
		 ac_soundCommand $59
		 ac_waitDest
word_45498:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FD64
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
		
		move.b  #$FF,((CAMERA_ENTITY-$1000000)).w
		clr.w   d0
		bsr.w   MakeEntityIdle
		moveq   #1,d0
		bsr.w   MakeEntityIdle
		lea     ms_BowieShrinkIn(pc), a0
		trap    #MAPSCRIPT
		lea     eas_ShrinkIn(pc), a1
		bsr.w   ApplyActscriptToFollowers
		bsr.w   WaitForFollowersStopped
		move.b  #1,((PLAYER_TYPE-$1000000)).w
		moveq   #3,d0
		jsr     (Sleep).w       
		rts

	; End of function ShrinkIntoCaravanBowieAndFollowers

ms_BowieShrinkIn:
		dc.w $15
		dc.b 0
		dc.b $FF
		dc.l eas_ShrinkIn
		dc.w $19
		dc.b 0
		dc.b $40
		dc.b $40
		dc.b 3
		dc.w $FFFF
eas_ShrinkIn:    ac_0E $1,$0,$0
		 ac_wait 6
		 ac_set1Db3 $FFFF
		 ac_soundCommand $59
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
word_455A8:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FC54
		dc.w (eas_Idle-word_455A8) & $FFFF

; =============== S U B R O U T I N E =======================================

GrowOutBowieAndFollowoers:
		
		clr.w   d0
		bsr.w   MakeEntityIdle
		lea     ms_BowieGrowOut(pc), a0
		trap    #MAPSCRIPT
		lea     eas_GrowOut(pc), a1
		bsr.w   ApplyActscriptToFollowers
		bsr.w   WaitForFollowersStopped
		jsr     InitializeFollowerActscripts
		move.b  #0,((PLAYER_TYPE-$1000000)).w
		rts

	; End of function GrowOutBowieAndFollowoers

ms_BowieGrowOut:dc.w $15
		dc.b 0
		dc.b $FF
		dc.l eas_GrowOut
		dc.w $FFFF
eas_GrowOut:     ac_clonePos $1
		 ac_set1Db3 $FFFF
		 ac_soundCommand $59
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
		 ac_set1Db3 $0
		 ac_setSize 16
		 ac_updateSprite
		 ac_waitDest
word_45630:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FBCC
		dc.w (eas_Idle-word_45630) & $FFFF
