
; SCRIPT SECTION maps\entries\map20\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map20_InitFunction:
										
										cmpi.l  #$22803780,((RAM_Entity_StructOffset_XAndStart-$1000000)).w
										bne.s   loc_53988
										trap    #TRAP_CHECKFLAG
										dc.w $25D               ; set after the scene in the King's bedroom
										bne.s   loc_53982
										lea     cs_53996(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $25D               ; set after the scene in the King's bedroom
										bra.s   loc_53988
loc_53982:
										
										lea     cs_53B60(pc), a0
										trap    #6
loc_53988:
										
										trap    #TRAP_CHECKFLAG
										dc.w $1FB               ; Battle 7 completed
										beq.s   return_53994
										lea     cs_53FD8(pc), a0
										trap    #6
return_53994:
										
										rts

	; End of function ms_map20_InitFunction

cs_53996:           dc.w 4                  ; 0004 SET TEXT INDEX 880 : "Mmmm....{N}Hmmm...mmmm....{W1}"
										dc.w $880
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 17 27 3
										dc.b 0
										dc.b $17
										dc.b $27
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1 17 26 3
										dc.b 1
										dc.b $17
										dc.b $26
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 2 17 25 3
										dc.b 2
										dc.b $17
										dc.b $25
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1 FF 460CE
										dc.b 1
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 460CE
										dc.b 2
										dc.b $FF
										dc.l eas_Init           
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $32                ; 0032 SET CAMERA DEST C 22
										dc.w $C
										dc.w $22
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Mmmm....{N}Hmmm...mmmm....{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Oh, father!{N}Please wake up.{W1}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 0 1
										dc.b $83
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 83 1
										dc.b $83
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83 : "Sir Astral?{W1}"
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "Hmmm.  Nothing is wrong{N}with his body, but...{W1}"
										dc.w $8082
										dc.w $53                ; 0053  82 0
										dc.w $82
										dc.w 0
										dc.w $53                ; 0053  83 FFFF
										dc.w $83
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 45F0C
										dc.b $83
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 45F0C
										dc.b $83
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83 : "He is suffering badly from{N}something....{W1}"
										dc.w $83
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "Perhaps...it might be...{N}{D1}Well?{W1}"
										dc.w $8082
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 82 0
										dc.b $82
										dc.b 0
										dc.w $32                ; 0032 SET CAMERA DEST 11 22
										dc.w $11
										dc.w $22
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 82 0
										dc.b $82
										dc.b 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 0 2
										dc.b $82
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 460CE
										dc.b $82
										dc.b $FF
										dc.l eas_Init           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "What are you doing here?!{W1}"
										dc.w $82
										dc.w $32                ; 0032 SET CAMERA DEST 11 22
										dc.w $11
										dc.w $22
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1 0 45E44
										dc.b 1
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 45E44
										dc.b 2
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1 0 45E44
										dc.b 1
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 45E44
										dc.b 2
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8002 : "Oops!{W1}"
										dc.w $8002
										dc.w $2D                ; 002D MOVE ENTITY 2 FF 2 2
										dc.b 2
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8002 : "Sorry, sir!{W1}"
										dc.w $8002
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 2 1
										dc.b 1
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1 3
										dc.b 1
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8001 : "Well, we just followed you....{W1}"
										dc.w $8001
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 0 1
										dc.b $82
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "Don't lie to me.{N}You wanted to see the{N}castle, didn't you?{W1}"
										dc.w $8082
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 1 1
										dc.b $83
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 83 0
										dc.b $83
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83 : "Sir Astral, who are they?{W1}"
										dc.w $83
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 461B6
										dc.b $82
										dc.b 0
										dc.l eas_461B6          
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "Oh...{D1}well...{D1}(mumble)...{D1}{N}They're my pupils....{W1}"
										dc.w $8082
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 0 1
										dc.b $83
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83 : "So they are.   They look{N}like good kids.{W1}"
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83 : "You must have a special{N}reason to have them here,{N}right?{W1}"
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "Um...{D1}I didn't mean for...{W1}"
										dc.w $8082
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 82 0
										dc.b $82
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Astral glares at {LEADER}.{W1}"
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 2 1
										dc.b $82
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "(Cough){N}You said the door of the{N}Ancient Tower is open.{W2}{N}There must be a connection{N}between the open door and{N}the King's sickness.{W1}"
										dc.w $8082
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "I called them here to help{N}me investigate the tower.{W1}"
										dc.w $8082
										dc.w $26                ; 0026 MAKE ENTITY NOD 83
										dc.w $83
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 0 1
										dc.b $82
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "Now, pupils.  Follow me.{W1}"
										dc.w $8082
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "Don't give me any more{N}trouble!{W1}"
										dc.w $8082
										dc.w $2D                ; 002D MOVE ENTITY 1 0 1 1
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 1
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2C                ; 002C FOLLOW ENTITY 1 0 2
										dc.w 1
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 2 1 2
										dc.w 2
										dc.w 1
										dc.w 2
cs_53B60:           dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_53B66:           dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w 4                  ; 0004 SET TEXT INDEX 895 : "King Granseal!{N}Calm down!{W1}"
										dc.w $895
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
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
										dc.w $32                ; 0032 SET CAMERA DEST 11 30
										dc.w $11
										dc.w $30
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_ENEMY_ATTACK
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 2
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 2
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 2
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 3 2
										dc.b $82
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "King Granseal!{N}Calm down!{W1}"
										dc.w $8082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Guooooorrrr!{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 0 0 2
										dc.b $80
										dc.b 0
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 460CE
										dc.b $82
										dc.b $FF
										dc.l eas_Init           
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 45E94
										dc.b $82
										dc.b $FF
										dc.l eas_JumpRight      
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 45E94
										dc.b $82
										dc.b $FF
										dc.l eas_JumpRight      
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "He's possessed!  He needs{N}an exorcism right now!{W1}"
										dc.w $8082
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 82
										dc.w $82
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 1
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_DESOUL_HOVERING
										dc.w $6E
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45EBC
										dc.b $80
										dc.b 0
										dc.l eas_BumpRight      
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 0 2
										dc.b $82
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $3
										dc.w 3
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 78
										dc.b $78
cs_53C42:           dc.w $32                ; 0032 SET CAMERA DEST 13 30
										dc.w $13
										dc.w $30
										dc.w 4                  ; 0004 SET TEXT INDEX 898 : "Yeow!  My head!{N}No, I'm OK, {LEADER}.{W2}"
										dc.w $898
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 460CE
										dc.b $82
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 82
										dc.w $82
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8082 : "Yeow!  My head!{N}No, I'm OK, {LEADER}.{W2}"
										dc.w $8082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "I must use a powerful spell.{N}It may be dangerous.{N}Stay back!{W1}"
										dc.w $8082
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 82
										dc.w $82
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 82
										dc.w $82
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_SPELL_CAST
										dc.w $4D
										dc.w $18                ; 0018 FLASH ENTITY WHITE 82 78
										dc.w $82
										dc.w $78
										dc.w $2D                ; 002D MOVE ENTITY 82 0 2 2
										dc.b $82
										dc.b 0
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 0 C 14
										dc.b $80
										dc.b 0
										dc.b $C
										dc.b $14
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $18                ; 0018 FLASH ENTITY WHITE 82 78
										dc.w $82
										dc.w $78
										dc.w 5                  ; 0005 PLAY SOUND SFX_SPELL_CAST
										dc.w $4D
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 88 18 35 2
										dc.b $88
										dc.b $18
										dc.b $35
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "Evil spirit inside the King,{N}begone, HAAA!{W1}"
										dc.w $8082
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 2 2
										dc.b $88
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 88
										dc.w $88
										dc.w 5                  ; 0005 PLAY SOUND SFX_PRISM_LASER_CUTSCENE_FIRING
										dc.w $6F
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $3
										dc.w 3
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 82
										dc.w $82
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 2 2
										dc.b $82
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "King...Granseal?{W1}"
										dc.w $8082
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 15 34 3
										dc.b $87
										dc.b $15
										dc.b $34
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 87
										dc.w $87
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "Did it work?{W1}"
										dc.w $8082
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 87
										dc.w $87
										dc.w $15                ; 0015 SET ACTSCRIPT 87 FF 46172
										dc.b $87
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 87
										dc.b $87
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$0 Y=$0
										dc.b 0
										dc.b 0
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 1 5
										dc.b $87
										dc.b $FF
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 87
										dc.w $87
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Ooh....{W1}"
										dc.w $80
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461B6
										dc.b $80
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 64
										dc.b $64
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 1
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Astral, wha...what{N}happened?{W1}"
										dc.w $80
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 82
										dc.w $82
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8082 : "Are you alright?{W2}"
										dc.w $8082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "Let me use your soldiers.{N}We must kill it before it{N}finds another victim.{W1}"
										dc.w $8082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "What are you talking about?{N}I don't understand.{W1}"
										dc.w $80
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082 : "(Sigh){W1}"
										dc.w $8082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Astral!{W1}"
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $3A                ; 003A FADE OUT TO BLACK
										dc.w $36                ; 0036 RELATED TO LOADING A MAP
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $46                ; 0046  0 0
										dc.w 0
										dc.w 0
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Astral is exhausted.{N}He won't wake up!{W2}{N}The Minister summons the{N}soldiers to the hall to kill{N}the evil spirit.{W1}"
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 261 FFFF : set after the scene where Astral exorcises the Gizmo
										dc.w $261
										dc.w $FFFF
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 131D0801
										dc.l $131D0801
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_CASTLE
										dc.w $26
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
