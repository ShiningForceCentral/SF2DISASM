
; ASM FILE data\maps\entries\map18\mapsetups\s6_212.asm :
; 0x61298..0x61488 : 

; =============== S U B R O U T I N E =======================================

ms_map18_flag212_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $398
		bne.s   loc_612A8
		lea     cs_612BE(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $398               
						; set after the scene with Zeon plays as you leave the Galam Drawbridge area
loc_612A8:
		
		move.w  #$80,d0 
		jsr     MoveEntityOutOfMap
		move.w  #$82,d0 
		jsr     MoveEntityOutOfMap
		rts

	; End of function ms_map18_flag212_InitFunction

cs_612BE:
		textCursor $E61         
						; Initial text line $E61 : "{LEADER} defeated Red{N}Baron too?  Is that what{N}you said, Geshp?{W1}"
		mapLoad $3B,$8,$4       
						; 0048 LOAD MAP 3B 8 4
		entityPosDir $0,$3F,$3F,$3
						; 0019 SET ENTITY POS AND FACING 0 3F 3F 3
		entityPosDir $7,$3F,$3F,$3
						; 0019 SET ENTITY POS AND FACING 7 3F 3F 3
		entityPosDir $1F,$3F,$3F,$3
						; 0019 SET ENTITY POS AND FACING 1F 3F 3F 3
		entityPosDir $1A,$3F,$3F,$3
						; 0019 SET ENTITY POS AND FACING 1A 3F 3F 3
		fadeInFromBlackHalf     
						; 004A FADE IN FROM BLACK HALF
		nextSingleText $80,$82  
						; "{LEADER} defeated Red{N}Baron too?  Is that what{N}you said, Geshp?{W1}"
		entityNod $80           
						; 0026 MAKE ENTITY NOD 80
		nextSingleText $0,$80   
						; "Yes, sir...I'm sorry.{W1}"
		nextText $80,$82        
						; "Once again, my minions have{N}failed me.{W2}"
		nextSingleText $80,$82  
						; "Are my soldiers that weak?{W1}"
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		setEntitySize $80,$15   
						; 0050 SET ENTITY SIZE 80 15 
		nextText $0,$80         
						; "Yes...oh, no!  I mean, they{N}were strong enough.{W2}"
		nextSingleText $0,$80   
						; "But {LEADER} and his force{N}were smarter.{W1}"
		playSound SFX_BIG_DOOR_RUMBLE
						; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		setQuakeAmount $3       
						; 0033 SET QUAKE AMOUNT 3
		csWait $1E              
						; WAIT 1E
		setActscript $80,$FF,eas_Init
						; 0015 SET ACTSCRIPT 80 FF 460CE
		csWait $1E              
						; WAIT 1E
		setQuakeAmount $0       
						; 0033 SET QUAKE AMOUNT 0
		nextText $80,$82        
						; "No more excuses!{W2}"
		nextSingleText $80,$82  
						; "This is your last chance.{N}Kill {LEADER} this time,{N}or I'll kill you!{W1}"
		setActscript $80,$FF,eas_46172
						; 0015 SET ACTSCRIPT 80 FF 46172
		customActscript $80,$FF 
						; 0014 SET MANUAL ACTSCRIPT 80
		dc.w $10                
						;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$FF,$3,$1
						; 002D MOVE ENTITY 80 FF 3 1
		endMove $8080
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		nextSingleText $0,$80   
						; "Ah...yes, sir.  I'll kill{N}{LEADER} this time.{N}I stake my life on it.{W1}"
		nextSingleText $80,$82  
						; "Bring the Jewel of Evil back{N}to me!{W1}"
		nextSingleText $0,$80   
						; "Yes, sir!{W1}"
		setEntityDir $80,$3     
						; 0023 SET ENTITY FACING 80 3
		csWait $28              
						; WAIT 28
		setActscript $80,$0,eas_RotateRightHighSpeed
						; 0015 SET ACTSCRIPT 80 0 45FF0
		csWait $28              
						; WAIT 28
		animEntityFadeInOut $80,$6
						; 0022 ANIMATE ENTITY FADE INOUT 80
		entityPosDir $80,$3F,$3F,$3
						; 0019 SET ENTITY POS AND FACING 80 3F 3F 3
		csWait $96              
						; WAIT 96
		csc53 $83,$FFFF         
						; 0053 UNKNOWN
		csc53 $81,$0            
						; 0053 UNKNOWN
		setActscript $83,$0,eas_Transparent
						; 0015 SET ACTSCRIPT 83 0 45FA8
		entityPosDir $83,$D,$C,$3
						; 0019 SET ENTITY POS AND FACING 83 D C 3
		csWait $32              
						; WAIT 32
		entityPosDir $81,$D,$C,$1
						; 0019 SET ENTITY POS AND FACING 81 D C 1
		animEntityFadeInOut $81,$7
						; 0022 ANIMATE ENTITY FADE INOUT 81
		csWait $32              
						; WAIT 32
		hideEntity $83          
						; 002E HIDE ENTITY 83
		csWait $28              
						; WAIT 28
		customActscript $81,$FF 
						; 0014 SET MANUAL ACTSCRIPT 81
		dc.w $10                
						;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $81,$FF,$1,$2
						; 002D MOVE ENTITY 81 FF 1 2
		endMove $8080
		entityNod $81           
						; 0026 MAKE ENTITY NOD 81
		csWait $32              
						; WAIT 32
		nextSingleText $80,$82  
						; "You were right, Odd Eye.{W1}"
		moveEntity $81,$FF,$1,$1
						; 002D MOVE ENTITY 81 FF 1 1
		endMove $8080
		nextSingleText $0,$81   
						; "Of course.{W1}"
		nextText $80,$82        
						; "I can't trust Geshp anymore.{W2}"
		nextSingleText $80,$82  
						; "If he fails, you must battle{N}{LEADER}.{W1}"
		entityShiver $81        
						; 002A MAKE ENTITY SHIVER 81
		nextText $0,$81         
						; "You want me to kill{N}{LEADER}?{W2}"
		customActscript $81,$FF 
						; 0014 SET MANUAL ACTSCRIPT 81
		dc.w $10                
						;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		csWait $14              
						; WAIT 14
		moveEntity $81,$FF,$3,$1
						; 002D MOVE ENTITY 81 FF 3 1
		endMove $8080
		csWait $1E              
						; WAIT 1E
		nextText $0,$81         
						; "He's probably much stronger{N}now.{N}Hmmm, sounds interesting.{W2}"
		setActscript $81,$FF,eas_Init
						; 0015 SET ACTSCRIPT 81 FF 460CE
		setEntityDir $81,$1     
						; 0023 SET ENTITY FACING 81 1
		nextSingleText $0,$81   
						; "I'll do it.  If this comes{N}to pass, it will be his final{N}battle.{W1}"
		csWait $1E              
						; WAIT 1E
		executeSubroutine csub_61426
						; 000A EXECUTE SUBROUTINE 61426
		mapSysEvent $12090A03   
						; 0007 EXECUTE MAP SYSTEM EVENT 12090A03
		csc_end                 
						; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

csub_61426:
		
		lea     (PALETTE_1).l,a0
		lea     (PALETTE_1_BIS).l,a1
		moveq   #$F,d0
loc_61434:
		
		move.l  (a0)+,(a1)+
		dbf     d0,loc_61434
		rts

	; End of function csub_61426

cs_6143C:
		textCursor $36F         
						; Initial text line $36F : "Sorry, {LEADER}.{N}I'm going back to Roft.{N}I'm worried about Petro.{W1}"
		setActscript $1A,$FF,eas_Init
						; 0015 SET ACTSCRIPT 1A FF 460CE
		moveEntityNextToPlayer $1A,$0
						; 0028 MOVE ENTITY NEXT TO PLAYER 1A 0
		setEntityDir $0,$0      
						; 0023 SET ENTITY FACING 0 0
		csWait $14              
						; WAIT 14
		nextSingleText $0,$1A   
						; "Sorry, {LEADER}.{N}I'm going back to Roft.{N}I'm worried about Petro.{W1}"
		csWait $1E              
						; WAIT 1E
		moveEntity $1A,$FF,$1,$4
						; 002D MOVE ENTITY 1A FF 1 4
		endMove $8080
		setEntityDir $0,$1      
						; 0023 SET ENTITY FACING 0 1
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		setEntityDir $1F,$1     
						; 0023 SET ENTITY FACING 1F 1
		setEntityDir $1A,$3     
						; 0023 SET ENTITY FACING 1A 3
		csWait $1E              
						; WAIT 1E
		entityNod $1A           
						; 0026 MAKE ENTITY NOD 1A
		csWait $14              
						; WAIT 14
		moveEntity $1A,$FF,$1,$4
						; 002D MOVE ENTITY 1A FF 1 4
		endMove $8080
		hideEntity $1A          
						; 002E HIDE ENTITY 1A
		csc_end                 
						; END OF CUTSCENE SCRIPT
