
; ASM FILE data\maps\entries\map37\mapsetups\s6_47948.asm :
; 0x47948..0x47992 : Map 37 init function

; =============== S U B R O U T I N E =======================================

sub_47948:
		
		movem.l d0-a2,-(sp)
		moveq   #1,d0
		moveq   #$1C,d7
		lea     ((byte_FFA922-$1000000)).w,a0
		lea     byte_47A38(pc), a2
loc_47958:
		
		move.w  d0,d1
		jsr     j_CheckFlag
		bne.s   loc_47982
		move.w  #$5E80,d2
		move.w  d2,(a0)
		move.w  d2,2(a0)
		move.w  d2,$C(a0)
		move.w  d2,$E(a0)
		move.b  #3,$10(a0)
		move.l  #eas_Idle,$14(a0)
loc_47982:
		
		addq.w  #1,d0
		lea     $20(a0),a0
		dbf     d7,loc_47958
		movem.l (sp)+,d0-a2
		rts

	; End of function sub_47948

