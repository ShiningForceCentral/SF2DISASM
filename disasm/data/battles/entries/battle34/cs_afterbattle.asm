
; ASM FILE data\battles\entries\battle34\cs_afterbattle.asm :
; 0x4D4B6..0x4D6CE : Cutscene after battle 34
abcs_battle34:  textCursor $B5F
                loadMapFadeIn 55,2,7
                loadMapEntities ce_4D69E
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setPos $7,9,11,UP
                setActscriptWait $1F,eas_Init
                setPos $1F,5,11,UP
                jumpIfFlagClear $4C,cs_4D502; Zynk is a follower
                setActscriptWait $1A,eas_Init
                setPos $1A,8,12,UP
cs_4D502:       stopEntity $80
                customActscriptWait $80
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $1          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                stopEntity $83
                setActscriptWait $83,eas_46172
                fadeInB
                shiver $80
                nextSingleText $0,$80   ; "{LEADER}, I lost?!{N}Take this.{W1}"
                nextSingleText $FF,$FF  ; "Cameela reveals the Sky Orb.{W1}"
                setPos $83,7,10,LEFT
                nextText $0,$80         ; "This is the Sky Orb.  With{N}it, you can drive the Nazca{N}Ship.{W2}"
                nextText $0,$80         ; "Listen.  You have to be very{N}careful from now on.{W2}"
                nextSingleText $0,$80   ; "Geshp has Prism Flowers.{N}He will...{W1}"
                tintMap
                nextSingleText $C0,$81  ; "Your life is over,{N}Cameela!{W1}"
                flashScreenWhite $2
                tintMap
                setActscriptWait $80,eas_Init
                setFacing $80,LEFT
                setSprite $80,MAPSPRITE_OBJECT3
                startEntity $80
                setActscript $80,eas_AnimSpeedx2
                setActscript $0,eas_Jump
                setActscript $7,eas_Jump
                jumpIfFlagClear $4C,cs_4D592; Zynk is a follower
                setActscript $1A,eas_Jump
cs_4D592:       setActscriptWait $1F,eas_Jump
                nextSingleText $0,$80   ; "Geshp!{W1}"
                nextSingleText $C0,$81  ; "Ha, ha, ha!  You acted just{N}as I planned!{W1}"
                nextSingleText $0,$80   ; "Ouuuuu...Ges...{W1}"
                setSprite $80,MAPSPRITE_CAMEELA
                setActscriptWait $80,eas_Die
                nextSingleText $0,$1F   ; "How horrible!{W1}"
                nextText $C0,$81        ; "It's the law.  Traitors{N}die by fire.{W2}"
                nextText $C0,$81        ; "Congratulations!{N}You have a ship now!{N}Come to Grans!{W2}"
                nextSingleText $C0,$81  ; "I have to go now and{N}prepare your welcoming{N}party!{W1}"
                flickerOnce
                csWait 60
                setFacing $7,LEFT
                nextText $0,$7          ; "I really hate him!{W2}"
                nextSingleText $0,$7    ; "Prism Flowers?{N}What are they?{W1}"
                setFacing $1F,RIGHT
                nextSingleText $0,$1F   ; "I have no idea, but it's{N}probably a trap.{W1}"
                jumpIfFlagClear $4C,cs_4D620; Zynk is a follower
                customActscriptWait $1A
                 ac_setSpeed 24,24      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $1A
                 moveUp 1
                 moveLeft 1
                endActions
                nextSingleText $0,$1A   ; "Ancient flower.{W1}"
                entityActionsWait $1F
                 moveRight 1
                endActions
                nextSingleText $0,$1F   ; "Excuse me?{W1}"
                nextSingleText $0,$1A   ; "Ancient countries had those{N}flowers along their borders.{W1}"
                nextSingleText $0,$1F   ; "What kind of flowers are{N}they?{W1}"
                setFacing $1A,UP
                csWait 30
                nextSingleText $0,$1A   ; "I cannot explain....{W1}"
cs_4D620:       textCursor $B74
                entityActionsWait $7
                 moveLeft 1
                endActions
                nextSingleText $0,$7    ; "We will see them when we{N}arrive at Grans.{W1}"
                nextSingleText $0,$1F   ; "{LEADER}, grab the Sky{N}Orb.{N}Let's go.{W1}"
                entityActionsWait $7
                 moveUp 1
                endActions
                setFacing $7,LEFT
                jumpIfFlagClear $4C,cs_4D654; Zynk is a follower
                entityActionsWait $1A
                 moveRight 1
                endActions
                setFacing $1A,LEFT
cs_4D654:       nod $0
                entityActionsWait $0
                 moveUp 1
                endActions
                hide $83
                executeSubroutine csub_4D694
                followEntity $82,$0,$2
                followEntity $7,$82,$1
                followEntity $1F,$82,$3
                jumpIfFlagClear $4C,cs_4D692; Zynk is a follower
                followEntity $1A,$82,$2
cs_4D692:       csc_end

; =============== S U B R O U T I N E =======================================

csub_4D694:
                
                moveq   #$71,d0 
                moveq   #1,d1
                jmp     GetMandatoryItem

	; End of function csub_4D694

ce_4D69E:       mainEntity 7,12,UP
                entity 9,11,UP,MAPSPRITE_CHESTER_SPECIAL,eas_Init
                entity 7,9,DOWN,MAPSPRITE_CAMEELA,eas_Init
                entity 63,63,DOWN,MAPSPRITE_GESHP,eas_Init
                entity 6,12,UP,MAPSPRITE_CARAVAN,eas_Init
                entity 63,63,LEFT,MAPSPRITE_ORB,eas_Init
                dc.w $FFFF
