
; ASM FILE data\battles\entries\battle34\cs_afterbattle.asm :
; 0x4D4B6..0x4D6CE : Cutscene after battle 34
abcs_battle34:  textCursor 2911
                loadMapFadeIn MAP_CAMEELA_ARENA,2,7
                loadMapEntities ce_4D69E
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,9,11,UP
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,5,11,UP
                jumpIfFlagClear 76,cs_4D502 ; Zynk is a follower
                setActscriptWait ALLY_ZYNK,eas_Init
                setPos ALLY_ZYNK,8,12,UP
cs_4D502:       stopEntity 128
                customActscriptWait 128
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                stopEntity 131
                setActscriptWait 131,eas_DeactivateAutoFacing
                fadeInB
                shiver 128
                nextSingleText $0,128   ; "{LEADER}, I lost?!{N}Take this.{W1}"
                nextSingleText $FF,255  ; "Cameela reveals the Sky Orb.{W1}"
                setPos 131,7,10,LEFT
                nextText $0,128         ; "This is the Sky Orb.  With{N}it, you can drive the Nazca{N}Ship.{W2}"
                nextText $0,128         ; "Listen.  You have to be very{N}careful from now on.{W2}"
                nextSingleText $0,128   ; "Geshp has Prism Flowers.{N}He will...{W1}"
                tintMap
                nextSingleText $C0,129  ; "Your life is over,{N}Cameela!{W1}"
                flashScreenWhite $2
                tintMap
                setActscriptWait 128,eas_Init
                setFacing 128,LEFT
                setSprite 128,MAPSPRITE_OBJECT3
                startEntity 128
                setActscript 128,eas_AnimSpeedx2
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                jumpIfFlagClear 76,cs_4D592 ; Zynk is a follower
                setActscript ALLY_ZYNK,eas_Jump
cs_4D592:       setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $0,128   ; "Geshp!{W1}"
                nextSingleText $C0,129  ; "Ha, ha, ha!  You acted just{N}as I planned!{W1}"
                nextSingleText $0,128   ; "Ouuuuu...Ges...{W1}"
                setSprite 128,MAPSPRITE_CAMEELA
                setActscriptWait 128,eas_Die
                nextSingleText $0,FOLLOWER_B ; "How horrible!{W1}"
                nextText $C0,129        ; "It's the law.  Traitors{N}die by fire.{W2}"
                nextText $C0,129        ; "Congratulations!{N}You have a ship now!{N}Come to Grans!{W2}"
                nextSingleText $C0,129  ; "I have to go now and{N}prepare your welcoming{N}party!{W1}"
                flickerOnce
                csWait 60
                setFacing ALLY_PETER,LEFT
                nextText $0,ALLY_PETER  ; "I really hate him!{W2}"
                nextSingleText $0,ALLY_PETER ; "Prism Flowers?{N}What are they?{W1}"
                setFacing FOLLOWER_B,RIGHT
                nextSingleText $0,FOLLOWER_B ; "I have no idea, but it's{N}probably a trap.{W1}"
                jumpIfFlagClear 76,cs_4D620 ; Zynk is a follower
                customActscriptWait ALLY_ZYNK
                 ac_setSpeed 24,24      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_ZYNK
                 moveUp 1
                 moveLeft 1
                endActions
                nextSingleText $0,ALLY_ZYNK ; "Ancient flower.{W1}"
                entityActionsWait FOLLOWER_B
                 moveRight 1
                endActions
                nextSingleText $0,FOLLOWER_B ; "Excuse me?{W1}"
                nextSingleText $0,ALLY_ZYNK ; "Ancient countries had those{N}flowers along their borders.{W1}"
                nextSingleText $0,FOLLOWER_B ; "What kind of flowers are{N}they?{W1}"
                setFacing ALLY_ZYNK,UP
                csWait 30
                nextSingleText $0,ALLY_ZYNK ; "I cannot explain....{W1}"
cs_4D620:       textCursor 2932
                entityActionsWait ALLY_PETER
                 moveLeft 1
                endActions
                nextSingleText $0,ALLY_PETER ; "We will see them when we{N}arrive at Grans.{W1}"
                nextSingleText $0,FOLLOWER_B ; "{LEADER}, grab the Sky{N}Orb.{N}Let's go.{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                setFacing ALLY_PETER,LEFT
                jumpIfFlagClear 76,cs_4D654 ; Zynk is a follower
                entityActionsWait ALLY_ZYNK
                 moveRight 1
                endActions
                setFacing ALLY_ZYNK,LEFT
cs_4D654:       nod ALLY_BOWIE
                entityActionsWait ALLY_BOWIE
                 moveUp 1
                endActions
                hide 131
                executeSubroutine csub_4D694
                followEntity 130,ALLY_BOWIE,2
                followEntity ALLY_PETER,130,1
                followEntity FOLLOWER_B,130,3
                jumpIfFlagClear 76,cs_4D692 ; Zynk is a follower
                followEntity ALLY_ZYNK,130,2
cs_4D692:       csc_end

; =============== S U B R O U T I N E =======================================


csub_4D694:
                
                moveq   #$71,d0 
                moveq   #1,d1
                jmp     GetMandatoryItem

    ; End of function csub_4D694

ce_4D69E:       mainEntity 7,12,UP
                entity 9,11,UP,ALLY_PETER,eas_Init
                entity 7,9,DOWN,MAPSPRITE_CAMEELA,eas_Init
                entity 63,63,DOWN,MAPSPRITE_GESHP,eas_Init
                entity 6,12,UP,MAPSPRITE_CARAVAN,eas_Init
                entity 63,63,LEFT,MAPSPRITE_ORB,eas_Init
                dc.w $FFFF
