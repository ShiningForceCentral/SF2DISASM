
; ASM FILE data\battles\entries\battle33\cs_beforebattle.asm :
; 0x4CF0C..0x4D09A : Cutscene before battle 33
bbcs_33:        textCursor $B32
		loadMapFadeIn 31,22,29
		loadMapEntities ce_4D048
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,27,38,2
		setActscript $1F,$FF,eas_Init
		setPos $1F,27,37,2
		setActscript $16,$FF,eas_Init
		setPos $16,27,36,2
		setBlocks 16,8,1,1,32,1
		setBlocks 3,39,1,1,16,8
		playSound MUSIC_BATTLE_THEME_3
		fadeInB
		csWait 30
		setFacing $0,1
		setFacing $7,1
		setFacing $1F,1
		moveEntity $16,$FF,$1,$1
		endMove $8080
		setFacing $16,3
		nextSingleText $0,$16   ; "I'm opening the gate of Moun.{N}Devils are waiting inside.{N}Be careful!{W1}"
		moveEntity $16,$FF,$1,$1
		endMove $8080
		nextSingleText $FF,$FF  ; "Vicar {NAME;22} uses{N}the gate key.{W1}"
		csWait 30
		setQuake 2
		setBlocks 1,39,2,2,26,32
		csWait 20
		setQuake 0
		setCameraEntity $0
		csWait 50
		moveEntity $0,$FF,$1,$1
		endMove $8080
		moveEntity $16,$0,$1,$6
		moreMove $2,$1
		moreMove $1,$1
		endMove $8080
		moveEntity $0,$0,$1,$7
		endMove $8080
		moveEntity $1F,$0,$1,$6
		moreMove $2,$2
		moreMove $1,$1
		endMove $8080
		moveEntity $7,$FF,$1,$8
		endMove $8080
		csWait 30
		cameraSpeed $30
		setCamDest 5,8
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextText $0,$80         ; "Welcome, losers!{W2}"
		nextSingleText $0,$80   ; "Will you follow the example{N}of the people of Moun and die{N}without resistance?{W1}"
		nextText $0,$16         ; "No!  I'm too late.{N}I killed a lot of people.{W2}"
		nextSingleText $0,$16   ; "I can never forgive myself!{W1}"
		setCamDest 21,25
		moveEntity $16,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$16   ; "{LEADER}, please let me{N}fight with you.  They must{N}die!{W1}"
		join $16
		moveEntity $1F,$FF,$1,$1
		endMove $8080
		setFacing $1F,0
		setFacing $0,2
		nextSingleText $0,$1F   ; "{LEADER}, {NAME;22} will be{N}a great asset.{W1}"
		joinBatParty $16
		executeSubroutine sub_4D078
		textCursor $B3B
		nextSingleText $0,$1F   ; "{LEADER}, {NAME;22} is{N}right.  They must die!{W1}"
		setF $33F               ; set after Frayja forces his way into the party just before the battle in Moun
		clearF $52              ; Frayja is a follower
		csc_end
ce_4D048:       dc.w $1A
		dc.w $25
		dc.w 2
		dc.b $1B
		dc.b $26
		dc.b 2
		dc.b 7
		dc.l eas_Init           
		dc.b $1B
		dc.b $24
		dc.b 2
		dc.b $16
		dc.l eas_Init           
		dc.b $A
		dc.b $A
		dc.b 3
		dc.b $93
		dc.l eas_Init           
		dc.b 9
		dc.b $A
		dc.b 3
		dc.b $57
		dc.l eas_Init           
		dc.b $B
		dc.b $A
		dc.b 3
		dc.b $57
		dc.l eas_Init           
		dc.w $FFFF

; =============== S U B R O U T I N E =======================================

sub_4D078:
		cmpi.w  #$FFFF,(TEXT_NAME_INDEX_1).l
		beq.s   return_4D098
		jsr     (HideTextBox).l 
		move.w  #$B3A,d0
		jsr     (DisplayText).l 
		jsr     (HideTextBox).l 
return_4D098:
		rts

	; End of function sub_4D078

