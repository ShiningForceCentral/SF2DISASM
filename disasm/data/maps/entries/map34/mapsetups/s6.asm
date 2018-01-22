
; ASM FILE data\maps\entries\map34\mapsetups\s6.asm :
; 0x5B6BE..0x5BFEE : 

; =============== S U B R O U T I N E =======================================

ms_map34_InitFunction:
		
		rts

	; End of function ms_map34_InitFunction

cs_5B6C0:       textCursor $C87
		setCamDest 2,4
		nextText $80,$80        ; "Yeeenn...queeen...{N}tillooora...synooora...{N}hear my voice....{W2}"
		nextSingleText $80,$80  ; "Evil Spirit, come.{W1}"
		entityFlashWhite $80,$64
		setPos $82,7,6,3
		csWait 7
		setPos $82,60,60,3
		csWait 80
		setPos $82,7,6,3
		csWait 7
		setPos $82,60,60,3
		csWait 60
		setPos $82,7,6,3
		csWait 7
		setPos $82,60,60,3
		csWait 40
		moveEntity $81,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$81   ; "Hey, Evil Spirit is{N}appearing!{W1}"
		setCamDest 2,2
		setPos $82,7,6,3
		csWait 7
		setPos $82,60,60,3
		csWait 60
		setPos $82,7,6,3
		csWait 7
		setPos $82,60,60,3
		csWait 50
		setPos $82,7,6,3
		csWait 7
		setPos $82,60,60,3
		csWait 40
		setPos $82,7,6,3
		csWait 7
		setPos $82,60,60,3
		csWait 30
		setPos $82,7,6,3
		csWait 7
		setPos $82,60,60,3
		csWait 20
		setPos $82,7,6,3
		csWait 7
		setPos $82,60,60,3
		csWait 10
		setPos $82,7,6,3
		setActscript $82,$0,eas_Transparent
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		setPos $0,7,12,1
		setPos $7,6,12,1
		setPos $1F,8,12,1
		setCamDest 2,4
		moveEntity $80,$FF,$1,$1
		endMove $8080
		nextSingleText $80,$80  ; "Ahhh....{W1}"
		nextSingleText $0,$82   ; "Creed, what do you want?{W1}"
		nextSingleText $80,$80  ; "Zeon.{W1}"
		nextSingleText $0,$82   ; "Zeon?!  The King of the{N}Devils?{W1}"
		entityNod $80
		nextText $80,$80        ; "Yes.{W2}"
		nextText $80,$80        ; "He was unsealed.{W1}"
		nextText $80,$80        ; "What is he doing now?{N}What is he going to do?{W2}"
		nextSingleText $80,$80  ; "I need to know anything{N}about him.  Anything!{W1}"
		nextText $0,$82         ; "I've got something.{W1}"
		csWait 40
		flashScreenWhite $4
		csWait 30
		flashScreenWhite $4
		csWait 20
		flashScreenWhite $4
		mapFadeOutToWhite
		csWait 30
		nextSingleText $0,$82   ; "Hmmmm....{N}Hmmmm...mmmm....{W1}"
		moveEntity $0,$0,$1,$1
		endMove $8080
		moveEntity $7,$0,$1,$1
		endMove $8080
		moveEntity $1F,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$7    ; "What is he doing now?{W1}"
		setFacing $81,3
		nextText $0,$81         ; "He's channeling his mind{N}into the nature of all{N}things.{W2}"
		setFacing $81,1
		mapFadeInFromWhite
		csWait 40
		setFacing $81,3
		nextSingleText $0,$81   ; "Shhhh!  Be silent.{N}He's got something.{W1}"
		setFacing $81,1
		setActscript $80,$FF,eas_Jump
		setActscript $80,$FF,eas_Jump
		nextSingleText $80,$80  ; "What did you find?{W1}"
		nextSingleText $0,$82   ; "The barrier around Grans{N}Island is too strong.{N}I can't see anything.{W1}"
		entityShiver $80
		nextSingleText $80,$80  ; "Please try again!{W1}"
		nextSingleText $0,$82   ; "If I touch something of his,{N}maybe I could contact his{N}mind better....{W1}"
		setCamDest 2,5
		setFacing $7,0
		setFacing $0,2
		setFacing $1F,2
		nextSingleText $0,$7    ; "{LEADER}, you have the{N}Jewel of Evil, right?{W1}"
		setFacing $80,3
		setFacing $81,3
		setActscript $80,$FF,eas_Jump
		setActscript $80,$FF,eas_Jump
		nextText $80,$80        ; "Is this true, {LEADER}?{W2}"
		nextSingleText $80,$80  ; "That's one of the magic{N}jewels used to seal{N}Zeon.  Give it to me.{W1}"
		setFacing $0,1
		setFacing $7,1
		setFacing $1F,1
		nextSingleText $0,$7    ; "But, we can't remove it.{W1}"
		nextSingleText $80,$80  ; "I can.{W1}"
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$80  ; "Let me see it.{W1}"
		setActscript $80,$FF,eas_46172
		moveEntity $80,$0,$3,$1
		endMove $8080
		csWait 2
		setActscript $80,$FF,eas_461AA
		stopEntity $80
		csWait 20
		entityFlashWhite $0,$28
		startEntity $80
		moveEntity $80,$0,$1,$1
		endMove $8080
		csWait 2
		setActscript $80,$FF,eas_461AA
		entityShakeHead $80
		nextText $80,$80        ; "Whhoooa!{W2}"
		nextSingleText $80,$80  ; "What's that light?{N}There are two!{W1}"
		nextSingleText $0,$7    ; "The other one is...{N}...ahhh...they called it,{N}the Jewel of Light.{W1}"
		entityShiver $80
		nextText $80,$80        ; "What?!{W2}"
		nextText $80,$80        ; "{LEADER}, do you have both{N}of the legendary jewels?{W2}"
		nextText $80,$80        ; "I can't remove them.{N}The chain is made of Mithril.{W2}"
		nextSingleText $80,$80  ; "Show them to him.{N}They might help him.{W1}"
		entityNod $0
		csWait 20
		setCamDest 2,4
		setActscript $80,$FF,eas_Init
		moveEntity $80,$0,$0,$1
		moreMove $1,$1
		endMove $8080
		moveEntity $0,$FF,$1,$2
		endMove $8080
		setFacing $81,1
		nextSingleText $FF,$FF  ; "{LEADER} displays the{N}jewels to Evil Spirit.{W1}"
		entityFlashWhite $0,$28
		nextText $0,$82         ; "Yeah, I feel it...I feel it...!{N}I think I can do it now.{N}Let me try again.{W1}"
		executeSubroutine csub_55EF4
		csWait 20
		executeSubroutine sub_55F82
		csWait 40
		executeSubroutine csub_55EF4
		csWait 30
		executeSubroutine sub_55F82
		csWait 30
		executeSubroutine csub_55EF4
		csWait 40
		executeSubroutine sub_55F82
		csWait 20
		executeSubroutine csub_55EF4
		nextSingleText $0,$82   ; "Hmmmm....{N}Hmmmm...mmmm....{W1}"
		csWait 100
		nextSingleText $0,$82   ; "Arc Valley was opened and{N}Zeon was revived.{W1}"
		nextSingleText $80,$80  ; "Go on.{W1}"
		nextSingleText $0,$82   ; "Zeon's devils are coming to{N}Parmecia from the sky.{W1}"
		nextText $80,$80        ; "Hmmm....{W2}"
		nextSingleText $80,$80  ; "Where are they heading?{W1}"
		nextSingleText $0,$82   ; "North Parmecia.{W1}"
		nextSingleText $80,$80  ; "Something has happened to{N}Mitula....{W1}"
		nextSingleText $0,$82   ; "I can't see Zeon.{W1}"
		setActscript $80,$FF,eas_Jump
		setActscript $80,$FF,eas_Jump
		nextSingleText $80,$80  ; "What do you mean?{W1}"
		nextText $0,$82         ; "He's still in Arc Valley.{W2}"
		nextSingleText $0,$82   ; "He has revived, but he has{N}not recovered his full{N}strength yet.{W1}"
		nextText $80,$80        ; "But, he has already created{N}"
		nextText $80,$80        ; "a lot of mischief on the{N}ground...{W2}"
		nextSingleText $80,$80  ; "Is he that powerful?{W1}"
		nextSingleText $0,$82   ; "He is.{N}His power...{W1}"
		executeSubroutine sub_5BFDA
		csWait 10
		executeSubroutine csub_5BFD0
		nextSingleText $80,$80  ; "His power what?{W1}"
		executeSubroutine sub_5BFDA
		csWait 10
		executeSubroutine csub_5BFD0
		nextSingleText $0,$82   ; "Hi...s...pow...er...{W1}"
		executeSubroutine sub_5BFDA
		csWait 10
		executeSubroutine csub_5BFD0
		csWait 10
		executeSubroutine sub_5BFDA
		flashScreenWhite $28
		executeSubroutine sub_5BFE4
		setActscript $0,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		setActscript $1F,$0,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		setActscript $0,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		setActscript $1F,$0,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		nextSingleText $0,$83   ; "I'm Zeon!  I'm the King of{N}the Devils!{W1}"
		nextSingleText $80,$80  ; "What's this?!{W1}"
		nextText $0,$83         ; "Who's contacting me?{N}Do you want to die?{W1}"
		nextSingleText $0,$83   ; "Ggggooo...I see a jewel.{N}The Jewel of Evil!{W1}"
		entityShiver $80
		nextText $80,$80        ; "He's seeing us through the{N}eyes of Evil Spirit!{W2}"
		nextSingleText $80,$80  ; "Impossible!{W1}"
		nextText $0,$83         ; "You're {LEADER}.{N}I see you....{W2}"
		nextSingleText $0,$83   ; "Listen, {LEADER}.{N}Bring that jewel to Arc{N}Valley.{W1}"
		moveEntity $7,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$7    ; "Why should we?!{W1}"
		nextText $0,$83         ; "I'll return Elis to you in{N}exchange for the jewel.{W2}"
		nextSingleText $0,$83   ; "Come to Arc Valley...{N}Ggggooo...!{W1}"
		csWait 40
		flashScreenWhite $4
		executeSubroutine sub_5BFDA
		csWait 8
		executeSubroutine sub_5BFE4
		csWait 60
		flashScreenWhite $4
		executeSubroutine sub_5BFDA
		csWait 8
		executeSubroutine sub_5BFE4
		csWait 40
		flashScreenWhite $4
		executeSubroutine sub_5BFDA
		csWait 8
		executeSubroutine sub_5BFE4
		csWait 20
		flashScreenWhite $4
		executeSubroutine sub_5BFDA
		setQuake 5
		playSound SFX_BIG_DOOR_RUMBLE
		customActscript $85,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $86,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $87,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $88,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $89,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8A,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8B,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8C,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8D,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8E,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $8F,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $90,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $91,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $92,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $93,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $94,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setPos $8D,8,6,0
		setPos $8E,7,5,0
		setPos $8F,6,6,0
		setPos $90,7,7,0
		setActscript $8D,$0,eas_464BE
		setActscript $8E,$0,eas_464C6
		setActscript $8F,$0,eas_464CE
		setActscript $90,$0,eas_464D6
		setPos $91,8,6,2
		setPos $92,7,7,2
		setPos $93,6,6,2
		setPos $94,7,5,2
		moveEntity $91,$0,$0,$1
		endMove $8080
		csWait 2
		setActscript $91,$FF,eas_461AA
		moveEntity $92,$0,$3,$1
		endMove $8080
		csWait 2
		setActscript $92,$FF,eas_461AA
		moveEntity $93,$0,$2,$1
		endMove $8080
		csWait 2
		setActscript $93,$FF,eas_461AA
		moveEntity $94,$0,$1,$1
		endMove $8080
		csWait 2
		setActscript $94,$FF,eas_461AA
		setActscript $91,$0,eas_464E2
		setActscript $92,$0,eas_464EA
		setActscript $93,$0,eas_464F2
		setActscript $94,$0,eas_464FA
		playSound SFX_BATTLEFIELD_DEATH
		setPos $85,7,6,0
		setPos $86,7,6,0
		setPos $87,7,6,0
		setPos $88,7,6,0
		setPos $89,7,6,0
		setPos $8A,7,6,0
		setPos $8B,7,6,0
		setPos $8C,7,6,0
		moveEntity $85,$0,$0,$4
		endMove $8080
		moveEntity $86,$0,$1,$4
		endMove $8080
		moveEntity $87,$0,$2,$4
		endMove $8080
		moveEntity $88,$0,$3,$4
		endMove $8080
		moveEntity $89,$0,$4,$4
		endMove $8080
		moveEntity $8A,$0,$5,$4
		endMove $8080
		moveEntity $8B,$0,$6,$4
		endMove $8080
		moveEntity $8C,$FF,$7,$4
		endMove $8080
		playSound SFX_BATTLEFIELD_DEATH
		setPos $85,7,6,0
		setPos $86,7,6,0
		setPos $87,7,6,0
		setPos $88,7,6,0
		setPos $89,7,6,0
		setPos $8A,7,6,0
		setPos $8B,7,6,0
		setPos $8C,7,6,0
		moveEntity $85,$0,$0,$4
		endMove $8080
		moveEntity $86,$0,$1,$4
		endMove $8080
		moveEntity $87,$0,$2,$4
		endMove $8080
		moveEntity $88,$0,$3,$4
		endMove $8080
		moveEntity $89,$0,$4,$4
		endMove $8080
		moveEntity $8A,$0,$5,$4
		endMove $8080
		moveEntity $8B,$0,$6,$4
		endMove $8080
		moveEntity $8C,$FF,$7,$4
		endMove $8080
		playSound SFX_BATTLEFIELD_DEATH
		setPos $85,7,6,0
		setPos $86,7,6,0
		setPos $87,7,6,0
		setPos $88,7,6,0
		setPos $89,7,6,0
		setPos $8A,7,6,0
		setPos $8B,7,6,0
		setPos $8C,7,6,0
		moveEntity $85,$0,$0,$4
		endMove $8080
		moveEntity $86,$0,$1,$4
		endMove $8080
		moveEntity $87,$0,$2,$4
		endMove $8080
		moveEntity $88,$0,$3,$4
		endMove $8080
		moveEntity $89,$0,$4,$4
		endMove $8080
		moveEntity $8A,$0,$5,$4
		endMove $8080
		moveEntity $8B,$0,$6,$4
		endMove $8080
		moveEntity $8C,$FF,$7,$4
		endMove $8080
		hideEntity $82
		playSound SFX_BATTLEFIELD_DEATH
		playSound SFX_BIG_DOOR_RUMBLE
		setPos $85,7,6,0
		setPos $86,7,6,0
		setPos $87,7,6,0
		setPos $88,7,6,0
		setPos $89,7,6,0
		setPos $8A,7,6,0
		setPos $8B,7,6,0
		setPos $8C,7,6,0
		moveEntity $85,$0,$0,$4
		endMove $8080
		moveEntity $86,$0,$1,$4
		endMove $8080
		moveEntity $87,$0,$2,$4
		endMove $8080
		moveEntity $88,$0,$3,$4
		endMove $8080
		moveEntity $89,$0,$4,$4
		endMove $8080
		moveEntity $8A,$0,$5,$4
		endMove $8080
		moveEntity $8B,$0,$6,$4
		endMove $8080
		moveEntity $8C,$FF,$7,$4
		endMove $8080
		playSound SFX_BATTLEFIELD_DEATH
		setPos $85,7,6,0
		setPos $86,7,6,0
		setPos $87,7,6,0
		setPos $88,7,6,0
		setPos $89,7,6,0
		setPos $8A,7,6,0
		setPos $8B,7,6,0
		setPos $8C,7,6,0
		moveEntity $85,$0,$0,$4
		endMove $8080
		moveEntity $86,$0,$1,$4
		endMove $8080
		moveEntity $87,$0,$2,$4
		endMove $8080
		moveEntity $88,$0,$3,$4
		endMove $8080
		moveEntity $89,$0,$4,$4
		endMove $8080
		moveEntity $8A,$0,$5,$4
		endMove $8080
		moveEntity $8B,$0,$6,$4
		endMove $8080
		moveEntity $8C,$FF,$7,$4
		endMove $8080
		hideEntity $85
		hideEntity $86
		hideEntity $87
		hideEntity $88
		hideEntity $89
		hideEntity $8A
		hideEntity $8B
		hideEntity $8C
		csWait 40
		hideEntity $8D
		hideEntity $8E
		hideEntity $8F
		hideEntity $90
		hideEntity $91
		hideEntity $92
		hideEntity $93
		hideEntity $94
		setQuake 16389
		executeSubroutine sub_55F82
		csWait 60
		setFacing $0,3
		setFacing $81,3
		setFacing $80,3
		nextText $80,$80        ; "No!  Evil Spirit exploded!{W2}"
		nextText $80,$80        ; "That's Zeon's power.{W2}"
		nextSingleText $80,$80  ; "If he revives fully, his{N}power will be unimaginably{N}strong!{W1}"
		setFacing $81,0
		setFacing $80,2
		nextSingleText $0,$81   ; "Creed, how reliable was he,{N}I mean, Evil Spirit?{W1}"
		nextText $80,$80        ; "Very.{W2}"
		setFacing $80,3
		nextText $80,$80        ; "Why does Zeon want the jewel?{W2}"
		nextSingleText $80,$80  ; "No more questions...{N}...without Evil Spirit....{W1}"
		csWait 30
		moveEntity $80,$FF,$3,$1
		moreMove $2,$1
		moreMove $3,$5
		endMove $8080
		hideEntity $80
		moveEntity $81,$FF,$2,$1
		moreMove $3,$1
		endMove $8080
		setFacing $7,3
		setFacing $1F,3
		nextText $0,$81         ; "Creed?  Creed!{W2}"
		setActscript $81,$FF,eas_Jump
		setActscript $81,$FF,eas_Jump
		nextSingleText $0,$81   ; "Hey, don't leave me here!{N}Wait for me!{W1}"
		moveEntity $81,$FF,$3,$5
		endMove $8080
		hideEntity $81
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		csc_end

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

