
; ASM FILE code\common\maps\mapinit_0.asm :
; 0x7956..0x7A36 : Map init functions

; =============== S U B R O U T I N E =======================================

; Alters map index if certain flags are set (Granseal, Pacalon, etc)
; In: D0 = map idx
; Out: D0 = new map idx

AlterMapIndexIfChanged:
		
		movem.l d1-d2/a0,-(sp)
		lea     FlagSwitchedMaps(pc), a0
loc_795E:
		move.w  (a0),d2
		bmi.w   loc_7982
		cmp.w   d0,d2
		bne.w   loc_797E
		move.w  2(a0),d1
		jsr     j_CheckFlag
		beq.s   loc_797E
		move.w  4(a0),d0
		bra.w   loc_7982
loc_797E:
		addq.l  #6,a0
		bra.s   loc_795E
loc_7982:
		movem.l (sp)+,d1-d2/a0
		rts

	; End of function AlterMapIndexIfChanged

FlagSwitchedMaps:
		incbin "data/maps/global/flagswitchedmaps.bin"
						; maps to change if flags are set
														; map idx (word), flag (word), new map idx (word)

; =============== S U B R O U T I N E =======================================

; In: D0 = map idx (if not supplied, will be pulled from CURRENT_MAP)
;     D1 = player X coord to check
;     D2 = player Y coord to check
; Out: D7 = battle idx to trigger (FFFF if none)
; ...more

GetNextBattleOnMap:
		
		movem.l d1-d6/a0,-(sp)
		move.w  d1,d4
		move.w  d2,d5
		move.w  d0,-(sp)
		cmpi.b  #$FF,d0         ; check if map idx was supplied and pull from CURRENT_MAP if so
		bne.s   loc_79B2
		clr.w   d0
		move.b  ((CURRENT_MAP-$1000000)).w,d0
loc_79B2:
		conditionalPc lea,BattleMapCoords,a0
		moveq   #$2C,d6 ; set number of maps to iterate
		clr.w   d7
loc_79BA:
		cmp.b   (a0),d0
		bne.s   loc_7A24
		move.w  #FLAGIDX_BATTLE0,d1
		add.w   d7,d1
		jsr     j_CheckFlag
		beq.s   loc_7A24
		cmpi.b  #$FF,5(a0)
		beq.w   loc_79DE
		cmp.b   5(a0),d4
		bne.w   loc_7A24
loc_79DE:
		cmpi.b  #$FF,6(a0)
		beq.w   loc_79F0
		cmp.b   6(a0),d5
		bne.w   loc_7A24
loc_79F0:
		move.b  1(a0),((byte_FFF706-$1000000)).w
		move.b  2(a0),((byte_FFF707-$1000000)).w
		move.b  3(a0),((byte_FFF708-$1000000)).w
		move.b  4(a0),((byte_FFF709-$1000000)).w
		addi.w  #$64,d1 
		jsr     j_CheckFlag
		beq.s   loc_7A1E
		subi.w  #$64,d1 
		jsr     j_ClearFlag
loc_7A1E:
		move.w  (sp)+,d1
		bra.w   loc_7A30
loc_7A24:
		addq.l  #7,a0
		addq.w  #1,d7
loc_7A28:
		dbf     d6,loc_79BA
		moveq   #$FFFFFFFF,d7
		move.w  (sp)+,d0
loc_7A30:
		movem.l (sp)+,d1-d6/a0
		rts

	; End of function GetNextBattleOnMap

