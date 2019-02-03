
; ASM FILE data\battles\entries\battle18\cs_afterbattle.asm :
; 0x4B2F2..0x4B6CE : Cutscene after battle 18
abcs_battle18:  textCursor $9E0
                loadMapFadeIn 12,7,5
                loadMapEntities ce_4B6BE
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setActscriptWait $1F,eas_Init
                setActscriptWait $B,eas_Init
                setPos $7,13,9,UP
                setPos $1F,14,9,UP
                setPos $B,5,9,RIGHT
                stopEntity $80
                fadeInB
                csWait 60
                nextSingleText $0,$B    ; "{LEADER}, you're much{N}stronger than I thought.{W1}"
                setFacing $0,LEFT
                setFacing $7,LEFT
                setFacing $1F,LEFT
                csWait 30
                setCameraEntity $B
                csWait 120
                entityActionsWait $B
                 moveRight 6
                endActions
                setFacing $0,UP
                setFacing $7,UP
                setFacing $1F,UP
                entityActionsWait $B
                 moveUp 4
                endActions
                setFacing $B,RIGHT
                setCameraEntity $FFFF
                setCamDest 7,1
                csWait 30
                setPos $B,12,6,UP
                csWait 20
                setPos $B,13,5,LEFT
                csWait 20
                setPos $B,12,6,UP
                csWait 20
                setPos $B,11,5,RIGHT
                csWait 20
                setPos $B,12,6,UP
                csWait 20
                setPos $B,13,5,LEFT
                csWait 20
                nextSingleText $0,$B    ; "It's so small.  I'll just{N}try to...get inside....{W1}"
                entityActions $B
                 moveLeft 1
                endActions
                csWait 3
                setActscript $B,eas_452BA
                csWait 3
                csWait 60
                startEntity $80
                csWait 30
                stopEntity $80
                csWait 60
                startEntity $80
                csWait 120
                setFacing $80,LEFT
                csWait 10
                setFacing $80,UP
                csWait 10
                setFacing $80,RIGHT
                csWait 10
                setFacing $80,DOWN
                csWait 10
                setFacing $80,LEFT
                csWait 10
                setFacing $80,UP
                csWait 10
                setFacing $80,RIGHT
                csWait 10
                setFacing $80,DOWN
                setActscript $80,eas_Jump
                csWait 10
                setPos $B,63,63,DOWN
                customActscriptWait $80
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                playSound SFX_FALLING
                entityActions $80
                 moveDown 9
                endActions
                csWait 20
                customActscriptWait $0
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $0,eas_46172
                entityActions $0
                 moveLeft 1
                endActions
                setFacing $0,RIGHT
                setFacing $7,LEFT
                setFacing $1F,LEFT
                csWait 60
                setCamDest 7,4
                setActscriptWait $0,eas_Init
                setFacing $0,DOWN
                setFacing $7,DOWN
                setFacing $1F,DOWN
                nextSingleText $0,$7    ; "Oh, he's gone!{W1}"
                csWait 60
                setFacing $0,RIGHT
                setFacing $7,LEFT
                setFacing $1F,LEFT
                nextSingleText $0,$7    ; "I hope he comes back.{N}Did {NAME;11} lie to us?{W1}"
                csWait 30
                setFacing $0,DOWN
                setFacing $7,DOWN
                setFacing $1F,DOWN
                csWait 150
                setActscriptWait $80,eas_46172
                entityActions $80
                 moveUp 9
                endActions
                playSound SFX_FALLING
                csWait 20
                setFacing $80,LEFT
                setFacing $1F,LEFT
                csWait 20
                setFacing $0,UP
                setFacing $7,UP
                csWait 10
                setFacing $0,LEFT
                setFacing $7,RIGHT
                csWait 10
                setFacing $0,DOWN
                setFacing $7,DOWN
                csWait 10
                setFacing $0,RIGHT
                setFacing $7,LEFT
                csWait 10
                setFacing $0,UP
                setFacing $7,UP
                csWait 10
                setFacing $0,LEFT
                setFacing $7,RIGHT
                csWait 10
                setFacing $0,DOWN
                setFacing $7,DOWN
                csWait 10
                setFacing $0,RIGHT
                setFacing $7,LEFT
                csWait 10
                customActscriptWait $0
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $1          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $7
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $1          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                stopEntity $0
                stopEntity $7
                csWait 30
                setFacing $80,DOWN
                csWait 60
                stopEntity $80
                setActscriptWait $1F,eas_BumpLeft
                setActscriptWait $1F,eas_BumpLeft
                csWait 30
                setPos $B,12,5,RIGHT
                setActscriptWait $B,eas_4536C
                csWait 3
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setFacing $0,UP
                setFacing $7,UP
                setFacing $1F,UP
                startEntity $0
                startEntity $7
                entityActionsWait $B
                 moveDown 3
                endActions
                nextSingleText $0,$B    ; "I never lie!{W1}"
                entityActionsWait $B
                 moveLeft 2
                endActions
                setFacing $B,DOWN
                nextSingleText $0,$B    ; "The Ancients were...how{N}should I say this...great!{W1}"
                entityActionsWait $B
                 moveRight 1
                endActions
                setFacing $B,UP
                nextSingleText $0,$B    ; "No wonder the Caravan is so{N}small.  It carries miniaturized{N}people and items.{W2}"
                entityActionsWait $B
                 moveUp 2
                endActions
                setFacing $B,DOWN
                nextSingleText $0,$B    ; "I can drive this excellent{N}vehicle.  May I go with you{N}as a driver?{W1}"
                csWait 30
                nextSingleText $FF,$FF  ; "{NAME;11} the historian{N}tags along with the force.{W1}"
                entityActionsWait $7
                 moveUp 1
                endActions
                nextSingleText $0,$7    ; "You're kidding, right?{W1}"
                entityActionsWait $7
                 moveDown 1
                endActions
                setFacing $7,LEFT
                setFacing $0,RIGHT
                setFacing $1F,LEFT
                nextSingleText $0,$7    ; "Well, at least we can bring{N}a lot of soldiers with us.{W1}"
                entityActionsWait $B
                 moveDown 1
                endActions
                setFacing $0,UP
                setFacing $7,UP
                setFacing $1F,UP
                nextSingleText $0,$B    ; "But soldiers in the Caravan{N}cannot enter battle 'cause{N}they've been miniaturized.{W1}"
                nextSingleText $0,$7    ; "We'll just have to see.{W1}"
                setFacing $0,RIGHT
                setFacing $7,LEFT
                setFacing $1F,LEFT
                nextSingleText $0,$7    ; "Humph.  I don't like this guy.{W1}"
                entityActionsWait $B
                 moveUp 1
                endActions
                setFacing $B,DOWN
                csWait 20
                setActscriptWait $B,eas_Jump
                setActscriptWait $B,eas_Jump
                setFacing $0,UP
                setFacing $7,UP
                setFacing $1F,UP
                nextSingleText $0,$B    ; "I wonder what adventures{N}we'll find with this Caravan!{W1}"
                csWait 30
                entityActions $B
                 moveUp 1
                endActions
                csWait 3
                setActscript $B,eas_452BA
                csWait 3
                csWait 60
                startEntity $80
                setPos $B,63,63,DOWN
                csWait 60
                setActscriptWait $80,eas_Init
                entityActions $80
                 moveDown 9
                endActions
                csWait 30
                setFacing $0,RIGHT
                setFacing $7,LEFT
                setFacing $1F,LEFT
                csWait 10
                setFacing $0,DOWN
                setFacing $7,DOWN
                setFacing $1F,DOWN
                csWait 180
                setF $41                ; Caravan is unlocked (0x4428A..0x44337, 0x44338..0x44403)
                clearF $54              ; Rohde is a follower
                csc_end
ce_4B6BE:       mainEntity 12,9,UP
                entity 12,5,DOWN,62,eas_Init
                dc.w $FFFF
