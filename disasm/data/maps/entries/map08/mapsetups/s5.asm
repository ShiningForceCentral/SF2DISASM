
; ASM FILE data\maps\entries\map08\mapsetups\s5.asm :
; 0x562E0..0x563A2 : 
ms_map8_Section5:
		dc.b $F
		dc.b $13
		dc.b 1
		dc.b $70
		dc.w sub_562F2-ms_map8_Section5
		dc.b $10
		dc.b $13
		dc.b 1
		dc.b $70
		dc.w sub_562F2-ms_map8_Section5
		dc.b $FD
		dc.b 0
		dc.b 0
		dc.b 0
		dc.w return_56312-ms_map8_Section5

; =============== S U B R O U T I N E =======================================

sub_562F2:
		
		trap    #CHECK_FLAG
		dc.w $2DB               
						; set after you open the tree in Ribble with the wooden plank
		beq.s   loc_562FC
		moveq   #0,d6
		bra.s   return_56312
loc_562FC:
		
		lea     cs_56314(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2DB               
						; set after you open the tree in Ribble with the wooden plank
		moveq   #$70,d0 
		jsr     sub_4F542       
						; remove wooden panel from items ?
		move.w  #$FFFF,d6
return_56312:
		
		rts

	; End of function sub_562F2

cs_56314:
		hideText                
						; 0009 HIDE TEXTBOX AND PORTRAIT
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $7,$FF,eas_Init
						; 0015 SET ACTSCRIPT 7 FF 460CE
		setQuakeAmount $2       
						; 0033 SET QUAKE AMOUNT 2
		csWait $3C              
						; WAIT 3C
		setActscript $0,$0,eas_Jump
						; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $7,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 7 FF 45E44
		moveEntity $0,$0,$3,$2  
						; 002D MOVE ENTITY 0 0 3 2
		endMove $8080
		moveEntity $7,$FF,$3,$2 
						; 002D MOVE ENTITY 7 FF 3 2
		endMove $8080
		setEntityDir $0,$1      
						; 0023 SET ENTITY FACING 0 1
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		setBlocks $2011,$202,$F13
						; 0034 SET BLOCKS 2011 202 F13
		csWait $1E              
						; WAIT 1E
		setQuakeAmount $0       
						; 0033 SET QUAKE AMOUNT 0
		csWait $1E              
						; WAIT 1E
		setQuakeAmount $2       
						; 0033 SET QUAKE AMOUNT 2
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		setBlocks $2211,$202,$F13
						; 0034 SET BLOCKS 2211 202 F13
		csWait $1E              
						; WAIT 1E
		setQuakeAmount $0       
						; 0033 SET QUAKE AMOUNT 0
		csWait $1E              
						; WAIT 1E
		setQuakeAmount $2       
						; 0033 SET QUAKE AMOUNT 2
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		setBlocks $200E,$202,$F13
						; 0034 SET BLOCKS 200E 202 F13
		csWait $1E              
						; WAIT 1E
		setQuakeAmount $0       
						; 0033 SET QUAKE AMOUNT 0
		csWait $1E              
						; WAIT 1E
		followEntity $7,$0,$2   
						; 002C FOLLOW ENTITY 7 0 2
		csc_end                 
						; END OF CUTSCENE SCRIPT
