
; ASM FILE data\battles\entries\battle08\cs_afterbattle.asm :
; 0x4AA74..0x4ABFE : Cutscene after battle 8
abcs_battle08:  textCursor 2468
                loadMapFadeIn MAP_OVERWORLD_NORTH_SOUTH_PARMECIA_JUNCTION,8,32
                loadMapEntities ce_4ABBE
                setActscriptWait ALLY_BOWIE,eas_Init
                stopEntity 129
                customActscriptWait 129
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                jumpIfFlagSet 6,cs_4AAB6 ; Kiwi joined
                setPos ALLY_KIWI,63,63,DOWN
cs_4AAB6:       fadeInB
                nextSingleText $0,128   ; "Oh, my...hey!{N}Are you OK?!{W1}"
                setFacing 128,LEFT
                entityActionsWait 128
                 moveLeft 1
                endActions
                setFacing 128,UP
                entityActionsWait 128
                 moveUp 1
                endActions
                setFacing 128,RIGHT
                nextSingleText $0,128   ; "Oh!{W1}"
                setActscriptWait 129,eas_Init
                setSprite 129,MAPSPRITE_POSE1
                setFacing 129,LEFT
                nextSingleText $C0,129  ; "Oooh...unh...a big rock...{N}fell on me....{W1}"
                setSprite 129,MAPSPRITE_WORKER
                setFacing 129,DOWN
                nextSingleText $C0,129  ; "Huh?  Where is it?{W1}"
                setActscriptWait 129,eas_Init
                csWait 5
                setActscript 129,eas_2xRightLeft
                csWait 120
                setFacing 129,LEFT
                startEntity 129
                nextSingleText $C0,129  ; "It's...humph...{W1}"
                setFacing 129,DOWN
                nextSingleText $C0,129  ; "{LEADER}...how come{N}you're here?{W1}"
                setActscript 128,eas_BumpRight
                customActscriptWait 129
                 ac_setSpeed 32,32      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 129,eas_4618A
                csWait 8
                entityActionsWait 129
                 moveRight 1
                endActions
                setFacing 129,DOWN
                headshake 129
                nextText $0,128         ; "What a fool.{N}We came to help you!{W2}"
                nextSingleText $0,128   ; "You would be dead if we{N}hadn't come.{W1}"
                setFacing 129,LEFT
                nextText $C0,129        ; "What are you talking about?{N}Oh, yeah!  I remember.{W2}"
                nextText $C0,129        ; "A huge rock fell on me after{N}you left.{W2}"
                nextText $C0,129        ; "It must have knocked me out.{N}Anyway, thank you.{W2}"
                nextSingleText $C0,129  ; "Look at that!{N}The tunnel is blocked by{N}a rockslide.{W1}"
                setFacing 129,RIGHT
                csWait 20
                setFacing ALLY_KIWI,RIGHT
                setCamDest 22,32
                csWait 30
                setCamDest 8,32
                entityActionsWait 128
                 moveRight 1
                endActions
                setActscriptWait 128,eas_Jump
                nextText $0,128         ; "Oh, what a pity.{N}Treasures may lie within....{W2}"
                nextSingleText $0,128   ; "I guess we'll never know.{W1}"
                setFacing 128,DOWN
                entityActionsWait 128
                 moveDown 1
                endActions
                nextSingleText $0,128   ; "{LEADER}, let's go back{N}to the ship.{W1}"
                warp MAP_OVERWORLD_NEW_GRANSEAL_SHORE,62,49,LEFT
                csc_end
ce_4ABBE:       mainEntity 14,37,UP
                entity 14,35,UP,MAPSPRITE_WORKER,eas_Init
                entity 13,36,UP,ALLY_SARAH,eas_Init
                entity 12,35,UP,ALLY_JAHA,eas_Init
                entity 15,36,UP,ALLY_KAZIN,eas_Init
                entity 16,35,UP,ALLY_CHESTER,eas_Init
                entity 16,34,LEFT,ALLY_KIWI,eas_Init
                entity 14,34,DOWN,MAPSPRITE_WORKER,eas_Init
                dc.w $FFFF
