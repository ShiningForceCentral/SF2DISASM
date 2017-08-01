
; ASM FILE data\maps\entries\map42\mapsetups\s6.asm :
; 0x5FE98..0x5FF62 : 

; =============== S U B R O U T I N E =======================================

ms_map42_InitFunction:
		
		rts

	; End of function ms_map42_InitFunction

cs_5FE9A:
		textCursor $D09         
						; Initial text line $D09 : "The Jewel of Light begins{N}to glow.{W2}"
		nextText $FF,$FF        
						; "The Jewel of Light begins{N}to glow.{W2}"
		nextSingleText $FF,$FF  
						; "The light seems to pull{N}{LEADER}.{D3}"
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		moveEntity $0,$FF,$3,$1 
						; 002D MOVE ENTITY 0 FF 3 1
		moreMove $3,$1
		moreMove $0,$1
		moreMove $0,$1
		moreMove $0,$1
		moreMove $0,$1
		endMove $8080
		moveEntity $0,$FF,$0,$1 
						; 002D MOVE ENTITY 0 FF 0 1
		moreMove $0,$1
		moreMove $0,$1
		moreMove $1,$1
		moreMove $1,$1
		endMove $8080
		moveEntity $0,$FF,$1,$1 
						; 002D MOVE ENTITY 0 FF 1 1
		moreMove $1,$1
		endMove $8080
		csWait $3C              
						; WAIT 3C
		nextSingleText $FF,$FF  
						; "The jewel glows even{N}brighter.{W1}"
		hideText                
						; 0009 HIDE TEXTBOX AND PORTRAIT
		csWait $28              
						; WAIT 28
		flashScreenWhite $14    
						; 0041 FLASH SCREEN WHITE 14
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		setQuakeAmount $2       
						; 0033 SET QUAKE AMOUNT 2
		setBlocks $2101,$101,$1A12
						; 0034 SET BLOCKS 2101 101 1A12
		csWait $14              
						; WAIT 14
		setQuakeAmount $0       
						; 0033 SET QUAKE AMOUNT 0
		csWait $3C              
						; WAIT 3C
		nextSingleText $0,$1F   
						; "Oh, an opening!{N}The light is leading us!{W1}"
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5FF06:
		textCursor $D07         
						; Initial text line $D07 : "Sounds like something opened{N}somewhere.{W1}"
		hideText                
						; 0009 HIDE TEXTBOX AND PORTRAIT
		entityFlashWhite $0,$3C 
						; 0018 FLASH ENTITY WHITE 0 3C
		setBlocks $2102,$101,$2702
						; 0034 SET BLOCKS 2102 101 2702
		csc2B $80,$27,$2,$3,$B4 
						; 002B  80 27 2 3 B4
		setActscript $80,$0,eas_AnimSpeedx2
						; 0015 SET ACTSCRIPT 80 0 45FB2
		executeSubroutine csub_5FF56
						; 000A EXECUTE SUBROUTINE 5FF56
		hideEntity $80          
						; 002E HIDE ENTITY 80
		setQuakeAmount $2       
						; 0033 SET QUAKE AMOUNT 2
		setBlocks $20,$706,$0   
						; 0034 SET BLOCKS 20 706 0
		csWait $3C              
						; WAIT 3C
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		csWait $14              
						; WAIT 14
		setQuakeAmount $0       
						; 0033 SET QUAKE AMOUNT 0
		nextSingleText $FF,$FF  
						; "Sounds like something opened{N}somewhere.{W1}"
		nextSingleText $0,$1F   
						; "You got it!  All we have to{N}do is find the door to the{N}tower!{W1}"
		csc_end                 
						; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

csub_5FF56:
		
		move.w  #$43,d0 
		moveq   #1,d1
		jmp     sub_4F48A

	; End of function csub_5FF56

