
; ASM FILE data\battles\entries\battle42\cs_beforebattle.asm :
; 0x4ED8E..0x4EF04 : Cutscene before battle 42
bbcs_42:        textCursor 3088
                loadMapFadeIn MAP_ZEON_ARENA,8,29
                loadMapEntities ce_4EEDC
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,12,36,UP
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,14,36,UP
                setActscriptWait ALLY_LEMON,eas_Init
                setPos ALLY_LEMON,13,36,UP
                jumpIfFlagClear 76,cs_4EDE8 ; Zynk is a follower
                setActscriptWait ALLY_ZYNK,eas_Init
                setPos ALLY_ZYNK,63,62,DOWN
cs_4EDE8:       stopEntity 129
                customActscriptWait 129
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                playSound MUSIC_WITCH
                fadeInFromBlackHalf
                cameraSpeed $30
                csWait 60
                entityActionsWait ALLY_PETER
                 moveUp 2
                endActions
                nextSingleText $0,ALLY_PETER ; "I can't see!  Is anybody{N}there?{W1}"
                nextSingleText $C0,128  ; "Welcome...{W1}"
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscript FOLLOWER_B,eas_Jump
                setActscriptWait ALLY_LEMON,eas_Jump
                entityActionsWait FOLLOWER_B
                 moveUp 3
                endActions
                nextSingleText $0,FOLLOWER_B ; "King Galam?{W1}"
                nextSingleText $C0,128  ; "Is it too dark?{N}Let there be light!{W1}"
                fadeInB
                nextSingleText $C0,128  ; "Is that better?{W1}"
                entityActions ALLY_BOWIE
                 moveUp 2
                endActions
                entityActionsWait ALLY_LEMON
                 moveUp 2
                endActions
                shiver FOLLOWER_B
                nextSingleText $0,FOLLOWER_B ; "King Galam!{W1}"
                entityActions ALLY_BOWIE
                 moveLeft 1
                endActions
                entityActionsWait ALLY_LEMON
                 moveUp 1
                endActions
                setFacing ALLY_BOWIE,UP
                entityActionsWait ALLY_LEMON
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_LEMON ; "Oh, Princess Elis is here!{W1}"
                setCamDest 8,13
                nextSingleText $C0,128  ; "Nice to see you again,{N}Astral.  I see {NAME;28} is{N}with you.{W1}"
                nextSingleText $0,FOLLOWER_B ; "Where's Zeon?{W1}"
                nextText $C0,128        ; "He has not revived fully yet.{W2}"
                nextSingleText $C0,128  ; "So I came to welcome you for{N}him.{W1}"
                nextSingleText $0,ALLY_PETER ; "She isn't moving!{N}Is she dead?{W1}"
                setFacing 128,UP
                csWait 40
                setFacing 128,DOWN
                nextSingleText $C0,128  ; "We haven't killed her yet.{N}She will be the first{N}sacrifice for King Zeon.{W1}"
                nextText $0,FOLLOWER_B  ; "What?!{W2}"
                nextSingleText $0,FOLLOWER_B ; "Zeon said, you'd return her{N}in exchange for the jewel!{W1}"
                nextText $C0,128        ; "Ha, ha, ha!  He lied.{W2}"
                nextText $C0,128        ; "You killed our greater{N}devils.{N}I can't allow this to go on.{W2}"
                nextSingleText $C0,128  ; "You shall never see Zeon!{N}I'll kill you before that!{W1}"
                setQuake 3
                playSound SFX_INTRO_LIGHTNING
                flashScreenWhite $1E
                csWait 20
                setQuake 0
                csc_end
ce_4EEDC:       mainEntity 13,35,UP
                entity 12,36,UP,ALLY_PETER,eas_Init
                entity 13,36,UP,ALLY_LEMON,eas_Init
                entity 13,18,DOWN,MAPSPRITE_GALAM_EVIL,eas_Init
                entity 13,15,DOWN,MAPSPRITE_ELIS,eas_Init
                dc.w $FFFF
