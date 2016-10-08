
; SCRIPT SECTION battles\entries\battle18\cs_afterbattle :
; Cutscene after battle 18
abcs_battle18:      dc.w 4                  ; 0004 INIT TEXT CURSOR 9E0 : "{LEADER}, you're much{N}stronger than I thought.{W1}"
										dc.w $9E0
										dc.w $37                ; 0037 LOAD MAP AND FADE IN C 7 5
										dc.w $C
										dc.w 7
										dc.w 5
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4B6BE
										dc.l word_4B6BE
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 460CE
										dc.b $B
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 9 1
										dc.b 7
										dc.b $D
										dc.b 9
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F E 9 1
										dc.b $1F
										dc.b $E
										dc.b 9
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B 5 9 0
										dc.b $B
										dc.b 5
										dc.b 9
										dc.b 0
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B : "{LEADER}, you're much{N}stronger than I thought.{W1}"
										dc.w $B
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA B
										dc.w $B
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $2D                ; 002D MOVE ENTITY B FF 0 6
										dc.b $B
										dc.b $FF
										dc.b 0
										dc.b 6
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY B FF 1 4
										dc.b $B
										dc.b $FF
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING B 0
										dc.b $B
										dc.b 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $32                ; 0032 SET CAMERA DEST 7 1
										dc.w 7
										dc.w 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B C 6 1
										dc.b $B
										dc.b $C
										dc.b 6
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B D 5 2
										dc.b $B
										dc.b $D
										dc.b 5
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B C 6 1
										dc.b $B
										dc.b $C
										dc.b 6
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B B 5 0
										dc.b $B
										dc.b $B
										dc.b 5
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B C 6 1
										dc.b $B
										dc.b $C
										dc.b 6
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B D 5 2
										dc.b $B
										dc.b $D
										dc.b 5
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B : "It's so small.  I'll just{N}try to...get inside....{W1}"
										dc.w $B
										dc.w $2D                ; 002D MOVE ENTITY B 0 2 1
										dc.b $B
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT B 0 452BA
										dc.b $B
										dc.b 0
										dc.l eas_452BA          
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B 3F 3F 3
										dc.b $B
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 5                  ; 0005 PLAY SOUND SFX_FALLING
										dc.w $58
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 9
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 9
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 46172
										dc.b 0
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 0 0 2 1
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $32                ; 0032 SET CAMERA DEST 7 4
										dc.w 7
										dc.w 4
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Oh, he's gone!{W1}"
										dc.w 7
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "I hope he comes back.{N}Did {NAME;11} lie to us?{W1}"
										dc.w 7
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.b $80                ; WAIT 96
										dc.b $96
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 9
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 9
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_FALLING
										dc.w $58
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $1C                ; 001C STOP ENTITY ANIM 0
										dc.w 0
										dc.w $1C                ; 001C STOP ENTITY ANIM 7
										dc.w 7
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45EE4
										dc.b $1F
										dc.b $FF
										dc.l eas_BumpLeft       
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45EE4
										dc.b $1F
										dc.b $FF
										dc.l eas_BumpLeft       
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B C 5 0
										dc.b $B
										dc.b $C
										dc.b 5
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 4536C
										dc.b $B
										dc.b $FF
										dc.l eas_4536C          
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $1B                ; 001B START ENTITY ANIM 0
										dc.w 0
										dc.w $1B                ; 001B START ENTITY ANIM 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY B FF 3 3
										dc.b $B
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B : "I never lie!{W1}"
										dc.w $B
										dc.w $2D                ; 002D MOVE ENTITY B FF 2 2
										dc.b $B
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING B 3
										dc.b $B
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B : "The Ancients were...how{N}should I say this...great!{W1}"
										dc.w $B
										dc.w $2D                ; 002D MOVE ENTITY B FF 0 1
										dc.b $B
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING B 1
										dc.b $B
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B : "No wonder the Caravan is so{N}small.  It carries miniaturized{N}people and items.{W2}"
										dc.w $B
										dc.w $2D                ; 002D MOVE ENTITY B FF 1 2
										dc.b $B
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING B 3
										dc.b $B
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B : "I can drive this excellent{N}vehicle.  May I go with you{N}as a driver?{W1}"
										dc.w $B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{NAME;11} the historian{N}tags along with the force.{W1}"
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "You're kidding, right?{W1}"
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Well, at least we can bring{N}a lot of soldiers with us.{W1}"
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY B FF 3 1
										dc.b $B
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B : "But soldiers in the Caravan{N}cannot enter battle 'cause{N}they've been miniaturized.{W1}"
										dc.w $B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "We'll just have to see.{W1}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Humph.  I don't like this guy.{W1}"
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY B FF 1 1
										dc.b $B
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING B 3
										dc.b $B
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 45E44
										dc.b $B
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 45E44
										dc.b $B
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B : "I wonder what adventures{N}we'll find with this Caravan!{W1}"
										dc.w $B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY B 0 1 1
										dc.b $B
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT B 0 452BA
										dc.b $B
										dc.b 0
										dc.l eas_452BA          
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B 3F 3F 3
										dc.b $B
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 9
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 9
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.b $80                ; WAIT B4
										dc.b $B4
										dc.w $10                ; 0010 SET FLAG 41 FFFF : Caravan is unlocked (0x4428A..0x44337, 0x44338..0x44403)
										dc.w $41
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 54 0 : Rohde is a follower
										dc.w $54
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4B6BE:         dc.w $C
										dc.w 9
										dc.w 1
										dc.b $C
										dc.b 5
										dc.b 3
										dc.b $3E
										dc.l eas_Init           
										dc.w $FFFF
