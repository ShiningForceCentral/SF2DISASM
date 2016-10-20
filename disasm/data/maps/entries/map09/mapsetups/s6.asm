
; ASM FILE data\maps\entries\map09\mapsetups\s6.asm :
; 0x568C4..0x56B84 : 

; =============== S U B R O U T I N E =======================================

ms_map9_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $206               
						; Battle 18 completed
		bne.s   loc_568D4
		move.w  #$89,d0 
		jsr     MoveEntityOutOfMap
loc_568D4:
		
		trap    #CHECK_FLAG
		dc.w $41                
						; Caravan is unlocked (0x4428A..0x44337, 0x44338..0x44403)
		beq.s   loc_568E4
		move.w  #$B,d0
		jsr     MoveEntityOutOfMap
loc_568E4:
		
		trap    #CHECK_FLAG
		dc.w $C                 
						; Rick joined
		beq.s   return_568F4
		move.w  #$C,d0
		jsr     MoveEntityOutOfMap
return_568F4:
		
		rts

	; End of function ms_map9_InitFunction

cs_568F6:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 55C : "Where are you from?{W1}"
		dc.w $55C
		dc.w $23                
						; 0023 SET ENTITY FACING 0 0
		dc.b 0
		dc.b 0
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $2D                
						; 002D MOVE ENTITY 82 FF 2 1
		dc.b $82
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 82 2
		dc.b $82
		dc.b 2
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "Where are you from?{W1}"
		dc.w $C082
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $29                
						; 0029 SET ENTITY DEST 7 4 3A
		dc.w 7
		dc.w 4
		dc.w $3A
		dc.w $23                
						; 0023 SET ENTITY FACING 7 0
		dc.b 7
		dc.b 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "{LEADER} came from{N}Grans Island.{W1}"
		dc.w 7
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 82
		dc.b $82
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
						; 002D MOVE ENTITY 82 FF 2 1
		dc.b $82
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "Then we could be related.{W1}"
		dc.w $C082
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $23                
						; 0023 SET ENTITY FACING 7 1
		dc.b 7
		dc.b 1
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "What do you mean?{W1}"
		dc.w 7
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w $15                
						; 0015 SET ACTSCRIPT 82 FF 46102
		dc.b $82
		dc.b $FF
		dc.l eas_Init2          
		dc.w $23                
						; 0023 SET ENTITY FACING 82 3
		dc.b $82
		dc.b 3
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $23                
						; 0023 SET ENTITY FACING 82 2
		dc.b $82
		dc.b 2
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w $2D                
						; 002D MOVE ENTITY 82 0 0 1
		dc.b $82
		dc.b 0
		dc.b 0
		dc.b 1
		dc.b 3
		dc.b 1
		dc.w $8080
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
		dc.b $80                
						; WAIT A
		dc.b $A
		dc.w $23                
						; 0023 SET ENTITY FACING 0 3
		dc.b 0
		dc.b 3
		dc.w $23                
						; 0023 SET ENTITY FACING 7 0
		dc.b 7
		dc.b 0
		dc.w $23                
						; 0023 SET ENTITY FACING 82 2
		dc.b $82
		dc.b 2
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C082 : "Our ancestors came to{N}Parmecia to chase after{N}a soldier called Max.{W2}"
		dc.w $C082
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C082 : "They lost his trail at the{N}shore and then split into{N}two groups.{W2}"
		dc.w $C082
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "One group went back to{N}Grans by way of Devil's Tail.{W1}"
		dc.w $C082
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "Hmmm...and what happened{N}to Max?{W1}"
		dc.w 7
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C082 : "He wasn't found in Parmecia,{N}so maybe he went to Grans.{N}I'm not really sure.{W2}"
		dc.w $C082
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C082 : "I think I'll take a nap{N}now.  Bye.{W1}"
		dc.w $C082
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 1 1
		dc.b 7
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 7 0
		dc.b 7
		dc.b 0
		dc.w $23                
						; 0023 SET ENTITY FACING 0 2
		dc.b 0
		dc.b 2
		dc.w $2C                
						; 002C FOLLOW ENTITY 7 0 2
		dc.w 7
		dc.w 0
		dc.w 2
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
cs_569BC:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 566 : "(Sniff)...(sniff)...I smell{N}something old....{W1}"
		dc.w $566
		dc.w $29                
						; 0029 SET ENTITY DEST 7 F 39
		dc.w 7
		dc.w $F
		dc.w $39
		dc.w $23                
						; 0023 SET ENTITY FACING 7 3
		dc.b 7
		dc.b 3
		dc.w $23                
						; 0023 SET ENTITY FACING 0 3
		dc.b 0
		dc.b 3
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C00B : "(Sniff)...(sniff)...I smell{N}something old....{W1}"
		dc.w $C00B
		dc.w $23                
						; 0023 SET ENTITY FACING B 1
		dc.b $B
		dc.b 1
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C00B : "That sword must be really{N}old.  Oh, my!{N}It's the Achilles Sword!{W2}"
		dc.w $C00B
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT B
		dc.b $B
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.b 0
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 46172
		dc.b 0
		dc.b $FF
		dc.l eas_46172          
		dc.w $2D                
						; 002D MOVE ENTITY B 0 1 1
		dc.b $B
		dc.b 0
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.b $80                
						; WAIT 3
		dc.b 3
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 1 1
		dc.b 0
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C00B : "You're an adventurer, right?{N}Don't you need a vehicle?{N}Huh?{W2}"
		dc.w $C00B
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C00B : "You can get the Ancient{N}Caravan with that sword!{W1}"
		dc.w $C00B
		dc.w $29                
						; 0029 SET ENTITY DEST 7 F 3A
		dc.w 7
		dc.w $F
		dc.w $3A
		dc.w $23                
						; 0023 SET ENTITY FACING 7 0
		dc.b 7
		dc.b 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "You wouldn't listen to us{N}just a short time ago!{W1}"
		dc.w 7
		dc.w $23                
						; 0023 SET ENTITY FACING B 2
		dc.b $B
		dc.b 2
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C00B : "I was busy and...{W1}"
		dc.w $C00B
		dc.w $23                
						; 0023 SET ENTITY FACING B 1
		dc.b $B
		dc.b 1
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C00B : "Let me join you!{W2}"
		dc.w $C00B
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C00B : "I'm the only one who can{N}drive it!{W2}"
		dc.w $C00B
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C00B : "You are going to get the{N}Caravan, aren't you?!{W1}"
		dc.w $C00B
		dc.w $11                
						; 0011 STORY YESNO PROMPT
		dc.w $C                 
						; 000C JUMP IF SET FLAG 59 56A82 : YES/NO prompt answer
		dc.w $59
		dc.l word_56A82         
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT B
		dc.b $B
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
		dc.w $15                
						; 0015 SET ACTSCRIPT B FF 46172
		dc.b $B
		dc.b $FF
		dc.l eas_46172          
		dc.w $2D                
						; 002D MOVE ENTITY B FF 3 1
		dc.b $B
		dc.b $FF
		dc.b 3
		dc.b 1
		dc.w $8080
word_56A70:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 56F : "You don't know what you'll{N}be missing!{W1}"
		dc.w $56F
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C00B : "You don't know what you'll{N}be missing!{W1}"
		dc.w $C00B
		dc.w $23                
						; 0023 SET ENTITY FACING B 3
		dc.b $B
		dc.b 3
		dc.w $B                 
						; 000B JUMP 56AD4
		dc.l word_56AD4         
word_56A82:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 572 : "Great!  Good lad!{W1}"
		dc.w $572
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C00B : "Great!  Good lad!{W1}"
		dc.w $C00B
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{CLEAR}{LEADER} decides to take{N}Dr. {NAME;11} with him.{W1}{CLEAR}"
		dc.w $FFFF
		dc.w $15                
						; 0015 SET ACTSCRIPT B FF 460CE
		dc.b $B
		dc.b $FF
		dc.l eas_Init           
		dc.w $53                
						; 0053  B FFFF
		dc.w $B
		dc.w $FFFF
		dc.w $53                
						; 0053  0 0
		dc.w 0
		dc.w 0
		dc.w $15                
						; 0015 SET ACTSCRIPT B FF 45E44
		dc.b $B
		dc.b $FF
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT B 0 45E44
		dc.b $B
		dc.b 0
		dc.l eas_Jump           
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C00B : "Let's go!{W1}"
		dc.w $C00B
		dc.w $53                
						; 0053  0 FFFF
		dc.w 0
		dc.w $FFFF
		dc.w $10                
						; 0010 SET FLAG 2D5 FFFF : set after telling Rohde that you're going to get the Caravan
		dc.w $2D5
		dc.w $FFFF
		dc.w $10                
						; 0010 SET FLAG 54 FFFF : Rohde is a follower
		dc.w $54
		dc.w $FFFF
		dc.w $13                
						; 0013 SET STORY FLAG 12 : Battle 18 unlocked
		dc.w $12
		dc.w $2C                
						; 002C FOLLOW ENTITY B 1F 2
		dc.w $B
		dc.w $1F
		dc.w 2
word_56AD4:
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 460CE
		dc.b 0
		dc.b $FF
		dc.l eas_Init           
		dc.w $2C                
						; 002C FOLLOW ENTITY 7 0 2
		dc.w 7
		dc.w 0
		dc.w 2
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
cs_56AE6:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 570 : "You again?!{W1}"
		dc.w $570
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C00B : "You again?!{W1}"
		dc.w $C00B
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C00B : "You changed your mind?{N}Hmmm....{W1}"
		dc.w $C00B
		dc.w $11                
						; 0011 STORY YESNO PROMPT
		dc.w $C                 
						; 000C JUMP IF SET FLAG 59 56A82 : YES/NO prompt answer
		dc.w $59
		dc.l word_56A82         
		dc.w $B                 
						; 000B JUMP 56A70
		dc.l word_56A70         
cs_56B02:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 583 : "Are you the boy who killed{N}the legendary Kraken?{W2}"
		dc.w $583
		dc.w $53                
						; 0053  C FFFF
		dc.w $C
		dc.w $FFFF
		dc.w $53                
						; 0053  0 0
		dc.w 0
		dc.w 0
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C : "Are you the boy who killed{N}the legendary Kraken?{W2}"
		dc.w $C
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C : "I got to Hassan thanks to{N}you.{W2}"
		dc.w $C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C : "I didn't know this was such a{N}dull town.{W1}"
		dc.w $C
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $23                
						; 0023 SET ENTITY FACING C 1
		dc.b $C
		dc.b 1
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $15                
						; 0015 SET ACTSCRIPT C FF 45E44
		dc.b $C
		dc.b $FF
		dc.l eas_Jump           
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $52                
						; 0052 RELATED TO TWO ENTITIES C 0
		dc.w $C
		dc.w 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C : "Wh...what's that?!{W1}"
		dc.w $C
		dc.w $52                
						; 0052 RELATED TO TWO ENTITIES 7 C
		dc.w 7
		dc.w $C
		dc.w $52                
						; 0052 RELATED TO TWO ENTITIES C 7
		dc.w $C
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C007 : "It's the Caravan...an ancient{N}vehicle found in the shrine.{W1}"
		dc.w $C007
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $52                
						; 0052 RELATED TO TWO ENTITIES C 0
		dc.w $C
		dc.w 0
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C : "I love interesting{N}things like that!{W2}"
		dc.w $C
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C : "Wow!  You found it?!{W2}"
		dc.w $C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C : "I want to go with you to{N}see some more interesting{N}things!{W1}"
		dc.w $C
		dc.w 8                  
						; 0008 JOIN FORCE C
		dc.w $C
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C : "Adventure!{N}Yo Ho!  Let's go!{W1}"
		dc.w $C
		dc.w $15                
						; 0015 SET ACTSCRIPT C FF 45E44
		dc.b $C
		dc.b $FF
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT C FF 45E44
		dc.b $C
		dc.b $FF
		dc.l eas_Jump           
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $53                
						; 0053  0 FFFF
		dc.w 0
		dc.w $FFFF
		dc.w $56                
						; 0056 SOMETHING WITH AN ENTITY C
		dc.w $C
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
