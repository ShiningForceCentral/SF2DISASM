
; ASM FILE data\battles\entries\battle34\cs_beforebattle.asm :
; 0x4D342..0x4D4B6 : Cutscene before battle 34
bbcs_34:        textCursor 2895
                loadMapFadeIn MAP_CAMEELA_ARENA,21,22
                loadMapEntities ce_4D48E
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,30,28,LEFT
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,30,30,LEFT
                jumpIfFlagClear 76,cs_4D38E ; Zynk is a follower
                setActscriptWait ALLY_ZYNK,eas_Init
                setPos ALLY_ZYNK,31,29,LEFT
cs_4D38E:       animEntityFX 129,6
                playSound MUSIC_BATTLE_THEME_1
                fadeInB
                cameraSpeed $30
                entityActions ALLY_BOWIE
                 moveLeft 3
                endActions
                entityActions ALLY_PETER
                 moveLeft 3
                endActions
                entityActions 130
                 moveLeft 3
                endActions
                jumpIfFlagClear 76,cs_4D3C6 ; Zynk is a follower
                entityActions ALLY_ZYNK
                 moveLeft 3
                endActions
cs_4D3C6:       entityActionsWait FOLLOWER_B
                 moveLeft 3
                endActions
                nextSingleText $0,128   ; "Hello, Granseal soldiers.{W1}"
                setActscriptWait ALLY_PETER,eas_Jump
                setCamDest 7,5
                nextText $0,128         ; "Remember?  I promised that I{N}would see you again.{W2}"
                nextSingleText $0,128   ; "Come on.  Let's party!{W1}"
                setCamDest 7,4
                animEntityFX 129,7
                nextSingleText $C0,129  ; "Stop!  You need my war plan!{W1}"
                setFacing 128,UP
                nextSingleText $0,128   ; "You again, Geshp?  Why don't{N}you leave me alone?{W1}"
                nextText $C0,129        ; "Zeon left me in charge.{W2}"
                nextSingleText $C0,129  ; "It doesn't matter if you are{N}killed or not.{W1}"
                entityActionsWait 128
                 moveUp 1
                endActions
                nextText $0,128         ; "Then kill me, if you've{N}got the guts to do it!{W2}"
                nextSingleText $0,128   ; "I know.  You want me to be{N}die!{W1}"
                customActscriptWait 128
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 128
                 moveUp 4
                endActions
                csWait 10
                animEntityFX 129,6
                waitIdle 128
                setFacing 128,DOWN
                csWait 30
                csWait 5
                setActscript 128,eas_2xRightLeft
                csWait 120
                setFacing 128,DOWN
                nextSingleText $0,128   ; "Geshp, you coward!{N}I'll kill you first!{W1}"
                tintMap
                nextText $C0,129        ; "I have no time to waste.{N}I must go.{W2}"
                nextSingleText $C0,129  ; "Silly Cameela.{N}You can't survive without my{N}brains.{W1}"
                flickerOnce
                setCamDest 7,3
                csWait 60
                setActscriptWait 128,eas_Jump
                setFacing 128,RIGHT
                nextText $0,128         ; "{LEADER}, did you hear that?{N}He said you would win!{W2}"
                nextSingleText $0,128   ; "He must be a bad{N}fortuneteller.{W1}"
                setCamDest 21,22
                nextText $0,FOLLOWER_B  ; "We can get a ship and return{N}to Grans if we defeat her.{W2}"
                nextSingleText $0,FOLLOWER_B ; "{LEADER}, get her!{W1}"
                csc_end
ce_4D48E:       mainEntity 29,29,LEFT
                entity 30,28,LEFT,ALLY_PETER,eas_Init
                entity 11,10,DOWN,MAPSPRITE_CAMEELA,eas_Init
                entity 11,6,DOWN,MAPSPRITE_GESHP,eas_Init
                entity 30,29,LEFT,MAPSPRITE_CARAVAN,eas_Init
                dc.w $FFFF
