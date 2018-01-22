
; ASM FILE data\battles\entries\battle38\cs_beforebattle.asm :
; 0x4DDA4..0x4DE8C : Cutscene before battle 38
bbcs_38:        textCursor $BBB
		loadMapFadeIn $42,$9,$6
		loadMapEntities ce_4DE74
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$D,$8,$3
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$F,$8,$3
		setActscript $1E,$FF,eas_Init
		entityPosDir $1E,$E,$8,$3
		jumpIfFlagClear $4C,cs_4DDFE; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		entityPosDir $1A,$3F,$3F,$3
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
		setCamDest $9,$13
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
		setQuake $4
		playSound SFX_BOLT_SPELL
		flashScreenWhite $1E
		playSound SFX_BATTLEFIELD_DEATH
		flashScreenWhite $32
		setQuake $0
		csc_end
ce_4DE74:       dc.w $E
		dc.w 9
		dc.w 3
		dc.b $D
		dc.b 8
		dc.b 3
		dc.b 7
		dc.l eas_Init           
		dc.b $D
		dc.b $17
		dc.b 1
		dc.b $9F
		dc.l eas_Init           
		dc.w $FFFF
