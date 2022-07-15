
; ASM FILE data\battles\entries\battle31\cs_beforebattle.asm :
; 0x4C994..0x4CBE2 : Cutscene before battle 31
bbcs_31:        textCursor 2811
                loadMapFadeIn MAP_PACALON,16,2
                loadMapEntities ce_4CB92
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,20,3,DOWN
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,22,3,DOWN
                setActscriptWait ALLY_FRAYJA,eas_Init
                setPos ALLY_FRAYJA,21,3,DOWN
                animEntityFX 128,6
                animEntityFX 129,6
                setActscript 130,eas_AnimSpeedx2
                playSound MUSIC_BATTLE_THEME_1
                fadeInB
                cameraSpeed $30
                nextSingleText $C0,128  ; "Finally, you've left the{N}castle, Vicar {NAME;22}.{W1}"
                setCamDest 16,5
                animEntityFX 128,7
                nextSingleText $0,ALLY_PETER ; "Geshp!{W1}"
                nextSingleText $C0,128  ; "So, you remember me. {W1}"
                setCamDest 16,2
                entityActionsWait FOLLOWER_B
                 moveDown 1
                endActions
                nextSingleText $0,FOLLOWER_B ; "What do you want?{W1}"
                nextText $C0,128        ; "I have plans for you.{W2}"
                nextSingleText $C0,128  ; "I'm very happy that you came{N}out of the castle.{W1}"
                nextSingleText $0,FOLLOWER_B ; "Why?{W1}"
                nextText $C0,128        ; "I have been waiting for{N}{NAME;22}.{W2}"
                nextText $C0,128        ; "Vicar {NAME;22}, you locked{N}the gate of Moun, remember?{W2}"
                nextSingleText $C0,128  ; "My faithful soldiers can't{N}enter Parmecia.{N}Now, you will open it!{W1}"
                setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $0,FOLLOWER_B ; "It's a trap!{W2}"
                entityActionsWait FOLLOWER_B
                 moveUp 1
                endActions
                setCamDest 16,0
                setFacing FOLLOWER_B,LEFT
                nextSingleText $0,FOLLOWER_B ; "{NAME;22}, run!{W1}"
                entityActionsWait ALLY_FRAYJA
                 moveUp 1
                endActions
                flashScreenWhite $2
                setPos 130,21,1,LEFT
                csWait 30
                setActscriptWait ALLY_FRAYJA,eas_Jump
                setActscriptWait ALLY_FRAYJA,eas_DeactivateAutoFacing
                entityActionsWait ALLY_FRAYJA
                 moveDown 1
                endActions
                nextSingleText $C0,128  ; "Ha, ha.  He can't.{W1}"
                setCamDest 16,6
                setFacing 128,DOWN
                nextSingleText $C0,128  ; "Cameela!  Cameeeeeela!{W1}"
                nextSingleText $0,ALLY_PETER ; "Cameela?!  We met her in{N}Pangoat Valley.{W1}"
                animEntityFX 129,7
                nextSingleText $0,129   ; "What?{W1}"
                nextText $C0,128        ; "Ah, Cameela.  You're here.{W2}"
                nextSingleText $C0,128  ; "Get the key for me!{W1}"
                nextSingleText $0,129   ; "Geshp, you're as devious as{N}usual.{W1}"
                entityActionsWait 128
                 moveDown 1
                endActions
                nextSingleText $C0,128  ; "That I am.  Now, get the key!{W1}"
                nextSingleText $0,129   ; "Me?!  Why?{W1}"
                stopEntity 128
                csWait 40
                customActscriptWait 128
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 128,eas_Jump
                setActscriptWait 128,eas_Jump
                setActscriptWait 128,eas_DeactivateAutoFacing
                entityActionsWait 128
                 moveUp 1
                endActions
                startEntity 128
                nextSingleText $C0,128  ; "Cameela!{W1}"
                nextText $0,129         ; "I hate you!{N}I won't help you.{W2}"
                nextText $0,129         ; "You want the key?{N}You get it!{N}You can use my army.{W2}"
                nextSingleText $0,129   ; "See you later.{W1}"
                animEntityFX 129,6
                nextText $C0,128        ; "That witch!{W2}"
                nextSingleText $C0,128  ; "Cameela!  Cameela!!{W1}"
                nextSingleText $0,ALLY_PETER ; "They're divided....{W1}"
                csWait 40
                shiver 128
                csWait 40
                setFacing 128,UP
                nextText $C0,128        ; "I don't need your help,{N}Cameela!{W2}"
                nextSingleText $C0,128  ; "Come on, devils!{N}Kill {LEADER} now!{W1}"
                setCamDest 16,13
                csWait 40
                setPos 131,19,18,UP
                setPos 132,21,19,UP
                setPos 133,22,18,UP
                setPos 134,23,15,UP
                setActscript 131,eas_Jump
                setActscript 132,eas_Jump
                setActscript 133,eas_Jump
                setActscriptWait 134,eas_Jump
                csWait 30
                setCamDest 16,6
                nextSingleText $C0,128  ; "Bye, {LEADER}.{W1}"
                nextSingleText $0,ALLY_PETER ; "You're not staying?{W1}"
                nextText $C0,128        ; "I'm good at using my brains,{N}not my strength.{W2}"
                nextSingleText $C0,128  ; "I'll return by the time{N}you're defeated.{W1}"
                animEntityFX 128,6
                csc_end
ce_4CB92:       mainEntity 21,4,DOWN
                entity 20,3,DOWN,ALLY_PETER,eas_Init
                entity 21,3,DOWN,ALLY_FRAYJA,eas_Init
                entity 21,8,UP,MAPSPRITE_GESHP,eas_Init
                entity 21,11,UP,MAPSPRITE_CAMEELA,eas_Init
                entity 63,63,LEFT,MAPSPRITE_FLAME1,eas_Init
                entity 63,63,UP,MAPSPRITE_DEATH_MONK,eas_Init
                entity 63,63,UP,MAPSPRITE_DARK_BISHOP,eas_Init
                entity 63,63,UP,MAPSPRITE_ORC_LORD,eas_Init
                entity 63,63,UP,MAPSPRITE_HARPY_QUEEN,eas_Init
                dc.w $FFFF
