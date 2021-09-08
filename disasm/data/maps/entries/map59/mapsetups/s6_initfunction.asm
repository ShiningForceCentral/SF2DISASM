
; ASM FILE data\maps\entries\map59\mapsetups\s6_initfunction.asm :
; 0x5EAD8..0x5F34C : 

; =============== S U B R O U T I N E =======================================


ms_map59_InitFunction:
                
                 
                chkFlg  999             ; Set after the Nazca ship shootdown scene
                bne.s   byte_5EB18      
                script  cs_5EB44
                script  cs_5EBFC
                script  cs_5ED06
                script  cs_5EDB8
                script  cs_5EF60
                setFlg  999             ; Set after the Nazca ship shootdown scene
                move.b  #$2D,((EGRESS_MAP_INDEX-$1000000)).w 
                setFlg  436             ; Battle 36 unlocked - BATTLE_VERSUS_PRISM_FLOWERS      
                setFlg  440             ; Battle 40 unlocked - BATTLE_VERSUS_ODD_EYE            
                setFlg  442             ; Battle 42 unlocked - BATTLE_VERSUS_GALAM              
                setFlg  443             ; Battle 43 unlocked - BATTLE_VERSUS_ZEON               
                rts
byte_5EB18:
                
                chkFlg  443             ; Battle 43 unlocked - BATTLE_VERSUS_ZEON               
                beq.s   return_5EB24
                script  cs_5EB26
return_5EB24:
                
                rts

    ; End of function ms_map59_InitFunction

cs_5EB26:       executeSubroutine csub_5EB34
                warp MAP_ZEON_ARENA,13,34,UP
                csc_end

; =============== S U B R O U T I N E =======================================


csub_5EB34:
                
                lea     (PALETTE_1_BASE).l,a0
                moveq   #$1F,d7
loc_5EB3C:
                
                clr.l   (a0)+
                dbf     d7,loc_5EB3C
                rts

    ; End of function csub_5EB34

cs_5EB44:       textCursor 3699
                setCameraEntity 65535
                reloadMap 8,2
                loadMapEntities ce_5F19E
                setActscriptWait ALLY_BOWIE,eas_Init
                csWait 60
                playSound MUSIC_WITCH
                csWait 30
                setActscript 128,eas_Transparent
                fadeInFromBlackHalf
                nextSingleText $0,128   ; "{LEADER} is almost here{N}already?{W1}"
                nextSingleText $80,129  ; "Yes, sir.  With an ancient{N}aircraft.  He'll be passing{N}over the cape soon.{W1}"
                nextSingleText $0,128   ; "Good.  I'll do anything to{N}get my powers back.{W1}"
                nextText $80,129        ; "They're stronger than we{N}thought.{W2}"
                nextSingleText $80,129  ; "But, I have an idea.  Please{N}let me try it.{W1}"
                nextSingleText $0,128   ; "Well?{W1}"
                nextText $80,129        ; "I think it's better for us{N}to shoot them down over the{N}"
                nextSingleText $80,129  ; "cape.{W1}"
                nextSingleText $0,128   ; "I agree.{W1}"
                nextText $80,129        ; "Thank you.  Then... may I{W2}"
                nextSingleText $80,129  ; "borrow Odd Eye?{W1}"
                nextText $0,128         ; "He's still damaged from his{N}battle against Volcanon.{W2}"
                nextSingleText $0,128   ; "Take Red Baron instead.{W1}"
                shiver 129
                shiver 129
                nextSingleText $80,129  ; "Thank you, sir.{W1}"
                nextSingleText $0,128   ; "They'll be passing over the{N}cape soon.  Go!{W1}"
                nextSingleText $80,129  ; "Yes, sir!{W1}"
                animEntityFX 129,6
                nextSingleText $0,130   ; "That Geshp!  He wants{N}everything.{W1}"
                setPos 130,9,9,DOWN
                animEntityFX 130,7
                entityActionsWait 130
                 moveRight 4
                 moveUp 1
                endActions
                nextSingleText $0,128   ; "You noticed that too?{W1}"
                nod 130
                nextText $0,130         ; "Yes, King Zeon.{W2}"
                nextSingleText $0,130   ; "I'm afraid Geshp can't stop{N}{LEADER}'s advance.{W1}"
                nextSingleText $0,128   ; "You really think so?{W1}"
                nextText $0,130         ; "I was just thinking of{N}{LEADER}'s hidden powers.{W2}"
                nextSingleText $0,130   ; "We must never underestimate{N}him.{W1}"
                nextSingleText $0,128   ; "Anyway, it will be a{N}fantastic show!  Ha, ha!{W1}"
                csc_end
cs_5EBFC:       loadMapFadeIn MAP_PRISM_FLOWERS_FIELD,8,14
                textCursor 3723
                loadMapEntities ce_5F1DE
                setActscriptWait ALLY_BOWIE,eas_Init
                stopEntity 130
                stopEntity 131
                stopEntity 132
                stopEntity 133
                playSound MUSIC_BATTLE_THEME_1
                fadeInB
                setActscriptWait 130,eas_Init
                setActscriptWait 134,eas_Init
                setActscriptWait 135,eas_Init
                setActscriptWait 136,eas_Init
                customActscriptWait 130
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 134
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 135
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 136
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 130
                 moveRight 3
                endActions
                entityActions 134
                 moveRight 3
                endActions
                entityActions 135
                 moveRight 3
                endActions
                entityActions 136
                 moveRight 3
                endActions
                setFacing 128,LEFT
                csWait 30
                setFacing 128,RIGHT
                csWait 30
                shiver 128
                nextSingleText $0,128   ; "Finish the preparations{N}before the Nazca Ship flies{N}over the cape!{W1}"
                setCamDest 10,14
                setPos 129,15,16,DOWN
                animEntityFX 129,7
                nextSingleText $80,129  ; "How are the Prism Flowers?{W1}"
                nextSingleText $0,128   ; "They're ready!{W1}"
                nextSingleText $80,129  ; "Excellent!{W1}"
                nod 129
                setCameraEntity 129
                entityActionsWait 129
                 moveRight 2
                 moveUp 2
                endActions
                setFacing 129,RIGHT
                nextText $80,129        ; "Now, c'mon Granseal losers!{W2}"
                nextSingleText $80,129  ; "The Prism Flowers are waiting{N}for you!  Hee, heee!{W1}"
                nod 129
                nod 129
                csc_end
cs_5ED06:       textCursor 3729
                loadMapFadeIn MAP_OVERWORLD_NEW_GRANSEAL_SHORE,0,0
                loadMapEntities ce_5F1BE
                setActscriptWait ALLY_BOWIE,eas_Init
                executeSubroutine sub_5F31E
                playSound MUSIC_MITULA_SHRINE
                setBlocks 0,10,22,10,42,10
                fadeInB
                executeSubroutine sub_5FD92
                nextSingleText $80,ALLY_ZYNK ; "There's Grans Island!{W1}"
                nextSingleText $80,ALLY_PETER ; "Alright!{W1}"
                nextSingleText $0,FOLLOWER_B ; "We've finally come home.{W1}"
                loadMapFadeIn MAP_PRISM_FLOWERS_FIELD,10,13
                loadMapEntities ce_5F23E
                setActscriptWait ALLY_BOWIE,eas_Init
                playSound MUSIC_BATTLE_THEME_1
                stopEntity 128
                stopEntity 130
                stopEntity 131
                stopEntity 132
                fadeInB
                nextSingleText $80,129  ; "I see the Nazca Ship!{N}Everybody, get ready!{W1}"
                loadMapFadeIn MAP_OVERWORLD_NEW_GRANSEAL_SHORE,0,0
                loadMapEntities ce_5F1BE
                setActscriptWait ALLY_BOWIE,eas_Init
                executeSubroutine sub_5F31E
                playSound MUSIC_MITULA_SHRINE
                setBlocks 0,10,22,10,42,10
                fadeInB
                executeSubroutine sub_5FD92
                nextSingleText $0,FOLLOWER_B ; "What's that?  I saw a flash{N}of light over there.{W1}"
                nextSingleText $80,ALLY_PETER ; "I didn't see it.  You must be{N}seeing things because you're{N}so old!  Ha, ha!{W1}"
                nextText $0,FOLLOWER_B  ; "(Grumble)....{W2}"
                nextSingleText $0,FOLLOWER_B ; "Someday, {NAME;7}....{W1}"
                csc_end
cs_5EDB8:       textCursor 3737
                loadMapFadeIn MAP_PRISM_FLOWERS_FIELD,10,13
                loadMapEntities ce_5F28E
                setActscriptWait ALLY_BOWIE,eas_Init
                playSound MUSIC_ENEMY_ATTACK
                setActscript 133,eas_5EF46
                setActscript 134,eas_5EF46
                setActscript 135,eas_5EF46
                setActscript 136,eas_5EF46
                setActscript 137,eas_5EF46
                setActscript 138,eas_5EF46
                setActscript 139,eas_5EF46
                setActscript 140,eas_5EF46
                stopEntity 141
                stopEntity 142
                stopEntity 143
                stopEntity 144
                fadeInB
                setFacing 129,LEFT
                nextSingleText $80,129  ; "NOW!{W1}"
                entityActionsWait 129
                 moveRight 1
                endActions
                nextSingleText $80,129  ; "Shoot them!  Shoot them!{W1}"
                playSound SFX_BATTLEFIELD_DEATH
                setPos 133,12,16,LEFT
                csWait 30
                setFacing 133,UP
                playSound SFX_PRISM_LASER_CUTSCENE_FIRING
                setPos 133,13,15,UP
                entityActions 133
                 moveUpRight 10
                endActions
                flashScreenWhite $2
                setPos 134,13,15,UP
                entityActions 134
                 moveUpRight 10
                endActions
                csWait 20
                playSound SFX_BATTLEFIELD_DEATH
                setPos 135,13,17,LEFT
                csWait 30
                setFacing 135,UP
                playSound SFX_PRISM_LASER_CUTSCENE_FIRING
                setPos 135,14,16,UP
                entityActions 135
                 moveUpRight 10
                endActions
                flashScreenWhite $2
                setPos 136,14,16,UP
                entityActions 136
                 moveUpRight 10
                endActions
                playSound SFX_BATTLEFIELD_DEATH
                setPos 137,14,19,LEFT
                csWait 30
                setFacing 137,UP
                playSound SFX_PRISM_LASER_CUTSCENE_FIRING
                setPos 137,15,18,UP
                entityActions 137
                 moveUpRight 10
                endActions
                flashScreenWhite $2
                setPos 138,15,18,UP
                entityActions 138
                 moveUpRight 10
                endActions
                csWait 10
                playSound SFX_BATTLEFIELD_DEATH
                setPos 139,15,20,LEFT
                csWait 30
                setFacing 139,UP
                playSound SFX_PRISM_LASER_CUTSCENE_FIRING
                setPos 139,16,19,UP
                entityActions 139
                 moveUpRight 10
                endActions
                flashScreenWhite $2
                setPos 140,16,19,UP
                entityActions 140
                 moveUpRight 10
                endActions
                playSound SFX_BATTLEFIELD_DEATH
                setPos 139,12,16,LEFT
                csWait 30
                setFacing 139,UP
                playSound SFX_PRISM_LASER_CUTSCENE_FIRING
                setPos 139,13,15,UP
                entityActions 139
                 moveUpRight 10
                endActions
                flashScreenWhite $2
                setPos 140,13,15,UP
                entityActionsWait 140
                 moveUpRight 10
                endActions
                csc_end
eas_5EF46:       ac_animSpeedX2 ON
                 ac_transparency ON
                 ac_entityUncollidable OFF
                 ac_autoFacing OFF
                 ac_setSpeed 64,64
                 ac_jump eas_Idle
cs_5EF60:       textCursor 3739
                loadMapFadeIn MAP_NAZCA_SHIP_INTERIOR,4,6
                loadEntitiesFromMapSetup 9,11,DOWN
                executeSubroutine InitNazcaShipForceMembers
                setPos ALLY_ZYNK,8,10,RIGHT
                executeSubroutine sub_5F32E
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setActscriptWait ALLY_ZYNK,eas_Init
                setPos 128,9,12,UP
                setPos ALLY_PETER,10,12,UP
                setPos ALLY_ZYNK,10,11,LEFT
                fadeInB
                shiver 128
                nextSingleText $0,128   ; "I did see something!{W1}"
                nextSingleText $80,ALLY_PETER ; "Well, I didn't.{W1}"
                nextSingleText $0,128   ; "This could be bad.{W1}"
                nextSingleText $80,ALLY_ZYNK ; "Sir Astral!  {LEADER}!{N}Something is coming straight{N}towards us!{W1}"
                nextSingleText $0,128   ; "What is it?{W1}"
                playSound SFX_BATTLEFIELD_DEATH
                setQuake 3
                flashScreenWhite $14
                setQuake 1
                csWait 10
                setQuake 0
                entityActionsWait ALLY_PETER
                 moveRight 1
                 jumpRight 1
                 jumpLeft 1
                 jumpRight 1
                 jumpLeft 1
                endActions
                setFacing ALLY_PETER,LEFT
                nextSingleText $80,ALLY_PETER ; "Oooouu!!  What was that?!{N}Lightning?{W1}"
                setFacing ALLY_BOWIE,RIGHT
                setFacing ALLY_ZYNK,DOWN
                nextText $80,ALLY_ZYNK  ; "An attack from the ground.{W2}"
                nextSingleText $80,ALLY_ZYNK ; "I can't control the ship!{W1}"
                playSound SFX_BATTLEFIELD_DEATH
                setQuake 3
                flashScreenWhite $14
                setQuake 1
                csWait 10
                setQuake 0
                csWait 10
                playSound SFX_BATTLEFIELD_DEATH
                setQuake 3
                flashScreenWhite $14
                setQuake 1
                csWait 10
                nextText $80,ALLY_ZYNK  ; "We've sustained damage to{N}the engine!{W2}"
                nextSingleText $80,ALLY_ZYNK ; "We might crash!{W1}"
                entityActionsWait 128
                 moveRight 1
                endActions
                setFacing 128,UP
                shiver 128
                nextText $0,128         ; "Crash?!{W2}"
                nextSingleText $80,ALLY_ZYNK ; "Geshp's trap!  Darn!{W1}"
                playSound SFX_BATTLEFIELD_DEATH
                setQuake 3
                flashScreenWhite $14
                setQuake 1
                csWait 10
                playSound SFX_BATTLEFIELD_DEATH
                setQuake 3
                flashScreenWhite $14
                setQuake 1
                csWait 10
                setActscriptWait ALLY_PETER,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                nextText $80,ALLY_PETER ; "I don't want to crash!{W2}"
                nextSingleText $80,ALLY_PETER ; "Sir Astral, please help us!{W1}"
                nextSingleText $0,128   ; "{NAME;26}, can you land on{N}that cape before the ship{N}crashes?{W1}"
                nextSingleText $80,ALLY_ZYNK ; "I'm not sure,{W2}"
                playSound SFX_BATTLEFIELD_DEATH
                setQuake 3
                flashScreenWhite $14
                setQuake 1
                csWait 10
                nextSingleText $80,ALLY_ZYNK ; "but I'll try.{W1}"
                playSound SFX_BATTLEFIELD_DEATH
                setQuake 3
                flashScreenWhite $14
                setQuake 1
                csWait 10
                setQuake 3
                executeSubroutine sub_5F338
                fadeOutB
                setQuake 0
                mapLoad MAP_OVERWORLD_GRANS_NORTH_SHORE,20,14
                loadMapEntities ce_5F1CE
                setActscriptWait ALLY_BOWIE,eas_Init
                setCameraEntity 128
                customActscriptWait 128
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                cameraSpeed $10
                entityActions 128
                 moveLeft 12
                endActions
                executeSubroutine csub_5F326
                fadeInB
                executeSubroutine sub_5FD92
                csWait 150
                playSound $FD
                executeSubroutine sub_5F16C
                setQuake 1
                playSound SFX_INTRO_LIGHTNING
                flashScreenWhite $3C
                waitIdle 128
                setBlocks 56,59,4,5,12,17
                csWait 120
                setQuake 0
                executeSubroutine csub_5F14C
                csWait 120
                warp MAP_NAZCA_SHIP_INTERIOR,8,12,DOWN
                csc_end

; =============== S U B R O U T I N E =======================================


csub_5F14C:
                
                lea     plt_5F17E(pc), a0
                lea     (PALETTE_4_BASE).l,a1
                moveq   #$20,d7 
                jsr     (CopyBytes).w   
                lea     (PALETTE_1_BASE).l,a0
                clr.b   ((FADING_TIMER_BYTE-$1000000)).w
                jsr     (sub_19C8).w    
                rts

    ; End of function csub_5F14C


; =============== S U B R O U T I N E =======================================


sub_5F16C:
                
                moveq   #$17,d7
loc_5F16E:
                
                subq.b  #1,((byte_FFAEEE+5-$1000000)).w
                moveq   #2,d0
                jsr     (Sleep).w       
                dbf     d7,loc_5F16E
                rts

    ; End of function sub_5F16C

plt_5F17E:      dc.w 0
                dc.w $C40
                dc.w $E84
                dc.w $26
                dc.w $6A
                dc.w $2AE
                dc.w $42
                dc.w $C4
                dc.w 0
                dc.w $222
                dc.w $666
                dc.w $AAA
                dc.w $20E
                dc.w $6CE
                dc.w $4E8
                dc.w $EEE
ce_5F19E:       mainEntity 0,0,UP
                entity 13,4,UP,MAPSPRITE_ZEON,eas_Init
                entity 13,8,UP,MAPSPRITE_GESHP,eas_Init
                entity 13,25,UP,MAPSPRITE_ODD_EYE,eas_Init
                dc.w $FFFF
ce_5F1BE:       mainEntity 63,63,UP
                entity 5,5,UP,MAPSPRITE_NAZCA_SHIP,eas_Init
                dc.w $FFFF
ce_5F1CE:       mainEntity 63,63,UP
                entity 25,19,UP,MAPSPRITE_NAZCA_SHIP,eas_Init
                dc.w $FFFF
ce_5F1DE:       mainEntity 0,0,UP
                entity 11,19,UP,MAPSPRITE_EXECUTIONER,eas_Init
                entity 63,63,RIGHT,MAPSPRITE_GESHP,eas_Init
                entity 9,16,RIGHT,MAPSPRITE_PRISM_FLOWER,eas_Init
                entity 13,17,UP,MAPSPRITE_PRISM_FLOWER,eas_Init
                entity 14,19,LEFT,MAPSPRITE_PRISM_FLOWER,eas_Init
                entity 15,20,UP,MAPSPRITE_PRISM_FLOWER,eas_Init
                entity 8,16,RIGHT,MAPSPRITE_DRAGONEWT,eas_Init
                entity 10,16,LEFT,MAPSPRITE_DRAGONEWT,eas_Init
                entity 11,16,LEFT,MAPSPRITE_DRAGONEWT,eas_Init
                entity 15,19,DOWN,MAPSPRITE_CHAOS_WIZARD,eas_Init
                entity 13,19,RIGHT,MAPSPRITE_CHAOS_WIZARD,eas_Init
                dc.w $FFFF
ce_5F23E:       mainEntity 0,0,UP
                entity 12,16,RIGHT,MAPSPRITE_PRISM_FLOWER,eas_Init
                entity 16,18,RIGHT,MAPSPRITE_GESHP,eas_Init
                entity 13,17,RIGHT,MAPSPRITE_PRISM_FLOWER,eas_Init
                entity 14,19,RIGHT,MAPSPRITE_PRISM_FLOWER,eas_Init
                entity 15,20,RIGHT,MAPSPRITE_PRISM_FLOWER,eas_Init
                entity 11,16,RIGHT,MAPSPRITE_DRAGONEWT,eas_Init
                entity 12,17,RIGHT,MAPSPRITE_CHAOS_WIZARD,eas_Init
                entity 13,19,RIGHT,MAPSPRITE_DRAGONEWT,eas_Init
                entity 14,20,RIGHT,MAPSPRITE_CHAOS_WIZARD,eas_Init
                dc.w $FFFF
ce_5F28E:       mainEntity 0,0,UP
                entity 11,16,RIGHT,MAPSPRITE_DRAGONEWT,eas_Init
                entity 16,18,RIGHT,MAPSPRITE_GESHP,eas_Init
                entity 12,17,RIGHT,MAPSPRITE_CHAOS_WIZARD,eas_Init
                entity 13,19,RIGHT,MAPSPRITE_DRAGONEWT,eas_Init
                entity 14,20,RIGHT,MAPSPRITE_CHAOS_WIZARD,eas_Init
                entity 0,0,LEFT,MAPSPRITE_EFFECT5,eas_Init
                entity 0,0,LEFT,MAPSPRITE_EFFECT5,eas_Init
                entity 0,0,LEFT,MAPSPRITE_EFFECT5,eas_Init
                entity 0,0,LEFT,MAPSPRITE_EFFECT5,eas_Init
                entity 0,0,LEFT,MAPSPRITE_EFFECT5,eas_Init
                entity 0,0,LEFT,MAPSPRITE_EFFECT5,eas_Init
                entity 0,0,LEFT,MAPSPRITE_EFFECT5,eas_Init
                entity 0,0,LEFT,MAPSPRITE_EFFECT5,eas_Init
                entity 12,16,RIGHT,MAPSPRITE_PRISM_FLOWER,eas_Init
                entity 13,17,RIGHT,MAPSPRITE_PRISM_FLOWER,eas_Init
                entity 14,19,RIGHT,MAPSPRITE_PRISM_FLOWER,eas_Init
                entity 15,20,RIGHT,MAPSPRITE_PRISM_FLOWER,eas_Init
                dc.w $FFFF

; =============== S U B R O U T I N E =======================================


sub_5F31E:
                
                move.b  #$F0,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
                nop
csub_5F326:
                
                move.b  #$18,((byte_FFAEEE+5-$1000000)).w
                rts

    ; End of function sub_5F31E


; =============== S U B R O U T I N E =======================================


sub_5F32E:
                
                move.b  #$F8,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
                nop
                rts

    ; End of function sub_5F32E


; =============== S U B R O U T I N E =======================================


sub_5F338:
                
                moveq   #$F,d7
loc_5F33A:
                
                subq.b  #1,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
                nop
                moveq   #4,d0
                jsr     (Sleep).w       
                dbf     d7,loc_5F33A
                rts

    ; End of function sub_5F338

