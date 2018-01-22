
; ASM FILE data\battles\entries\battle18\cs_afterbattle.asm :
; 0x4B2F2..0x4B6CE : Cutscene after battle 18
abcs_battle18:  textCursor $9E0
		loadMapFadeIn 12,7,5
		loadMapEntities ce_4B6BE
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		setActscript $B,$FF,eas_Init
		setPos $7,13,9,1
		setPos $1F,14,9,1
		setPos $B,5,9,0
		stopEntity $80
		fadeInB
		csWait 60
		nextSingleText $0,$B    ; "{LEADER}, you're much{N}stronger than I thought.{W1}"
		setFacing $0,2
		setFacing $7,2
		setFacing $1F,2
		csWait 30
		setCameraEntity $B
		csWait 120
		moveEntity $B,$FF,$0,$6
		endMove $8080
		setFacing $0,1
		setFacing $7,1
		setFacing $1F,1
		moveEntity $B,$FF,$1,$4
		endMove $8080
		setFacing $B,0
		setCameraEntity $FFFF
		setCamDest 7,1
		csWait 30
		setPos $B,12,6,1
		csWait 20
		setPos $B,13,5,2
		csWait 20
		setPos $B,12,6,1
		csWait 20
		setPos $B,11,5,0
		csWait 20
		setPos $B,12,6,1
		csWait 20
		setPos $B,13,5,2
		csWait 20
		nextSingleText $0,$B    ; "It's so small.  I'll just{N}try to...get inside....{W1}"
		moveEntity $B,$0,$2,$1
		endMove $8080
		csWait 3
		setActscript $B,$0,eas_452BA
		csWait 3
		csWait 60
		startEntity $80
		csWait 30
		stopEntity $80
		csWait 60
		startEntity $80
		csWait 120
		setFacing $80,2
		csWait 10
		setFacing $80,1
		csWait 10
		setFacing $80,0
		csWait 10
		setFacing $80,3
		csWait 10
		setFacing $80,2
		csWait 10
		setFacing $80,1
		csWait 10
		setFacing $80,0
		csWait 10
		setFacing $80,3
		setActscript $80,$0,eas_Jump
		csWait 10
		setPos $B,63,63,3
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		playSound SFX_FALLING
		moveEntity $80,$0,$3,$9
		endMove $8080
		csWait 20
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $0,$FF,eas_46172
		moveEntity $0,$0,$2,$1
		endMove $8080
		setFacing $0,0
		setFacing $7,2
		setFacing $1F,2
		csWait 60
		setCamDest 7,4
		setActscript $0,$FF,eas_Init
		setFacing $0,3
		setFacing $7,3
		setFacing $1F,3
		nextSingleText $0,$7    ; "Oh, he's gone!{W1}"
		csWait 60
		setFacing $0,0
		setFacing $7,2
		setFacing $1F,2
		nextSingleText $0,$7    ; "I hope he comes back.{N}Did {NAME;11} lie to us?{W1}"
		csWait 30
		setFacing $0,3
		setFacing $7,3
		setFacing $1F,3
		csWait 150
		setActscript $80,$FF,eas_46172
		moveEntity $80,$0,$1,$9
		endMove $8080
		playSound SFX_FALLING
		csWait 20
		setFacing $80,2
		setFacing $1F,2
		csWait 20
		setFacing $0,1
		setFacing $7,1
		csWait 10
		setFacing $0,2
		setFacing $7,0
		csWait 10
		setFacing $0,3
		setFacing $7,3
		csWait 10
		setFacing $0,0
		setFacing $7,2
		csWait 10
		setFacing $0,1
		setFacing $7,1
		csWait 10
		setFacing $0,2
		setFacing $7,0
		csWait 10
		setFacing $0,3
		setFacing $7,3
		csWait 10
		setFacing $0,0
		setFacing $7,2
		csWait 10
		customActscript $0,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $7,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		stopEntity $0
		stopEntity $7
		csWait 30
		setFacing $80,3
		csWait 60
		stopEntity $80
		setActscript $1F,$FF,eas_BumpLeft
		setActscript $1F,$FF,eas_BumpLeft
		csWait 30
		setPos $B,12,5,0
		setActscript $B,$FF,eas_4536C
		csWait 3
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setFacing $0,1
		setFacing $7,1
		setFacing $1F,1
		startEntity $0
		startEntity $7
		moveEntity $B,$FF,$3,$3
		endMove $8080
		nextSingleText $0,$B    ; "I never lie!{W1}"
		moveEntity $B,$FF,$2,$2
		endMove $8080
		setFacing $B,3
		nextSingleText $0,$B    ; "The Ancients were...how{N}should I say this...great!{W1}"
		moveEntity $B,$FF,$0,$1
		endMove $8080
		setFacing $B,1
		nextSingleText $0,$B    ; "No wonder the Caravan is so{N}small.  It carries miniaturized{N}people and items.{W2}"
		moveEntity $B,$FF,$1,$2
		endMove $8080
		setFacing $B,3
		nextSingleText $0,$B    ; "I can drive this excellent{N}vehicle.  May I go with you{N}as a driver?{W1}"
		csWait 30
		nextSingleText $FF,$FF  ; "{NAME;11} the historian{N}tags along with the force.{W1}"
		moveEntity $7,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$7    ; "You're kidding, right?{W1}"
		moveEntity $7,$FF,$3,$1
		endMove $8080
		setFacing $7,2
		setFacing $0,0
		setFacing $1F,2
		nextSingleText $0,$7    ; "Well, at least we can bring{N}a lot of soldiers with us.{W1}"
		moveEntity $B,$FF,$3,$1
		endMove $8080
		setFacing $0,1
		setFacing $7,1
		setFacing $1F,1
		nextSingleText $0,$B    ; "But soldiers in the Caravan{N}cannot enter battle 'cause{N}they've been miniaturized.{W1}"
		nextSingleText $0,$7    ; "We'll just have to see.{W1}"
		setFacing $0,0
		setFacing $7,2
		setFacing $1F,2
		nextSingleText $0,$7    ; "Humph.  I don't like this guy.{W1}"
		moveEntity $B,$FF,$1,$1
		endMove $8080
		setFacing $B,3
		csWait 20
		setActscript $B,$FF,eas_Jump
		setActscript $B,$FF,eas_Jump
		setFacing $0,1
		setFacing $7,1
		setFacing $1F,1
		nextSingleText $0,$B    ; "I wonder what adventures{N}we'll find with this Caravan!{W1}"
		csWait 30
		moveEntity $B,$0,$1,$1
		endMove $8080
		csWait 3
		setActscript $B,$0,eas_452BA
		csWait 3
		csWait 60
		startEntity $80
		setPos $B,63,63,3
		csWait 60
		setActscript $80,$FF,eas_Init
		moveEntity $80,$0,$3,$9
		endMove $8080
		csWait 30
		setFacing $0,0
		setFacing $7,2
		setFacing $1F,2
		csWait 10
		setFacing $0,3
		setFacing $7,3
		setFacing $1F,3
		csWait 180
		setF $41                ; Caravan is unlocked (0x4428A..0x44337, 0x44338..0x44403)
		clearF $54              ; Rohde is a follower
		csc_end
ce_4B6BE:       dc.w $C
		dc.w 9
		dc.w 1
		dc.b $C
		dc.b 5
		dc.b 3
		dc.b $3E
		dc.l eas_Init           
		dc.w $FFFF
