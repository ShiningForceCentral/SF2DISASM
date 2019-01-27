
; ASM FILE data\maps\entries\map08\mapsetups\s4.asm :
; 0x561EC..0x562E0 : 

; =============== S U B R O U T I N E =======================================

ms_map8_AreaDescriptions:
		
		move.w  #$546,d3
		lea     word_561FC(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map8_AreaDescriptions

word_561FC:     dc.w $50F
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $B
		dc.w $1B0F
		dc.b 0
		dc.b 0
		dc.b 5
		dc.b $C
		dc.w $60F
		dc.b 0
		dc.b 1
		dc.w sub_56246-word_561FC
		dc.w $70F
		dc.b 0
		dc.b 1
		dc.w sub_56246-word_561FC
		dc.w $719
		dc.b 0
		dc.b 1
		dc.w sub_5626C-word_561FC
		dc.w $190C
		dc.b 0
		dc.b 1
		dc.w sub_5626C-word_561FC
		dc.w $1618
		dc.b 0
		dc.b 1
		dc.w sub_5626C-word_561FC
		dc.w $619
		dc.b 0
		dc.b 0
		dc.b 6
		dc.b 3
		dc.w $1A0C
		dc.b 0
		dc.b 0
		dc.b 6
		dc.b 6
		dc.w $1808
		dc.b 0
		dc.b 1
		dc.w sub_5629A-word_561FC
		dc.w $F12
		dc.b 0
		dc.b 1
		dc.w byte_562BA-word_561FC
		dc.w $1012
		dc.b 0
		dc.b 1
		dc.w byte_562BA-word_561FC
		dc.w $FD00

; =============== S U B R O U T I N E =======================================

sub_56246:
		 
		chkFlg  $2C4            ; set after the scene in Ribble where the mayor confronts Bowie
		bne.s   loc_56256
		move.w  #$546,d0
		jsr     (DisplayText).w 
		bra.s   return_5626A
loc_56256:
		clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
		move.w  #$1A8,d0
		jsr     (DisplayText).w 
		move.w  #$1B2,d0
		jsr     (DisplayText).w 
return_5626A:
		rts

	; End of function sub_56246


; =============== S U B R O U T I N E =======================================

sub_5626C:
		 
		chkFlg  $2C4            ; set after the scene in Ribble where the mayor confronts Bowie
		bne.s   loc_56284
		move.w  #$547,d0
		jsr     (DisplayText).w 
		move.w  #$548,d0
		jsr     (DisplayText).w 
		bra.s   return_56298
loc_56284:
		clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
		move.w  #$1A8,d0
		jsr     (DisplayText).w 
		move.w  #$1B2,d0
		jsr     (DisplayText).w 
return_56298:
		rts

	; End of function sub_5626C


; =============== S U B R O U T I N E =======================================

sub_5629A:
		move.w  #$54D,d0
		jsr     (DisplayText).w 
		move.w  #$54E,d0
		jsr     (DisplayText).w 
		move.w  #$54F,d0
		jsr     (DisplayText).w 
		move.w  #$550,d0
		jmp     (DisplayText).w 
byte_562BA:
		chkFlg  $2DB            ; set after you open the tree in Ribble with the wooden plank
		bne.s   loc_562CA
		move.w  #$54A,d0
		jmp     (DisplayText).w 
		dc.w $6014
loc_562CA:
		clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
		move.w  #$1A8,d0
		jsr     (DisplayText).w 
		move.w  #$1B2,d0
		jsr     (DisplayText).w 
		rts

	; End of function sub_5629A

