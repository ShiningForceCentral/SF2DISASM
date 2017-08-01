
; ASM FILE data\maps\entries\map38\mapsetups\s6.asm :
; 0x5DD58..0x5DF84 : 

; =============== S U B R O U T I N E =======================================

ms_map38_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $399
		beq.s   loc_5DD78
		trap    #SET_FLAG
		dc.w $38F               
						; set after the Petro death scene in Roft
		trap    #CHECK_FLAG
		dc.w $1A
		bne.s   loc_5DD78
		trap    #CHECK_FLAG
		dc.w $104
		bne.s   loc_5DD78
		lea     cs_5DD8E(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $104
loc_5DD78:
		
		trap    #CHECK_FLAG
		dc.w $38E
		bne.s   return_5DD8C
		lea     cs_5DD9C(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $38E               
						; set after the initial scene on entering Roft (where the guy thinks you're Galam)
		trap    #SET_FLAG
		dc.w $102
return_5DD8C:
		
		rts

	; End of function ms_map38_InitFunction

cs_5DD8E:
		csc2B $1A,$B,$8,$3,$FF  
						; 002B  1A B 8 3 FF
		setEntityDir $1A,$3     
						; 0023 SET ENTITY FACING 1A 3
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5DD9C:
		entityPosDir $80,$E,$1A,$3
						; 0019 SET ENTITY POS AND FACING 80 E 1A 3
		textCursor $854         
						; Initial text line $854 : "Galam soldiers!  Run!{W1}"
		csWait $1               
						; WAIT 1
		entityPosDir $0,$E,$1C,$1
						; 0019 SET ENTITY POS AND FACING 0 E 1C 1
		entityPosDir $7,$D,$1D,$1
						; 0019 SET ENTITY POS AND FACING 7 D 1D 1
		entityPosDir $1F,$E,$1D,$1
						; 0019 SET ENTITY POS AND FACING 1F E 1D 1
		jumpIfFlagSet $4C,cs_5DE22
						; Zynk is a follower
cs_5DDC2:
		playSound MUSIC_TOWN    
						; 0005 PLAY SOUND MUSIC_TOWN
		fadeInB                 
						; 0039 FADE IN FROM BLACK
		setCameraEntity $80     
						; 0024 SET ENTITY FOLLOWED BY CAMERA 80
		setActscript $80,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 80 FF 45E44
		nextSingleText $0,$80   
						; "Galam soldiers!  Run!{W1}"
		moveEntity $80,$FF,$2,$2
						; 002D MOVE ENTITY 80 FF 2 2
		endMove $8080
		moveEntity $80,$FF,$1,$1
						; 002D MOVE ENTITY 80 FF 1 1
		endMove $8080
		moveEntity $80,$FF,$2,$2
						; 002D MOVE ENTITY 80 FF 2 2
		endMove $8080
		setEntityDir $0,$2      
						; 0023 SET ENTITY FACING 0 2
		setEntityDir $7,$2      
						; 0023 SET ENTITY FACING 7 2
		setEntityDir $1F,$2     
						; 0023 SET ENTITY FACING 1F 2
		nextSingleText $0,$7    
						; "No, wait!  We're not Galam{N}soldiers!{W1}"
		setEntityDir $80,$0     
						; 0023 SET ENTITY FACING 80 0
		nextSingleText $0,$80   
						; "No...?{W1}"
		moveEntity $80,$FF,$3,$2
						; 002D MOVE ENTITY 80 FF 3 2
		endMove $8080
		moveEntity $80,$FF,$0,$2
						; 002D MOVE ENTITY 80 FF 0 2
		endMove $8080
		nextSingleText $0,$80   
						; "Oops.  My mistake.{W2}"
		nextSingleText $0,$80   
						; "Oh, it's obvious.  I can see{N}it in your eyes.{W1}"
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5DE22:
		entityPosDir $1A,$F,$1D,$1
						; 0019 SET ENTITY POS AND FACING 1A F 1D 1
		jump cs_5DDC2           
						; 000B JUMP 5DDC2
cs_5DE2E:
		textCursor $86A         
						; Initial text line $86A : "Sir Petro, don't leave me{N}alone!{W1}"
		stopEntity $8E          
						; 001C STOP ENTITY ANIM 8E
		playSound $FD           
						; 0005 PLAY SOUND 
		setCamDest $8,$0        
						; 0032 SET CAMERA DEST 8 0
		entityShiver $89        
						; 002A MAKE ENTITY SHIVER 89
		playSound MUSIC_SAD_THEME_3
						; 0005 PLAY SOUND MUSIC_SAD_THEME_3
		nextSingleText $0,$89   
						; "Sir Petro, don't leave me{N}alone!{W1}"
		nextSingleText $0,$8E   
						; "Paseran...I'm sorry.{W1}"
		entityShiver $89        
						; 002A MAKE ENTITY SHIVER 89
		nextSingleText $0,$89   
						; "You promised to fly me in{N}the sky!{W1}"
		nextText $0,$8E         
						; "I know...with the Nazca{N}Ship...I promised...{W2}"
		nextText $0,$8E         
						; "I'd fly home...to see my{N}family....{W2}"
		nextSingleText $0,$8E   
						; "To show them how wonderful{N}the ancients were....{W1}"
		entityShiver $89        
						; 002A MAKE ENTITY SHIVER 89
		playSound $FD           
						; 0005 PLAY SOUND 
		nextSingleText $0,$89   
						; "Petro!  No!{W1}"
		playSound $FB           
						; 0005 PLAY SOUND 
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5DE76:
		textCursor $879         
						; Initial text line $879 : "What's wrong with {NAME;26}?{W1}"
		setActscript $7,$FF,eas_Init
						; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init
						; 0015 SET ACTSCRIPT 1F FF 460CE
		setCameraEntity $1A     
						; 0024 SET ENTITY FOLLOWED BY CAMERA 1A
		setEntityDest $0,$C,$9  
						; 0029 SET ENTITY DEST 0 C 9
		setEntityDest $7,$C,$8  
						; 0029 SET ENTITY DEST 7 C 8
		setEntityDest $7,$D,$8  
						; 0029 SET ENTITY DEST 7 D 8
		setEntityDest $1F,$C,$8 
						; 0029 SET ENTITY DEST 1F C 8
		setEntityDest $1F,$E,$8 
						; 0029 SET ENTITY DEST 1F E 8
		setActscript $1A,$FF,eas_Init
						; 0015 SET ACTSCRIPT 1A FF 460CE
		setEntityDest $1A,$B,$8 
						; 0029 SET ENTITY DEST 1A B 8
		setEntityDir $0,$2      
						; 0023 SET ENTITY FACING 0 2
		setEntityDir $7,$2      
						; 0023 SET ENTITY FACING 7 2
		setEntityDir $1F,$2     
						; 0023 SET ENTITY FACING 1F 2
		moveEntity $1A,$FF,$2,$2
						; 002D MOVE ENTITY 1A FF 2 2
		endMove $8080
		moveEntity $7,$FF,$2,$2 
						; 002D MOVE ENTITY 7 FF 2 2
		endMove $8080
		moveEntity $1F,$FF,$2,$1
						; 002D MOVE ENTITY 1F FF 2 1
		endMove $8080
		moveEntity $1A,$FF,$3,$1
						; 002D MOVE ENTITY 1A FF 3 1
		endMove $8080
		moveEntity $1A,$FF,$0,$1
						; 002D MOVE ENTITY 1A FF 0 1
		endMove $8080
		moveEntity $1A,$FF,$1,$1
						; 002D MOVE ENTITY 1A FF 1 1
		endMove $8080
		moveEntity $1A,$FF,$2,$2
						; 002D MOVE ENTITY 1A FF 2 2
		endMove $8080
		setActscript $1A,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 1A FF 45E44
		setActscript $1A,$0,eas_Jump
						; 0015 SET ACTSCRIPT 1A 0 45E44
		nextSingleText $0,$7    
						; "What's wrong with {NAME;26}?{W1}"
		nextSingleText $0,$1F   
						; "I have no idea, but he's{N}obviously disturbed!{W1}"
		moveEntity $1A,$FF,$1,$1
						; 002D MOVE ENTITY 1A FF 1 1
		endMove $8080
		moveEntity $1A,$FF,$0,$1
						; 002D MOVE ENTITY 1A FF 0 1
		endMove $8080
		moveEntity $1A,$FF,$3,$1
						; 002D MOVE ENTITY 1A FF 3 1
		endMove $8080
		moveEntity $1A,$FF,$2,$2
						; 002D MOVE ENTITY 1A FF 2 2
		endMove $8080
		csWait $1E              
						; WAIT 1E
		entityNod $1A           
						; 0026 MAKE ENTITY NOD 1A
		setEntityDir $1A,$0     
						; 0023 SET ENTITY FACING 1A 0
		nextSingleText $0,$1A   
						; "{LEADER}, Sir Astral!{N}I am angry!{W2}"
		nextSingleText $0,$1A   
						; "I cannot forgive the{N}devils!{W2}"
		nextSingleText $0,$1A   
						; "I have overridden my{N}restrictions on fighting.{W2}"
		nextSingleText $0,$1A   
						; "I am joining your force as{N}a soldier!{W1}"
		join $1A                
						; 0008 JOIN FORCE 1A
		clearF $4C              
						; Zynk is a follower
		nextSingleText $0,$1A   
						; "Let us go defeat the Devil{N}Army!{W1}"
		followEntity $7,$0,$2   
						; 002C FOLLOW ENTITY 7 0 2
		followEntity $1F,$7,$2  
						; 002C FOLLOW ENTITY 1F 7 2
		followEntity $1A,$1F,$2 
						; 002C FOLLOW ENTITY 1A 1F 2
		csc_end                 
						; END OF CUTSCENE SCRIPT
