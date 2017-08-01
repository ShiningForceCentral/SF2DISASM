
; ASM FILE data\maps\entries\map34\mapsetups\s6.asm :
; 0x5B6BE..0x5BFEE : 

; =============== S U B R O U T I N E =======================================

ms_map34_InitFunction:
		
		rts

	; End of function ms_map34_InitFunction

cs_5B6C0:       textCursor $C87         ; Initial text line $C87 : "Yeeenn...queeen...{N}tillooora...synooora...{N}hear my voice....{W2}"
		setCamDest $2,$4        ; 0032 SET CAMERA DEST 2 4
		nextText $80,$80        ; "Yeeenn...queeen...{N}tillooora...synooora...{N}hear my voice....{W2}"
		nextSingleText $80,$80  ; "Evil Spirit, come.{W1}"
		entityFlashWhite $80,$64; 0018 FLASH ENTITY WHITE 80 64
		entityPosDir $82,$7,$6,$3; 0019 SET ENTITY POS AND FACING 82 7 6 3
		csWait $7               ; WAIT 7
		entityPosDir $82,$3C,$3C,$3; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
		csWait $50              ; WAIT 50
		entityPosDir $82,$7,$6,$3; 0019 SET ENTITY POS AND FACING 82 7 6 3
		csWait $7               ; WAIT 7
		entityPosDir $82,$3C,$3C,$3; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
		csWait $3C              ; WAIT 3C
		entityPosDir $82,$7,$6,$3; 0019 SET ENTITY POS AND FACING 82 7 6 3
		csWait $7               ; WAIT 7
		entityPosDir $82,$3C,$3C,$3; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
		csWait $28              ; WAIT 28
		moveEntity $81,$FF,$1,$1; 002D MOVE ENTITY 81 FF 1 1
		endMove $8080
		nextSingleText $0,$81   ; "Hey, Evil Spirit is{N}appearing!{W1}"
		setCamDest $2,$2        ; 0032 SET CAMERA DEST 2 2
		entityPosDir $82,$7,$6,$3; 0019 SET ENTITY POS AND FACING 82 7 6 3
		csWait $7               ; WAIT 7
		entityPosDir $82,$3C,$3C,$3; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
		csWait $3C              ; WAIT 3C
		entityPosDir $82,$7,$6,$3; 0019 SET ENTITY POS AND FACING 82 7 6 3
		csWait $7               ; WAIT 7
		entityPosDir $82,$3C,$3C,$3; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
		csWait $32              ; WAIT 32
		entityPosDir $82,$7,$6,$3; 0019 SET ENTITY POS AND FACING 82 7 6 3
		csWait $7               ; WAIT 7
		entityPosDir $82,$3C,$3C,$3; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
		csWait $28              ; WAIT 28
		entityPosDir $82,$7,$6,$3; 0019 SET ENTITY POS AND FACING 82 7 6 3
		csWait $7               ; WAIT 7
		entityPosDir $82,$3C,$3C,$3; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
		csWait $1E              ; WAIT 1E
		entityPosDir $82,$7,$6,$3; 0019 SET ENTITY POS AND FACING 82 7 6 3
		csWait $7               ; WAIT 7
		entityPosDir $82,$3C,$3C,$3; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
		csWait $14              ; WAIT 14
		entityPosDir $82,$7,$6,$3; 0019 SET ENTITY POS AND FACING 82 7 6 3
		csWait $7               ; WAIT 7
		entityPosDir $82,$3C,$3C,$3; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
		csWait $A               ; WAIT A
		entityPosDir $82,$7,$6,$3; 0019 SET ENTITY POS AND FACING 82 7 6 3
		setActscript $82,$0,eas_Transparent
						; 0015 SET ACTSCRIPT 82 0 45FA8
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init; 0015 SET ACTSCRIPT 1F FF 460CE
		entityPosDir $0,$7,$C,$1; 0019 SET ENTITY POS AND FACING 0 7 C 1
		entityPosDir $7,$6,$C,$1; 0019 SET ENTITY POS AND FACING 7 6 C 1
		entityPosDir $1F,$8,$C,$1; 0019 SET ENTITY POS AND FACING 1F 8 C 1
		setCamDest $2,$4        ; 0032 SET CAMERA DEST 2 4
		moveEntity $80,$FF,$1,$1; 002D MOVE ENTITY 80 FF 1 1
		endMove $8080
		nextSingleText $80,$80  ; "Ahhh....{W1}"
		nextSingleText $0,$82   ; "Creed, what do you want?{W1}"
		nextSingleText $80,$80  ; "Zeon.{W1}"
		nextSingleText $0,$82   ; "Zeon?!  The King of the{N}Devils?{W1}"
		entityNod $80           ; 0026 MAKE ENTITY NOD 80
		nextText $80,$80        ; "Yes.{W2}"
		nextText $80,$80        ; "He was unsealed.{W1}"
		nextText $80,$80        ; "What is he doing now?{N}What is he going to do?{W2}"
		nextSingleText $80,$80  ; "I need to know anything{N}about him.  Anything!{W1}"
		nextText $0,$82         ; "I've got something.{W1}"
		csWait $28              ; WAIT 28
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $1E              ; WAIT 1E
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $14              ; WAIT 14
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		mapFadeOutToWhite       ; 003F FADE MAP OUT TO WHITE
		csWait $1E              ; WAIT 1E
		nextSingleText $0,$82   ; "Hmmmm....{N}Hmmmm...mmmm....{W1}"
		moveEntity $0,$0,$1,$1  ; 002D MOVE ENTITY 0 0 1 1
		endMove $8080
		moveEntity $7,$0,$1,$1  ; 002D MOVE ENTITY 7 0 1 1
		endMove $8080
		moveEntity $1F,$FF,$1,$1; 002D MOVE ENTITY 1F FF 1 1
		endMove $8080
		nextSingleText $0,$7    ; "What is he doing now?{W1}"
		setEntityDir $81,$3     ; 0023 SET ENTITY FACING 81 3
		nextText $0,$81         ; "He's channeling his mind{N}into the nature of all{N}things.{W2}"
		setEntityDir $81,$1     ; 0023 SET ENTITY FACING 81 1
		mapFadeInFromWhite      ; 0040 FADE MAP IN FROM WHITE
		csWait $28              ; WAIT 28
		setEntityDir $81,$3     ; 0023 SET ENTITY FACING 81 3
		nextSingleText $0,$81   ; "Shhhh!  Be silent.{N}He's got something.{W1}"
		setEntityDir $81,$1     ; 0023 SET ENTITY FACING 81 1
		setActscript $80,$FF,eas_Jump; 0015 SET ACTSCRIPT 80 FF 45E44
		setActscript $80,$FF,eas_Jump; 0015 SET ACTSCRIPT 80 FF 45E44
		nextSingleText $80,$80  ; "What did you find?{W1}"
		nextSingleText $0,$82   ; "The barrier around Grans{N}Island is too strong.{N}I can't see anything.{W1}"
		entityShiver $80        ; 002A MAKE ENTITY SHIVER 80
		nextSingleText $80,$80  ; "Please try again!{W1}"
		nextSingleText $0,$82   ; "If I touch something of his,{N}maybe I could contact his{N}mind better....{W1}"
		setCamDest $2,$5        ; 0032 SET CAMERA DEST 2 5
		setEntityDir $7,$0      ; 0023 SET ENTITY FACING 7 0
		setEntityDir $0,$2      ; 0023 SET ENTITY FACING 0 2
		setEntityDir $1F,$2     ; 0023 SET ENTITY FACING 1F 2
		nextSingleText $0,$7    ; "{LEADER}, you have the{N}Jewel of Evil, right?{W1}"
		setEntityDir $80,$3     ; 0023 SET ENTITY FACING 80 3
		setEntityDir $81,$3     ; 0023 SET ENTITY FACING 81 3
		setActscript $80,$FF,eas_Jump; 0015 SET ACTSCRIPT 80 FF 45E44
		setActscript $80,$FF,eas_Jump; 0015 SET ACTSCRIPT 80 FF 45E44
		nextText $80,$80        ; "Is this true, {LEADER}?{W2}"
		nextSingleText $80,$80  ; "That's one of the magic{N}jewels used to seal{N}Zeon.  Give it to me.{W1}"
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		setEntityDir $7,$1      ; 0023 SET ENTITY FACING 7 1
		setEntityDir $1F,$1     ; 0023 SET ENTITY FACING 1F 1
		nextSingleText $0,$7    ; "But, we can't remove it.{W1}"
		nextSingleText $80,$80  ; "I can.{W1}"
		moveEntity $80,$FF,$3,$1; 002D MOVE ENTITY 80 FF 3 1
		endMove $8080
		nextSingleText $80,$80  ; "Let me see it.{W1}"
		setActscript $80,$FF,eas_46172; 0015 SET ACTSCRIPT 80 FF 46172
		moveEntity $80,$0,$3,$1 ; 002D MOVE ENTITY 80 0 3 1
		endMove $8080
		csWait $2               ; WAIT 2
		setActscript $80,$FF,eas_461AA; 0015 SET ACTSCRIPT 80 FF 461AA
		stopEntity $80          ; 001C STOP ENTITY ANIM 80
		csWait $14              ; WAIT 14
		entityFlashWhite $0,$28 ; 0018 FLASH ENTITY WHITE 0 28
		startEntity $80         ; 001B START ENTITY ANIM 80
		moveEntity $80,$0,$1,$1 ; 002D MOVE ENTITY 80 0 1 1
		endMove $8080
		csWait $2               ; WAIT 2
		setActscript $80,$FF,eas_461AA; 0015 SET ACTSCRIPT 80 FF 461AA
		entityShakeHead $80     ; 0027 MAKE ENTITY SHAKE HEAD 80
		nextText $80,$80        ; "Whhoooa!{W2}"
		nextSingleText $80,$80  ; "What's that light?{N}There are two!{W1}"
		nextSingleText $0,$7    ; "The other one is...{N}...ahhh...they called it,{N}the Jewel of Light.{W1}"
		entityShiver $80        ; 002A MAKE ENTITY SHIVER 80
		nextText $80,$80        ; "What?!{W2}"
		nextText $80,$80        ; "{LEADER}, do you have both{N}of the legendary jewels?{W2}"
		nextText $80,$80        ; "I can't remove them.{N}The chain is made of Mithril.{W2}"
		nextSingleText $80,$80  ; "Show them to him.{N}They might help him.{W1}"
		entityNod $0            ; 0026 MAKE ENTITY NOD 0
		csWait $14              ; WAIT 14
		setCamDest $2,$4        ; 0032 SET CAMERA DEST 2 4
		setActscript $80,$FF,eas_Init; 0015 SET ACTSCRIPT 80 FF 460CE
		moveEntity $80,$0,$0,$1 ; 002D MOVE ENTITY 80 0 0 1
		moreMove $1,$1
		endMove $8080
		moveEntity $0,$FF,$1,$2 ; 002D MOVE ENTITY 0 FF 1 2
		endMove $8080
		setEntityDir $81,$1     ; 0023 SET ENTITY FACING 81 1
		nextSingleText $FF,$FF  ; "{LEADER} displays the{N}jewels to Evil Spirit.{W1}"
		entityFlashWhite $0,$28 ; 0018 FLASH ENTITY WHITE 0 28
		nextText $0,$82         ; "Yeah, I feel it...I feel it...!{N}I think I can do it now.{N}Let me try again.{W1}"
		executeSubroutine csub_55EF4; 000A EXECUTE SUBROUTINE 55EF4
		csWait $14              ; WAIT 14
		executeSubroutine sub_55F82; 000A EXECUTE SUBROUTINE 55F82
		csWait $28              ; WAIT 28
		executeSubroutine csub_55EF4; 000A EXECUTE SUBROUTINE 55EF4
		csWait $1E              ; WAIT 1E
		executeSubroutine sub_55F82; 000A EXECUTE SUBROUTINE 55F82
		csWait $1E              ; WAIT 1E
		executeSubroutine csub_55EF4; 000A EXECUTE SUBROUTINE 55EF4
		csWait $28              ; WAIT 28
		executeSubroutine sub_55F82; 000A EXECUTE SUBROUTINE 55F82
		csWait $14              ; WAIT 14
		executeSubroutine csub_55EF4; 000A EXECUTE SUBROUTINE 55EF4
		nextSingleText $0,$82   ; "Hmmmm....{N}Hmmmm...mmmm....{W1}"
		csWait $64              ; WAIT 64
		nextSingleText $0,$82   ; "Arc Valley was opened and{N}Zeon was revived.{W1}"
		nextSingleText $80,$80  ; "Go on.{W1}"
		nextSingleText $0,$82   ; "Zeon's devils are coming to{N}Parmecia from the sky.{W1}"
		nextText $80,$80        ; "Hmmm....{W2}"
		nextSingleText $80,$80  ; "Where are they heading?{W1}"
		nextSingleText $0,$82   ; "North Parmecia.{W1}"
		nextSingleText $80,$80  ; "Something has happened to{N}Mitula....{W1}"
		nextSingleText $0,$82   ; "I can't see Zeon.{W1}"
		setActscript $80,$FF,eas_Jump; 0015 SET ACTSCRIPT 80 FF 45E44
		setActscript $80,$FF,eas_Jump; 0015 SET ACTSCRIPT 80 FF 45E44
		nextSingleText $80,$80  ; "What do you mean?{W1}"
		nextText $0,$82         ; "He's still in Arc Valley.{W2}"
		nextSingleText $0,$82   ; "He has revived, but he has{N}not recovered his full{N}strength yet.{W1}"
		nextText $80,$80        ; "But, he has already created{N}"
		nextText $80,$80        ; "a lot of mischief on the{N}ground...{W2}"
		nextSingleText $80,$80  ; "Is he that powerful?{W1}"
		nextSingleText $0,$82   ; "He is.{N}His power...{W1}"
		executeSubroutine sub_5BFDA; 000A EXECUTE SUBROUTINE 5BFDA
		csWait $A               ; WAIT A
		executeSubroutine csub_5BFD0; 000A EXECUTE SUBROUTINE 5BFD0
		nextSingleText $80,$80  ; "His power what?{W1}"
		executeSubroutine sub_5BFDA; 000A EXECUTE SUBROUTINE 5BFDA
		csWait $A               ; WAIT A
		executeSubroutine csub_5BFD0; 000A EXECUTE SUBROUTINE 5BFD0
		nextSingleText $0,$82   ; "Hi...s...pow...er...{W1}"
		executeSubroutine sub_5BFDA; 000A EXECUTE SUBROUTINE 5BFDA
		csWait $A               ; WAIT A
		executeSubroutine csub_5BFD0; 000A EXECUTE SUBROUTINE 5BFD0
		csWait $A               ; WAIT A
		executeSubroutine sub_5BFDA; 000A EXECUTE SUBROUTINE 5BFDA
		flashScreenWhite $28    ; 0041 FLASH SCREEN WHITE 28
		executeSubroutine sub_5BFE4; 000A EXECUTE SUBROUTINE 5BFE4
		setActscript $0,$0,eas_Jump; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $7,$0,eas_Jump; 0015 SET ACTSCRIPT 7 0 45E44
		setActscript $1F,$0,eas_Jump; 0015 SET ACTSCRIPT 1F 0 45E44
		setActscript $80,$0,eas_Jump; 0015 SET ACTSCRIPT 80 0 45E44
		setActscript $81,$FF,eas_Jump; 0015 SET ACTSCRIPT 81 FF 45E44
		setActscript $0,$0,eas_Jump; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $7,$0,eas_Jump; 0015 SET ACTSCRIPT 7 0 45E44
		setActscript $1F,$0,eas_Jump; 0015 SET ACTSCRIPT 1F 0 45E44
		setActscript $80,$0,eas_Jump; 0015 SET ACTSCRIPT 80 0 45E44
		setActscript $81,$FF,eas_Jump; 0015 SET ACTSCRIPT 81 FF 45E44
		nextSingleText $0,$83   ; "I'm Zeon!  I'm the King of{N}the Devils!{W1}"
		nextSingleText $80,$80  ; "What's this?!{W1}"
		nextText $0,$83         ; "Who's contacting me?{N}Do you want to die?{W1}"
		nextSingleText $0,$83   ; "Ggggooo...I see a jewel.{N}The Jewel of Evil!{W1}"
		entityShiver $80        ; 002A MAKE ENTITY SHIVER 80
		nextText $80,$80        ; "He's seeing us through the{N}eyes of Evil Spirit!{W2}"
		nextSingleText $80,$80  ; "Impossible!{W1}"
		nextText $0,$83         ; "You're {LEADER}.{N}I see you....{W2}"
		nextSingleText $0,$83   ; "Listen, {LEADER}.{N}Bring that jewel to Arc{N}Valley.{W1}"
		moveEntity $7,$FF,$1,$1 ; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		nextSingleText $0,$7    ; "Why should we?!{W1}"
		nextText $0,$83         ; "I'll return Elis to you in{N}exchange for the jewel.{W2}"
		nextSingleText $0,$83   ; "Come to Arc Valley...{N}Ggggooo...!{W1}"
		csWait $28              ; WAIT 28
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		executeSubroutine sub_5BFDA; 000A EXECUTE SUBROUTINE 5BFDA
		csWait $8               ; WAIT 8
		executeSubroutine sub_5BFE4; 000A EXECUTE SUBROUTINE 5BFE4
		csWait $3C              ; WAIT 3C
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		executeSubroutine sub_5BFDA; 000A EXECUTE SUBROUTINE 5BFDA
		csWait $8               ; WAIT 8
		executeSubroutine sub_5BFE4; 000A EXECUTE SUBROUTINE 5BFE4
		csWait $28              ; WAIT 28
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		executeSubroutine sub_5BFDA; 000A EXECUTE SUBROUTINE 5BFDA
		csWait $8               ; WAIT 8
		executeSubroutine sub_5BFE4; 000A EXECUTE SUBROUTINE 5BFE4
		csWait $14              ; WAIT 14
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		executeSubroutine sub_5BFDA; 000A EXECUTE SUBROUTINE 5BFDA
		setQuakeAmount $5       ; 0033 SET QUAKE AMOUNT 5
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		customActscript $85,$FF ; 0014 SET MANUAL ACTSCRIPT 85
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $86,$FF ; 0014 SET MANUAL ACTSCRIPT 86
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $87,$FF ; 0014 SET MANUAL ACTSCRIPT 87
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $88,$FF ; 0014 SET MANUAL ACTSCRIPT 88
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $89,$FF ; 0014 SET MANUAL ACTSCRIPT 89
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8A,$FF ; 0014 SET MANUAL ACTSCRIPT 8A
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8B,$FF ; 0014 SET MANUAL ACTSCRIPT 8B
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8C,$FF ; 0014 SET MANUAL ACTSCRIPT 8C
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8D,$FF ; 0014 SET MANUAL ACTSCRIPT 8D
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8E,$FF ; 0014 SET MANUAL ACTSCRIPT 8E
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8F,$FF ; 0014 SET MANUAL ACTSCRIPT 8F
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $90,$FF ; 0014 SET MANUAL ACTSCRIPT 90
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $91,$FF ; 0014 SET MANUAL ACTSCRIPT 91
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $92,$FF ; 0014 SET MANUAL ACTSCRIPT 92
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $93,$FF ; 0014 SET MANUAL ACTSCRIPT 93
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $94,$FF ; 0014 SET MANUAL ACTSCRIPT 94
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		entityPosDir $8D,$8,$6,$0; 0019 SET ENTITY POS AND FACING 8D 8 6 0
		entityPosDir $8E,$7,$5,$0; 0019 SET ENTITY POS AND FACING 8E 7 5 0
		entityPosDir $8F,$6,$6,$0; 0019 SET ENTITY POS AND FACING 8F 6 6 0
		entityPosDir $90,$7,$7,$0; 0019 SET ENTITY POS AND FACING 90 7 7 0
		setActscript $8D,$0,eas_464BE; 0015 SET ACTSCRIPT 8D 0 464BE
		setActscript $8E,$0,eas_464C6; 0015 SET ACTSCRIPT 8E 0 464C6
		setActscript $8F,$0,eas_464CE; 0015 SET ACTSCRIPT 8F 0 464CE
		setActscript $90,$0,eas_464D6; 0015 SET ACTSCRIPT 90 0 464D6
		entityPosDir $91,$8,$6,$2; 0019 SET ENTITY POS AND FACING 91 8 6 2
		entityPosDir $92,$7,$7,$2; 0019 SET ENTITY POS AND FACING 92 7 7 2
		entityPosDir $93,$6,$6,$2; 0019 SET ENTITY POS AND FACING 93 6 6 2
		entityPosDir $94,$7,$5,$2; 0019 SET ENTITY POS AND FACING 94 7 5 2
		moveEntity $91,$0,$0,$1 ; 002D MOVE ENTITY 91 0 0 1
		endMove $8080
		csWait $2               ; WAIT 2
		setActscript $91,$FF,eas_461AA; 0015 SET ACTSCRIPT 91 FF 461AA
		moveEntity $92,$0,$3,$1 ; 002D MOVE ENTITY 92 0 3 1
		endMove $8080
		csWait $2               ; WAIT 2
		setActscript $92,$FF,eas_461AA; 0015 SET ACTSCRIPT 92 FF 461AA
		moveEntity $93,$0,$2,$1 ; 002D MOVE ENTITY 93 0 2 1
		endMove $8080
		csWait $2               ; WAIT 2
		setActscript $93,$FF,eas_461AA; 0015 SET ACTSCRIPT 93 FF 461AA
		moveEntity $94,$0,$1,$1 ; 002D MOVE ENTITY 94 0 1 1
		endMove $8080
		csWait $2               ; WAIT 2
		setActscript $94,$FF,eas_461AA; 0015 SET ACTSCRIPT 94 FF 461AA
		setActscript $91,$0,eas_464E2; 0015 SET ACTSCRIPT 91 0 464E2
		setActscript $92,$0,eas_464EA; 0015 SET ACTSCRIPT 92 0 464EA
		setActscript $93,$0,eas_464F2; 0015 SET ACTSCRIPT 93 0 464F2
		setActscript $94,$0,eas_464FA; 0015 SET ACTSCRIPT 94 0 464FA
		playSound SFX_BATTLEFIELD_DEATH; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		entityPosDir $85,$7,$6,$0; 0019 SET ENTITY POS AND FACING 85 7 6 0
		entityPosDir $86,$7,$6,$0; 0019 SET ENTITY POS AND FACING 86 7 6 0
		entityPosDir $87,$7,$6,$0; 0019 SET ENTITY POS AND FACING 87 7 6 0
		entityPosDir $88,$7,$6,$0; 0019 SET ENTITY POS AND FACING 88 7 6 0
		entityPosDir $89,$7,$6,$0; 0019 SET ENTITY POS AND FACING 89 7 6 0
		entityPosDir $8A,$7,$6,$0; 0019 SET ENTITY POS AND FACING 8A 7 6 0
		entityPosDir $8B,$7,$6,$0; 0019 SET ENTITY POS AND FACING 8B 7 6 0
		entityPosDir $8C,$7,$6,$0; 0019 SET ENTITY POS AND FACING 8C 7 6 0
		moveEntity $85,$0,$0,$4 ; 002D MOVE ENTITY 85 0 0 4
		endMove $8080
		moveEntity $86,$0,$1,$4 ; 002D MOVE ENTITY 86 0 1 4
		endMove $8080
		moveEntity $87,$0,$2,$4 ; 002D MOVE ENTITY 87 0 2 4
		endMove $8080
		moveEntity $88,$0,$3,$4 ; 002D MOVE ENTITY 88 0 3 4
		endMove $8080
		moveEntity $89,$0,$4,$4 ; 002D MOVE ENTITY 89 0 4 4
		endMove $8080
		moveEntity $8A,$0,$5,$4 ; 002D MOVE ENTITY 8A 0 5 4
		endMove $8080
		moveEntity $8B,$0,$6,$4 ; 002D MOVE ENTITY 8B 0 6 4
		endMove $8080
		moveEntity $8C,$FF,$7,$4; 002D MOVE ENTITY 8C FF 7 4
		endMove $8080
		playSound SFX_BATTLEFIELD_DEATH; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		entityPosDir $85,$7,$6,$0; 0019 SET ENTITY POS AND FACING 85 7 6 0
		entityPosDir $86,$7,$6,$0; 0019 SET ENTITY POS AND FACING 86 7 6 0
		entityPosDir $87,$7,$6,$0; 0019 SET ENTITY POS AND FACING 87 7 6 0
		entityPosDir $88,$7,$6,$0; 0019 SET ENTITY POS AND FACING 88 7 6 0
		entityPosDir $89,$7,$6,$0; 0019 SET ENTITY POS AND FACING 89 7 6 0
		entityPosDir $8A,$7,$6,$0; 0019 SET ENTITY POS AND FACING 8A 7 6 0
		entityPosDir $8B,$7,$6,$0; 0019 SET ENTITY POS AND FACING 8B 7 6 0
		entityPosDir $8C,$7,$6,$0; 0019 SET ENTITY POS AND FACING 8C 7 6 0
		moveEntity $85,$0,$0,$4 ; 002D MOVE ENTITY 85 0 0 4
		endMove $8080
		moveEntity $86,$0,$1,$4 ; 002D MOVE ENTITY 86 0 1 4
		endMove $8080
		moveEntity $87,$0,$2,$4 ; 002D MOVE ENTITY 87 0 2 4
		endMove $8080
		moveEntity $88,$0,$3,$4 ; 002D MOVE ENTITY 88 0 3 4
		endMove $8080
		moveEntity $89,$0,$4,$4 ; 002D MOVE ENTITY 89 0 4 4
		endMove $8080
		moveEntity $8A,$0,$5,$4 ; 002D MOVE ENTITY 8A 0 5 4
		endMove $8080
		moveEntity $8B,$0,$6,$4 ; 002D MOVE ENTITY 8B 0 6 4
		endMove $8080
		moveEntity $8C,$FF,$7,$4; 002D MOVE ENTITY 8C FF 7 4
		endMove $8080
		playSound SFX_BATTLEFIELD_DEATH; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		entityPosDir $85,$7,$6,$0; 0019 SET ENTITY POS AND FACING 85 7 6 0
		entityPosDir $86,$7,$6,$0; 0019 SET ENTITY POS AND FACING 86 7 6 0
		entityPosDir $87,$7,$6,$0; 0019 SET ENTITY POS AND FACING 87 7 6 0
		entityPosDir $88,$7,$6,$0; 0019 SET ENTITY POS AND FACING 88 7 6 0
		entityPosDir $89,$7,$6,$0; 0019 SET ENTITY POS AND FACING 89 7 6 0
		entityPosDir $8A,$7,$6,$0; 0019 SET ENTITY POS AND FACING 8A 7 6 0
		entityPosDir $8B,$7,$6,$0; 0019 SET ENTITY POS AND FACING 8B 7 6 0
		entityPosDir $8C,$7,$6,$0; 0019 SET ENTITY POS AND FACING 8C 7 6 0
		moveEntity $85,$0,$0,$4 ; 002D MOVE ENTITY 85 0 0 4
		endMove $8080
		moveEntity $86,$0,$1,$4 ; 002D MOVE ENTITY 86 0 1 4
		endMove $8080
		moveEntity $87,$0,$2,$4 ; 002D MOVE ENTITY 87 0 2 4
		endMove $8080
		moveEntity $88,$0,$3,$4 ; 002D MOVE ENTITY 88 0 3 4
		endMove $8080
		moveEntity $89,$0,$4,$4 ; 002D MOVE ENTITY 89 0 4 4
		endMove $8080
		moveEntity $8A,$0,$5,$4 ; 002D MOVE ENTITY 8A 0 5 4
		endMove $8080
		moveEntity $8B,$0,$6,$4 ; 002D MOVE ENTITY 8B 0 6 4
		endMove $8080
		moveEntity $8C,$FF,$7,$4; 002D MOVE ENTITY 8C FF 7 4
		endMove $8080
		hideEntity $82          ; 002E HIDE ENTITY 82
		playSound SFX_BATTLEFIELD_DEATH; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		entityPosDir $85,$7,$6,$0; 0019 SET ENTITY POS AND FACING 85 7 6 0
		entityPosDir $86,$7,$6,$0; 0019 SET ENTITY POS AND FACING 86 7 6 0
		entityPosDir $87,$7,$6,$0; 0019 SET ENTITY POS AND FACING 87 7 6 0
		entityPosDir $88,$7,$6,$0; 0019 SET ENTITY POS AND FACING 88 7 6 0
		entityPosDir $89,$7,$6,$0; 0019 SET ENTITY POS AND FACING 89 7 6 0
		entityPosDir $8A,$7,$6,$0; 0019 SET ENTITY POS AND FACING 8A 7 6 0
		entityPosDir $8B,$7,$6,$0; 0019 SET ENTITY POS AND FACING 8B 7 6 0
		entityPosDir $8C,$7,$6,$0; 0019 SET ENTITY POS AND FACING 8C 7 6 0
		moveEntity $85,$0,$0,$4 ; 002D MOVE ENTITY 85 0 0 4
		endMove $8080
		moveEntity $86,$0,$1,$4 ; 002D MOVE ENTITY 86 0 1 4
		endMove $8080
		moveEntity $87,$0,$2,$4 ; 002D MOVE ENTITY 87 0 2 4
		endMove $8080
		moveEntity $88,$0,$3,$4 ; 002D MOVE ENTITY 88 0 3 4
		endMove $8080
		moveEntity $89,$0,$4,$4 ; 002D MOVE ENTITY 89 0 4 4
		endMove $8080
		moveEntity $8A,$0,$5,$4 ; 002D MOVE ENTITY 8A 0 5 4
		endMove $8080
		moveEntity $8B,$0,$6,$4 ; 002D MOVE ENTITY 8B 0 6 4
		endMove $8080
		moveEntity $8C,$FF,$7,$4; 002D MOVE ENTITY 8C FF 7 4
		endMove $8080
		playSound SFX_BATTLEFIELD_DEATH; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		entityPosDir $85,$7,$6,$0; 0019 SET ENTITY POS AND FACING 85 7 6 0
		entityPosDir $86,$7,$6,$0; 0019 SET ENTITY POS AND FACING 86 7 6 0
		entityPosDir $87,$7,$6,$0; 0019 SET ENTITY POS AND FACING 87 7 6 0
		entityPosDir $88,$7,$6,$0; 0019 SET ENTITY POS AND FACING 88 7 6 0
		entityPosDir $89,$7,$6,$0; 0019 SET ENTITY POS AND FACING 89 7 6 0
		entityPosDir $8A,$7,$6,$0; 0019 SET ENTITY POS AND FACING 8A 7 6 0
		entityPosDir $8B,$7,$6,$0; 0019 SET ENTITY POS AND FACING 8B 7 6 0
		entityPosDir $8C,$7,$6,$0; 0019 SET ENTITY POS AND FACING 8C 7 6 0
		moveEntity $85,$0,$0,$4 ; 002D MOVE ENTITY 85 0 0 4
		endMove $8080
		moveEntity $86,$0,$1,$4 ; 002D MOVE ENTITY 86 0 1 4
		endMove $8080
		moveEntity $87,$0,$2,$4 ; 002D MOVE ENTITY 87 0 2 4
		endMove $8080
		moveEntity $88,$0,$3,$4 ; 002D MOVE ENTITY 88 0 3 4
		endMove $8080
		moveEntity $89,$0,$4,$4 ; 002D MOVE ENTITY 89 0 4 4
		endMove $8080
		moveEntity $8A,$0,$5,$4 ; 002D MOVE ENTITY 8A 0 5 4
		endMove $8080
		moveEntity $8B,$0,$6,$4 ; 002D MOVE ENTITY 8B 0 6 4
		endMove $8080
		moveEntity $8C,$FF,$7,$4; 002D MOVE ENTITY 8C FF 7 4
		endMove $8080
		hideEntity $85          ; 002E HIDE ENTITY 85
		hideEntity $86          ; 002E HIDE ENTITY 86
		hideEntity $87          ; 002E HIDE ENTITY 87
		hideEntity $88          ; 002E HIDE ENTITY 88
		hideEntity $89          ; 002E HIDE ENTITY 89
		hideEntity $8A          ; 002E HIDE ENTITY 8A
		hideEntity $8B          ; 002E HIDE ENTITY 8B
		hideEntity $8C          ; 002E HIDE ENTITY 8C
		csWait $28              ; WAIT 28
		hideEntity $8D          ; 002E HIDE ENTITY 8D
		hideEntity $8E          ; 002E HIDE ENTITY 8E
		hideEntity $8F          ; 002E HIDE ENTITY 8F
		hideEntity $90          ; 002E HIDE ENTITY 90
		hideEntity $91          ; 002E HIDE ENTITY 91
		hideEntity $92          ; 002E HIDE ENTITY 92
		hideEntity $93          ; 002E HIDE ENTITY 93
		hideEntity $94          ; 002E HIDE ENTITY 94
		setQuakeAmount $4005    ; 0033 SET QUAKE AMOUNT 4005
		executeSubroutine sub_55F82; 000A EXECUTE SUBROUTINE 55F82
		csWait $3C              ; WAIT 3C
		setEntityDir $0,$3      ; 0023 SET ENTITY FACING 0 3
		setEntityDir $81,$3     ; 0023 SET ENTITY FACING 81 3
		setEntityDir $80,$3     ; 0023 SET ENTITY FACING 80 3
		nextText $80,$80        ; "No!  Evil Spirit exploded!{W2}"
		nextText $80,$80        ; "That's Zeon's power.{W2}"
		nextSingleText $80,$80  ; "If he revives fully, his{N}power will be unimaginably{N}strong!{W1}"
		setEntityDir $81,$0     ; 0023 SET ENTITY FACING 81 0
		setEntityDir $80,$2     ; 0023 SET ENTITY FACING 80 2
		nextSingleText $0,$81   ; "Creed, how reliable was he,{N}I mean, Evil Spirit?{W1}"
		nextText $80,$80        ; "Very.{W2}"
		setEntityDir $80,$3     ; 0023 SET ENTITY FACING 80 3
		nextText $80,$80        ; "Why does Zeon want the jewel?{W2}"
		nextSingleText $80,$80  ; "No more questions...{N}...without Evil Spirit....{W1}"
		csWait $1E              ; WAIT 1E
		moveEntity $80,$FF,$3,$1; 002D MOVE ENTITY 80 FF 3 1
		moreMove $2,$1
		moreMove $3,$5
		endMove $8080
		hideEntity $80          ; 002E HIDE ENTITY 80
		moveEntity $81,$FF,$2,$1; 002D MOVE ENTITY 81 FF 2 1
		moreMove $3,$1
		endMove $8080
		setEntityDir $7,$3      ; 0023 SET ENTITY FACING 7 3
		setEntityDir $1F,$3     ; 0023 SET ENTITY FACING 1F 3
		nextText $0,$81         ; "Creed?  Creed!{W2}"
		setActscript $81,$FF,eas_Jump; 0015 SET ACTSCRIPT 81 FF 45E44
		setActscript $81,$FF,eas_Jump; 0015 SET ACTSCRIPT 81 FF 45E44
		nextSingleText $0,$81   ; "Hey, don't leave me here!{N}Wait for me!{W1}"
		moveEntity $81,$FF,$3,$5; 002D MOVE ENTITY 81 FF 3 5
		endMove $8080
		hideEntity $81          ; 002E HIDE ENTITY 81
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		followEntity $1F,$7,$2  ; 002C FOLLOW ENTITY 1F 7 2
		csc_end                 ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

csub_5BFD0:
		moveq   #0,d0
		jsr     sub_20058
		rts

	; End of function csub_5BFD0


; =============== S U B R O U T I N E =======================================

sub_5BFDA:
		moveq   #1,d0
		jsr     sub_20058
		rts

	; End of function sub_5BFDA


; =============== S U B R O U T I N E =======================================

sub_5BFE4:
		moveq   #2,d0
		jsr     sub_20058
		rts

	; End of function sub_5BFE4

