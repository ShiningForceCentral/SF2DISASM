
; ASM FILE data\maps\entries\map59\mapsetups\s6_initfunction.asm :
; 0x5EAD8..0x5F34C : 

; =============== S U B R O U T I N E =======================================

ms_map59_InitFunction:
                
                 
                chkFlg  $3E7            ; Set after the Nazca ship shootdown scene
                bne.s   byte_5EB18      
                script  cs_5EB44
                script  cs_5EBFC
                script  cs_5ED06
                script  cs_5EDB8
                script  cs_5EF60
                setFlg  $3E7            ; Set after the Nazca ship shootdown scene
                move.b  #$2D,((EGRESS_MAP_INDEX-$1000000)).w 
                setFlg  $1B4            ; Battle 36 unlocked
                setFlg  $1B8            ; Battle 40 unlocked
                setFlg  $1BA            ; Battle 42 unlocked
                setFlg  $1BB            ; Battle 43 unlocked
                rts
byte_5EB18:
                
                chkFlg  $1BB            ; Battle 43 unlocked
                beq.s   return_5EB24
                script  cs_5EB26
return_5EB24:
                
                rts

	; End of function ms_map59_InitFunction

cs_5EB26:       executeSubroutine csub_5EB34
                warp $3B,$D,$22,$1
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

cs_5EB44:       textCursor $E73
                setCameraEntity $FFFF
                reloadMap 8,2
                loadMapEntities ce_5F19E
                setActscriptWait $0,eas_Init
                csWait 60
                playSound MUSIC_WITCH
                csWait 30
                setActscript $80,eas_Transparent
                fadeInFromBlackHalf
                nextSingleText $0,$80   ; "{LEADER} is almost here{N}already?{W1}"
                nextSingleText $80,$81  ; "Yes, sir.  With an ancient{N}aircraft.  He'll be passing{N}over the cape soon.{W1}"
                nextSingleText $0,$80   ; "Good.  I'll do anything to{N}get my powers back.{W1}"
                nextText $80,$81        ; "They're stronger than we{N}thought.{W2}"
                nextSingleText $80,$81  ; "But, I have an idea.  Please{N}let me try it.{W1}"
                nextSingleText $0,$80   ; "Well?{W1}"
                nextText $80,$81        ; "I think it's better for us{N}to shoot them down over the{N}"
                nextSingleText $80,$81  ; "cape.{W1}"
                nextSingleText $0,$80   ; "I agree.{W1}"
                nextText $80,$81        ; "Thank you.  Then... may I{W2}"
                nextSingleText $80,$81  ; "borrow Odd Eye?{W1}"
                nextText $0,$80         ; "He's still damaged from his{N}battle against Volcanon.{W2}"
                nextSingleText $0,$80   ; "Take Red Baron instead.{W1}"
                shiver $81
                shiver $81
                nextSingleText $80,$81  ; "Thank you, sir.{W1}"
                nextSingleText $0,$80   ; "They'll be passing over the{N}cape soon.  Go!{W1}"
                nextSingleText $80,$81  ; "Yes, sir!{W1}"
                animEntityFX $81,6
                nextSingleText $0,$82   ; "That Geshp!  He wants{N}everything.{W1}"
                setPos $82,9,9,DOWN
                animEntityFX $82,7
                entityActionsWait $82
                 moveRight 4
                 moveUp 1
                endActions
                nextSingleText $0,$80   ; "You noticed that too?{W1}"
                nod $82
                nextText $0,$82         ; "Yes, King Zeon.{W2}"
                nextSingleText $0,$82   ; "I'm afraid Geshp can't stop{N}{LEADER}'s advance.{W1}"
                nextSingleText $0,$80   ; "You really think so?{W1}"
                nextText $0,$82         ; "I was just thinking of{N}{LEADER}'s hidden powers.{W2}"
                nextSingleText $0,$82   ; "We must never underestimate{N}him.{W1}"
                nextSingleText $0,$80   ; "Anyway, it will be a{N}fantastic show!  Ha, ha!{W1}"
                csc_end
cs_5EBFC:       loadMapFadeIn 53,8,14
                textCursor $E8B
                loadMapEntities ce_5F1DE
                setActscriptWait $0,eas_Init
                stopEntity $82
                stopEntity $83
                stopEntity $84
                stopEntity $85
                playSound MUSIC_BATTLE_THEME_1
                fadeInB
                setActscriptWait $82,eas_Init
                setActscriptWait $86,eas_Init
                setActscriptWait $87,eas_Init
                setActscriptWait $88,eas_Init
                customActscriptWait $82
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $86
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $87
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $88
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $82
                 moveRight 3
                endActions
                entityActions $86
                 moveRight 3
                endActions
                entityActions $87
                 moveRight 3
                endActions
                entityActions $88
                 moveRight 3
                endActions
                setFacing $80,LEFT
                csWait 30
                setFacing $80,RIGHT
                csWait 30
                shiver $80
                nextSingleText $0,$80   ; "Finish the preparations{N}before the Nazca Ship flies{N}over the cape!{W1}"
                setCamDest 10,14
                setPos $81,15,16,DOWN
                animEntityFX $81,7
                nextSingleText $80,$81  ; "How are the Prism Flowers?{W1}"
                nextSingleText $0,$80   ; "They're ready!{W1}"
                nextSingleText $80,$81  ; "Excellent!{W1}"
                nod $81
                setCameraEntity $81
                entityActionsWait $81
                 moveRight 2
                 moveUp 2
                endActions
                setFacing $81,RIGHT
                nextText $80,$81        ; "Now, c'mon Granseal losers!{W2}"
                nextSingleText $80,$81  ; "The Prism Flowers are waiting{N}for you!  Hee, heee!{W1}"
                nod $81
                nod $81
                csc_end
cs_5ED06:       textCursor $E91
                loadMapFadeIn 73,0,0
                loadMapEntities ce_5F1BE
                setActscriptWait $0,eas_Init
                executeSubroutine sub_5F31E
                playSound MUSIC_MITULA_SHRINE
                setBlocks 0,10,22,10,42,10
                fadeInB
                executeSubroutine sub_5FD92
                nextSingleText $80,$1A  ; "There's Grans Island!{W1}"
                nextSingleText $80,$7   ; "Alright!{W1}"
                nextSingleText $0,$1F   ; "We've finally come home.{W1}"
                loadMapFadeIn 53,10,13
                loadMapEntities ce_5F23E
                setActscriptWait $0,eas_Init
                playSound MUSIC_BATTLE_THEME_1
                stopEntity $80
                stopEntity $82
                stopEntity $83
                stopEntity $84
                fadeInB
                nextSingleText $80,$81  ; "I see the Nazca Ship!{N}Everybody, get ready!{W1}"
                loadMapFadeIn 73,0,0
                loadMapEntities ce_5F1BE
                setActscriptWait $0,eas_Init
                executeSubroutine sub_5F31E
                playSound MUSIC_MITULA_SHRINE
                setBlocks 0,10,22,10,42,10
                fadeInB
                executeSubroutine sub_5FD92
                nextSingleText $0,$1F   ; "What's that?  I saw a flash{N}of light over there.{W1}"
                nextSingleText $80,$7   ; "I didn't see it.  You must be{N}seeing things because you're{N}so old!  Ha, ha!{W1}"
                nextText $0,$1F         ; "(Grumble)....{W2}"
                nextSingleText $0,$1F   ; "Someday, {NAME;7}....{W1}"
                csc_end
cs_5EDB8:       textCursor $E99
                loadMapFadeIn 53,10,13
                loadMapEntities ce_5F28E
                setActscriptWait $0,eas_Init
                playSound MUSIC_ENEMY_ATTACK
                setActscript $85,eas_5EF46
                setActscript $86,eas_5EF46
                setActscript $87,eas_5EF46
                setActscript $88,eas_5EF46
                setActscript $89,eas_5EF46
                setActscript $8A,eas_5EF46
                setActscript $8B,eas_5EF46
                setActscript $8C,eas_5EF46
                stopEntity $8D
                stopEntity $8E
                stopEntity $8F
                stopEntity $90
                fadeInB
                setFacing $81,LEFT
                nextSingleText $80,$81  ; "NOW!{W1}"
                entityActionsWait $81
                 moveRight 1
                endActions
                nextSingleText $80,$81  ; "Shoot them!  Shoot them!{W1}"
                playSound SFX_BATTLEFIELD_DEATH
                setPos $85,12,16,LEFT
                csWait 30
                setFacing $85,UP
                playSound SFX_PRISM_LASER_CUTSCENE_FIRING
                setPos $85,13,15,UP
                entityActions $85
                 moveUpRight 10
                endActions
                flashScreenWhite $2
                setPos $86,13,15,UP
                entityActions $86
                 moveUpRight 10
                endActions
                csWait 20
                playSound SFX_BATTLEFIELD_DEATH
                setPos $87,13,17,LEFT
                csWait 30
                setFacing $87,UP
                playSound SFX_PRISM_LASER_CUTSCENE_FIRING
                setPos $87,14,16,UP
                entityActions $87
                 moveUpRight 10
                endActions
                flashScreenWhite $2
                setPos $88,14,16,UP
                entityActions $88
                 moveUpRight 10
                endActions
                playSound SFX_BATTLEFIELD_DEATH
                setPos $89,14,19,LEFT
                csWait 30
                setFacing $89,UP
                playSound SFX_PRISM_LASER_CUTSCENE_FIRING
                setPos $89,15,18,UP
                entityActions $89
                 moveUpRight 10
                endActions
                flashScreenWhite $2
                setPos $8A,15,18,UP
                entityActions $8A
                 moveUpRight 10
                endActions
                csWait 10
                playSound SFX_BATTLEFIELD_DEATH
                setPos $8B,15,20,LEFT
                csWait 30
                setFacing $8B,UP
                playSound SFX_PRISM_LASER_CUTSCENE_FIRING
                setPos $8B,16,19,UP
                entityActions $8B
                 moveUpRight 10
                endActions
                flashScreenWhite $2
                setPos $8C,16,19,UP
                entityActions $8C
                 moveUpRight 10
                endActions
                playSound SFX_BATTLEFIELD_DEATH
                setPos $8B,12,16,LEFT
                csWait 30
                setFacing $8B,UP
                playSound SFX_PRISM_LASER_CUTSCENE_FIRING
                setPos $8B,13,15,UP
                entityActions $8B
                 moveUpRight 10
                endActions
                flashScreenWhite $2
                setPos $8C,13,15,UP
                entityActionsWait $8C
                 moveUpRight 10
                endActions
                csc_end
eas_5EF46:       ac_setAnimSpeedX2 $FFFF
                 ac_setTransparency $FFFF
                 ac_set1Cb5 $0
                 ac_autoFacing $0
                 ac_setSpeed 64,64
                 ac_jump eas_Idle
cs_5EF60:       textCursor $E9B
                loadMapFadeIn 37,4,6
                loadEntitiesFromMapSetup 9,11,DOWN
                executeSubroutine InitNazcaShipForceMembers
                setPos $1A,8,10,RIGHT
                executeSubroutine sub_5F32E
                setActscriptWait $7,eas_Init
                setActscriptWait $1F,eas_Init
                setActscriptWait $1A,eas_Init
                setPos $80,9,12,UP
                setPos $7,10,12,UP
                setPos $1A,10,11,LEFT
                fadeInB
                shiver $80
                nextSingleText $0,$80   ; "I did see something!{W1}"
                nextSingleText $80,$7   ; "Well, I didn't.{W1}"
                nextSingleText $0,$80   ; "This could be bad.{W1}"
                nextSingleText $80,$1A  ; "Sir Astral!  {LEADER}!{N}Something is coming straight{N}towards us!{W1}"
                nextSingleText $0,$80   ; "What is it?{W1}"
                playSound SFX_BATTLEFIELD_DEATH
                setQuake 3
                flashScreenWhite $14
                setQuake 1
                csWait 10
                setQuake 0
                entityActionsWait $7
                 moveRight 1
                 jumpRight 1
                 jumpLeft 1
                 jumpRight 1
                 jumpLeft 1
                endActions
                setFacing $7,LEFT
                nextSingleText $80,$7   ; "Oooouu!!  What was that?!{N}Lightning?{W1}"
                setFacing $0,RIGHT
                setFacing $1A,DOWN
                nextText $80,$1A        ; "An attack from the ground.{W2}"
                nextSingleText $80,$1A  ; "I can't control the ship!{W1}"
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
                nextText $80,$1A        ; "We've sustained damage to{N}the engine!{W2}"
                nextSingleText $80,$1A  ; "We might crash!{W1}"
                entityActionsWait $80
                 moveRight 1
                endActions
                setFacing $80,UP
                shiver $80
                nextText $0,$80         ; "Crash?!{W2}"
                nextSingleText $80,$1A  ; "Geshp's trap!  Darn!{W1}"
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
                setActscriptWait $7,eas_Jump
                setActscriptWait $7,eas_Jump
                nextText $80,$7         ; "I don't want to crash!{W2}"
                nextSingleText $80,$7   ; "Sir Astral, please help us!{W1}"
                nextSingleText $0,$80   ; "{NAME;26}, can you land on{N}that cape before the ship{N}crashes?{W1}"
                nextSingleText $80,$1A  ; "I'm not sure,{W2}"
                playSound SFX_BATTLEFIELD_DEATH
                setQuake 3
                flashScreenWhite $14
                setQuake 1
                csWait 10
                nextSingleText $80,$1A  ; "but I'll try.{W1}"
                playSound SFX_BATTLEFIELD_DEATH
                setQuake 3
                flashScreenWhite $14
                setQuake 1
                csWait 10
                setQuake 3
                executeSubroutine sub_5F338
                fadeOutB
                setQuake 0
                mapLoad 75,20,14
                loadMapEntities ce_5F1CE
                setActscriptWait $0,eas_Init
                setCameraEntity $80
                customActscriptWait $80
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                cameraSpeed $10
                entityActions $80
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
                waitIdle $80
                setBlocks 56,59,4,5,12,17
                csWait 120
                setQuake 0
                executeSubroutine csub_5F14C
                csWait 120
                warp $25,$8,$C,$3
                csc_end

; =============== S U B R O U T I N E =======================================

csub_5F14C:
                
                lea     plt_5F17E(pc), a0
                lea     (PALETTE_4_BASE).l,a1
                moveq   #$20,d7 
                jsr     (CopyBytes).w   
                lea     (PALETTE_1_BASE).l,a0
                clr.b   ((byte_FFDFAB-$1000000)).w
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
                entity 13,4,UP,251,eas_Init
                entity 13,8,UP,159,eas_Init
                entity 13,25,UP,160,eas_Init
                dc.w $FFFF
ce_5F1BE:       mainEntity 63,63,UP
                entity 5,5,UP,253,eas_Init
                dc.w $FFFF
ce_5F1CE:       mainEntity 63,63,UP
                entity 25,19,UP,253,eas_Init
                dc.w $FFFF
ce_5F1DE:       mainEntity 0,0,UP
                entity 11,19,UP,92,eas_Init
                entity 63,63,RIGHT,159,eas_Init
                entity 9,16,RIGHT,157,eas_Init
                entity 13,17,UP,157,eas_Init
                entity 14,19,LEFT,157,eas_Init
                entity 15,20,UP,157,eas_Init
                entity 8,16,RIGHT,90,eas_Init
                entity 10,16,LEFT,90,eas_Init
                entity 11,16,LEFT,90,eas_Init
                entity 15,19,DOWN,138,eas_Init
                entity 13,19,RIGHT,138,eas_Init
                dc.w $FFFF
ce_5F23E:       mainEntity 0,0,UP
                entity 12,16,RIGHT,157,eas_Init
                entity 16,18,RIGHT,159,eas_Init
                entity 13,17,RIGHT,157,eas_Init
                entity 14,19,RIGHT,157,eas_Init
                entity 15,20,RIGHT,157,eas_Init
                entity 11,16,RIGHT,90,eas_Init
                entity 12,17,RIGHT,138,eas_Init
                entity 13,19,RIGHT,90,eas_Init
                entity 14,20,RIGHT,138,eas_Init
                dc.w $FFFF
ce_5F28E:       mainEntity 0,0,UP
                entity 11,16,RIGHT,90,eas_Init
                entity 16,18,RIGHT,159,eas_Init
                entity 12,17,RIGHT,138,eas_Init
                entity 13,19,RIGHT,90,eas_Init
                entity 14,20,RIGHT,138,eas_Init
                entity 0,0,LEFT,186,eas_Init
                entity 0,0,LEFT,186,eas_Init
                entity 0,0,LEFT,186,eas_Init
                entity 0,0,LEFT,186,eas_Init
                entity 0,0,LEFT,186,eas_Init
                entity 0,0,LEFT,186,eas_Init
                entity 0,0,LEFT,186,eas_Init
                entity 0,0,LEFT,186,eas_Init
                entity 12,16,RIGHT,157,eas_Init
                entity 13,17,RIGHT,157,eas_Init
                entity 14,19,RIGHT,157,eas_Init
                entity 15,20,RIGHT,157,eas_Init
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

