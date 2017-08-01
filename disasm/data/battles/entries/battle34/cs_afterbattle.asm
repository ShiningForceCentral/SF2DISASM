
; ASM FILE data\battles\entries\battle34\cs_afterbattle.asm :
; 0x4D4B6..0x4D6CE : Cutscene after battle 34
abcs_battle34:
		textCursor $B5F         
						; Initial text line $B5F : "{LEADER}, I lost?!{N}Take this.{W1}"
		loadMapFadeIn $37,$2,$7
		loadMapEntities ce_4D69E
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$9,$B,$1
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$5,$B,$1
		jumpIfFlagClear $4C,cs_4D502
						; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		entityPosDir $1A,$8,$C,$1
cs_4D502:
		stopEntity $80
		customActscript $80,$FF
		dc.w $14                
						;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                
						;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 
						;   000A UPDATE SPRITE
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		stopEntity $83
		setActscript $83,$FF,eas_46172
		fadeInB
		entityShiver $80
		nextSingleText $0,$80   
						; "{LEADER}, I lost?!{N}Take this.{W1}"
		nextSingleText $FF,$FF  
						; "Cameela reveals the Sky Orb.{W1}"
		entityPosDir $83,$7,$A,$2
		nextText $0,$80         
						; "This is the Sky Orb.  With{N}it, you can drive the Nazca{N}Ship.{W2}"
		nextText $0,$80         
						; "Listen.  You have to be very{N}careful from now on.{W2}"
		nextSingleText $0,$80   
						; "Geshp has Prism Flowers.{N}He will...{W1}"
		tintMap
		nextSingleText $C0,$81  
						; "Your life is over,{N}Cameela!{W1}"
		flashScreenWhite $2
		tintMap
		setActscript $80,$FF,eas_Init
		setEntityDir $80,$2
		entitySprite $80,$B4
		startEntity $80
		setActscript $80,$0,eas_AnimSpeedx2
		setActscript $0,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		jumpIfFlagClear $4C,cs_4D592
						; Zynk is a follower
		setActscript $1A,$0,eas_Jump
cs_4D592:
		setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$80   
						; "Geshp!{W1}"
		nextSingleText $C0,$81  
						; "Ha, ha, ha!  You acted just{N}as I planned!{W1}"
		nextSingleText $0,$80   
						; "Ouuuuu...Ges...{W1}"
		entitySprite $80,$9C
		setActscript $80,$FF,eas_Die
		nextSingleText $0,$1F   
						; "How horrible!{W1}"
		nextText $C0,$81        
						; "It's the law.  Traitors{N}die by fire.{W2}"
		nextText $C0,$81        
						; "Congratulations!{N}You have a ship now!{N}Come to Grans!{W2}"
		nextSingleText $C0,$81  
						; "I have to go now and{N}prepare your welcoming{N}party!{W1}"
		flickerOnce
		csWait $3C
		setEntityDir $7,$2
		nextText $0,$7          
						; "I really hate him!{W2}"
		nextSingleText $0,$7    
						; "Prism Flowers?{N}What are they?{W1}"
		setEntityDir $1F,$0
		nextSingleText $0,$1F   
						; "I have no idea, but it's{N}probably a trap.{W1}"
		jumpIfFlagClear $4C,cs_4D620
						; Zynk is a follower
		customActscript $1A,$FF
		dc.w $10                
						;   0010 SET SPEED X=$18 Y=$18
		dc.b $18
		dc.b $18
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1A,$FF,$1,$1
		moreMove $2,$1
		endMove $8080
		nextSingleText $0,$1A   
						; "Ancient flower.{W1}"
		moveEntity $1F,$FF,$0,$1
		endMove $8080
		nextSingleText $0,$1F   
						; "Excuse me?{W1}"
		nextSingleText $0,$1A   
						; "Ancient countries had those{N}flowers along their borders.{W1}"
		nextSingleText $0,$1F   
						; "What kind of flowers are{N}they?{W1}"
		setEntityDir $1A,$1
		csWait $1E
		nextSingleText $0,$1A   
						; "I cannot explain....{W1}"
cs_4D620:
		textCursor $B74         
						; Initial text line $B74 : "We will see them when we{N}arrive at Grans.{W1}"
		moveEntity $7,$FF,$2,$1
		endMove $8080
		nextSingleText $0,$7    
						; "We will see them when we{N}arrive at Grans.{W1}"
		nextSingleText $0,$1F   
						; "{LEADER}, grab the Sky{N}Orb.{N}Let's go.{W1}"
		moveEntity $7,$FF,$1,$1
		endMove $8080
		setEntityDir $7,$2
		jumpIfFlagClear $4C,cs_4D654
						; Zynk is a follower
		moveEntity $1A,$FF,$0,$1
		endMove $8080
		setEntityDir $1A,$2
cs_4D654:
		entityNod $0
		moveEntity $0,$FF,$1,$1
		endMove $8080
		hideEntity $83
		executeSubroutine csub_4D694
		followEntity $82,$0,$2
		followEntity $7,$82,$1
		followEntity $1F,$82,$3
		jumpIfFlagClear $4C,cs_4D692
						; Zynk is a follower
		followEntity $1A,$82,$2
cs_4D692:
		csc_end                 
						; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

csub_4D694:
		
		moveq   #$71,d0 
		moveq   #1,d1
		jmp     sub_4F48A

	; End of function csub_4D694

ce_4D69E:
		dc.w 7
		dc.w $C
		dc.w 1
		dc.b 9
		dc.b $B
		dc.b 1
		dc.b 7
		dc.l eas_Init           
		dc.b 7
		dc.b 9
		dc.b 3
		dc.b $9C
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $9F
		dc.l eas_Init           
		dc.b 6
		dc.b $C
		dc.b 1
		dc.b $3E
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 2
		dc.b $AC
		dc.l eas_Init           
		dc.w $FFFF
