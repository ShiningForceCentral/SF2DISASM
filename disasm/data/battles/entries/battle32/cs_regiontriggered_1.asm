
; ASM FILE data\battles\entries\battle32\cs_regiontriggered_1.asm :
; 0x4CD10..0x4CDB4 : Region-activated cutscene for battle 32
rbcs_battle32:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR B21 : "I'm tired of this.  I can no{N}longer fight for devils.{W1}"
		dc.w $B21
		dc.w $A                 
						; 000A EXECUTE SUBROUTINE 4CD56
		dc.l sub_4CD56          
		dc.w $45                
						; 0045 RELATED TO CAMERA ADJUST TO PLAYER 38
		dc.w $38
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 17
		dc.w $17
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 17 : "I'm tired of this.  I can no{N}longer fight for devils.{W1}"
		dc.w $17
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 80
		dc.w $80
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "{NAME;23}, what?{W1}"
		dc.w $80
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 17
		dc.w $17
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $23                
						; 0023 SET ENTITY FACING 17 1
		dc.b $17
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 17 : "Didn't you hear me?{W1}"
		dc.w $17
		dc.w $23                
						; 0023 SET ENTITY FACING 17 3
		dc.b $17
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 17 : "Hey, Granseal guys!{N}I'm on your side from now{N}on! OK?{W1}"
		dc.w $17
		dc.w $54                
						; 0054  17 FFFF
		dc.w $17
		dc.w $FFFF
		dc.w $10                
						; 0010 SET FLAG 182 FFFF : set during battle 32, after Jaro switches sides
		dc.w $182
		dc.w $FFFF
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

; Jaro joins the Force

sub_4CD56:
		
		move.w  #$8F,d0 
		jsr     j_GetXPos
		move.w  d1,d7
		jsr     j_GetYPos
		move.w  d1,d6
		clr.w   d1
		jsr     j_SetCurrentHP
		move.w  #$FFFF,d1
		jsr     j_SetXPos
		move.w  #$FFFF,d1
		jsr     j_SetYPos
		moveq   #$17,d0
		move.w  d7,d1
		jsr     j_SetXPos
		move.w  d6,d1
		jsr     j_SetYPos
		moveq   #$17,d0
		jsr     j_JoinForce
		moveq   #$17,d0
		jsr     j_JoinBattleParty
		move.b  ((byte_FFB160+$F)).l,(ENTITY_EVENT_IDX_LIST+$17).l
		rts

	; End of function sub_4CD56

