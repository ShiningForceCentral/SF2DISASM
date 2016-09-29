
; SCRIPT SECTION maps\entries\map07\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map7_InitFunction:
										
										trap    #1
										dc.w $2C3
										bne.s   return_55830
										move.b  #6,((RAM_EgressMapIdx-$1000000)).w
										lea     cs_55832(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $2C3               ; set after the "one year has passed" text, after New Granseal is built
										trap    #TRAP_SETFLAG
										dc.w $19B               ; Battle 11 unlocked
return_55830:
										
										rts

	; End of function ms_map7_InitFunction

cs_55832:           dc.w 4                  ; 0004 SET TEXT INDEX 50A : "One year has passed.{W1}"
										dc.w $50A
										dc.w $48                ; 0048 LOAD MAP 7 6 2
										dc.w 7
										dc.w 6
										dc.w 2
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 559AE
										dc.l word_559AE
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $36                ; 0036 RELATED TO LOADING A MAP
										dc.w $3B                ; 003B SLOW FADE IN FROM BLACK
										dc.w $46                ; 0046  6 2
										dc.w 6
										dc.w 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX FFFF : "One year has passed.{W1}"
										dc.w $FFFF
										dc.w 4                  ; 0004 SET TEXT INDEX 470 : "(Cough)...our town is being{N}rebuilt, as you can see.{W2}"
										dc.w $470
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 7 6 2
										dc.w 7
										dc.w 6
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_CASTLE
										dc.w $26
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "(Cough)...our town is being{N}rebuilt, as you can see.{W2}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "But, we will be better off{N}if there are no accidents.{W2}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "You're too young to spend{N}your time guarding our new{N}home.{W2}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "You are the soldiers of{N}Granseal!{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Do your best to improve our{N}new home!{W1}"
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "King Granseal!{W1}"
										dc.w $80
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "(Cough)...(cough)...{N}King Granseal!{W1}"
										dc.w $80
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $1B                ; 001B START ENTITY ANIM 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "All the people of Granseal{N}have been working hard for{N}an entire year.{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Please thank them for their{N}hard work.{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Ah...I have nothing to say.{W1}"
										dc.w $81
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "N...nothing?{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Mmmm...alright.{W1}"
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 8B 0
										dc.b $8B
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Sir Astral, please speak in{N}place of our King.{W1}"
										dc.w $80
										dc.w $26                ; 0026 MAKE ENTITY NOD 8B
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "Ummmm...OK, I got it.{W1}"
										dc.w $8B
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 1
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 19
										dc.b $19
										dc.w $2D                ; 002D MOVE ENTITY 8B FF 0 1
										dc.b $8B
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8B 3
										dc.b $8B
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8B : "One year has passed since{N}we came here.{W2}"
										dc.w $8B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8B : "The castle, the town...{N}everything is coming along{N}nicely.{W2}"
										dc.w $8B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8B : "But we lack something.{N}What is it?  It's trading!{W2}"
										dc.w $8B
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "We need to make alliances{N}with other towns.{W1}"
										dc.w $8B
										dc.w $23                ; 0023 SET ENTITY FACING 8B 0
										dc.b $8B
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Indeed, indeed.{N}Thank you, sir!{W1}"
										dc.w $80
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 8B 3
										dc.b $8B
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "That's all for today.{N}You may go now.{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 82 0 3 1
										dc.b $82
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 83 0 2 5
										dc.b $83
										dc.b 0
										dc.b 2
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 84 0 3 1
										dc.b $84
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 0 3 4
										dc.b $85
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 0 0 5
										dc.b $86
										dc.b 0
										dc.b 0
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 87 0 3 1
										dc.b $87
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 3 4
										dc.b $88
										dc.b $FF
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8B 0 2 1
										dc.b $8B
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 3 FF 3 1
										dc.b 3
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 3 0 0 6
										dc.b 3
										dc.b 0
										dc.b 0
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1 0 0 6
										dc.b 1
										dc.b 0
										dc.b 0
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 4 0 1 1
										dc.b 4
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 2 FF 1 2
										dc.b 2
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 6
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8B 3
										dc.b $8B
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 84 3
										dc.b $84
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 87 3
										dc.b $87
										dc.b 3
										dc.w $44                ; 0044  553C6
										dc.l ms_map7_Entities
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_559AE:         dc.w $B
										dc.w 7
										dc.w 1
										dc.b $C
										dc.b 5
										dc.b 3
										dc.b $CD
										dc.l eas_Init           
										dc.b $B
										dc.b 4
										dc.b 3
										dc.b $CB
										dc.l eas_Init           
										dc.b $A
										dc.b 7
										dc.b 1
										dc.b $CE
										dc.l eas_Init           
										dc.b $A
										dc.b 8
										dc.b 1
										dc.b $CE
										dc.l eas_Init           
										dc.b $A
										dc.b 9
										dc.b 1
										dc.b $CE
										dc.l eas_Init           
										dc.b $A
										dc.b $A
										dc.b 1
										dc.b $CF
										dc.l eas_Init           
										dc.b $C
										dc.b 8
										dc.b 1
										dc.b $CF
										dc.l eas_Init           
										dc.b $C
										dc.b 9
										dc.b 1
										dc.b $CF
										dc.l eas_Init           
										dc.b $C
										dc.b $A
										dc.b 1
										dc.b $CF
										dc.l eas_Init           
										dc.b 8
										dc.b 7
										dc.b 0
										dc.b $D0
										dc.l eas_Init           
										dc.b $E
										dc.b 7
										dc.b 2
										dc.b $D0
										dc.l eas_Init           
										dc.b $A
										dc.b 5
										dc.b 3
										dc.b $D1
										dc.l eas_Init           
										dc.b $C
										dc.b 7
										dc.b 1
										dc.b 3
										dc.l eas_Init           
										dc.b $B
										dc.b 8
										dc.b 1
										dc.b 1
										dc.l eas_Init           
										dc.b $B
										dc.b 9
										dc.b 1
										dc.b 4
										dc.l eas_Init           
										dc.b $B
										dc.b $A
										dc.b 1
										dc.b 2
										dc.l eas_Init           
										dc.w $FFFF
cs_55A36:           dc.w 4                  ; 0004 SET TEXT INDEX 4AE : "Are you a phoenix?{N}The legendary bird?{W1}"
										dc.w $4AE
										dc.w $32                ; 0032 SET CAMERA DEST 6 2
										dc.w 6
										dc.w 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "Are you a phoenix?{N}The legendary bird?{W1}"
										dc.w $8B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C007 : "Y...yeah, I'm a phoenix.{W2}"
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007 : "But...legendary?{N}I don't know about that.{W1}"
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "You are legendary, {NAME;7}!{N}I read that a phoenix serves{N}a god.{W1}"
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C007 : "God?  Ah, Volcanon!{N}{NAME;10} calls him a god. {W2}"
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007 : "As long as he watches over{N}us, nothing can break the{N}peace of Parmecia.{W1}"
										dc.w $C007
										dc.w $2D                ; 002D MOVE ENTITY 8B FF 1 1
										dc.b $8B
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8B : "Volcanon?  The great being{N}who created the Earth?{W2}"
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "Oh, this is the happiest day{N}of my life!{W1}"
										dc.w $8B
										dc.w $2D                ; 002D MOVE ENTITY 8B FF 3 1
										dc.b $8B
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8B 0
										dc.b $8B
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "Please let me go with you{N}and meet Volcanon!{W1}"
										dc.w $8B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C007 : "Ummm...OK.{W2}"
										dc.w $C007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C007 : "To tell the truth, I hurt{N}my wing during this trip.{W2}"
										dc.w $C007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C007 : "I stopped by here to ask{N}for help.{W2}"
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007 : "But, I don't want to trouble{N}you....{W1}"
										dc.w $C007
										dc.w $26                ; 0026 MAKE ENTITY NOD 8B
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "Don't worry.  These lads{N}love trouble.{W1}"
										dc.w $8B
										dc.w $2D                ; 002D MOVE ENTITY 8B FF 3 1
										dc.b $8B
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8B 3
										dc.b $8B
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8B : "{LEADER}!{W2}"
										dc.w $8B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8B : "Why didn't you tell me you{N}were here?  Did you listen{N}to our conversation?{W2}"
										dc.w $8B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8B : "You know, it's time for us to{N}set out!{W2}"
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "We're going to Mt. Volcano{N}with {NAME;7}.{N}It's in the far east!{W1}"
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Sir Astral!{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 2
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 8B 0
										dc.b $8B
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "You said, you're going too?{N}No!{W1}"
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 8B FF 45E6C
										dc.b $8B
										dc.b $FF
										dc.l eas_JumpLeft       
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 8B FF 0 1
										dc.b $8B
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "Wh...why not?{W1}"
										dc.w $8B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "We came here just a year{N}ago.{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "We're still learning about{N}this country.  You're needed{N}here.{W1}"
										dc.w $80
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "He's right.  You must stay.{W1}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 1
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8B FF 2 1
										dc.b $8B
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "{LEADER}, please take your{N}party and go with{N}{NAME;7}.{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Astral, do you agree?{W1}"
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 8B 3
										dc.b $8B
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8B : "Hmmmmm....{W2}"
										dc.w $8B
										dc.w $23                ; 0023 SET ENTITY FACING 8B 1
										dc.b $8B
										dc.b 1
										dc.w $26                ; 0026 MAKE ENTITY NOD 8B
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "Y...yes.{W1}"
										dc.w $8B
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007 : "Then, they're my companions!{W1}"
										dc.w $C007
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 2
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C007 : "I'm {NAME;7}.{W2}"
										dc.w $C007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C007 : "I really appreciate your{N}kindness.{W2}"
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007 : "Mt. Volcano is in the east....{N}It's very far away.{W1}"
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{CLEAR}{LEADER} decides to take{N}{NAME;7} with him.{W1}{CLEAR}"
										dc.w $FFFF
										dc.w $54                ; 0054  7 FFFF
										dc.w 7
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 2
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1 7 2
										dc.w 1
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 2 1 2
										dc.w 2
										dc.w 1
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 3 0 5
										dc.w 3
										dc.w 0
										dc.w 5
										dc.w $2C                ; 002C FOLLOW ENTITY 4 0 6
										dc.w 4
										dc.w 0
										dc.w 6
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Minister, bring the gift!{W1}"
										dc.w $81
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Yes, sir.{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 2
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 3
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "A parting gift.  Take it.{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER} receives 100{N}gold coins.{W1}"
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 8B FF 0 1
										dc.b $8B
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "Good luck, {LEADER}.{W2}"
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "Find as many friends as you{N}can on your journey with{N}{NAME;7}.{W1}"
										dc.w $8B
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 12
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b $12
										dc.w $8080
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 60B0103
										dc.l $60B0103
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_55BEE:           dc.w 4                  ; 0004 SET TEXT INDEX 4E1 : "Welcome back, {LEADER}.{W1}"
										dc.w $4E1
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Welcome back, {LEADER}.{W1}"
										dc.w $80
										dc.w $29                ; 0029 SET ENTITY DEST 8000 B 7
										dc.w $8000
										dc.w $B
										dc.w 7
										dc.w $29                ; 0029 SET ENTITY DEST 7 A 8
										dc.w 7
										dc.w $A
										dc.w 8
										dc.w $32                ; 0032 SET CAMERA DEST 6 2
										dc.w 6
										dc.w 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "Thanks to you, Granseal has{N}many allies to trade with.{W1}"
										dc.w $8B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "You've also made a lot of{N}new friends!{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Great job!{W1}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8B : "I heard about everything{N}from Bedoe.{W2}"
										dc.w $8B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8B : "I never imagined Zeon could{N}be revived!{W1}"
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "I understand that Volcanon{N}is angry.{W1}"
										dc.w $8B
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "So Princess Elis must be...{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "She's alive.{W1}"
										dc.w 7
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8B
										dc.b $8B
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
										dc.w $1C                ; 001C STOP ENTITY ANIM 8B
										dc.w $8B
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45E44
										dc.b $81
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 8B 0 45E44
										dc.b $8B
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45E44
										dc.b $81
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 8B 0 45E44
										dc.b $8B
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $1B                ; 001B START ENTITY ANIM 81
										dc.w $81
										dc.w $1B                ; 001B START ENTITY ANIM 8B
										dc.w $8B
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
										dc.b $38
										dc.b $38
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 2
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "What did you say?!{N}Is she alive?{W1}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Y...yes!{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "Is it true?{N}Is it true?!{W1}"
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Yes, it is.{W1}"
										dc.w 7
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8B
										dc.b $8B
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 55EF4
										dc.l sub_55EF4
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $26                ; 0026 MAKE ENTITY NOD 8B
										dc.w $8B
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 1
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 2
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 8B FF 45E44
										dc.b $8B
										dc.b $FF
										dc.l eas_Jump           
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER} and {NAME;7}{N}explain in detail.{W1}"
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $26                ; 0026 MAKE ENTITY NOD 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 8B 0
										dc.b $8B
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 2 1
										dc.b 0
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 8B 3
										dc.b $8B
										dc.b 3
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX FFFF : "About the ancient ruins{N}and Creed....{W2}"
										dc.w $FFFF
										dc.w 2                  ; 0002 DISPLAY TEXT BOX FFFF : "And Zeon's message through{N}Evil Spilit.{W2}"
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "They explain everything.{W1}"
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 1
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 55F82
										dc.l sub_55F82
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Amazing!{N}{LEADER}!  And {NAME;7}...{W1}"
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "you've experienced a great{N}deal.{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "Hmmm...mmmm....{W1}"
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Sir Astral?{W1}"
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 8B 0
										dc.b $8B
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "What should we do now?{W1}"
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "Easy, we have to defeat{N}Zeon and save Elis!{W1}"
										dc.w $C081
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Impossible!{W1}"
										dc.w $80
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $23                ; 0023 SET ENTITY FACING 8B 1
										dc.b $8B
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "The King is right.{W1}"
										dc.w $8B
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "What?{W1}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081 : "Astral, thank you.{W2}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "What do we have to do first?{W1}"
										dc.w $C081
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 1
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8B : "We have to go to North{N}Parmecia.{W2}"
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "We'd better go and see the{N}storytellers in Tristan.{W1}"
										dc.w $8B
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Sir!{W1}"
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 8B 0
										dc.b $8B
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Astral winks at the Minister{N}and smiles.{W1}"
										dc.w $FFFF
										dc.w $23                ; 0023 SET ENTITY FACING 8B 1
										dc.b $8B
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "It's an important job. Will{N}you allow me to go with{N}{LEADER}?{W1}"
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "Sure, sure!  Just bring{N}Elis back to me!{W1}"
										dc.w $C081
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "Be careful, Astral.{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "It's dangerous out there.{W1}"
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 8B 0
										dc.b $8B
										dc.b 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 8B
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "I will!{W1}"
										dc.w $8B
										dc.w $23                ; 0023 SET ENTITY FACING 8B 3
										dc.b $8B
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8B : "{LEADER}.{W2}"
										dc.w $8B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "I'm going with you as an{N}adviser.{W1}"
										dc.w $8B
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_JOIN
										dc.w $13
										dc.w 2                  ; 0002 DISPLAY TEXT BOX FFFF : "Adviser Astral has joined the{N}force."
										dc.w $FFFF
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 20044
										dc.l j_FadeOut_WaitForP2Input
										dc.w 9                  ; 0009 HIDE TEXTBOX AND PORTRAIT
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8B : "We have to remove the rocks{N}blocking the passageway{N}leading to North Parmecia.{W2}{N}Maybe we can use an{N}explosive!{W1}"
										dc.w $8B
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 8B
										dc.w $8B
										dc.w $10                ; 0010 SET FLAG 46 FFFF : Astral is a follower
										dc.w $46
										dc.w $FFFF
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_55EF4:
										
										lea     (PALETTE_1).l,a0
										lea     (FFD080_Palette1bis).l,a1
										lea     plt_55F6A(pc), a2
										moveq   #$3F,d0 
loc_55F06:
										
										moveq   #0,d1
										move.w  (a0),d1
										andi.w  #$E00,d1
										lsr.w   #8,d1
										lsr.w   #1,d1
										move.w  (a0),d2
										andi.w  #$E,d2
										add.w   d2,d1
										move.w  (a0)+,d2
										andi.w  #$E0,d2 
										lsr.w   #3,d2
										add.w   d2,d1
										divu.w  #7,d1
										move.l  d1,d2
										swap    d2
										cmpi.w  #4,d2
										bcs.s   loc_55F34
										addq.w  #1,d1
loc_55F34:
										
										moveq   #7,d2
										sub.w   d1,d2
										move.b  (a2,d2.w),d3
										ext.w   d3
										move.b  8(a2,d2.w),d2
										ext.w   d2
										move.b  $10(a2,d1.w),d1
										ext.w   d1
										clr.w   d4
										lsl.w   #8,d1
										lsl.w   #4,d3
										or.w    d1,d4
										or.w    d2,d4
										or.w    d3,d4
										move.w  d4,(a1)+
										dbf     d0,loc_55F06
										clr.b   ((byte_FFDFAB-$1000000)).w
										lea     (FFD080_Palette1bis).l,a0
										jmp     (sub_19C8).w    

	; End of function sub_55EF4

plt_55F6A:          dc.w $E0C
										dc.w $A08
										dc.w $806
										dc.w $402
										dc.w $E0C
										dc.w $C0A
										dc.w $806
										dc.w $402
										dc.w 2
										dc.w $204
										dc.w $608
										dc.w $A0A

; =============== S U B R O U T I N E =======================================

sub_55F82:
										
										clr.b   ((byte_FFDFAB-$1000000)).w
										lea     ((byte_FFDF2A-$1000000)).w,a0
										jmp     (sub_19C8).w    

	; End of function sub_55F82

