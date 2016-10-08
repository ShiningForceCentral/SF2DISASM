
; SCRIPT SECTION maps\entries\map03\mapsetups\s6_261 :
; 

; =============== S U B R O U T I N E =======================================

ms_map3_flag261_InitFunction:
										
										trap    #CHECK_FLAG
										dc.w 3                  ; Jaha joined
										beq.s   return_513CC
										lea     cs_513CE(pc), a0
										trap    #6
return_513CC:
										
										rts

	; End of function ms_map3_flag261_InitFunction

cs_513CE:           dc.w $2E                ; 002E HIDE ENTITY 3
										dc.w 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
										dc.b $4E
										dc.b $75 
cs_513D6:           dc.w $2D                ; 002D MOVE ENTITY 1 FF 2 1
										dc.b 1
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_513E2:           dc.w 4                  ; 0004 INIT TEXT CURSOR 216 : "{LEADER}, so you decided{N}to go?{W1}"
										dc.w $216
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1 : "{LEADER}, so you decided{N}to go?{W1}"
										dc.w 1
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 51406 : YES/NO prompt answer
										dc.w $59
										dc.l word_51406         
										dc.w 4                  ; 0004 INIT TEXT CURSOR 214 : "No?  Really?{N}Then I'm not going either!{W2}"
										dc.w $214
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1 : "No?  Really?{N}Then I'm not going either!{W2}"
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1 : "But, if you change your{N}mind, let me know right{N}away!{W1}"
										dc.w 1
										dc.w $B                 ; 000B JUMP 51650
										dc.l word_51650         
word_51406:         dc.w 4                  ; 0004 INIT TEXT CURSOR 217 : "Great!{N}Let's go right now!{N}Hurry!{W1}"
										dc.w $217
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1 : "Great!{N}Let's go right now!{N}Hurry!{W1}"
										dc.w 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 2
										dc.b 2
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2 : "What?  {LEADER}, are you{N}going?  I'm going too!{W1}"
										dc.w 2
										dc.w $10                ; 0010 SET FLAG 258 FFFF : set after agreeing to try getting into the castle
										dc.w $258
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 42 FFFF : Sarah + Chester are followers
										dc.w $42
										dc.w $FFFF
										dc.w 8                  ; 0008 JOIN FORCE 80
										dc.w $80                ; Special use case value $80, hardcoded in command function
										dc.w $2C                ; 002C FOLLOW ENTITY 1 0 2
										dc.w 1
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 2 1 2
										dc.w 2
										dc.w 1
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8A 1B 3 3
										dc.b $8A
										dc.b $1B
										dc.b 3
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8B 1F 3 3
										dc.b $8B
										dc.b $1F
										dc.b 3
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_51444:           dc.w $28                ; 0028 MOVE ENTITY NEXT TO PLAYER 8C 2
										dc.w $8C
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5144C:           dc.w $28                ; 0028 MOVE ENTITY NEXT TO PLAYER 8A 1
										dc.w $8A
										dc.w 1
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_51454:           dc.w $28                ; 0028 MOVE ENTITY NEXT TO PLAYER 8B 1
										dc.w $8B
										dc.w 1
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5145C:           dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 2
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b $A
										dc.b $14
										dc.w $8080
										dc.w 4                  ; 0004 INIT TEXT CURSOR 1FE : "Good morning {LEADER}!{N}You woke up late this{N}morning.{W2}"
										dc.w $1FE
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "Good morning {LEADER}!{N}You woke up late this{N}morning.{W2}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "Did the storm wake you up?{W2}"
										dc.w $80
										dc.w 4                  ; 0004 INIT TEXT CURSOR 1E3 : "Hurry to school!{N}Sir Astral and {NAME;1} must{N}be waiting.{W1}"
										dc.w $1E3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Hurry to school!{N}Sir Astral and {NAME;1} must{N}be waiting.{W1}"
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5148C:           dc.w $19                ; 0019 SET ENTITY POS AND FACING 1 29 A 1
										dc.b 1
										dc.b $29
										dc.b $A
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 6 4 1
										dc.b $80
										dc.b 6
										dc.b 4
										dc.b 1
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5149A:           dc.w 4                  ; 0004 INIT TEXT CURSOR 205 : "Is everybody here?{N}OK, let's start.{W2}"
										dc.w $205
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8E 2E 7 2
										dc.b $8E
										dc.b $2E
										dc.b 7
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 8E FF 2 1
										dc.b $8E
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8E 3
										dc.b $8E
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8E : "Is everybody here?{N}OK, let's start.{W2}"
										dc.w $8E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8E : "Where is {NAME;3}?{N}Overslept again?  Oh, well.{N}I can't wait for him.{W2}"
										dc.w $8E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8E : "Where did I leave off{N}yesterday?{W1}"
										dc.w $8E
										dc.w $2D                ; 002D MOVE ENTITY 8E FF 1 1
										dc.b $8E
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8F : "Sir Astral!{W1}"
										dc.w $8F
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1 3
										dc.b 1
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8E 3
										dc.b $8E
										dc.b 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8F
										dc.b $8F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8F 29 11 1
										dc.b $8F
										dc.b $29
										dc.b $11
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 8F FF 1 6
										dc.b $8F
										dc.b $FF
										dc.b 1
										dc.b 6
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 1
										dc.b 2
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 8F FF 1 1
										dc.b $8F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $26                ; 0026 MAKE ENTITY NOD 8F
										dc.w $8F
										dc.w $26                ; 0026 MAKE ENTITY NOD 8F
										dc.w $8F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8F : "The Minister would like you{N}to come to the castle!{W1}"
										dc.w $8F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8E : "What has happened?{N}Why are you so...?{W1}"
										dc.w $8E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8F : "The King.  He has fallen{N}down and is in great pain!{W1}"
										dc.w $8F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8E : "What?!  The King?{N}OK, I'm coming!{W1}"
										dc.w $8E
										dc.b $80                ; WAIT F
										dc.b $F
										dc.w $15                ; 0015 SET ACTSCRIPT 8F FF 460CE
										dc.b $8F
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 8F 0 3 3
										dc.b $8F
										dc.b 0
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8E FF 3 3
										dc.b $8E
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1 3
										dc.b 1
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 8F 0 3 1
										dc.b $8F
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8E FF 3 2
										dc.b $8E
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b $C
										dc.b $14
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8F 1
										dc.b $8F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 8E 1
										dc.b $8E
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 26 7
										dc.w $26
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8E : "Sorry, kids.  I have to go{N}to the castle.{N}Stay here.{W1}"
										dc.w $8E
										dc.w $2D                ; 002D MOVE ENTITY 8E FF 2 1
										dc.b $8E
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8F 0 3 3
										dc.b $8F
										dc.b 0
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8E FF 3 5
										dc.b $8E
										dc.b $FF
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 8E
										dc.w $8E
										dc.w $2E                ; 002E HIDE ENTITY 8F
										dc.w $8F
										dc.w $32                ; 0032 SET CAMERA DEST 26 6
										dc.w $26
										dc.w 6
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 2 2
										dc.b 2
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 2 : "{LEADER}, did you hear that?{N}The King is sick!{W2}"
										dc.w 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2 : "But, I think it must be{N}something else!{N}He was acting so strange!{W1}"
										dc.w 2
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 3 1
										dc.b 1
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C001 : "Hey, {NAME;2}!{N}Let's go to the castle.{W1}"
										dc.w $C001
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2 : "We can't, {NAME;1}!{N}We're just kids.{N}They won't let us in.{W1}"
										dc.w 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C001 : "Never mind that.{N}I have a plan!{W1}"
										dc.w $C001
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 2 1
										dc.b 1
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C001 : "{LEADER}, maybe we can{N}meet the Princess!{N}Are you going with us?{W1}"
										dc.w $C001
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 51614 : YES/NO prompt answer
										dc.w $59                ; Unkown command : 59
										dc.l word_51614         ; 0005 PLAY SOUND 
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1 : "No?  Really?{N}Then I'm not going either!{W2}"
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1 : "But, if you change your{N}mind, let me know right{N}away!{W1}"
										dc.w 1
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 2 2
										dc.b 1
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 2 1
										dc.b 2
										dc.b 1
										dc.w $B                 ; 000B JUMP 51650
										dc.l word_51650         
word_51614:         dc.w 4                  ; 0004 INIT TEXT CURSOR 217 : "Great!{N}Let's go right now!{N}Hurry!{W1}"
										dc.w $217
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1 : "Great!{N}Let's go right now!{N}Hurry!{W1}"
										dc.w 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 2
										dc.b 2
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2 : "What?  {LEADER}, are you{N}going?  I'm going too!{W1}"
										dc.w 2
										dc.w $10                ; 0010 SET FLAG 258 FFFF : set after agreeing to try getting into the castle
										dc.w $258
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 42 FFFF : Sarah + Chester are followers
										dc.w $42
										dc.w $FFFF
										dc.w 8                  ; 0008 JOIN FORCE 80
										dc.w $80
										dc.w $2C                ; 002C FOLLOW ENTITY 1 0 2
										dc.w 1
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 2 1 2
										dc.w 2
										dc.w 1
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8A 1B 3 3
										dc.b $8A
										dc.b $1B
										dc.b 3
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8B 1F 3 3
										dc.b $8B
										dc.b $1F
										dc.b 3
										dc.b 3
word_51650:         dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_51652:           dc.w 4                  ; 0004 INIT TEXT CURSOR 219 : "Halt!{N}Where do you think you're{N}going?{W1}"
										dc.w $219
										dc.w $2D                ; 002D MOVE ENTITY 8A 0 0 1
										dc.b $8A
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8B FF 2 1
										dc.b $8B
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8A 3
										dc.b $8A
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8B 3
										dc.b $8B
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8A : "Halt!{N}Where do you think you're{N}going?{W1}"
										dc.w $8A
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 1
										dc.b 2
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C001 : "Well, let's see....{N}Ummm...yes, Sir Astral{N}called us!{W1}"
										dc.w $C001
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8A : "Why?{W1}"
										dc.w $8A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C001 : "We're his pupils.{N}He left a package behind,{N}and....{W1}"
										dc.w $C001
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8A : "You want to deliver it to{N}him?{N}Well...OK, go ahead.{W1}"
										dc.w $8A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "(Cough!){N}Be good in the castle, OK?{W1}"
										dc.w $8B
										dc.w $2D                ; 002D MOVE ENTITY 8A 0 2 1
										dc.b $8A
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8B FF 0 1
										dc.b $8B
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8A 3
										dc.b $8A
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8B 3
										dc.b $8B
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_516A8:           dc.w 4                  ; 0004 INIT TEXT CURSOR 296 : "Here you are!{N}I've been waiting.{W1}"
										dc.w $296
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 3 : "Here you are!{N}I've been waiting.{W1}"
										dc.w 3
										dc.w $28                ; 0028 MOVE ENTITY NEXT TO PLAYER 3 2
										dc.w 3
										dc.w 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 3 : "A soldier said you went{N}into the castle.{N}Is that true?{W2}{N}Oooww!  I missed it!{N}I would've woken up early{N}if I knew that...!{W1}{N}So I came to meet you{N}here, {LEADER}.{N}You're going to Yeel, right?{W2}{N}Under the King's orders!{N}Cool!  Of course, I'm{N}going too!{W1}"
										dc.w 3
										dc.w 8                  ; 0008 JOIN FORCE 3
										dc.w 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 3 : "Let's go!{W1}"
										dc.w 3
										dc.w $2C                ; 002C FOLLOW ENTITY 3 2 2
										dc.w 3
										dc.w 2
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
