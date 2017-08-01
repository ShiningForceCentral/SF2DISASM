
; ASM FILE data\maps\entries\map51\mapsetups\s3.asm :
; 0x5C2D6..0x5C3C0 : 
ms_map51_ZoneEvents:
		dc.b 9
		dc.b 6
		dc.w sub_5C2F2-ms_map51_ZoneEvents
		dc.b 9
		dc.b 7
		dc.w sub_5C2F2-ms_map51_ZoneEvents
		dc.b 9
		dc.b 8
		dc.w sub_5C2F2-ms_map51_ZoneEvents
		dc.b 9
		dc.b 9
		dc.w sub_5C2F2-ms_map51_ZoneEvents
		dc.b 9
		dc.b $18
		dc.w sub_5C304-ms_map51_ZoneEvents
		dc.b $A
		dc.b $18
		dc.w sub_5C304-ms_map51_ZoneEvents
		dc.w $FD00
		dc.w return_5C310-ms_map51_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5C2F2:
		
		trap    #CHECK_FLAG
		dc.w $1D6
		bne.s   return_5C302
		lea     cs_5C312(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $1D6               
						; set after you approach the pond to rescue Elric at the Harpy Pond
return_5C302:
		
		rts

	; End of function sub_5C2F2


; =============== S U B R O U T I N E =======================================

sub_5C304:
		
		trap    #CHECK_FLAG
		dc.w $1D6
		bne.s   return_5C310
		lea     cs_5C3AA(pc), a0
		trap    #6
return_5C310:
		
		rts

	; End of function sub_5C304

cs_5C312:
		textCursor $9FB         
						; Initial text line $9FB : "Did you come to help me?{N}Oh, thank you!{W2}"
		setActscript $7,$FF,eas_Init
						; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init
						; 0015 SET ACTSCRIPT 1F FF 460CE
		entityPosDir $80,$7,$10,$1
						; 0019 SET ENTITY POS AND FACING 80 7 10 1
		entityPosDir $81,$6,$11,$1
						; 0019 SET ENTITY POS AND FACING 81 6 11 1
		entityPosDir $82,$8,$11,$1
						; 0019 SET ENTITY POS AND FACING 82 8 11 1
		nextText $0,$D          
						; "Did you come to help me?{N}Oh, thank you!{W2}"
		nextSingleText $0,$D    
						; "I might have been eaten by{N}monsters if you hadn't come.{W1}"
		nextSingleText $C0,$80  
						; "My dinner is escaping!{W1}"
		setActscript $1F,$0,eas_Jump
						; 0015 SET ACTSCRIPT 1F 0 45E44
		setActscript $7,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 7 FF 45E44
		csWait $5               
						; WAIT 5
		setActscript $7,$0,eas_461B6
						; 0015 SET ACTSCRIPT 7 0 461B6
		csWait $78              
						; WAIT 78
		nextSingleText $0,$7    
						; "Who said that?{W1}"
		setCamDest $3,$C        
						; 0032 SET CAMERA DEST 3 C
		nextText $C0,$80        
						; "That pond catches my food.{N}Hey elf boy, good trap, huh?{W2}"
		nextSingleText $C0,$80  
						; "Those who get stuck in the{N}pond are mine.  It's my{N}rule.{W1}"
		nextSingleText $0,$D    
						; "Then, all the missing people{N}were eaten by you?{W1}"
		nextSingleText $C0,$80  
						; "They were in my pond.{W1}"
		moveEntity $80,$FF,$1,$2
						; 002D MOVE ENTITY 80 FF 1 2
		endMove $8080
		nextSingleText $C0,$80  
						; "And this elf is my dinner{N}for tonight.  Got it?{W1}"
		setEntityDir $80,$3     
						; 0023 SET ENTITY FACING 80 3
		nextSingleText $C0,$80  
						; "Did you guys bring the{N}ketchup? No? Oh, well.{W1}"
		setActscript $81,$0,eas_Jump
						; 0015 SET ACTSCRIPT 81 0 45E44
		setActscript $82,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 82 FF 45E44
		setStoryFlag $14        
						; Battle 20 unlocked
		mapSysEvent $33000000   
						; 0007 EXECUTE MAP SYSTEM EVENT 33000000
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5C3AA:
		textCursor $A05         
						; Initial text line $A05 : "{LEADER}, we have to{N}save him!{W1}"
		nextSingleText $0,$7    
						; "{LEADER}, we have to{N}save him!{W1}"
		entityNod $0            
						; 0026 MAKE ENTITY NOD 0
		moveEntity $0,$FF,$1,$1 
						; 002D MOVE ENTITY 0 FF 1 1
		endMove $8080
		csc_end                 
						; END OF CUTSCENE SCRIPT
