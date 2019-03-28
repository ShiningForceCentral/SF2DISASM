
; ASM FILE data\maps\entries\map59\mapsetups\s6_initfunction_21F.asm :
; 0x615D8..0x626A6 : 

; =============== S U B R O U T I N E =======================================

ms_map59_flag21F_InitFunction:
                
                 
                chkFlg  $21F            ; Battle 43 completed
                beq.s   return_615E4
                script  cs_615E6
return_615E4:
                
                rts

	; End of function ms_map59_flag21F_InitFunction

cs_615E6:       textCursor $EB0
                setCameraEntity $FFFF
                reloadMap 9,6
                setPos $0,12,11,UP
                setPriority $0,$0
                setPriority $80,$FFFF
                setBlocks 12,39,7,4,10,3
                setActscriptWait $82,eas_46172
                setActscriptWait $80,eas_46172
                setActscriptWait $83,eas_46172
                setActscriptWait $0,eas_Init
                setActscript $81,eas_Transparent
                customActscriptWait $86
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $3          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $86,eas_46172
                entityActions $86
                 moveDown 1
                endActions
                csWait 2
                setActscriptWait $86,eas_461AA
                csWait 5
                fadeInB
                csWait 40
                nextText $80,$86        ; "Where am I?{N}What's going on?{W2}"
                nextSingleText $80,$86  ; "I...can't...sit up.{W1}"
                shiver $86
                nextSingleText $80,$86  ; "{NAME;28}, is that you?{N}{NAME;28}, what happened?{W1}"
                nextSingleText $0,$1C   ; "King...King Galam...{W1}"
                entityActionsWait $1C
                 moveUp 1
                 faceRight 40
                endActions
                setFacing $1C,DOWN
                setSprite $1C,MAPSPRITE_EFFECT5
                csWait 20
                nextSingleText $0,$1C   ; "I don't know what to say.{W1}"
                nextText $80,$86        ; "I can't see very well.{N}Am I dying?{W2}"
                nextSingleText $80,$86  ; "I don't want to die!{N}{NAME;28}, tell me why.{W1}"
                shiver $86
                csWait 30
                shiver $1C
                csWait 30
                entityActionsWait $84
                 moveRight 2
                 moveUp 4
                endActions
                nextSingleText $0,$84   ; "Poor King Galam.{N}You were possessed by a{N}devil.{W1}"
                shiver $86
                nextText $80,$86        ; "A devil?  I don't understand.{W2}"
                nextSingleText $80,$86  ; "Are you...Elis, Princess{N}of Granseal?{W1}"
                nod $84
                nextSingleText $0,$84   ; "Yes.{W1}"
                nextSingleText $80,$86  ; "I have not seen you for a{N}while.  Let me see your face.{W2}"
                nod $84
                entityActionsWait $84
                 moveUp 1
                 moveRight 1
                 moveUp 1
                 faceLeft 10
                endActions
                stopEntity $84
                setSprite $84,MAPSPRITE_POSE4
                nextSingleText $80,$84  ; "Can you see me now?{N}King Galam?{W1}"
                shiver $86
                setActscriptWait $86,eas_Init
                setActscriptWait $86,eas_Jump
                startEntity $86
                startEntity $84
                setSprite $84,MAPSPRITE_ELIS
                setFacing $84,DOWN
                setFacing $86,DOWN
                setActscriptWait $86,eas_46172
                customActscriptWait $86
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $86
                 moveRight 1
                endActions
                csWait 5
                setActscriptWait $86,eas_461AA
                entityActions $86
                 moveUp 1
                endActions
                csWait 2
                setActscriptWait $86,eas_461AA
                nextSingleText $FF,$FF  ; "King Galam grabbed Elis'{N}arms!{W1}"
                setActscriptWait $84,eas_46172
                customActscriptWait $86
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $84
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setSprite $1C,ALLY_LEMON
                setFacing $1C,RIGHT
                setCamDest 7,5
                entityActions $84
                 moveUp 1
                 moveLeft 1
                endActions
                entityActionsWait $86
                 moveUp 1
                 moveLeft 1
                endActions
                setActscript $0,eas_Jump
                setActscript $7,eas_Jump
                setActscript $85,eas_Jump
                setActscriptWait $1C,eas_Jump
                setActscript $0,eas_Jump
                setActscript $7,eas_Jump
                setActscript $85,eas_Jump
                setActscriptWait $1C,eas_Jump
                csWait 20
                entityActionsWait $1C
                 moveUp 1
                 faceRight 1
                endActions
                nextText $0,$1C         ; "What are you doing?{W2}"
                nextSingleText $0,$1C   ; "King Galam!{N}You're standing?!{W1}"
                setFacing $86,LEFT
                nextSingleText $80,$86  ; "Ha, ha, ha!{N}Galam?{W1}"
                flashScreenWhite $4
                csWait 10
                flashScreenWhite $4
                csWait 10
                flashScreenWhite $4
                csWait 10
                setActscriptWait $86,eas_Init
                setSprite $86,MAPSPRITE_GALAM_ZEON
                shiver $86
                playSound MUSIC_ZEON_ATTACK
                nextSingleText $80,$86  ; "I'm not Galam, you fools!{W1}"
                setActscript $84,eas_Jump
                setActscript $0,eas_Jump
                setActscript $7,eas_Jump
                setActscript $85,eas_Jump
                setActscriptWait $1C,eas_Jump
                setActscript $84,eas_Jump
                setActscript $0,eas_Jump
                setActscript $7,eas_Jump
                setActscript $85,eas_Jump
                setActscriptWait $1C,eas_Jump
                setActscriptWait $84,eas_46172
                setActscript $84,eas_AnimSpeedx2
                nextSingleText $80,$7   ; "Zeon!{W1}"
                setActscriptWait $1C,eas_46172
                customActscriptWait $1C
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $1C
                 moveLeft 1
                endActions
                nextSingleText $0,$1C   ; "How?!{N}You died!{W1}"
                nextText $80,$86        ; "Never!{N}You don't know anything{N}about me!{W2}"
                nextText $80,$86        ; "I can't be killed by the{N}sword.{W2}"
                setFacing $86,DOWN
                shiver $86
                nextSingleText $80,$86  ; "All you can do is weaken me.{W1}"
                csWait 20
                shiver $85
                nextText $80,$85        ; "Yes, Mitula told us to{N}weaken him!{W2}"
                nextSingleText $80,$85  ; "I should have remembered{N}that before Elis was{N}captured!{W1}"
                nextSingleText $0,$1C   ; "Y...you fiend!{W1}"
                setActscriptWait $1C,eas_Init
                customActscriptWait $1C
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $1C
                 moveRight 1
                endActions
                setFacing $86,LEFT
                nextSingleText $80,$86  ; "Stop!  Do you want me to kill{N}Elis?!{W1}"
                shiver $1C
                nextSingleText $0,$1C   ; "Scoundrel!{N}We have to save her!{W1}"
                setCamDest 8,5
                csWait 30
                setFacing $86,DOWN
                nextSingleText $0,$86   ; "{LEADER}!  Phoenix!{N}Come here!{W1}"
                csWait 20
                setFacing $7,LEFT
                setFacing $0,RIGHT
                csWait 20
                nextSingleText $80,$7   ; "Well, {LEADER}.{N}What should we do?{W1}"
                nextText $0,$86         ; "Quickly!  My time is short,{N}but I can still choke her!{W2}"
                nextSingleText $0,$86   ; "Get over here, NOW!{W1}"
                csWait 20
                nextSingleText $80,$7   ; "We have no choice....{W1}"
                nod $0
                nextSingleText $FF,$FF  ; "{LEADER} nods hopelessly.{W1}"
                setFacing $7,UP
                setFacing $0,UP
                csWait 30
                customActscriptWait $0
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $7
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $0
                 moveUp 1
                endActions
                entityActionsWait $7
                 moveUp 1
                endActions
                nextText $0,$86         ; "That's far enough.{N}Now, phoenix.{W2}"
                nextSingleText $0,$86   ; "Take the Jewel of Evil{N}from {LEADER}!{W1}"
                csWait 20
                setFacing $7,LEFT
                csWait 50
                setFacing $7,UP
                csWait 30
                nextSingleText $80,$7   ; "But, we can't remove it.{W1}"
                setActscriptWait $86,eas_Jump
                setActscriptWait $86,eas_Jump
                nextSingleText $0,$86   ; "Shut up!  Do it!{W1}"
                nextSingleText $80,$7   ; "But...{W1}"
                csWait 30
                setFacing $7,LEFT
                setFacing $0,RIGHT
                csWait 20
                entityActionsWait $0
                 moveRight 1
                endActions
                csWait 30
                customActscriptWait $7
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $7
                 moveLeft 1
                endActions
                csWait 15
                setActscriptWait $7,eas_461AA
                nextSingleText $FF,$FF  ; "{NAME;7} tugs at the{N}jewel.{W1}"
                csWait 20
                nextSingleText $80,$7   ; "Nope.  Let me try this.{W1}"
                shiver $7
                nextSingleText $FF,$FF  ; "{NAME;7} removed the{N}jewel from {LEADER}'s neck.{W1}"
                setActscriptWait $7,eas_46172
                entityActions $7
                 moveRight 1
                endActions
                csWait 15
                setActscriptWait $7,eas_461AA
                nextSingleText $80,$7   ; "Oh, my!{W1}"
                csWait 30
                setFacing $7,UP
                setFacing $0,UP
                nextSingleText $80,$7   ; "What should I do with it?{W1}"
                csWait 20
                setFacing $86,RIGHT
                nextSingleText $0,$86   ; "Put it in front of me.{W1}"
                csWait 20
                nod $7
                nextSingleText $80,$7   ; "OK....{W1}"
                entityActionsWait $7
                 moveUp 2
                 faceLeft 1
                endActions
                setFacing $86,RIGHT
                csWait 20
                nod $7
                csWait 20
                nextSingleText $FF,$FF  ; "{NAME;7} put the jewel on{N}the ground.{W1}"
                entityActionsWait $7
                 moveRight 2
                endActions
                nextSingleText $0,$86   ; "Excellent!{N}Finally, I have it back!{W1}"
                setActscriptWait $86,eas_46172
                customActscriptWait $86
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $86
                 moveRight 1
                endActions
                entityActionsWait $84
                 moveRight 1
                endActions
                setFacing $86,DOWN
                csWait 30
                nod $86
                nextSingleText $FF,$FF  ; "Zeon picks up the jewel.{W1}"
                csWait 40
                playSound SFX_SPELL_CAST
                entityFlashWhite $86,$14
                csWait 20
                playSound SFX_SPELL_CAST
                entityFlashWhite $86,$14
                csWait 20
                playSound SFX_SPELL_CAST
                entityFlashWhite $86,$14
                csWait 20
                nextSingleText $0,$86   ; "Oh...oh...I feel my powers{N}returning!{W1}"
                setFacing $85,UP
                shiver $85
                nextText $80,$85        ; "Zeon is reviving.{N}We have to stop him!{W2}"
                nextSingleText $80,$85  ; "How?  Mitula!  Volcanon!{N}Tell me!{W1}"
                shiver $85
                nextSingleText $0,$86   ; "Ha, ha!  Astral!{N}I'll have revived fully in a{N}few minutes.{W1}"
                shiver $85
                nextSingleText $0,$86   ; "You did a good job, Elis.{N}You may take a rest now.{W1}"
                nextSingleText $80,$84  ; "A rest?  Wha...{W1}"
                nextSingleText $FF,$FF  ; "A black cloud envelopes{N}Elis.{W1}"
                setPos $83,14,8,LEFT
                csWait 50
                nextSingleText $80,$84  ; "Ohhh....{W1}"
                csWait 20
                stopEntity $84
                customActscriptWait $83
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $83
                 moveDown 1
                endActions
                entityActionsWait $84
                 moveDown 1
                endActions
                setFacing $84,UP
                customActscriptWait $84
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $2          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 20
                hide $83
                entityActionsWait $1C
                 moveRight 1
                endActions
                nextSingleText $0,$1C   ; "Princess!{W1}"
                setFacing $86,LEFT
                nextSingleText $0,$86   ; "And you too {NAME;28}.{N}So long!{W1}"
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                csWait 20
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                csWait 20
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                csWait 20
                playSound SFX_BIG_DOOR_RUMBLE
                setPos $82,12,8,LEFT
                animEntityFX $82,5
                setFacing $1C,DOWN
                nextSingleText $0,$1C   ; "Aauugghhh!{N}I'm burning!{W1}"
                customActscriptWait $1C
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $82
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $82
                 moveDown 2
                endActions
                entityActionsWait $1C
                 moveDown 2
                endActions
                setFacing $1C,DOWN
                customActscriptWait $1C
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $2          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setFacing $0,LEFT
                setFacing $85,LEFT
                nextSingleText $0,$86   ; "That is special fire.{N}It burns even vampires!{W1}"
                shiver $86
                csWait 20
                setFacing $0,UP
                setFacing $85,UP
                nextSingleText $80,$7   ; "NO!{W1}"
                setActscriptWait $7,eas_Init
                setActscriptWait $85,eas_Init
                entityActions $7
                 moveLeft 1
                endActions
                entityActionsWait $85
                 moveUp 1
                endActions
                setFacing $85,LEFT
                setFacing $86,RIGHT
                customActscriptWait $7
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $85
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $7,eas_46172
                setActscriptWait $85,eas_46172
                setActscript $86,eas_BumpRight
                entityFlashWhite $86,$28
                playSound SFX_BLAST_SPELL
                setCameraEntity $7
                entityActions $7
                 moveRight 4
                endActions
                entityActions $85
                 moveDownRight 4
                endActions
                playSound SFX_FALLING
                waitIdle $85
                playSound SFX_LIGHTNING_2
                setQuake 4
                setDest $86,13,8
                setFacing $7,LEFT
                customActscriptWait $7
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $3          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setFacing $85,UP
                customActscriptWait $85
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $2          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 30
                setQuake 0
                customActscriptWait $0
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setCameraEntity $0
                entityActionsWait $0
                 moveUp 1
                endActions
                setActscriptWait $0,eas_BumpUp
                nextSingleText $FF,$FF  ; "{LEADER} slapped the jewel{N}out of Zeon's hand.{W1}"
                playSound $FD
                setPos $81,14,8,DOWN
                setActscriptWait $81,eas_46172
                entityActions $81
                 moveRight 2
                endActions
                setFacing $86,DOWN
                headshake $86
                nextSingleText $0,$86   ; "Ouch, darn you {LEADER}!{W1}"
                customActscriptWait $0
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $0,eas_46172
                setActscript $86,eas_BumpDown
                entityFlashWhite $86,$A
                playSound SFX_BLAST_SPELL
                entityActions $0
                 moveDown 5
                endActions
                playSound SFX_FALLING
                entityFlashWhite $86,$28
                waitIdle $0
                playSound SFX_LIGHTNING_2
                setQuake 4
                setFacing $0,UP
                customActscriptWait $0
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $2          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 30
                setQuake 0
                csWait 30
                nextSingleText $0,$0    ; "Ohhh....{W1}"
                shiver $0
                nextSingleText $FF,$FF  ; "{LEADER} is stunned.{W1}"
                setCamDest 10,4
                setFacing $86,DOWN
                stopEntity $86
                csWait 5
                setActscript $86,eas_461B6
                csWait 60
                startEntity $86
                nextSingleText $80,$86  ; "That's what you get!{W1}"
                csWait 30
                setFacing $86,RIGHT
                csWait 30
                customActscriptWait $86
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $86
                 moveRight 1
                endActions
                setCamDest 10,6
                setPos $80,13,14,DOWN
                animEntityFX $80,7
                csWait 30
                customActscriptWait $80
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $80
                 moveUp 3
                 moveUpLeft 1
                endActions
                csWait 30
                playSound SFX_PRISM_LASER_FIRING
                setPos $82,63,63,LEFT
                animEntityFX $80,6
                playSound MUSIC_FINAL_BATTLE
                shiver $1C
                csWait 20
                shiver $1C
                csWait 20
                setActscriptWait $1C,eas_Init
                startEntity $1C
                setFacing $1C,DOWN
                csWait 30
                nextSingleText $0,$1C   ; "Groovy!{W1}"
                customActscriptWait $1C
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $1C
                 moveUp 1
                endActions
                shiver $85
                nextSingleText $80,$85  ; "{NAME;28}...{W1}"
                entityActionsWait $1C
                 moveUp 1
                 faceRight 1
                endActions
                shiver $86
                setCamDest 8,3
                nextSingleText $80,$86  ; "What?  How?{W1}"
                setFacing $86,LEFT
                csWait 30
                nextSingleText $80,$86  ; "{NAME;28}...leave, now!{W1}"
                nextText $0,$1C         ; "King Galam...{W2}"
                nextSingleText $0,$1C   ; "Please stop!{W1}"
                nextSingleText $80,$86  ; "Get away!{W1}"
                nextSingleText $0,$1C   ; "I'll go, but I'll take you{N}with me to another dimension.{W1}"
                entityActionsWait $1C
                 moveRight 1
                endActions
                nextSingleText $80,$86  ; "Die!{W1}"
                setActscriptWait $1C,eas_46172
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                csWait 20
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                csWait 20
                entityActions $1C
                 moveLeft 3
                endActions
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                csWait 20
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                csWait 20
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                csWait 20
                waitIdle $1C
                csWait 20
                playSound SFX_BIG_DOOR_RUMBLE
                setPos $82,10,8,LEFT
                animEntityFX $82,5
                setCamDest 8,6
                setPos $80,13,14,DOWN
                animEntityFX $80,7
                csWait 30
                customActscriptWait $80
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $80
                 moveUp 3
                 moveUpLeft 3
                endActions
                csWait 30
                playSound SFX_PRISM_LASER_FIRING
                setPos $82,63,63,LEFT
                animEntityFX $80,6
                csWait 40
                setCamDest 8,3
                nextSingleText $0,$1C   ; "King...Galam...{W1}"
                entityActionsWait $1C
                 moveRight 1
                endActions
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                csWait 10
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                csWait 10
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                csWait 10
                entityActionsWait $1C
                 moveLeft 1
                endActions
                csWait 50
                entityActionsWait $1C
                 moveRight 2
                endActions
                shiver $86
                csWait 20
                nextText $80,$86        ; "How?  It's not possible!{W2}"
                nextText $80,$86        ; "You can't still be alive!{W2}"
                setFacing $86,DOWN
                headshake $86
                setFacing $86,RIGHT
                nextSingleText $80,$86  ; "Oh, my powers are fading.{N}Where's the jewel?!{W1}"
                shiver $86
                nextSingleText $0,$1C   ; "My King...come with me....{W1}"
                entityActionsWait $1C
                 moveRight 1
                endActions
                entityActions $1C
                 moveRight 1
                endActions
                csWait 25
                setActscriptWait $1C,eas_461AA
                nextSingleText $80,$86  ; "No, I'll never go back to{N}such a terrible...{W1}"
                headshake $86
                setActscriptWait $86,eas_46172
                customActscriptWait $86
                 ac_setSpeed 5,5        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $1C
                 ac_setSpeed 5,5        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $86
                 moveLeft 1
                endActions
                entityActions $1C
                 moveLeft 1
                endActions
                headshake $86
                headshake $86
                waitIdle $86
                nextSingleText $80,$86  ; "I shall return!{N}Remember!{W1}"
                setActscriptWait $1C,eas_46172
                setActscriptWait $86,eas_46172
                setFacing $86,DOWN
                setFacing $1C,DOWN
                setPriority $86,$FFFF
                setPriority $1C,$0
                entityActions $1C
                 moveUpRight 1
                endActions
                csWait 8
                setActscriptWait $1C,eas_461AA
                entityActions $86
                 moveUp 3
                endActions
                entityActions $1C
                 moveUp 3
                endActions
                headshake $86
                headshake $86
                headshake $86
                headshake $86
                headshake $86
                headshake $86
                waitIdle $86
                headshake $86
                playSound SFX_FALLING
                setActscript $86,eas_463AE
                setActscriptWait $1C,eas_463AE
                nextSingleText $80,$86  ; "Noooooooooo!{W1}"
                csWait 30
                setQuake 2
                playSound SFX_BLAST_SPELL
                flashScreenWhite $14
                playSound SFX_BLAST_SPELL
                flashScreenWhite $14
                playSound SFX_BLAST_SPELL
                flashScreenWhite $14
                setBlocks 20,39,7,4,10,3
                playSound SFX_BLAST_SPELL
                flashScreenWhite $14
                playSound SFX_BLAST_SPELL
                flashScreenWhite $14
                setQuake 0
                csWait 60
                playSound $FD
                setCameraEntity $7
                csWait 60
                setActscriptWait $7,eas_Init
                startEntity $7
                setFacing $7,DOWN
                headshake $7
                csWait 60
                setFacing $7,LEFT
                csWait 20
                nextSingleText $80,$7   ; "{NAME;28} has taken Zeon{N}away.{W1}"
                playSound MUSIC_SAD_THEME_3
                setCameraEntity $85
                csWait 30
                setActscriptWait $85,eas_Init
                startEntity $85
                setFacing $85,DOWN
                headshake $85
                csWait 30
                entityActionsWait $85
                 moveRight 1
                 faceUp 1
                endActions
                setFacing $7,DOWN
                nextText $80,$85        ; "It's over.{W2}"
                nextSingleText $80,$85  ; "But, what a tragic ending.{W1}"
                nod $7
                csWait 40
                setActscriptWait $7,eas_Jump
                setActscriptWait $7,eas_Jump
                nextSingleText $80,$7   ; "{LEADER}?  Is he OK?{W1}"
                setCameraEntity $7
                entityActionsWait $7
                 moveRight 1
                 moveDown 4
                endActions
                entityActions $85
                 moveDown 4
                 moveLeft 7
                endActions
                entityActionsWait $7
                 moveDown 5
                 moveLeft 6
                endActions
                setFacing $85,UP
                setFacing $7,UP
                csWait 40
                setActscriptWait $0,eas_Init
                startEntity $0
                setFacing $0,DOWN
                headshake $0
                csWait 30
                nextSingleText $80,$7   ; "{LEADER},  Zeon was{N}taken away by {NAME;28}.{W1}"
                nod $0
                nextSingleText $FF,$FF  ; "{LEADER} nods.{W1}"
                csWait 40
                shiver $85
                nextSingleText $80,$85  ; "Oh, is she...is Princess{N}Elis OK?{W1}"
                entityActions $85
                 moveUp 2
                endActions
                entityActionsWait $7
                 moveLeft 1
                 moveUp 1
                endActions
                setFacing $0,UP
                setCamDest 8,5
                entityActions $0
                 moveUp 5
                 faceRight 1
                endActions
                entityActions $85
                 moveUp 5
                 moveRight 2
                 moveUp 1
                 faceLeft 1
                endActions
                entityActionsWait $7
                 moveUp 6
                 moveRight 1
                 faceUp 1
                endActions
                csWait 20
                setPriority $7,$FFFF
                setPriority $84,$0
                setActscriptWait $7,eas_BumpUp
                setActscriptWait $7,eas_BumpUp
                nextSingleText $80,$7   ; "Princess!{W1}"
                nextSingleText $FF,$FF  ; "{NAME;7} shakes her{N}wildly.{W1}"
                csWait 10
                showPortrait $8084
                executeSubroutine csub_6269C
                nextSingleText $80,$84  ; "Elis does not respond.{W1}"
                shiver $7
                nextSingleText $80,$7   ; "She's so cold, and looks so{N}pale.{W2}"
                entityActionsWait $7
                 moveRight 1
                 faceUp 1
                endActions
                nextSingleText $80,$7   ; "Sir Astral, is she dead?{W1}"
                setFacing $85,DOWN
                headshake $85
                nextSingleText $80,$85  ; "I don't think so.{N}Let me see her.{W1}"
                setFacing $85,LEFT
                csWait 30
                customActscriptWait $85
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $85,eas_46172
                entityActions $85
                 moveLeft 1
                endActions
                csWait 16
                setActscriptWait $85,eas_461AA
                csWait 40
                nextSingleText $FF,$FF  ; "Astral examines Elis.{W1}"
                csWait 40
                entityActions $85
                 moveRight 1
                endActions
                csWait 16
                setActscriptWait $85,eas_461AA
                setFacing $85,DOWN
                nextText $80,$85        ; "No. She's cold, but she's{N}breathing.{W2}"
                nextSingleText $80,$85  ; "I don't understand....{W1}"
                csWait 50
                playSound $FD
                nextSingleText $0,$87   ; "She's in a coma.{W1}"
                csWait 5
                setActscript $0,eas_461B6
                csWait 5
                setActscript $85,eas_461B6
                csWait 5
                setActscript $7,eas_461E4
                csWait 120
                setFacing $0,UP
                setFacing $85,UP
                setFacing $7,UP
                playSound MUSIC_MITULA
                setPos $87,13,7,DOWN
                playSound SFX_PRISM_LASER_FIRING
                entityFlashWhite $87,$46
                setActscript $0,eas_Jump
                setActscript $85,eas_Jump
                setActscriptWait $7,eas_Jump
                setActscript $0,eas_Jump
                setActscript $85,eas_Jump
                setActscriptWait $7,eas_Jump
                csWait 20
                entityActionsWait $85
                 moveUp 1
                endActions
                setFacing $85,LEFT
                nextSingleText $80,$85  ; "Goddess Mitula...?{W1}"
                setCamDest 8,4
                nod $87
                nextSingleText $0,$87   ; "Hello, Astral.{N}{LEADER} and {NAME;7},{N}you did very well.{W1}"
                entityActionsWait $7
                 moveUp 1
                endActions
                nextSingleText $0,$7    ; "Mitula!  I knew you would{N}come.{W1}"
                shiver $87
                nextSingleText $0,$87   ; "We've been watching.{W1}"
                setActscriptWait $7,eas_Jump
                setActscriptWait $7,eas_Jump
                nextSingleText $80,$7   ; "We?  I don't see anybody{N}else?{W1}"
                csWait 5
                setActscript $7,eas_461B6
                csWait 80
                nextSingleText $0,$87   ; "C'mon, {NAME;7}.{N}You know what I mean.{W1}"
                setFacing $7,UP
                nextSingleText $80,$7   ; "Volcanon?{W1}"
                setActscriptWait $7,eas_46172
                customActscriptWait $7
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $7
                 moveDown 1
                endActions
                shiver $7
                csWait 30
                nextSingleText $0,$87   ; "Yes.  He helped you many{N}times.{W1}"
                setActscriptWait $7,eas_Init
                entityActionsWait $7
                 moveLeft 3
                 moveUp 3
                 faceRight 1
                endActions
                setCamDest 8,3
                nextSingleText $80,$7   ; "When?{W1}"
                setFacing $87,LEFT
                nextText $80,$87        ; "You doubt me?{W2}"
                nextSingleText $80,$87  ; "How about {NAME;28}?{N}God Volcanon protected him{N}from the fire.{W1}"
                setActscriptWait $7,eas_Jump
                setActscriptWait $7,eas_Jump
                nextSingleText $0,$7    ; "Really?  But he said, he{N}would forsake the people{N}of the earth.{W1}"
                nextText $80,$87        ; "He said that to deceive the{N}devils.{W2}"
                nextText $80,$87        ; "If he had joined you at{N}that time, Zeon would've{N}come to Parmecia.{W2}"
                nextText $80,$87        ; "The entire continent might{N}have been destroyed.{W2}"
                nextSingleText $80,$87  ; "And if Volcanon had joined{N}you, you would've leaned{N}on him, wouldn't you have?{W1}"
                csWait 20
                nextText $80,$85        ; "The Jewel of Light was made{N}by him, wasn't it?{W2}"
                setFacing $0,RIGHT
                setFacing $87,RIGHT
                setActscriptWait $85,eas_Init
                entityActionsWait $85
                 moveLeft 1
                 moveUp 1
                 faceLeft 1
                endActions
                setFacing $0,UP
                nextSingleText $80,$85  ; "It protected {NAME;28}, right?{W1}"
                csWait 20
                setFacing $87,DOWN
                csWait 30
                shiver $87
                nextSingleText $0,$87   ; "You're very smart, Astral.{W1}"
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 1
                csWait 90
                setQuake 0
                csWait 20
                nextText $0,$87         ; "I have to go now.{W2}"
                nextSingleText $0,$87   ; "I need the Jewel of Light.{W1}"
                entityActionsWait $87
                 moveDown 1
                endActions
                setFacing $85,DOWN
                setFacing $7,DOWN
                csWait 30
                setActscriptWait $87,eas_46172
                customActscriptWait $87
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $87
                 moveDown 1
                endActions
                csWait 16
                setActscriptWait $87,eas_461AA
                entityFlashWhite $87,$28
                entityActions $87
                 moveUp 1
                endActions
                csWait 16
                setActscriptWait $87,eas_461AA
                nextSingleText $FF,$FF  ; "Mitula took the Jewel of{N}Light from {LEADER}.{W1}"
                nod $87
                nextSingleText $0,$87   ; "And I need the Jewel of Evil.{W1}"
                setActscriptWait $87,eas_Init2
                csWait 10
                entityActionsWait $87
                 moveRight 3
                endActions
                setFacing $85,RIGHT
                setFacing $7,RIGHT
                setFacing $0,RIGHT
                csWait 30
                nod $87
                hide $81
                nextSingleText $FF,$FF  ; "Mitula took the Jewel{N}of Evil.{W1}"
                setFacing $87,LEFT
                csWait 20
                nextText $80,$87        ; "I have to seal Zeon before{N}he regains his power.{W2}"
                nextSingleText $80,$87  ; "You had better leave now.{N}Arc Valley will be destroyed.{W1}"
                setFacing $87,UP
                csWait 30
                entityFlashWhite $87,$3C
                nextSingleText $0,$85   ; "One more thing!{W1}"
                csWait 30
                setFacing $87,LEFT
                nextSingleText $80,$87  ; "Yes?{W1}"
                entityActionsWait $85
                 moveDown 1
                 faceRight 1
                endActions
                nextSingleText $0,$85   ; "How do we wake Elis up?{W1}"
                nextText $80,$87        ; "She has been poisoned.{W2}"
                nextSingleText $80,$87  ; "When the poison leaves her{N}body, her face will turn pink.{W1}"
                setFacing $85,DOWN
                csWait 20
                nod $85
                nextSingleText $0,$85   ; "Then she will awaken?{W1}"
                csWait 20
                setFacing $85,RIGHT
                nextText $80,$87        ; "If she's still sleeping, she{N}will need a kiss from her{N}true love.{W2}"
                nextSingleText $80,$87  ; "This kiss will awaken her.{W1}"
                shiver $85
                entityActionsWait $85
                 moveRight 1
                endActions
                nextSingleText $0,$85   ; "When will the poison leave?{W1}"
                headshake $87
                csWait 10
                nextText $80,$87        ; "I have no idea.  It depends{N}on her physical strength.{W2}"
                nextText $80,$87        ; "It may take a few months...{N}or a few years.{W2}"
                nextSingleText $80,$87  ; "Now, I must go.{N}Good luck.{W1}"
                setFacing $87,UP
                csWait 30
                entityFlashWhite $87,$64
                hide $87
                csWait 50
                playSound $FD
                entityActionsWait $7
                 moveRight 1
                endActions
                nextSingleText $0,$7    ; "She's gone.{W1}"
                customActscriptWait $85
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $85
                 moveLeft 1
                 faceDown 10
                endActions
                shiver $85
                nextSingleText $80,$85  ; "A few years....{W1}"
                entityActionsWait $7
                 moveRight 1
                 faceDown 1
                 jumpUp 1
                 jumpUp 10
                endActions
                nextText $0,$7          ; "Sir Astral, c'mon!{W2}"
                setFacing $85,UP
                nextSingleText $0,$7    ; "Mitula told us to leave.{W1}"
                shiver $85
                nextSingleText $80,$85  ; "Oh, yeah...let's get out of{N}here!{W1}"
                setActscriptWait $85,eas_Init
                entityActionsWait $85
                 moveLeft 1
                 faceDown 1
                endActions
                setFacing $0,UP
                nextSingleText $80,$85  ; "{LEADER}, you carry{N}Princess Elis!{W1}"
                setPriority $0,$0
                setPriority $84,$FFFF
                nod $0
                csWait 20
                entityActions $0
                 moveUp 1
                endActions
                csWait 2
                setActscriptWait $0,eas_461AA
                entityActionsWait $0
                 moveRight 1
                 faceDown 20
                endActions
                nod $0
                hide $84
                setFacing $0,DOWN
                setSprite $0,MAPSPRITE_POSE2
                csWait 30
                csWait 5
                setActscript $7,eas_461B6
                csWait 5
                setActscript $85,eas_461E4
                setQuake 32771
                playSound MUSIC_BOSS_ATTACK
                nextSingleText $0,$85   ; "Oops!  She's sealing the{N}tower!{W1}"
                entityActions $0
                 moveDown 1
                endActions
                csWait 2
                setActscriptWait $0,eas_461AA
                entityActionsWait $7
                 moveDown 1
                endActions
                nextSingleText $0,$7    ; "Hurry!{W1}"
                entityActionsWait $85
                 moveDown 1
                 faceRight 1
                endActions
                nextSingleText $0,$85   ; "{LEADER}, run!{W1}"
                setPriority $0,$FFFF
                followEntity $7,$0,$2
                followEntity $85,$7,$2
                setActscriptWait $0,eas_46172
                setCameraEntity $0
                entityActions $0
                 moveDown 1
                 moveLeft 1
                 moveDown 10
                endActions
                csWait 60
cs_62658:       setQuake 5
                csWait 50
                playSound $FD
                fadeOutB
                setQuake 0
                mapLoad 3,0,0
                resetMap
                fadeInB
                reloadMap 0,0
                textCursor $F44
                nextSingleText $FF,$FF  ; "Two years have passed{N}since Mitula resealed Zeon.{W1}"
                nextSingleText $0,$88   ; "Wow, is it true?{N}Did Elis' face turn pink?{W1}"
                clearF $180             ; Set after Bowie obtains the jewel of light/evil... whichever it is
                clearF $181             ; Set after Bowie obtains King Galam's jewel
                resetForceBattleStats
                warp $3,$38,$3,$3
                csc_end

; =============== S U B R O U T I N E =======================================

csub_6269C:
                
                moveq   #1,d0
                jsr     j_ClosePortraitEyes
                rts

	; End of function csub_6269C

