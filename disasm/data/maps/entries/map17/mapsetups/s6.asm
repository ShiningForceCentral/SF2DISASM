
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
		dc.w $34                
						; 0034 SET BLOCKS 3007 101 3008
		dc.w $3007
		dc.w $101
		dc.w $3008
		dc.w $34                
						; 0034 SET BLOCKS 3E14 102 3014
		dc.w $3E14
		dc.w $102
		dc.w $3014
		dc.w $34                
						; 0034 SET BLOCKS 3907 101 3908
		dc.w $3907
		dc.w $101
		dc.w $3908
		dc.w $34                
						; 0034 SET BLOCKS 3E14 102 3914
		dc.w $3E14
		dc.w $102
		dc.w $3914
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
cs_5249E:
		dc.w 5                  
						; 0005 PLAY SOUND 
		dc.w $FD
		dc.w $55                
						; 0055 RESET FORCE BATTLE STATS
		dc.w $36                
						; 0036 RELATED TO LOADING A MAP
		dc.w $49                
						; 0049  0 0 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 370 : "Impossible!{N}Galam and Granseal are{N}allies!{W1}"
		dc.w $370
		dc.w $46                
						; 0046  34 1
		dc.w $34
		dc.w 1
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 0 3B 4 1
		dc.b 0
		dc.b $3B
		dc.b 4
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1 : "Impossible!{N}Galam and Granseal are{N}allies!{W1}"
		dc.w 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C084 : "But it's true.  I'm a scholar.{N}I'm here because I tried{N}to stop him.{W1}"
		dc.w $C084
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C085 : "I'm a leader of the Galam{N}Army.  I disagreed with{N}the war and now I'm here.{W2}"
		dc.w $C085
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C085 : "What did your kingdom{N}do to Galam?{W2}"
		dc.w $C085
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C085 : "What is the reason for this{N}war?{W1}"
		dc.w $C085
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 4 : "What about Sir Hawel?{N}He was killed by Galam!{W2}"
		dc.w 4
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 4 : "What did Galam want?{N}What is Ground Seal?{W1}"
		dc.w 4
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C084 : "Ground Seal...do you know{N}what Ground Seal is?{W1}"
		dc.w $C084
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 2 : "What is Ground Seal?{N}Please tell me!{W1}"
		dc.w 2
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C084 : "I heard King Galam say{N}those words.{W2}"
		dc.w $C084
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C084 : "I just know that something{N}is being concealed.{W1}"
		dc.w $C084
		dc.w $37                
						; 0037 LOAD MAP AND FADE IN 11 34 1
		dc.w $11
		dc.w $34
		dc.w 1
		dc.b $80                
						; WAIT 1
		dc.b 1
		dc.w 5                  
						; 0005 PLAY SOUND MUSIC_CASTLE
		dc.w $26
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $29                
						; 0029 SET ENTITY DEST 0 3B 5
		dc.w 0
		dc.w $3B
		dc.w 5
		dc.w $27                
						; 0027 MAKE ENTITY SHAKE HEAD 0
		dc.w 0
		dc.w $26                
						; 0026 MAKE ENTITY NOD 0
		dc.w 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 0 : "(Yawn){W1}"
		dc.w 0
		dc.w $23                
						; 0023 SET ENTITY FACING 0 2
		dc.b 0
		dc.b 2
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w $23                
						; 0023 SET ENTITY FACING 2 0
		dc.b 2
		dc.b 0
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 37C : "{LEADER}!{N}You finally woke up!{W2}"
		dc.w $37C
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 2 : "{LEADER}!{N}You finally woke up!{W2}"
		dc.w 2
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 2 : "We're talking about{N}Ground Seal.{N}Please, join in.{W1}"
		dc.w 2
		dc.w $23                
						; 0023 SET ENTITY FACING 2 2
		dc.b 2
		dc.b 2
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
cs_52530:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 385 : "What's wrong with the seal?{W1}"
		dc.w $385
		dc.w $32                
						; 0032 SET CAMERA DEST 30 0
		dc.w $30
		dc.w 0
		dc.w $23                
						; 0023 SET ENTITY FACING 0 3
		dc.b 0
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C084 : "What's wrong with the seal?{W1}"
		dc.w $C084
		dc.w $2D                
						; 002D MOVE ENTITY 2 FF 2 1
		dc.b 2
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C002 : "Somebody broke the sacred{N}seal?{W1}"
		dc.w $C002
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1 : "We're not sure.{N}It seems that somebody{N}stole the two jewels.{W1}"
		dc.w 1
		dc.w $32                
						; 0032 SET CAMERA DEST 2B 0
		dc.w $2B
		dc.w 0
		dc.w $1B                
						; 001B START ENTITY ANIM 5
		dc.w 5
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "...ancient...shrine...{N}two...jewels...!{W1}"
		dc.w 5
		dc.w $2D                
						; 002D MOVE ENTITY 85 FF 2 1
		dc.b $85
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 85 : "Oh, you woke up!{N}Are you OK?{W1}"
		dc.w $85
		dc.w $23                
						; 0023 SET ENTITY FACING 0 2
		dc.b 0
		dc.b 2
		dc.w $23                
						; 0023 SET ENTITY FACING 2 2
		dc.b 2
		dc.b 2
		dc.w $23                
						; 0023 SET ENTITY FACING 3 2
		dc.b 3
		dc.b 2
		dc.w $23                
						; 0023 SET ENTITY FACING 1 2
		dc.b 1
		dc.b 2
		dc.w $23                
						; 0023 SET ENTITY FACING 4 2
		dc.b 4
		dc.b 2
		dc.w $23                
						; 0023 SET ENTITY FACING 84 2
		dc.b $84
		dc.b 2
		dc.w $23                
						; 0023 SET ENTITY FACING 85 2
		dc.b $85
		dc.b 2
		dc.w $2D                
						; 002D MOVE ENTITY 5 FF 0 1
		dc.b 5
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $15                
						; 0015 SET ACTSCRIPT 5 0 461B6
		dc.b 5
		dc.b 0
		dc.l eas_461B6          
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "Where...?{N}...I...why am I...?{W1}"
		dc.w 5
		dc.w $23                
						; 0023 SET ENTITY FACING 5 3
		dc.b 5
		dc.b 3
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C084 : "This is a jail in the{N}basement of Galam Castle.{W2}"
		dc.w $C084
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C084 : "Say, you mustn't move yet!{W1}"
		dc.w $C084
		dc.w $27                
						; 0027 MAKE ENTITY SHAKE HEAD 5
		dc.w 5
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "Yes, I remember!{N}I was caught by Galam{N}soldiers.{W1}"
		dc.w 5
		dc.w $23                
						; 0023 SET ENTITY FACING 85 1
		dc.b $85
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 85 : "They took my jewels and{N}brought me here!{W1}"
		dc.w $85
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 5
		dc.w 5
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "They...they killed my{N}friends!{W1}"
		dc.w 5
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 5
		dc.b 5
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$E Y=$E
		dc.b $E
		dc.b $E
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $2D                
						; 002D MOVE ENTITY 5 FF 3 1
		dc.b 5
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.b $C
		dc.b $28
		dc.b 2
		dc.b 1
		dc.b $C
		dc.b $28
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 5 1
		dc.b 5
		dc.b 1
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 5
		dc.b 5
		dc.b $FF
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
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $1C                
						; 001C STOP ENTITY ANIM 5
		dc.w 5
		dc.w $23                
						; 0023 SET ENTITY FACING 85 2
		dc.b $85
		dc.b 2
		dc.b $80                
						; WAIT 32
		dc.b $32
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "Ouch!{N}I can hardly move.{W1}"
		dc.w 5
		dc.w $2D                
						; 002D MOVE ENTITY 85 FF 2 1
		dc.b $85
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 85 : "Stay here for a while.{N}You need to rest.{W1}"
		dc.w $85
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $2D                
						; 002D MOVE ENTITY 85 FF 0 2
		dc.b $85
		dc.b $FF
		dc.b 0
		dc.b 2
		dc.w $8080
		dc.w $32                
						; 0032 SET CAMERA DEST 2F 0
		dc.w $2F
		dc.w 0
		dc.w $23                
						; 0023 SET ENTITY FACING 1 0
		dc.b 1
		dc.b 0
		dc.w $23                
						; 0023 SET ENTITY FACING 85 0
		dc.b $85
		dc.b 0
		dc.w $23                
						; 0023 SET ENTITY FACING 0 3
		dc.b 0
		dc.b 3
		dc.w $23                
						; 0023 SET ENTITY FACING 3 3
		dc.b 3
		dc.b 3
		dc.w $23                
						; 0023 SET ENTITY FACING 4 3
		dc.b 4
		dc.b 3
		dc.w $23                
						; 0023 SET ENTITY FACING 84 3
		dc.b $84
		dc.b 3
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C084 : "What were we talking{N}about?{W2}"
		dc.w $C084
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C084 : "Oh, yes.  Why is King Galam{N}interested in Ground Seal?{W1}"
		dc.w $C084
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1 : "Is it related to the opened{N}door?{W1}"
		dc.w 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "Hey!{W1}"
		dc.w 5
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 5
		dc.b 5
		dc.b $FF
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
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $1A                
						; 001A SET ENTITY SPRITE 5 3B
		dc.w 5
		dc.w $3B
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 4 : "Does he want the jewels?{W1}"
		dc.w 4
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "What?{W1}"
		dc.w 5
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 5
		dc.w 5
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 3 : "The man that broke the seal{N}is to blame for everything!{W1}"
		dc.w 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "Oh, no!{W1}"
		dc.w 5
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 5
		dc.w 5
		dc.w $2D                
						; 002D MOVE ENTITY 85 FF 2 1
		dc.b $85
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 85 : "Are you OK?{N}You know something?{W1}"
		dc.w $85
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "Uhh...nope!{W1}"
		dc.w 5
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 5
		dc.w 5
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 4 : "We can't stay here!{W2}"
		dc.w 4
		dc.w $23                
						; 0023 SET ENTITY FACING 1 0
		dc.b 1
		dc.b 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 4 : "We must escape!{W1}"
		dc.w 4
		dc.w $2D                
						; 002D MOVE ENTITY 85 FF 0 1
		dc.b $85
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 1 : "I know, but how can we{N}open that locked door?{W2}"
		dc.w 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1 : "Oh, Galam is invading{N}Granseal while we're{N}sitting here!{W1}"
		dc.w 1
		dc.w $32                
						; 0032 SET CAMERA DEST 2B 0
		dc.w $2B
		dc.w 0
		dc.w $15                
						; 0015 SET ACTSCRIPT 5 FF 460CE
		dc.b 5
		dc.b $FF
		dc.l eas_Init           
		dc.w $1B                
						; 001B START ENTITY ANIM 5
		dc.w 5
		dc.w $1A                
						; 001A SET ENTITY SPRITE 5 5
		dc.w 5
		dc.w 5
		dc.w $15                
						; 0015 SET ACTSCRIPT 5 FF 45E44
		dc.b 5
		dc.b $FF
		dc.l eas_Jump           
		dc.w $2D                
						; 002D MOVE ENTITY 5 FF 0 1
		dc.b 5
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "I'll open the door for you!{W1}"
		dc.w 5
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 5
		dc.w 5
		dc.w $2D                
						; 002D MOVE ENTITY 85 FF 2 1
		dc.b $85
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 1 3
		dc.b 1
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 85 : "Oh, yes!  You're a thief and{N}you can open locked doors.{W1}"
		dc.w $85
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "Yes, of course!{N}I'm the great thief, {NAME;5}!{W1}"
		dc.w 5
		dc.w $2D                
						; 002D MOVE ENTITY 5 FF 2 1
		dc.b 5
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 5 3
		dc.b 5
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{NAME;5} sticks a short wire{N}into the keyhole.{W1}"
		dc.w $FFFF
		dc.w 5                  
						; 0005 PLAY SOUND SFX_SECRET_PATH_ROCK
		dc.w $60
		dc.w $34                
						; 0034 SET BLOCKS 3007 101 3008
		dc.w $3007
		dc.w $101
		dc.w $3008
		dc.w $34                
						; 0034 SET BLOCKS 3E14 102 3014
		dc.w $3E14
		dc.w $102
		dc.w $3014
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 3A3 : "{NAME;5} sticks a short wire{N}into the keyhole.{W1}"
		dc.w $3A3
		dc.w $2D                
						; 002D MOVE ENTITY 5 FF 3 2
		dc.b 5
		dc.b $FF
		dc.b 3
		dc.b 2
		dc.b 0
		dc.b 9
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 5 1
		dc.b 5
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{NAME;5} sticks a short wire{N}into the keyhole.{W1}"
		dc.w $FFFF
		dc.w 5                  
						; 0005 PLAY SOUND SFX_SECRET_PATH_ROCK
		dc.w $60
		dc.w $34                
						; 0034 SET BLOCKS 3907 101 3908
		dc.w $3907
		dc.w $101
		dc.w $3908
		dc.w $34                
						; 0034 SET BLOCKS 3E14 102 3914
		dc.w $3E14
		dc.w $102
		dc.w $3914
		dc.w $2D                
						; 002D MOVE ENTITY 5 FF 1 2
		dc.b 5
		dc.b $FF
		dc.b 1
		dc.b 2
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C005 : "OK, it's done.{N}Hurry to your country and{N}save them!{W1}"
		dc.w $C005
		dc.w $2D                
						; 002D MOVE ENTITY 2 FF 0 1
		dc.b 2
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 2 3
		dc.b 2
		dc.b 3
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 2 : "Thank you!{W2}"
		dc.w 2
		dc.w $23                
						; 0023 SET ENTITY FACING 2 2
		dc.b 2
		dc.b 2
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 2 : "{LEADER}, let's get back{N}to Granseal!{W1}"
		dc.w 2
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 0 45E44
		dc.b 0
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 3 0 45E44
		dc.b 3
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 4 FF 45E44
		dc.b 4
		dc.b $FF
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 0 45E44
		dc.b 0
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 3 0 45E44
		dc.b 3
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 4 FF 45E44
		dc.b 4
		dc.b $FF
		dc.l eas_Jump           
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1 : "Why are you being so nice{N}to us?  You don't know us.{W1}"
		dc.w 1
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 5
		dc.w 5
		dc.b $80                
						; WAIT 5
		dc.b 5
		dc.w $15                
						; 0015 SET ACTSCRIPT 5 0 461B6
		dc.b 5
		dc.b 0
		dc.l eas_461B6          
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C005 : "Ah, that's because...{N}well...{W1}"
		dc.w $C005
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $23                
						; 0023 SET ENTITY FACING 5 1
		dc.b 5
		dc.b 1
		dc.w $15                
						; 0015 SET ACTSCRIPT 5 FF 46172
		dc.b 5
		dc.b $FF
		dc.l eas_46172          
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 5
		dc.b 5
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $2D                
						; 002D MOVE ENTITY 5 0 3 2
		dc.b 5
		dc.b 0
		dc.b 3
		dc.b 2
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 1 FF 2 3
		dc.b 1
		dc.b $FF
		dc.b 2
		dc.b 3
		dc.b 3
		dc.b 4
		dc.b 0
		dc.b 4
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 5 2
		dc.b 5
		dc.b 2
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1 : "Is it...?{N}Are you the thief who broke{N}the seal?{W1}"
		dc.w 1
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 5
		dc.w 5
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C005 : "I...ah...{W1}"
		dc.w $C005
		dc.w $2D                
						; 002D MOVE ENTITY 1 FF 0 3
		dc.b 1
		dc.b $FF
		dc.b 0
		dc.b 3
		dc.w $8080
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 1 : "You are!{W2}"
		dc.w 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1 : "Hey, you!{N}Do you know what you've done?{W1}"
		dc.w 1
		dc.w $15                
						; 0015 SET ACTSCRIPT 1 0 45EBC
		dc.b 1
		dc.b 0
		dc.l eas_BumpRight      
		dc.w $2D                
						; 002D MOVE ENTITY 5 FF 0 1
		dc.b 5
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1 : "A big problem was created{N}because you stole the{N}jewels!{W1}"
		dc.w 1
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 1
		dc.b 1
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $2D                
						; 002D MOVE ENTITY 1 FF 0 1
		dc.b 1
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $15                
						; 0015 SET ACTSCRIPT 1 0 45EBC
		dc.b 1
		dc.b 0
		dc.l eas_BumpRight      
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 5
		dc.b 5
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$E Y=$E
		dc.b $E
		dc.b $E
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $2D                
						; 002D MOVE ENTITY 5 FF 0 1
		dc.b 5
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 5
		dc.b 5
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $2D                
						; 002D MOVE ENTITY 5 FF 0 1
		dc.b 5
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $1C                
						; 001C STOP ENTITY ANIM 5
		dc.w 5
		dc.w $23                
						; 0023 SET ENTITY FACING 5 1
		dc.b 5
		dc.b 1
		dc.w $1A                
						; 001A SET ENTITY SPRITE 5 3B
		dc.w 5
		dc.w $3B
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 1 : "I know the thief {NAME;5}{N}always steals for poor{N}people, but you made a{W2}"
		dc.w 1
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 1 : "serious mistake this time!!{W2}"
		dc.w 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1 : "All these disasters...{N}everything is YOUR fault!{W1}"
		dc.w 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C005 : "I didn't mean to...{W1}"
		dc.w $C005
		dc.w $2D                
						; 002D MOVE ENTITY 1 FF 0 1
		dc.b 1
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.b 1
		dc.b 2
		dc.b 2
		dc.b 4
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 1 1
		dc.b 1
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1 : "That's enough!{N}{LEADER}, let's go!{W1}"
		dc.w 1
		dc.w $2C                
						; 002C FOLLOW ENTITY 3 0 2
		dc.w 3
		dc.w 0
		dc.w 2
		dc.w $2C                
						; 002C FOLLOW ENTITY 4 3 2
		dc.w 4
		dc.w 3
		dc.w 2
		dc.w $2C                
						; 002C FOLLOW ENTITY 2 4 2
		dc.w 2
		dc.w 4
		dc.w 2
		dc.w $2C                
						; 002C FOLLOW ENTITY 1 2 2
		dc.w 1
		dc.w 2
		dc.w 2
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
cs_528CA:
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 0 1
		dc.b 0
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
cs_528D4:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 3B3 : "Wait!{W1}"
		dc.w $3B3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "Wait!{W1}"
		dc.w 5
		dc.w $32                
						; 0032 SET CAMERA DEST 32 3
		dc.w $32
		dc.w 3
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $15                
						; 0015 SET ACTSCRIPT 5 FF 460CE
		dc.b 5
		dc.b $FF
		dc.l eas_Init           
		dc.w $1B                
						; 001B START ENTITY ANIM 5
		dc.w 5
		dc.w $1A                
						; 001A SET ENTITY SPRITE 5 5
		dc.w 5
		dc.w 5
		dc.w $2D                
						; 002D MOVE ENTITY 5 FF 2 2
		dc.b 5
		dc.b $FF
		dc.b 2
		dc.b 2
		dc.w $8080
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 5 : "You'll be captured if you go{N}that way.{W2}"
		dc.w 5
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "I know this castle very{N}well.  I know a short cut.{W1}"
		dc.w 5
		dc.w $2D                
						; 002D MOVE ENTITY 5 FF 1 4
		dc.b 5
		dc.b $FF
		dc.b 1
		dc.b 4
		dc.w $8080
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{NAME;5} pulls up some tiles{N}with a short wire.{W1}"
		dc.w $FFFF
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w 5                  
						; 0005 PLAY SOUND SFX_DOOR_OPEN
		dc.w $5C
		dc.w $34                
						; 0034 SET BLOCKS 3F02 101 3904
		dc.w $3F02
		dc.w $101
		dc.w $3904
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $2D                
						; 002D MOVE ENTITY 5 FF 0 1
		dc.b 5
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 5 3
		dc.b 5
		dc.b 3
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "Now, go out through this{N}short cut!{W1}"
		dc.w 5
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
cs_52938:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 3B8 : "You're right.  I did it.{W2}"
		dc.w $3B8
		dc.w $2D                
						; 002D MOVE ENTITY 5 FF 3 1
		dc.b 5
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 5 2
		dc.b 5
		dc.b 2
		dc.w $23                
						; 0023 SET ENTITY FACING 0 0
		dc.b 0
		dc.b 0
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 5 : "You're right.  I did it.{W2}"
		dc.w 5
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 5 : "But, I didn't know all this{N}would happen.{W2}"
		dc.w 5
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "Please take me with you.{W1}"
		dc.w 5
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{CLEAR}{LEADER} decides to take{N}{NAME;5} with him.{W1}{CLEAR}"
		dc.w $FFFF
		dc.w $15                
						; 0015 SET ACTSCRIPT 5 FF 45E44
		dc.b 5
		dc.b $FF
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 5 0 45E44
		dc.b 5
		dc.b 0
		dc.l eas_Jump           
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 5 : "Thanks.  I promise to help{N}you.{W2}"
		dc.w 5
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 5 : "This tunnel leads to the{N}kitchen.{N}We can escape safely.{W1}"
		dc.w 5
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 1 1
		dc.b 0
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $3A                
						; 003A FADE OUT TO BLACK
		dc.w $46                
						; 0046  18 E
		dc.w $18
		dc.w $E
		dc.w $15                
						; 0015 SET ACTSCRIPT 1 FF 460CE
		dc.b 1
		dc.b $FF
		dc.l eas_Init           
		dc.w $15                
						; 0015 SET ACTSCRIPT 2 FF 460CE
		dc.b 2
		dc.b $FF
		dc.l eas_Init           
		dc.w $15                
						; 0015 SET ACTSCRIPT 3 FF 460CE
		dc.b 3
		dc.b $FF
		dc.l eas_Init           
		dc.w $15                
						; 0015 SET ACTSCRIPT 4 FF 460CE
		dc.b 4
		dc.b $FF
		dc.l eas_Init           
		dc.w $15                
						; 0015 SET ACTSCRIPT 5 FF 460CE
		dc.b 5
		dc.b $FF
		dc.l eas_Init           
		dc.w $2E                
						; 002E HIDE ENTITY 1
		dc.w 1
		dc.w $2E                
						; 002E HIDE ENTITY 2
		dc.w 2
		dc.w $2E                
						; 002E HIDE ENTITY 3
		dc.w 3
		dc.w $2E                
						; 002E HIDE ENTITY 4
		dc.w 4
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 0 1D C 3
		dc.b 0
		dc.b $1D
		dc.b $C
		dc.b 3
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 5 1D B 3
		dc.b 5
		dc.b $1D
		dc.b $B
		dc.b 3
		dc.w $1C                
						; 001C STOP ENTITY ANIM 0
		dc.w 0
		dc.w $1C                
						; 001C STOP ENTITY ANIM 5
		dc.w 5
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.b 0
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 5
		dc.b 5
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 0 45FBC
		dc.b 0
		dc.b 0
		dc.l eas_RotateRight    
		dc.w $15                
						; 0015 SET ACTSCRIPT 5 0 45FBC
		dc.b 5
		dc.b 0
		dc.l eas_RotateRight    
		dc.w $29                
						; 0029 SET ENTITY DEST 8000 1D 12
		dc.w $8000
		dc.w $1D
		dc.w $12
		dc.w $29                
						; 0029 SET ENTITY DEST 5 1D 11
		dc.w 5
		dc.w $1D
		dc.w $11
		dc.w $23                
						; 0023 SET ENTITY FACING 0 3
		dc.b 0
		dc.b 3
		dc.w $23                
						; 0023 SET ENTITY FACING 5 3
		dc.b 5
		dc.b 3
		dc.w $1B                
						; 001B START ENTITY ANIM 0
		dc.w 0
		dc.w $1B                
						; 001B START ENTITY ANIM 5
		dc.w 5
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 460CE
		dc.b 0
		dc.b $FF
		dc.l eas_Init           
		dc.w $15                
						; 0015 SET ACTSCRIPT 5 FF 460CE
		dc.b 5
		dc.b $FF
		dc.l eas_Init           
		dc.w $2C                
						; 002C FOLLOW ENTITY 5 0 2
		dc.w 5
		dc.w 0
		dc.w 2
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
cs_52A3C:
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 460CE
		dc.b 0
		dc.b $FF
		dc.l eas_Init           
		dc.w $23                
						; 0023 SET ENTITY FACING 83 2
		dc.b $83
		dc.b 2
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 3BE : "Hey, it's noisy next door.{W2}"
		dc.w $3BE
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 83 : "Hey, it's noisy next door.{W2}"
		dc.w $83
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "It sounds like...{N}Mr. {NAME;28} and the King{N}are arguing.{W1}"
		dc.w $83
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $23                
						; 0023 SET ENTITY FACING 83 0
		dc.b $83
		dc.b 0
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 83 : "Who are you?{W2}"
		dc.w $83
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 83 : "Now, I have to get back{N}to work.{W1}"
		dc.w $83
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 0 1
		dc.b 0
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 0 2
		dc.b 0
		dc.b 2
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $2D                
						; 002D MOVE ENTITY 83 FF 0 1
		dc.b $83
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.b 1
		dc.b 1
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
