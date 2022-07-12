
; ASM FILE data\maps\entries\map59\mapsetups\s6_initfunction_543.asm :
; 0x615D8..0x626A6 : 

; =============== S U B R O U T I N E =======================================


ms_map59_flag543_InitFunction:
                
                 
                chkFlg  543             ; Battle 43 completed - BATTLE_VERSUS_ZEON                 
                beq.s   return_615E4
                script  cs_615E6
return_615E4:
                
                rts

    ; End of function ms_map59_flag543_InitFunction

cs_615E6:       textCursor 3760
                setCameraEntity 65535
                reloadMap 9,6
                setPos ALLY_BOWIE,12,11,UP
                setPriority ALLY_BOWIE,$0
                setPriority 128,$FFFF
                setBlocks 12,39,7,4,10,3
                setActscriptWait 130,eas_DeactivateAutoFacing
                setActscriptWait 128,eas_DeactivateAutoFacing
                setActscriptWait 131,eas_DeactivateAutoFacing
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscript 129,eas_Transparent
                customActscriptWait 134
                 ac_motion OFF          ;   
                 ac_orientRight         ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 134,eas_DeactivateAutoFacing
                entityActions 134
                 moveDown 1
                endActions
                csWait 2
                setActscriptWait 134,eas_StopMoving
                csWait 5
                fadeInB
                csWait 40
                nextText $80,134        ; "Where am I?{N}What's going on?{W2}"
                nextSingleText $80,134  ; "I...can't...sit up.{W1}"
                shiver 134
                nextSingleText $80,134  ; "{NAME;28}, is that you?{N}{NAME;28}, what happened?{W1}"
                nextSingleText $0,ALLY_LEMON ; "King...King Galam...{W1}"
                entityActionsWait ALLY_LEMON
                 moveUp 1
                 faceRight 40
                endActions
                setFacing ALLY_LEMON,DOWN
                setSprite ALLY_LEMON,MAPSPRITE_EFFECT5
                csWait 20
                nextSingleText $0,ALLY_LEMON ; "I don't know what to say.{W1}"
                nextText $80,134        ; "I can't see very well.{N}Am I dying?{W2}"
                nextSingleText $80,134  ; "I don't want to die!{N}{NAME;28}, tell me why.{W1}"
                shiver 134
                csWait 30
                shiver ALLY_LEMON
                csWait 30
                entityActionsWait 132
                 moveRight 2
                 moveUp 4
                endActions
                nextSingleText $0,132   ; "Poor King Galam.{N}You were possessed by a{N}devil.{W1}"
                shiver 134
                nextText $80,134        ; "A devil?  I don't understand.{W2}"
                nextSingleText $80,134  ; "Are you...Elis, Princess{N}of Granseal?{W1}"
                nod 132
                nextSingleText $0,132   ; "Yes.{W1}"
                nextSingleText $80,134  ; "I have not seen you for a{N}while.  Let me see your face.{W2}"
                nod 132
                entityActionsWait 132
                 moveUp 1
                 moveRight 1
                 moveUp 1
                 faceLeft 10
                endActions
                stopEntity 132
                setSprite 132,MAPSPRITE_POSE4
                nextSingleText $80,132  ; "Can you see me now?{N}King Galam?{W1}"
                shiver 134
                setActscriptWait 134,eas_Init
                setActscriptWait 134,eas_Jump
                startEntity 134
                startEntity 132
                setSprite 132,MAPSPRITE_ELIS
                setFacing 132,DOWN
                setFacing 134,DOWN
                setActscriptWait 134,eas_DeactivateAutoFacing
                customActscriptWait 134
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 134
                 moveRight 1
                endActions
                csWait 5
                setActscriptWait 134,eas_StopMoving
                entityActions 134
                 moveUp 1
                endActions
                csWait 2
                setActscriptWait 134,eas_StopMoving
                nextSingleText $FF,255  ; "King Galam grabbed Elis'{N}arms!{W1}"
                setActscriptWait 132,eas_DeactivateAutoFacing
                customActscriptWait 134
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 132
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setSprite ALLY_LEMON,ALLY_LEMON
                setFacing ALLY_LEMON,RIGHT
                setCamDest 7,5
                entityActions 132
                 moveUp 1
                 moveLeft 1
                endActions
                entityActionsWait 134
                 moveUp 1
                 moveLeft 1
                endActions
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscript 133,eas_Jump
                setActscriptWait ALLY_LEMON,eas_Jump
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscript 133,eas_Jump
                setActscriptWait ALLY_LEMON,eas_Jump
                csWait 20
                entityActionsWait ALLY_LEMON
                 moveUp 1
                 faceRight 1
                endActions
                nextText $0,ALLY_LEMON  ; "What are you doing?{W2}"
                nextSingleText $0,ALLY_LEMON ; "King Galam!{N}You're standing?!{W1}"
                setFacing 134,LEFT
                nextSingleText $80,134  ; "Ha, ha, ha!{N}Galam?{W1}"
                flashScreenWhite $4
                csWait 10
                flashScreenWhite $4
                csWait 10
                flashScreenWhite $4
                csWait 10
                setActscriptWait 134,eas_Init
                setSprite 134,MAPSPRITE_GALAM_ZEON
                shiver 134
                playSound MUSIC_ZEON_ATTACK
                nextSingleText $80,134  ; "I'm not Galam, you fools!{W1}"
                setActscript 132,eas_Jump
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscript 133,eas_Jump
                setActscriptWait ALLY_LEMON,eas_Jump
                setActscript 132,eas_Jump
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscript 133,eas_Jump
                setActscriptWait ALLY_LEMON,eas_Jump
                setActscriptWait 132,eas_DeactivateAutoFacing
                setActscript 132,eas_AnimSpeedx2
                nextSingleText $80,ALLY_PETER ; "Zeon!{W1}"
                setActscriptWait ALLY_LEMON,eas_DeactivateAutoFacing
                customActscriptWait ALLY_LEMON
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_LEMON
                 moveLeft 1
                endActions
                nextSingleText $0,ALLY_LEMON ; "How?!{N}You died!{W1}"
                nextText $80,134        ; "Never!{N}You don't know anything{N}about me!{W2}"
                nextText $80,134        ; "I can't be killed by the{N}sword.{W2}"
                setFacing 134,DOWN
                shiver 134
                nextSingleText $80,134  ; "All you can do is weaken me.{W1}"
                csWait 20
                shiver 133
                nextText $80,133        ; "Yes, Mitula told us to{N}weaken him!{W2}"
                nextSingleText $80,133  ; "I should have remembered{N}that before Elis was{N}captured!{W1}"
                nextSingleText $0,ALLY_LEMON ; "Y...you fiend!{W1}"
                setActscriptWait ALLY_LEMON,eas_Init
                customActscriptWait ALLY_LEMON
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_LEMON
                 moveRight 1
                endActions
                setFacing 134,LEFT
                nextSingleText $80,134  ; "Stop!  Do you want me to kill{N}Elis?!{W1}"
                shiver ALLY_LEMON
                nextSingleText $0,ALLY_LEMON ; "Scoundrel!{N}We have to save her!{W1}"
                setCamDest 8,5
                csWait 30
                setFacing 134,DOWN
                nextSingleText $0,134   ; "{LEADER}!  Phoenix!{N}Come here!{W1}"
                csWait 20
                setFacing ALLY_PETER,LEFT
                setFacing ALLY_BOWIE,RIGHT
                csWait 20
                nextSingleText $80,ALLY_PETER ; "Well, {LEADER}.{N}What should we do?{W1}"
                nextText $0,134         ; "Quickly!  My time is short,{N}but I can still choke her!{W2}"
                nextSingleText $0,134   ; "Get over here, NOW!{W1}"
                csWait 20
                nextSingleText $80,ALLY_PETER ; "We have no choice....{W1}"
                nod ALLY_BOWIE
                nextSingleText $FF,255  ; "{LEADER} nods hopelessly.{W1}"
                setFacing ALLY_PETER,UP
                setFacing ALLY_BOWIE,UP
                csWait 30
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait ALLY_PETER
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions ALLY_BOWIE
                 moveUp 1
                endActions
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                nextText $0,134         ; "That's far enough.{N}Now, phoenix.{W2}"
                nextSingleText $0,134   ; "Take the Jewel of Evil{N}from {LEADER}!{W1}"
                csWait 20
                setFacing ALLY_PETER,LEFT
                csWait 50
                setFacing ALLY_PETER,UP
                csWait 30
                nextSingleText $80,ALLY_PETER ; "But, we can't remove it.{W1}"
                setActscriptWait 134,eas_Jump
                setActscriptWait 134,eas_Jump
                nextSingleText $0,134   ; "Shut up!  Do it!{W1}"
                nextSingleText $80,ALLY_PETER ; "But...{W1}"
                csWait 30
                setFacing ALLY_PETER,LEFT
                setFacing ALLY_BOWIE,RIGHT
                csWait 20
                entityActionsWait ALLY_BOWIE
                 moveRight 1
                endActions
                csWait 30
                customActscriptWait ALLY_PETER
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions ALLY_PETER
                 moveLeft 1
                endActions
                csWait 15
                setActscriptWait ALLY_PETER,eas_StopMoving
                nextSingleText $FF,255  ; "{NAME;7} tugs at the{N}jewel.{W1}"
                csWait 20
                nextSingleText $80,ALLY_PETER ; "Nope.  Let me try this.{W1}"
                shiver ALLY_PETER
                nextSingleText $FF,255  ; "{NAME;7} removed the{N}jewel from {LEADER}'s neck.{W1}"
                setActscriptWait ALLY_PETER,eas_DeactivateAutoFacing
                entityActions ALLY_PETER
                 moveRight 1
                endActions
                csWait 15
                setActscriptWait ALLY_PETER,eas_StopMoving
                nextSingleText $80,ALLY_PETER ; "Oh, my!{W1}"
                csWait 30
                setFacing ALLY_PETER,UP
                setFacing ALLY_BOWIE,UP
                nextSingleText $80,ALLY_PETER ; "What should I do with it?{W1}"
                csWait 20
                setFacing 134,RIGHT
                nextSingleText $0,134   ; "Put it in front of me.{W1}"
                csWait 20
                nod ALLY_PETER
                nextSingleText $80,ALLY_PETER ; "OK....{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 2
                 faceLeft 1
                endActions
                setFacing 134,RIGHT
                csWait 20
                nod ALLY_PETER
                csWait 20
                nextSingleText $FF,255  ; "{NAME;7} put the jewel on{N}the ground.{W1}"
                entityActionsWait ALLY_PETER
                 moveRight 2
                endActions
                nextSingleText $0,134   ; "Excellent!{N}Finally, I have it back!{W1}"
                setActscriptWait 134,eas_DeactivateAutoFacing
                customActscriptWait 134
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 134
                 moveRight 1
                endActions
                entityActionsWait 132
                 moveRight 1
                endActions
                setFacing 134,DOWN
                csWait 30
                nod 134
                nextSingleText $FF,255  ; "Zeon picks up the jewel.{W1}"
                csWait 40
                playSound SFX_SPELL_CAST
                entityFlashWhite 134,$14
                csWait 20
                playSound SFX_SPELL_CAST
                entityFlashWhite 134,$14
                csWait 20
                playSound SFX_SPELL_CAST
                entityFlashWhite 134,$14
                csWait 20
                nextSingleText $0,134   ; "Oh...oh...I feel my powers{N}returning!{W1}"
                setFacing 133,UP
                shiver 133
                nextText $80,133        ; "Zeon is reviving.{N}We have to stop him!{W2}"
                nextSingleText $80,133  ; "How?  Mitula!  Volcanon!{N}Tell me!{W1}"
                shiver 133
                nextSingleText $0,134   ; "Ha, ha!  Astral!{N}I'll have revived fully in a{N}few minutes.{W1}"
                shiver 133
                nextSingleText $0,134   ; "You did a good job, Elis.{N}You may take a rest now.{W1}"
                nextSingleText $80,132  ; "A rest?  Wha...{W1}"
                nextSingleText $FF,255  ; "A black cloud envelopes{N}Elis.{W1}"
                setPos 131,14,8,LEFT
                csWait 50
                nextSingleText $80,132  ; "Ohhh....{W1}"
                csWait 20
                stopEntity 132
                customActscriptWait 131
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 131
                 moveDown 1
                endActions
                entityActionsWait 132
                 moveDown 1
                endActions
                setFacing 132,UP
                customActscriptWait 132
                 ac_motion OFF          ;   
                 ac_orientDown          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 20
                hide 131
                entityActionsWait ALLY_LEMON
                 moveRight 1
                endActions
                nextSingleText $0,ALLY_LEMON ; "Princess!{W1}"
                setFacing 134,LEFT
                nextSingleText $0,134   ; "And you too {NAME;28}.{N}So long!{W1}"
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
                setPos 130,12,8,LEFT
                animEntityFX 130,5
                setFacing ALLY_LEMON,DOWN
                nextSingleText $0,ALLY_LEMON ; "Aauugghhh!{N}I'm burning!{W1}"
                customActscriptWait ALLY_LEMON
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 130
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 130
                 moveDown 2
                endActions
                entityActionsWait ALLY_LEMON
                 moveDown 2
                endActions
                setFacing ALLY_LEMON,DOWN
                customActscriptWait ALLY_LEMON
                 ac_motion OFF          ;   
                 ac_orientDown          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setFacing ALLY_BOWIE,LEFT
                setFacing 133,LEFT
                nextSingleText $0,134   ; "That is special fire.{N}It burns even vampires!{W1}"
                shiver 134
                csWait 20
                setFacing ALLY_BOWIE,UP
                setFacing 133,UP
                nextSingleText $80,ALLY_PETER ; "NO!{W1}"
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait 133,eas_Init
                entityActions ALLY_PETER
                 moveLeft 1
                endActions
                entityActionsWait 133
                 moveUp 1
                endActions
                setFacing 133,LEFT
                setFacing 134,RIGHT
                customActscriptWait ALLY_PETER
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 133
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait ALLY_PETER,eas_DeactivateAutoFacing
                setActscriptWait 133,eas_DeactivateAutoFacing
                setActscript 134,eas_BumpRight
                entityFlashWhite 134,$28
                playSound SFX_BLAST_SPELL
                setCameraEntity ALLY_PETER
                entityActions ALLY_PETER
                 moveRight 4
                endActions
                entityActions 133
                 moveDownRight 4
                endActions
                playSound SFX_FALLING
                waitIdle 133
                playSound SFX_LIGHTNING_2
                setQuake 4
                setDest 134,13,8
                setFacing ALLY_PETER,LEFT
                customActscriptWait ALLY_PETER
                 ac_motion OFF          ;   
                 ac_orientRight         ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setFacing 133,UP
                customActscriptWait 133
                 ac_motion OFF          ;   
                 ac_orientDown          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 30
                setQuake 0
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setCameraEntity ALLY_BOWIE
                entityActionsWait ALLY_BOWIE
                 moveUp 1
                endActions
                setActscriptWait ALLY_BOWIE,eas_BumpUp
                nextSingleText $FF,255  ; "{LEADER} slapped the jewel{N}out of Zeon's hand.{W1}"
                playSound $FD
                setPos 129,14,8,DOWN
                setActscriptWait 129,eas_DeactivateAutoFacing
                entityActions 129
                 moveRight 2
                endActions
                setFacing 134,DOWN
                headshake 134
                nextSingleText $0,134   ; "Ouch, darn you {LEADER}!{W1}"
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait ALLY_BOWIE,eas_DeactivateAutoFacing
                setActscript 134,eas_BumpDown
                entityFlashWhite 134,$A
                playSound SFX_BLAST_SPELL
                entityActions ALLY_BOWIE
                 moveDown 5
                endActions
                playSound SFX_FALLING
                entityFlashWhite 134,$28
                waitIdle ALLY_BOWIE
                playSound SFX_LIGHTNING_2
                setQuake 4
                setFacing ALLY_BOWIE,UP
                customActscriptWait ALLY_BOWIE
                 ac_motion OFF          ;   
                 ac_orientDown          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 30
                setQuake 0
                csWait 30
                nextSingleText $0,ALLY_BOWIE ; "Ohhh....{W1}"
                shiver ALLY_BOWIE
                nextSingleText $FF,255  ; "{LEADER} is stunned.{W1}"
                setCamDest 10,4
                setFacing 134,DOWN
                stopEntity 134
                csWait 5
                setActscript 134,eas_2xRightLeft
                csWait 60
                startEntity 134
                nextSingleText $80,134  ; "That's what you get!{W1}"
                csWait 30
                setFacing 134,RIGHT
                csWait 30
                customActscriptWait 134
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 134
                 moveRight 1
                endActions
                setCamDest 10,6
                setPos 128,13,14,DOWN
                animEntityFX 128,7
                csWait 30
                customActscriptWait 128
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 128
                 moveUp 3
                 moveUpLeft 1
                endActions
                csWait 30
                playSound SFX_PRISM_LASER_FIRING
                setPos 130,63,63,LEFT
                animEntityFX 128,6
                playSound MUSIC_FINAL_BATTLE
                shiver ALLY_LEMON
                csWait 20
                shiver ALLY_LEMON
                csWait 20
                setActscriptWait ALLY_LEMON,eas_Init
                startEntity ALLY_LEMON
                setFacing ALLY_LEMON,DOWN
                csWait 30
                nextSingleText $0,ALLY_LEMON ; "Groovy!{W1}"
                customActscriptWait ALLY_LEMON
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_LEMON
                 moveUp 1
                endActions
                shiver 133
                nextSingleText $80,133  ; "{NAME;28}...{W1}"
                entityActionsWait ALLY_LEMON
                 moveUp 1
                 faceRight 1
                endActions
                shiver 134
                setCamDest 8,3
                nextSingleText $80,134  ; "What?  How?{W1}"
                setFacing 134,LEFT
                csWait 30
                nextSingleText $80,134  ; "{NAME;28}...leave, now!{W1}"
                nextText $0,ALLY_LEMON  ; "King Galam...{W2}"
                nextSingleText $0,ALLY_LEMON ; "Please stop!{W1}"
                nextSingleText $80,134  ; "Get away!{W1}"
                nextSingleText $0,ALLY_LEMON ; "I'll go, but I'll take you{N}with me to another dimension.{W1}"
                entityActionsWait ALLY_LEMON
                 moveRight 1
                endActions
                nextSingleText $80,134  ; "Die!{W1}"
                setActscriptWait ALLY_LEMON,eas_DeactivateAutoFacing
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                csWait 20
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                csWait 20
                entityActions ALLY_LEMON
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
                waitIdle ALLY_LEMON
                csWait 20
                playSound SFX_BIG_DOOR_RUMBLE
                setPos 130,10,8,LEFT
                animEntityFX 130,5
                setCamDest 8,6
                setPos 128,13,14,DOWN
                animEntityFX 128,7
                csWait 30
                customActscriptWait 128
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 128
                 moveUp 3
                 moveUpLeft 3
                endActions
                csWait 30
                playSound SFX_PRISM_LASER_FIRING
                setPos 130,63,63,LEFT
                animEntityFX 128,6
                csWait 40
                setCamDest 8,3
                nextSingleText $0,ALLY_LEMON ; "King...Galam...{W1}"
                entityActionsWait ALLY_LEMON
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
                entityActionsWait ALLY_LEMON
                 moveLeft 1
                endActions
                csWait 50
                entityActionsWait ALLY_LEMON
                 moveRight 2
                endActions
                shiver 134
                csWait 20
                nextText $80,134        ; "How?  It's not possible!{W2}"
                nextText $80,134        ; "You can't still be alive!{W2}"
                setFacing 134,DOWN
                headshake 134
                setFacing 134,RIGHT
                nextSingleText $80,134  ; "Oh, my powers are fading.{N}Where's the jewel?!{W1}"
                shiver 134
                nextSingleText $0,ALLY_LEMON ; "My King...come with me....{W1}"
                entityActionsWait ALLY_LEMON
                 moveRight 1
                endActions
                entityActions ALLY_LEMON
                 moveRight 1
                endActions
                csWait 25
                setActscriptWait ALLY_LEMON,eas_StopMoving
                nextSingleText $80,134  ; "No, I'll never go back to{N}such a terrible...{W1}"
                headshake 134
                setActscriptWait 134,eas_DeactivateAutoFacing
                customActscriptWait 134
                 ac_setSpeed 5,5        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait ALLY_LEMON
                 ac_setSpeed 5,5        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 134
                 moveLeft 1
                endActions
                entityActions ALLY_LEMON
                 moveLeft 1
                endActions
                headshake 134
                headshake 134
                waitIdle 134
                nextSingleText $80,134  ; "I shall return!{N}Remember!{W1}"
                setActscriptWait ALLY_LEMON,eas_DeactivateAutoFacing
                setActscriptWait 134,eas_DeactivateAutoFacing
                setFacing 134,DOWN
                setFacing ALLY_LEMON,DOWN
                setPriority 134,$FFFF
                setPriority ALLY_LEMON,$0
                entityActions ALLY_LEMON
                 moveUpRight 1
                endActions
                csWait 8
                setActscriptWait ALLY_LEMON,eas_StopMoving
                entityActions 134
                 moveUp 3
                endActions
                entityActions ALLY_LEMON
                 moveUp 3
                endActions
                headshake 134
                headshake 134
                headshake 134
                headshake 134
                headshake 134
                headshake 134
                waitIdle 134
                headshake 134
                playSound SFX_FALLING
                setActscript 134,eas_TwirlShrinkDisappear
                setActscriptWait ALLY_LEMON,eas_TwirlShrinkDisappear
                nextSingleText $80,134  ; "Noooooooooo!{W1}"
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
                setCameraEntity ALLY_PETER
                csWait 60
                setActscriptWait ALLY_PETER,eas_Init
                startEntity ALLY_PETER
                setFacing ALLY_PETER,DOWN
                headshake ALLY_PETER
                csWait 60
                setFacing ALLY_PETER,LEFT
                csWait 20
                nextSingleText $80,ALLY_PETER ; "{NAME;28} has taken Zeon{N}away.{W1}"
                playSound MUSIC_SAD_THEME_3
                setCameraEntity 133
                csWait 30
                setActscriptWait 133,eas_Init
                startEntity 133
                setFacing 133,DOWN
                headshake 133
                csWait 30
                entityActionsWait 133
                 moveRight 1
                 faceUp 1
                endActions
                setFacing ALLY_PETER,DOWN
                nextText $80,133        ; "It's over.{W2}"
                nextSingleText $80,133  ; "But, what a tragic ending.{W1}"
                nod ALLY_PETER
                csWait 40
                setActscriptWait ALLY_PETER,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                nextSingleText $80,ALLY_PETER ; "{LEADER}?  Is he OK?{W1}"
                setCameraEntity ALLY_PETER
                entityActionsWait ALLY_PETER
                 moveRight 1
                 moveDown 4
                endActions
                entityActions 133
                 moveDown 4
                 moveLeft 7
                endActions
                entityActionsWait ALLY_PETER
                 moveDown 5
                 moveLeft 6
                endActions
                setFacing 133,UP
                setFacing ALLY_PETER,UP
                csWait 40
                setActscriptWait ALLY_BOWIE,eas_Init
                startEntity ALLY_BOWIE
                setFacing ALLY_BOWIE,DOWN
                headshake ALLY_BOWIE
                csWait 30
                nextSingleText $80,ALLY_PETER ; "{LEADER},  Zeon was{N}taken away by {NAME;28}.{W1}"
                nod ALLY_BOWIE
                nextSingleText $FF,255  ; "{LEADER} nods.{W1}"
                csWait 40
                shiver 133
                nextSingleText $80,133  ; "Oh, is she...is Princess{N}Elis OK?{W1}"
                entityActions 133
                 moveUp 2
                endActions
                entityActionsWait ALLY_PETER
                 moveLeft 1
                 moveUp 1
                endActions
                setFacing ALLY_BOWIE,UP
                setCamDest 8,5
                entityActions ALLY_BOWIE
                 moveUp 5
                 faceRight 1
                endActions
                entityActions 133
                 moveUp 5
                 moveRight 2
                 moveUp 1
                 faceLeft 1
                endActions
                entityActionsWait ALLY_PETER
                 moveUp 6
                 moveRight 1
                 faceUp 1
                endActions
                csWait 20
                setPriority ALLY_PETER,$FFFF
                setPriority 132,$0
                setActscriptWait ALLY_PETER,eas_BumpUp
                setActscriptWait ALLY_PETER,eas_BumpUp
                nextSingleText $80,ALLY_PETER ; "Princess!{W1}"
                nextSingleText $FF,255  ; "{NAME;7} shakes her{N}wildly.{W1}"
                csWait 10
                showPortrait $80,132
                executeSubroutine csub_6269C
                nextSingleText $80,132  ; "Elis does not respond.{W1}"
                shiver ALLY_PETER
                nextSingleText $80,ALLY_PETER ; "She's so cold, and looks so{N}pale.{W2}"
                entityActionsWait ALLY_PETER
                 moveRight 1
                 faceUp 1
                endActions
                nextSingleText $80,ALLY_PETER ; "Sir Astral, is she dead?{W1}"
                setFacing 133,DOWN
                headshake 133
                nextSingleText $80,133  ; "I don't think so.{N}Let me see her.{W1}"
                setFacing 133,LEFT
                csWait 30
                customActscriptWait 133
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 133,eas_DeactivateAutoFacing
                entityActions 133
                 moveLeft 1
                endActions
                csWait 16
                setActscriptWait 133,eas_StopMoving
                csWait 40
                nextSingleText $FF,255  ; "Astral examines Elis.{W1}"
                csWait 40
                entityActions 133
                 moveRight 1
                endActions
                csWait 16
                setActscriptWait 133,eas_StopMoving
                setFacing 133,DOWN
                nextText $80,133        ; "No. She's cold, but she's{N}breathing.{W2}"
                nextSingleText $80,133  ; "I don't understand....{W1}"
                csWait 50
                playSound $FD
                nextSingleText $0,135   ; "She's in a coma.{W1}"
                csWait 5
                setActscript ALLY_BOWIE,eas_2xRightLeft
                csWait 5
                setActscript 133,eas_2xRightLeft
                csWait 5
                setActscript ALLY_PETER,eas_2xUpDown
                csWait 120
                setFacing ALLY_BOWIE,UP
                setFacing 133,UP
                setFacing ALLY_PETER,UP
                playSound MUSIC_MITULA
                setPos 135,13,7,DOWN
                playSound SFX_PRISM_LASER_FIRING
                entityFlashWhite 135,$46
                setActscript ALLY_BOWIE,eas_Jump
                setActscript 133,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                setActscript ALLY_BOWIE,eas_Jump
                setActscript 133,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                csWait 20
                entityActionsWait 133
                 moveUp 1
                endActions
                setFacing 133,LEFT
                nextSingleText $80,133  ; "Goddess Mitula...?{W1}"
                setCamDest 8,4
                nod 135
                nextSingleText $0,135   ; "Hello, Astral.{N}{LEADER} and {NAME;7},{N}you did very well.{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_PETER ; "Mitula!  I knew you would{N}come.{W1}"
                shiver 135
                nextSingleText $0,135   ; "We've been watching.{W1}"
                setActscriptWait ALLY_PETER,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                nextSingleText $80,ALLY_PETER ; "We?  I don't see anybody{N}else?{W1}"
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                csWait 80
                nextSingleText $0,135   ; "C'mon, {NAME;7}.{N}You know what I mean.{W1}"
                setFacing ALLY_PETER,UP
                nextSingleText $80,ALLY_PETER ; "Volcanon?{W1}"
                setActscriptWait ALLY_PETER,eas_DeactivateAutoFacing
                customActscriptWait ALLY_PETER
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_PETER
                 moveDown 1
                endActions
                shiver ALLY_PETER
                csWait 30
                nextSingleText $0,135   ; "Yes.  He helped you many{N}times.{W1}"
                setActscriptWait ALLY_PETER,eas_Init
                entityActionsWait ALLY_PETER
                 moveLeft 3
                 moveUp 3
                 faceRight 1
                endActions
                setCamDest 8,3
                nextSingleText $80,ALLY_PETER ; "When?{W1}"
                setFacing 135,LEFT
                nextText $80,135        ; "You doubt me?{W2}"
                nextSingleText $80,135  ; "How about {NAME;28}?{N}God Volcanon protected him{N}from the fire.{W1}"
                setActscriptWait ALLY_PETER,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                nextSingleText $0,ALLY_PETER ; "Really?  But he said, he{N}would forsake the people{N}of the earth.{W1}"
                nextText $80,135        ; "He said that to deceive the{N}devils.{W2}"
                nextText $80,135        ; "If he had joined you at{N}that time, Zeon would've{N}come to Parmecia.{W2}"
                nextText $80,135        ; "The entire continent might{N}have been destroyed.{W2}"
                nextSingleText $80,135  ; "And if Volcanon had joined{N}you, you would've leaned{N}on him, wouldn't you have?{W1}"
                csWait 20
                nextText $80,133        ; "The Jewel of Light was made{N}by him, wasn't it?{W2}"
                setFacing ALLY_BOWIE,RIGHT
                setFacing 135,RIGHT
                setActscriptWait 133,eas_Init
                entityActionsWait 133
                 moveLeft 1
                 moveUp 1
                 faceLeft 1
                endActions
                setFacing ALLY_BOWIE,UP
                nextSingleText $80,133  ; "It protected {NAME;28}, right?{W1}"
                csWait 20
                setFacing 135,DOWN
                csWait 30
                shiver 135
                nextSingleText $0,135   ; "You're very smart, Astral.{W1}"
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 1
                csWait 90
                setQuake 0
                csWait 20
                nextText $0,135         ; "I have to go now.{W2}"
                nextSingleText $0,135   ; "I need the Jewel of Light.{W1}"
                entityActionsWait 135
                 moveDown 1
                endActions
                setFacing 133,DOWN
                setFacing ALLY_PETER,DOWN
                csWait 30
                setActscriptWait 135,eas_DeactivateAutoFacing
                customActscriptWait 135
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 135
                 moveDown 1
                endActions
                csWait 16
                setActscriptWait 135,eas_StopMoving
                entityFlashWhite 135,$28
                entityActions 135
                 moveUp 1
                endActions
                csWait 16
                setActscriptWait 135,eas_StopMoving
                nextSingleText $FF,255  ; "Mitula took the Jewel of{N}Light from {LEADER}.{W1}"
                nod 135
                nextSingleText $0,135   ; "And I need the Jewel of Evil.{W1}"
                setActscriptWait 135,eas_InitSlow
                csWait 10
                entityActionsWait 135
                 moveRight 3
                endActions
                setFacing 133,RIGHT
                setFacing ALLY_PETER,RIGHT
                setFacing ALLY_BOWIE,RIGHT
                csWait 30
                nod 135
                hide 129
                nextSingleText $FF,255  ; "Mitula took the Jewel{N}of Evil.{W1}"
                setFacing 135,LEFT
                csWait 20
                nextText $80,135        ; "I have to seal Zeon before{N}he regains his power.{W2}"
                nextSingleText $80,135  ; "You had better leave now.{N}Arc Valley will be destroyed.{W1}"
                setFacing 135,UP
                csWait 30
                entityFlashWhite 135,$3C
                nextSingleText $0,133   ; "One more thing!{W1}"
                csWait 30
                setFacing 135,LEFT
                nextSingleText $80,135  ; "Yes?{W1}"
                entityActionsWait 133
                 moveDown 1
                 faceRight 1
                endActions
                nextSingleText $0,133   ; "How do we wake Elis up?{W1}"
                nextText $80,135        ; "She has been poisoned.{W2}"
                nextSingleText $80,135  ; "When the poison leaves her{N}body, her face will turn pink.{W1}"
                setFacing 133,DOWN
                csWait 20
                nod 133
                nextSingleText $0,133   ; "Then she will awaken?{W1}"
                csWait 20
                setFacing 133,RIGHT
                nextText $80,135        ; "If she's still sleeping, she{N}will need a kiss from her{N}true love.{W2}"
                nextSingleText $80,135  ; "This kiss will awaken her.{W1}"
                shiver 133
                entityActionsWait 133
                 moveRight 1
                endActions
                nextSingleText $0,133   ; "When will the poison leave?{W1}"
                headshake 135
                csWait 10
                nextText $80,135        ; "I have no idea.  It depends{N}on her physical strength.{W2}"
                nextText $80,135        ; "It may take a few months...{N}or a few years.{W2}"
                nextSingleText $80,135  ; "Now, I must go.{N}Good luck.{W1}"
                setFacing 135,UP
                csWait 30
                entityFlashWhite 135,$64
                hide 135
                csWait 50
                playSound $FD
                entityActionsWait ALLY_PETER
                 moveRight 1
                endActions
                nextSingleText $0,ALLY_PETER ; "She's gone.{W1}"
                customActscriptWait 133
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 133
                 moveLeft 1
                 faceDown 10
                endActions
                shiver 133
                nextSingleText $80,133  ; "A few years....{W1}"
                entityActionsWait ALLY_PETER
                 moveRight 1
                 faceDown 1
                 jumpUp 1
                 jumpUp 10
                endActions
                nextText $0,ALLY_PETER  ; "Sir Astral, c'mon!{W2}"
                setFacing 133,UP
                nextSingleText $0,ALLY_PETER ; "Mitula told us to leave.{W1}"
                shiver 133
                nextSingleText $80,133  ; "Oh, yeah...let's get out of{N}here!{W1}"
                setActscriptWait 133,eas_Init
                entityActionsWait 133
                 moveLeft 1
                 faceDown 1
                endActions
                setFacing ALLY_BOWIE,UP
                nextSingleText $80,133  ; "{LEADER}, you carry{N}Princess Elis!{W1}"
                setPriority ALLY_BOWIE,$0
                setPriority 132,$FFFF
                nod ALLY_BOWIE
                csWait 20
                entityActions ALLY_BOWIE
                 moveUp 1
                endActions
                csWait 2
                setActscriptWait ALLY_BOWIE,eas_StopMoving
                entityActionsWait ALLY_BOWIE
                 moveRight 1
                 faceDown 20
                endActions
                nod ALLY_BOWIE
                hide 132
                setFacing ALLY_BOWIE,DOWN
                setSprite ALLY_BOWIE,MAPSPRITE_POSE2
                csWait 30
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                csWait 5
                setActscript 133,eas_2xUpDown
                setQuake 32771
                playSound MUSIC_BOSS_ATTACK
                nextSingleText $0,133   ; "Oops!  She's sealing the{N}tower!{W1}"
                entityActions ALLY_BOWIE
                 moveDown 1
                endActions
                csWait 2
                setActscriptWait ALLY_BOWIE,eas_StopMoving
                entityActionsWait ALLY_PETER
                 moveDown 1
                endActions
                nextSingleText $0,ALLY_PETER ; "Hurry!{W1}"
                entityActionsWait 133
                 moveDown 1
                 faceRight 1
                endActions
                nextSingleText $0,133   ; "{LEADER}, run!{W1}"
                setPriority ALLY_BOWIE,$FFFF
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity 133,ALLY_PETER,2
                setActscriptWait ALLY_BOWIE,eas_DeactivateAutoFacing
                setCameraEntity ALLY_BOWIE
                entityActions ALLY_BOWIE
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
                mapLoad MAP_GRANSEAL,0,0
                resetMap
                fadeInB
                reloadMap 0,0
                textCursor 3908
                nextSingleText $FF,255  ; "Two years have passed{N}since Mitula resealed Zeon.{W1}"
                nextSingleText $0,136   ; "Wow, is it true?{N}Did Elis' face turn pink?{W1}"
                clearF 384              ; Set after Bowie obtains the jewel of light/evil... whichever it is
                clearF 385              ; Set after Bowie obtains King Galam's jewel
                resetForceBattleStats
                warp MAP_GRANSEAL,56,3,DOWN
                csc_end

; =============== S U B R O U T I N E =======================================


csub_6269C:
                
                moveq   #1,d0
                jsr     j_ClosePortraitEyes
                rts

    ; End of function csub_6269C

