
; ASM FILE data\battles\entries\battle38\cs_beforebattle.asm :
; 0x4DDA4..0x4DE8C : Cutscene before battle 38
bbcs_38:        textCursor $BBB
		loadMapFadeIn 66,9,6
		loadMapEntities ce_4DE74
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,13,8,DOWN
		setActscript $1F,$FF,eas_Init
		setPos $1F,15,8,DOWN
		setActscript $1E,$FF,eas_Init
		setPos $1E,14,8,DOWN
		jumpIfFlagClear $4C,cs_4DDFE; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		setPos $1A,63,63,DOWN
cs_4DDFE:       playSound MUSIC_BATTLE_THEME_1
		fadeInB
		cameraSpeed $30
		moveEntity $0,$0,$3,$2
		endMove $8080
		moveEntity $7,$0,$3,$2
		endMove $8080
		moveEntity $1E,$0,$3,$2
		endMove $8080
		moveEntity $1F,$FF,$3,$2
		endMove $8080
		nextSingleText $0,$80   ; "Stop!{W1}"
		setCamDest 9,19
		nextText $0,$80         ; "Finally, you've arrived.{W2}"
		nextSingleText $0,$80   ; "It was a mistake to{N}underestimate you.{W2}"
		moveEntity $80,$FF,$1,$2
		endMove $8080
		nextSingleText $0,$80   ; "But, the game is not over.{N}At the risk of my life,{N}you'll proceed no further!{W1}"
		nextText $C0,$1F        ; "Geshp is serious.{N}He finally considers us{N}worthy opponents.{W2}"
		nextSingleText $C0,$1F  ; "{LEADER}, be careful.{N}We mustn't underrate his{N}power.{W1}"
		nextText $0,$80         ; "You're right, Astral!{W2}"
		nextText $0,$80         ; "Zeon doesn't trust me,{N}thanks to you!{W2}"
		nextSingleText $0,$80   ; "This is my last chance.{N}I can't see him again 'til I{N}bring him your head.{W1}"
		setQuake 4
		playSound SFX_BOLT_SPELL
		flashScreenWhite $1E
		playSound SFX_BATTLEFIELD_DEATH
		flashScreenWhite $32
		setQuake 0
		csc_end
ce_4DE74:       mainEntity 14,9,DOWN
		entity 13,8,DOWN,7,eas_Init
		entity 13,23,UP,159,eas_Init
		dc.w $FFFF
