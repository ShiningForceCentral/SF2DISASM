
; ASM FILE data\maps\entries\map41\mapsetups\scripts.asm :
; 0x5F4B8..0x5F630 : 
cs_5F4B8:       setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                csWait 40
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 3
                csWait 40
                playSound SFX_BIG_DOOR_RUMBLE
                csWait 5
                setActscript ALLY_BOWIE,eas_2xRightLeft
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                csWait 5
                setActscript FOLLOWER_B,eas_2xRightLeft
                playSound SFX_BIG_DOOR_RUMBLE
                csWait 40
                playSound SFX_BIG_DOOR_RUMBLE
                csWait 40
                playSound SFX_BIG_DOOR_RUMBLE
                csWait 40
                playSound SFX_BIG_DOOR_RUMBLE
                setBlocks 13,6,3,5,5,4
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                playSound SFX_BIG_DOOR_RUMBLE
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                setFacing FOLLOWER_B,UP
                csWait 60
                setBlocks 13,0,3,5,5,4
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 16387
                csWait 40
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                csWait 50
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                csc_end
cs_5F594:       newEntity ALLY_LEMON,6,15,UP,MAPSPRITE_TAROS
                textCursor 3513
                nextSingleText $0,ALLY_LEMON ; "Sir Astral!  {LEADER}!{W1}"
                setDest FOLLOWER_B,6,10
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_PETER,DOWN
                setFacing FOLLOWER_B,DOWN
                setCamDest 1,6
                nextSingleText $0,ALLY_LEMON ; "{LEADER}, wait!{W1}"
                entityActionsWait ALLY_LEMON
                 moveUp 4
                endActions
                nextSingleText $0,ALLY_LEMON ; "May I join your force?{W1}"
                csWait 30
                setFacing FOLLOWER_B,UP
                csWait 30
                nextSingleText $80,FOLLOWER_B ; "Well...{W1}"
                setFacing FOLLOWER_B,DOWN
                nextText $0,ALLY_LEMON  ; "You can trust me.{N}I'm a born fighter.{W2}"
                nextText $0,ALLY_LEMON  ; "As you know, I want to die.{W2}"
                nextSingleText $0,ALLY_LEMON ; "I will die fighting for your{N}cause, if you let me.{W1}"
                csWait 40
                setFacing FOLLOWER_B,UP
                nextSingleText $80,FOLLOWER_B ; "He's a hero in Galam.{N}I think he should join us.{W1}"
                nod ALLY_PETER
                nod ALLY_BOWIE
                setFacing FOLLOWER_B,DOWN
                csWait 20
                nod FOLLOWER_B
                nextSingleText $0,FOLLOWER_B ; "{NAME;28}, please come{N}with us.  You'll be a great{N}help.{W1}"
                join ALLY_LEMON
                setActscriptWait ALLY_LEMON,eas_Jump
                setActscriptWait ALLY_LEMON,eas_Jump
                nextSingleText $0,ALLY_LEMON ; "Oh, thank you!  I know I can{N}take the King of the Devils!{W1}"
                setFacing FOLLOWER_B,UP
                followEntity ALLY_LEMON,FOLLOWER_B,2
                csc_end
