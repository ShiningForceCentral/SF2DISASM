
; ASM FILE data\maps\entries\map17\mapsetups\s6.asm :
; 0x52450..0x52A80 : 

; =============== S U B R O U T I N E =======================================

ms_map17_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $294               
						; set after initial wake-up in prison sequence
		bne.s   loc_52460
		lea     cs_5249E(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $294               
						; set after initial wake-up in prison sequence
loc_52460:
		
		trap    #CHECK_FLAG
		dc.w $297               
						; set after Galam and Lemon leave with their army
		beq.s   loc_52476
		move.w  #$83,d0 
		jsr     MoveEntityOutOfMap
		lea     cs_5247C(pc), a0
		trap    #6
loc_52476:
		
		trap    #SET_FLAG
		dc.w $263               
						; set after prison wake-up sequence IF 0297 is *not* also set
		rts

	; End of function ms_map17_InitFunction

cs_5247C:
		setBlocks $3007,$101,$3008
						; 0034 SET BLOCKS 3007 101 3008
		setBlocks $3E14,$102,$3014
						; 0034 SET BLOCKS 3E14 102 3014
		setBlocks $3907,$101,$3908
						; 0034 SET BLOCKS 3907 101 3908
		setBlocks $3E14,$102,$3914
						; 0034 SET BLOCKS 3E14 102 3914
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5249E:
		playSound $FD           
						; 0005 PLAY SOUND 
		resetForceBattleStats   
						; 0055 RESET FORCE BATTLE STATS
		csc36                   
						; 0036 UNKNOWN, RELATED TO LOADING A MAP
		csc49 $0,$0,$0          
						; 0049 UNKNOWN
		csWait $3C              
						; WAIT 3C
		fadeInB                 
						; 0039 FADE IN FROM BLACK
		textCursor $370         
						; Initial text line $370 : "Impossible!{N}Galam and Granseal are{N}allies!{W1}"
		csc46 $34,$1            
						; 0046 UNKNOWN
		entityPosDir $0,$3B,$4,$1
						; 0019 SET ENTITY POS AND FACING 0 3B 4 1
		nextSingleText $0,$1    
						; "Impossible!{N}Galam and Granseal are{N}allies!{W1}"
		nextSingleText $C0,$84  
						; "But it's true.  I'm a scholar.{N}I'm here because I tried{N}to stop him.{W1}"
		nextText $C0,$85        
						; "I'm a leader of the Galam{N}Army.  I disagreed with{N}the war and now I'm here.{W2}"
		nextText $C0,$85        
						; "What did your kingdom{N}do to Galam?{W2}"
		nextSingleText $C0,$85  
						; "What is the reason for this{N}war?{W1}"
		nextText $0,$4          
						; "What about Sir Hawel?{N}He was killed by Galam!{W2}"
		nextSingleText $0,$4    
						; "What did Galam want?{N}What is Ground Seal?{W1}"
		nextSingleText $C0,$84  
						; "Ground Seal...do you know{N}what Ground Seal is?{W1}"
		nextSingleText $0,$2    
						; "What is Ground Seal?{N}Please tell me!{W1}"
		nextText $C0,$84        
						; "I heard King Galam say{N}those words.{W2}"
		nextSingleText $C0,$84  
						; "I just know that something{N}is being concealed.{W1}"
		loadMapFadeIn $11,$34,$1
						; 0037 LOAD MAP AND FADE IN 11 34 1
		csWait $1               
						; WAIT 1
		playSound MUSIC_CASTLE  
						; 0005 PLAY SOUND MUSIC_CASTLE
		fadeInB                 
						; 0039 FADE IN FROM BLACK
		csWait $1E              
						; WAIT 1E
		setEntityDest $0,$3B,$5 
						; 0029 SET ENTITY DEST 0 3B 5
		entityShakeHead $0      
						; 0027 MAKE ENTITY SHAKE HEAD 0
		entityNod $0            
						; 0026 MAKE ENTITY NOD 0
		nextSingleText $0,$0    
						; "(Yawn){W1}"
		setEntityDir $0,$2      
						; 0023 SET ENTITY FACING 0 2
		csWait $28              
						; WAIT 28
		setEntityDir $2,$0      
						; 0023 SET ENTITY FACING 2 0
		textCursor $37C         
						; Initial text line $37C : "{LEADER}!{N}You finally woke up!{W2}"
		nextText $0,$2          
						; "{LEADER}!{N}You finally woke up!{W2}"
		nextSingleText $0,$2    
						; "We're talking about{N}Ground Seal.{N}Please, join in.{W1}"
		setEntityDir $2,$2      
						; 0023 SET ENTITY FACING 2 2
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_52530:
		textCursor $385         
						; Initial text line $385 : "What's wrong with the seal?{W1}"
		setCamDest $30,$0       
						; 0032 SET CAMERA DEST 30 0
		setEntityDir $0,$3      
						; 0023 SET ENTITY FACING 0 3
		nextSingleText $C0,$84  
						; "What's wrong with the seal?{W1}"
		moveEntity $2,$FF,$2,$1 
						; 002D MOVE ENTITY 2 FF 2 1
		endMove $8080
		nextSingleText $C0,$2   
						; "Somebody broke the sacred{N}seal?{W1}"
		nextSingleText $0,$1    
						; "We're not sure.{N}It seems that somebody{N}stole the two jewels.{W1}"
		setCamDest $2B,$0       
						; 0032 SET CAMERA DEST 2B 0
		startEntity $5          
						; 001B START ENTITY ANIM 5
		nextSingleText $0,$5    
						; "...ancient...shrine...{N}two...jewels...!{W1}"
		moveEntity $85,$FF,$2,$1
						; 002D MOVE ENTITY 85 FF 2 1
		endMove $8080
		nextSingleText $0,$85   
						; "Oh, you woke up!{N}Are you OK?{W1}"
		setEntityDir $0,$2      
						; 0023 SET ENTITY FACING 0 2
		setEntityDir $2,$2      
						; 0023 SET ENTITY FACING 2 2
		setEntityDir $3,$2      
						; 0023 SET ENTITY FACING 3 2
		setEntityDir $1,$2      
						; 0023 SET ENTITY FACING 1 2
		setEntityDir $4,$2      
						; 0023 SET ENTITY FACING 4 2
		setEntityDir $84,$2     
						; 0023 SET ENTITY FACING 84 2
		setEntityDir $85,$2     
						; 0023 SET ENTITY FACING 85 2
		moveEntity $5,$FF,$0,$1 
						; 002D MOVE ENTITY 5 FF 0 1
		endMove $8080
		csWait $5               
						; WAIT 5
		setActscript $5,$0,eas_461B6
						; 0015 SET ACTSCRIPT 5 0 461B6
		csWait $1E              
						; WAIT 1E
		nextSingleText $0,$5    
						; "Where...?{N}...I...why am I...?{W1}"
		setEntityDir $5,$3      
						; 0023 SET ENTITY FACING 5 3
		nextText $C0,$84        
						; "This is a jail in the{N}basement of Galam Castle.{W2}"
		nextSingleText $C0,$84  
						; "Say, you mustn't move yet!{W1}"
		entityShakeHead $5      
						; 0027 MAKE ENTITY SHAKE HEAD 5
		csWait $1E              
						; WAIT 1E
		nextSingleText $0,$5    
						; "Yes, I remember!{N}I was caught by Galam{N}soldiers.{W1}"
		setEntityDir $85,$1     
						; 0023 SET ENTITY FACING 85 1
		nextSingleText $0,$85   
						; "They took my jewels and{N}brought me here!{W1}"
		entityShiver $5         
						; 002A MAKE ENTITY SHIVER 5
		nextSingleText $0,$5    
						; "They...they killed my{N}friends!{W1}"
		customActscript $5,$FF  
						; 0014 SET MANUAL ACTSCRIPT 5
		dc.w $10                
						;   0010 SET SPEED X=$E Y=$E
		dc.b $E
		dc.b $E
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $5,$FF,$3,$1 
						; 002D MOVE ENTITY 5 FF 3 1
		moreMove $C,$28
		moreMove $2,$1
		moreMove $C,$28
		moreMove $3,$1
		endMove $8080
		setEntityDir $5,$1      
						; 0023 SET ENTITY FACING 5 1
		customActscript $5,$FF  
						; 0014 SET MANUAL ACTSCRIPT 5
		dc.w $14                
						;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                
						;   001B SET FLIPPING $2
		dc.w 2
		dc.w $A                 
						;   000A UPDATE SPRITE
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		stopEntity $5           
						; 001C STOP ENTITY ANIM 5
		setEntityDir $85,$2     
						; 0023 SET ENTITY FACING 85 2
		csWait $32              
						; WAIT 32
		nextSingleText $0,$5    
						; "Ouch!{N}I can hardly move.{W1}"
		moveEntity $85,$FF,$2,$1
						; 002D MOVE ENTITY 85 FF 2 1
		endMove $8080
		nextSingleText $0,$85   
						; "Stay here for a while.{N}You need to rest.{W1}"
		csWait $14              
						; WAIT 14
		moveEntity $85,$FF,$0,$2
						; 002D MOVE ENTITY 85 FF 0 2
		endMove $8080
		setCamDest $2F,$0       
						; 0032 SET CAMERA DEST 2F 0
		setEntityDir $1,$0      
						; 0023 SET ENTITY FACING 1 0
		setEntityDir $85,$0     
						; 0023 SET ENTITY FACING 85 0
		setEntityDir $0,$3      
						; 0023 SET ENTITY FACING 0 3
		setEntityDir $3,$3      
						; 0023 SET ENTITY FACING 3 3
		setEntityDir $4,$3      
						; 0023 SET ENTITY FACING 4 3
		setEntityDir $84,$3     
						; 0023 SET ENTITY FACING 84 3
		nextText $C0,$84        
						; "What were we talking{N}about?{W2}"
		nextSingleText $C0,$84  
						; "Oh, yes.  Why is King Galam{N}interested in Ground Seal?{W1}"
		nextSingleText $0,$1    
						; "Is it related to the opened{N}door?{W1}"
		nextSingleText $0,$5    
						; "Hey!{W1}"
		customActscript $5,$FF  
						; 0014 SET MANUAL ACTSCRIPT 5
		dc.w $14                
						;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                
						;   001B SET FLIPPING $0
		dc.w 0
		dc.w $A                 
						;   000A UPDATE SPRITE
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		entitySprite $5,$3B     
						; 001A SET ENTITY SPRITE 5 3B
		csWait $14              
						; WAIT 14
		nextSingleText $0,$4    
						; "Does he want the jewels?{W1}"
		nextSingleText $0,$5    
						; "What?{W1}"
		entityShiver $5         
						; 002A MAKE ENTITY SHIVER 5
		csWait $14              
						; WAIT 14
		nextSingleText $0,$3    
						; "The man that broke the seal{N}is to blame for everything!{W1}"
		nextSingleText $0,$5    
						; "Oh, no!{W1}"
		entityShiver $5         
						; 002A MAKE ENTITY SHIVER 5
		moveEntity $85,$FF,$2,$1
						; 002D MOVE ENTITY 85 FF 2 1
		endMove $8080
		nextSingleText $0,$85   
						; "Are you OK?{N}You know something?{W1}"
		nextSingleText $0,$5    
						; "Uhh...nope!{W1}"
		entityShiver $5         
						; 002A MAKE ENTITY SHIVER 5
		nextText $0,$4          
						; "We can't stay here!{W2}"
		setEntityDir $1,$0      
						; 0023 SET ENTITY FACING 1 0
		nextSingleText $0,$4    
						; "We must escape!{W1}"
		moveEntity $85,$FF,$0,$1
						; 002D MOVE ENTITY 85 FF 0 1
		endMove $8080
		nextText $0,$1          
						; "I know, but how can we{N}open that locked door?{W2}"
		nextSingleText $0,$1    
						; "Oh, Galam is invading{N}Granseal while we're{N}sitting here!{W1}"
		setCamDest $2B,$0       
						; 0032 SET CAMERA DEST 2B 0
		setActscript $5,$FF,eas_Init
						; 0015 SET ACTSCRIPT 5 FF 460CE
		startEntity $5          
						; 001B START ENTITY ANIM 5
		entitySprite $5,$5      
						; 001A SET ENTITY SPRITE 5 5
		setActscript $5,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 5 FF 45E44
		moveEntity $5,$FF,$0,$1 
						; 002D MOVE ENTITY 5 FF 0 1
		endMove $8080
		nextSingleText $0,$5    
						; "I'll open the door for you!{W1}"
		setCameraEntity $5      
						; 0024 SET ENTITY FOLLOWED BY CAMERA 5
		moveEntity $85,$FF,$2,$1
						; 002D MOVE ENTITY 85 FF 2 1
		endMove $8080
		setEntityDir $1,$3      
						; 0023 SET ENTITY FACING 1 3
		nextSingleText $0,$85   
						; "Oh, yes!  You're a thief and{N}you can open locked doors.{W1}"
		nextSingleText $0,$5    
						; "Yes, of course!{N}I'm the great thief, {NAME;5}!{W1}"
		moveEntity $5,$FF,$2,$1 
						; 002D MOVE ENTITY 5 FF 2 1
		moreMove $3,$1
		endMove $8080
		setEntityDir $5,$3      
						; 0023 SET ENTITY FACING 5 3
		nextSingleText $FF,$FF  
						; "{NAME;5} sticks a short wire{N}into the keyhole.{W1}"
		playSound SFX_SECRET_PATH_ROCK
						; 0005 PLAY SOUND SFX_SECRET_PATH_ROCK
		setBlocks $3007,$101,$3008
						; 0034 SET BLOCKS 3007 101 3008
		setBlocks $3E14,$102,$3014
						; 0034 SET BLOCKS 3E14 102 3014
		textCursor $3A3         
						; Initial text line $3A3 : "{NAME;5} sticks a short wire{N}into the keyhole.{W1}"
		moveEntity $5,$FF,$3,$2 
						; 002D MOVE ENTITY 5 FF 3 2
		moreMove $0,$9
		endMove $8080
		setEntityDir $5,$1      
						; 0023 SET ENTITY FACING 5 1
		nextSingleText $FF,$FF  
						; "{NAME;5} sticks a short wire{N}into the keyhole.{W1}"
		playSound SFX_SECRET_PATH_ROCK
						; 0005 PLAY SOUND SFX_SECRET_PATH_ROCK
		setBlocks $3907,$101,$3908
						; 0034 SET BLOCKS 3907 101 3908
		setBlocks $3E14,$102,$3914
						; 0034 SET BLOCKS 3E14 102 3914
		moveEntity $5,$FF,$1,$2 
						; 002D MOVE ENTITY 5 FF 1 2
		endMove $8080
		nextSingleText $C0,$5   
						; "OK, it's done.{N}Hurry to your country and{N}save them!{W1}"
		moveEntity $2,$FF,$0,$1 
						; 002D MOVE ENTITY 2 FF 0 1
		endMove $8080
		setEntityDir $2,$3      
						; 0023 SET ENTITY FACING 2 3
		nextText $0,$2          
						; "Thank you!{W2}"
		setEntityDir $2,$2      
						; 0023 SET ENTITY FACING 2 2
		nextSingleText $0,$2    
						; "{LEADER}, let's get back{N}to Granseal!{W1}"
		csWait $1E              
						; WAIT 1E
		setActscript $0,$0,eas_Jump
						; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $3,$0,eas_Jump
						; 0015 SET ACTSCRIPT 3 0 45E44
		setActscript $4,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 4 FF 45E44
		setActscript $0,$0,eas_Jump
						; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $3,$0,eas_Jump
						; 0015 SET ACTSCRIPT 3 0 45E44
		setActscript $4,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 4 FF 45E44
		csWait $1E              
						; WAIT 1E
		nextSingleText $0,$1    
						; "Why are you being so nice{N}to us?  You don't know us.{W1}"
		entityShiver $5         
						; 002A MAKE ENTITY SHIVER 5
		csWait $5               
						; WAIT 5
		setActscript $5,$0,eas_461B6
						; 0015 SET ACTSCRIPT 5 0 461B6
		nextSingleText $C0,$5   
						; "Ah, that's because...{N}well...{W1}"
		csWait $14              
						; WAIT 14
		setEntityDir $5,$1      
						; 0023 SET ENTITY FACING 5 1
		setActscript $5,$FF,eas_46172
						; 0015 SET ACTSCRIPT 5 FF 46172
		customActscript $5,$FF  
						; 0014 SET MANUAL ACTSCRIPT 5
		dc.w $10                
						;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $5,$0,$3,$2  
						; 002D MOVE ENTITY 5 0 3 2
		moreMove $2,$1
		endMove $8080
		moveEntity $1,$FF,$2,$3 
						; 002D MOVE ENTITY 1 FF 2 3
		moreMove $3,$4
		moreMove $0,$4
		endMove $8080
		setEntityDir $5,$2      
						; 0023 SET ENTITY FACING 5 2
		nextSingleText $0,$1    
						; "Is it...?{N}Are you the thief who broke{N}the seal?{W1}"
		entityShiver $5         
						; 002A MAKE ENTITY SHIVER 5
		nextSingleText $C0,$5   
						; "I...ah...{W1}"
		moveEntity $1,$FF,$0,$3 
						; 002D MOVE ENTITY 1 FF 0 3
		endMove $8080
		nextText $0,$1          
						; "You are!{W2}"
		nextSingleText $0,$1    
						; "Hey, you!{N}Do you know what you've done?{W1}"
		setActscript $1,$0,eas_BumpRight
						; 0015 SET ACTSCRIPT 1 0 45EBC
		moveEntity $5,$FF,$0,$1 
						; 002D MOVE ENTITY 5 FF 0 1
		endMove $8080
		nextSingleText $0,$1    
						; "A big problem was created{N}because you stole the{N}jewels!{W1}"
		customActscript $1,$FF  
						; 0014 SET MANUAL ACTSCRIPT 1
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1,$FF,$0,$1 
						; 002D MOVE ENTITY 1 FF 0 1
		endMove $8080
		setActscript $1,$0,eas_BumpRight
						; 0015 SET ACTSCRIPT 1 0 45EBC
		customActscript $5,$FF  
						; 0014 SET MANUAL ACTSCRIPT 5
		dc.w $10                
						;   0010 SET SPEED X=$E Y=$E
		dc.b $E
		dc.b $E
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $5,$FF,$0,$1 
						; 002D MOVE ENTITY 5 FF 0 1
		endMove $8080
		customActscript $5,$FF  
						; 0014 SET MANUAL ACTSCRIPT 5
		dc.w $10                
						;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $5,$FF,$0,$1 
						; 002D MOVE ENTITY 5 FF 0 1
		endMove $8080
		stopEntity $5           
						; 001C STOP ENTITY ANIM 5
		setEntityDir $5,$1      
						; 0023 SET ENTITY FACING 5 1
		entitySprite $5,$3B     
						; 001A SET ENTITY SPRITE 5 3B
		csWait $28              
						; WAIT 28
		nextText $0,$1          
						; "I know the thief {NAME;5}{N}always steals for poor{N}people, but you made a{W2}"
		nextText $0,$1          
						; "serious mistake this time!!{W2}"
		nextSingleText $0,$1    
						; "All these disasters...{N}everything is YOUR fault!{W1}"
		nextSingleText $C0,$5   
						; "I didn't mean to...{W1}"
		moveEntity $1,$FF,$0,$1 
						; 002D MOVE ENTITY 1 FF 0 1
		moreMove $1,$2
		moreMove $2,$4
		endMove $8080
		setEntityDir $1,$1      
						; 0023 SET ENTITY FACING 1 1
		nextSingleText $0,$1    
						; "That's enough!{N}{LEADER}, let's go!{W1}"
		followEntity $3,$0,$2   
						; 002C FOLLOW ENTITY 3 0 2
		followEntity $4,$3,$2   
						; 002C FOLLOW ENTITY 4 3 2
		followEntity $2,$4,$2   
						; 002C FOLLOW ENTITY 2 4 2
		followEntity $1,$2,$2   
						; 002C FOLLOW ENTITY 1 2 2
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_528CA:
		moveEntity $0,$FF,$0,$1 
						; 002D MOVE ENTITY 0 FF 0 1
		endMove $8080
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_528D4:
		textCursor $3B3         
						; Initial text line $3B3 : "Wait!{W1}"
		nextSingleText $0,$5    
						; "Wait!{W1}"
		setCamDest $32,$3       
						; 0032 SET CAMERA DEST 32 3
		csWait $1E              
						; WAIT 1E
		setActscript $5,$FF,eas_Init
						; 0015 SET ACTSCRIPT 5 FF 460CE
		startEntity $5          
						; 001B START ENTITY ANIM 5
		entitySprite $5,$5      
						; 001A SET ENTITY SPRITE 5 5
		moveEntity $5,$FF,$2,$2 
						; 002D MOVE ENTITY 5 FF 2 2
		endMove $8080
		nextText $0,$5          
						; "You'll be captured if you go{N}that way.{W2}"
		nextSingleText $0,$5    
						; "I know this castle very{N}well.  I know a short cut.{W1}"
		moveEntity $5,$FF,$1,$4 
						; 002D MOVE ENTITY 5 FF 1 4
		endMove $8080
		csWait $1E              
						; WAIT 1E
		nextSingleText $FF,$FF  
						; "{NAME;5} pulls up some tiles{N}with a short wire.{W1}"
		csWait $1E              
						; WAIT 1E
		playSound SFX_DOOR_OPEN 
						; 0005 PLAY SOUND SFX_DOOR_OPEN
		setBlocks $3F02,$101,$3904
						; 0034 SET BLOCKS 3F02 101 3904
		csWait $14              
						; WAIT 14
		moveEntity $5,$FF,$0,$1 
						; 002D MOVE ENTITY 5 FF 0 1
		moreMove $1,$1
		endMove $8080
		setEntityDir $5,$3      
						; 0023 SET ENTITY FACING 5 3
		nextSingleText $0,$5    
						; "Now, go out through this{N}short cut!{W1}"
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_52938:
		textCursor $3B8         
						; Initial text line $3B8 : "You're right.  I did it.{W2}"
		moveEntity $5,$FF,$3,$1 
						; 002D MOVE ENTITY 5 FF 3 1
		endMove $8080
		setEntityDir $5,$2      
						; 0023 SET ENTITY FACING 5 2
		setEntityDir $0,$0      
						; 0023 SET ENTITY FACING 0 0
		nextText $0,$5          
						; "You're right.  I did it.{W2}"
		nextText $0,$5          
						; "But, I didn't know all this{N}would happen.{W2}"
		nextSingleText $0,$5    
						; "Please take me with you.{W1}"
		nextSingleText $FF,$FF  
						; "{CLEAR}{LEADER} decides to take{N}{NAME;5} with him.{W1}{CLEAR}"
		setActscript $5,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 5 FF 45E44
		setActscript $5,$0,eas_Jump
						; 0015 SET ACTSCRIPT 5 0 45E44
		nextText $0,$5          
						; "Thanks.  I promise to help{N}you.{W2}"
		nextSingleText $0,$5    
						; "This tunnel leads to the{N}kitchen.{N}We can escape safely.{W1}"
		moveEntity $0,$FF,$1,$1 
						; 002D MOVE ENTITY 0 FF 1 1
		endMove $8080
		fadeOutB                
						; 003A FADE OUT TO BLACK
		csc46 $18,$E            
						; 0046 UNKNOWN
		setActscript $1,$FF,eas_Init
						; 0015 SET ACTSCRIPT 1 FF 460CE
		setActscript $2,$FF,eas_Init
						; 0015 SET ACTSCRIPT 2 FF 460CE
		setActscript $3,$FF,eas_Init
						; 0015 SET ACTSCRIPT 3 FF 460CE
		setActscript $4,$FF,eas_Init
						; 0015 SET ACTSCRIPT 4 FF 460CE
		setActscript $5,$FF,eas_Init
						; 0015 SET ACTSCRIPT 5 FF 460CE
		hideEntity $1           
						; 002E HIDE ENTITY 1
		hideEntity $2           
						; 002E HIDE ENTITY 2
		hideEntity $3           
						; 002E HIDE ENTITY 3
		hideEntity $4           
						; 002E HIDE ENTITY 4
		entityPosDir $0,$1D,$C,$3
						; 0019 SET ENTITY POS AND FACING 0 1D C 3
		entityPosDir $5,$1D,$B,$3
						; 0019 SET ENTITY POS AND FACING 5 1D B 3
		stopEntity $0           
						; 001C STOP ENTITY ANIM 0
		stopEntity $5           
						; 001C STOP ENTITY ANIM 5
		fadeInB                 
						; 0039 FADE IN FROM BLACK
		customActscript $0,$FF  
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $10                
						;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $5,$FF  
						; 0014 SET MANUAL ACTSCRIPT 5
		dc.w $10                
						;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $0,$0,eas_RotateRight
						; 0015 SET ACTSCRIPT 0 0 45FBC
		setActscript $5,$0,eas_RotateRight
						; 0015 SET ACTSCRIPT 5 0 45FBC
		setEntityDest $8000,$1D,$12
						; 0029 SET ENTITY DEST 8000 1D 12
		setEntityDest $5,$1D,$11
						; 0029 SET ENTITY DEST 5 1D 11
		setEntityDir $0,$3      
						; 0023 SET ENTITY FACING 0 3
		setEntityDir $5,$3      
						; 0023 SET ENTITY FACING 5 3
		startEntity $0          
						; 001B START ENTITY ANIM 0
		startEntity $5          
						; 001B START ENTITY ANIM 5
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $5,$FF,eas_Init
						; 0015 SET ACTSCRIPT 5 FF 460CE
		followEntity $5,$0,$2   
						; 002C FOLLOW ENTITY 5 0 2
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_52A3C:
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		setEntityDir $83,$2     
						; 0023 SET ENTITY FACING 83 2
		textCursor $3BE         
						; Initial text line $3BE : "Hey, it's noisy next door.{W2}"
		nextText $0,$83         
						; "Hey, it's noisy next door.{W2}"
		nextSingleText $0,$83   
						; "It sounds like...{N}Mr. {NAME;28} and the King{N}are arguing.{W1}"
		csWait $14              
						; WAIT 14
		setEntityDir $83,$0     
						; 0023 SET ENTITY FACING 83 0
		nextText $0,$83         
						; "Who are you?{W2}"
		nextSingleText $0,$83   
						; "Now, I have to get back{N}to work.{W1}"
		csWait $14              
						; WAIT 14
		moveEntity $0,$FF,$0,$1 
						; 002D MOVE ENTITY 0 FF 0 1
		endMove $8080
		setEntityDir $0,$2      
						; 0023 SET ENTITY FACING 0 2
		csWait $14              
						; WAIT 14
		moveEntity $83,$FF,$0,$1
						; 002D MOVE ENTITY 83 FF 0 1
		moreMove $1,$1
		moreMove $0,$1
		endMove $8080
		csc_end                 
						; END OF CUTSCENE SCRIPT
