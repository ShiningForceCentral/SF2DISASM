
; ASM FILE data\battles\entries\battle42\cs_afterbattle.asm :
; 0x4EF04..0x4F358 : Cutscene after battle 42
abcs_battle42:  textCursor $C22
                loadMapFadeIn 59,8,13
                loadMapEntities ce_4F328
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setPos $7,15,15,LEFT
                setActscriptWait $1F,eas_Init
                setPos $1F,11,15,RIGHT
                setActscriptWait $1C,eas_Init
                setPos $1C,12,19,RIGHT
                jumpIfFlagClear $4C,cs_4EF5E; Zynk is a follower
                setActscriptWait $1A,eas_Init
                setPos $1A,63,62,DOWN
cs_4EF5E:       stopEntity $80
                customActscriptWait $80
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $1          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $80,eas_46172
                stopEntity $81
                customActscriptWait $81
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $1          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setPriority $1F,$0
                setPriority $1C,$0
                setPriority $80,$FFFF
                fadeInB
                cameraSpeed $30
                csWait 60
                shiver $80
                nextSingleText $C0,$80  ; "Auuugh...{W1}"
                setFacing $0,DOWN
                setFacing $7,DOWN
                setFacing $1F,DOWN
                shiver $80
                nextText $C0,$80        ; "I've never lost to anybody{N}but the gods.{W2}"
                nextSingleText $C0,$80  ; "I don't understand!{W1}"
                setFacing $80,UP
                nextSingleText $0,$1C   ; "Oh, King Galam...poor{N}King Galam....{W1}"
                shiver $81
                setFacing $7,LEFT
                setActscriptWait $7,eas_Jump
                nextSingleText $0,$7    ; "Princess Elis!{W1}"
                setFacing $0,UP
                setFacing $1F,RIGHT
                setFacing $1C,UP
                nextSingleText $C0,$81  ; "Zzzzz....{W1}"
                nextSingleText $0,$1F   ; "...she's waking up!{W1}"
                nextSingleText $C0,$81  ; "Zzzzz...(yawn)...{W1}"
                entityActions $1F
                 moveRight 1
                endActions
                entityActionsWait $1C
                 moveUp 1
                endActions
                nextSingleText $0,$1F   ; "Princess, princess!{W1}"
                csWait 50
                setActscriptWait $81,eas_Init
                setFacing $81,DOWN
                setSprite $81,MAPSPRITE_POSE6
                nextSingleText $C0,$81  ; "Wha...What?{W1}"
                setActscriptWait $1F,eas_Jump
                nextSingleText $0,$1F   ; "It's me!  Astral!{W1}"
                setFacing $81,LEFT
                nextSingleText $C0,$81  ; "Sir Astral?  Oh, what{N}happened?{W1}"
                setFacing $81,DOWN
                csWait 30
                setFacing $81,UP
                csWait 30
                setFacing $81,LEFT
                nextSingleText $C0,$81  ; "Who are they?{W1}"
                nextSingleText $0,$7    ; "Nice to meet you.{W1}"
                setFacing $81,UP
                setActscriptWait $7,eas_Jump
                nextSingleText $0,$7    ; "I'm {NAME;7}.  And this is{N}our leader.{W1}"
                entityActionsWait $7
                 moveDown 2
                 moveLeft 1
                endActions
                setFacing $81,DOWN
                setFacing $7,UP
                nextSingleText $0,$7    ; "{LEADER}, say something.{W1}"
                setSprite $81,MAPSPRITE_ELIS
                setFacing $81,DOWN
                startEntity $81
                nextSingleText $C0,$81  ; "Oh, it's you.{W1}"
                customActscriptWait $81
                 ac_setSpeed 24,24      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $81
                 moveDown 1
                endActions
                csWait 50
                nextSingleText $0,$0    ; "Ah...{W1}"
                csWait 50
                nextSingleText $C0,$81  ; "Er...ummm....{W1}"
                setPos $7,13,18,UP
                csWait 30
                setPos $7,14,16,LEFT
                csWait 30
                setPos $7,13,15,DOWN
                csWait 30
                setPos $7,14,17,LEFT
                setFacing $1F,DOWN
                nextSingleText $0,$1F   ; "{NAME;7}, don't bother them!{N}This is a private moment!{W1}"
                setQuake 2
                csWait 30
                setQuake 0
                csWait 5
                setActscript $1C,eas_461B6
                csWait 120
                setFacing $1C,DOWN
                setQuake 2
                entityActions $0
                 moveLeft 2
                endActions
                entityActionsWait $81
                 moveDown 1
                 moveLeft 1
                endActions
                csWait 5
                setActscript $0,eas_461E4
                entityActionsWait $7
                 moveRight 2
                endActions
                csWait 5
                setActscript $7,eas_461B6
                entityActionsWait $1F
                 moveRight 1
                endActions
                csWait 5
                setActscript $1F,eas_461B6
                csWait 120
                nextSingleText $0,$7    ; "An earthquake!{N}Deep below us....{W1}"
                nextSingleText $0,$1C   ; "Something is coming up{N}through the earth...{W1}"
                setFacing $1F,UP
                nextSingleText $0,$1F   ; "I almost forgot...about...{N}the other devil....{W1}"
                entityActions $0
                 moveUp 2
                 moveRight 1
                endActions
                entityActions $1C
                 moveUp 1
                 moveRight 1
                 moveUp 1
                endActions
                entityActions $7
                 moveUp 2
                 moveLeft 2
                endActions
                entityActions $81
                 moveUp 1
                endActions
                waitIdle $7
                setFacing $0,RIGHT
                setFacing $1F,LEFT
                nextSingleText $0,$0    ; "You mean...Zeon?{W1}"
                nod $1F
                setFacing $0,UP
                setFacing $7,UP
                setFacing $1F,UP
                setFacing $1C,UP
                setCamDest 8,3
                setQuake 3
                nextSingleText $0,$7    ; "Huh?{W1}"
                playSound SFX_BATTLEFIELD_DEATH
                setBlocks 12,39,7,4,10,3
                csWait 40
                nextSingleText $0,$1C   ; "Uh, oh.{W1}"
                playSound SFX_BATTLEFIELD_DEATH
                setBlocks 12,44,7,4,10,3
                csWait 40
                nextSingleText $0,$1F   ; "This doesn't look promising.{W1}"
                playSound SFX_BATTLEFIELD_DEATH
                setBlocks 12,49,7,4,10,3
                csWait 40
                nextSingleText $0,$81   ; "Eeeekkk!{W1}"
                csWait 40
                nextSingleText $0,$0    ; "Oh, no.{W1}"
                playSound SFX_DEMON_BREATH
                setQuake 4
                csWait 30
                playSound SFX_INTRO_LIGHTNING
                setBlocks 12,54,7,4,10,3
                flashScreenWhite $1E
                setPos $82,13,6,DOWN
                tintMap
                csWait 40
                setQuake 0
                playSound $FD
                csWait 90
                setCameraEntity $80
                customActscriptWait $80
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 110
                playSound MUSIC_ZEON_ATTACK
                setSprite $80,MAPSPRITE_EFFECT3
                setFacing $80,DOWN
                startEntity $80
                entityActionsWait $80
                 moveUp 13
                endActions
                animEntityFX $80,6
                setCameraEntity $FFFF
                csWait 50
                nextSingleText $C0,$82  ; "Gggggrrr...you destroyed my{N}minions!{W1}"
                nextSingleText $0,$1F   ; "Zeon!{W1}"
                nextText $C0,$82        ; "You resisted me....{W2}"
                nextSingleText $C0,$82  ; "I...I never...!{W1}"
                setFacing $81,DOWN
                stopEntity $81
                customActscriptWait $81
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $1          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setQuake 3
                playSound SFX_INTRO_LIGHTNING
                flashScreenWhite $1E
                tintMap
                setQuake 0
                csWait 50
                setCamDest 8,12
                setFacing $1F,LEFT
                nextSingleText $0,$1F   ; "{LEADER}, we had better{N}run away and return later.{W1}"
                setFacing $7,LEFT
                nextSingleText $0,$7    ; "Sir Astral, we can't!{W1}"
                setFacing $1F,RIGHT
                nextSingleText $0,$1F   ; "Why not?{W1}"
                nextSingleText $0,$7    ; "Princess Elis fainted when{N}she saw Zeon.{W1}"
                setFacing $1F,DOWN
                setFacing $1C,LEFT
                setActscriptWait $1F,eas_Jump
                nextSingleText $0,$1F   ; "What?  Oh, my.{W1}"
                setFacing $0,DOWN
                setActscriptWait $0,eas_Jump
                entityActionsWait $1C
                 moveDown 1
                endActions
                setFacing $1C,RIGHT
                csWait 30
                setFacing $1C,DOWN
                csWait 30
                setFacing $1C,LEFT
                csWait 30
                setFacing $1C,DOWN
                csWait 30
                nextSingleText $0,$1C   ; "And now we're surrounded{N}by devils.{W1}"
                csWait 5
                setActscript $7,eas_461B6
                setFacing $1F,LEFT
                csWait 40
                setFacing $1F,UP
                nextText $0,$1F         ; "{LEADER}, believe in your{N}sword and the jewel!{N}We must fight Zeon now!{W1}"
                nextSingleText $0,$1F   ; "Let's go!{W1}"
                setFacing $0,UP
                setFacing $7,UP
                nod $0
                setStoryFlag $2B        ; Battle 43 unlocked
                csc_end
ce_4F328:       mainEntity 13,17,UP
                entity 15,15,LEFT,MAPSPRITE_CHESTER_SPECIAL,eas_Init
                entity 12,19,RIGHT,MAPSPRITE_RICK_PROMO,eas_Init
                entity 13,19,DOWN,MAPSPRITE_GALAM_EVIL,eas_Init
                entity 13,15,DOWN,MAPSPRITE_ELIS,eas_Init
                entity 62,62,DOWN,MAPSPRITE_ZEON,eas_Init
                dc.w $FFFF
