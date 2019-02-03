
; ASM FILE data\maps\entries\map41\mapsetups\s6_initfunction.asm :
; 0x5F4A0..0x5F630 : 

; =============== S U B R O U T I N E =======================================

ms_map41_InitFunction:
                
                 
                chkFlg  $3A2            ; set after opening Devil's Head with the Force Sword
                beq.s   return_5F4AC
                script  cs_5F4AE
return_5F4AC:
                
                rts

	; End of function ms_map41_InitFunction

cs_5F4AE:       setBlocks 13,0,3,5,5,4
                csc_end
cs_5F4B8:       setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setActscriptWait $1F,eas_Init
                csWait 40
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 3
                csWait 40
                playSound SFX_BIG_DOOR_RUMBLE
                csWait 5
                setActscript $0,eas_461B6
                csWait 5
                setActscript $7,eas_461B6
                csWait 5
                setActscript $1F,eas_461B6
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
                setFacing $0,UP
                setFacing $7,UP
                setFacing $1F,UP
                csWait 60
                setBlocks 13,0,3,5,5,4
                playSound SFX_BLAST_SPELL
                flashScreenWhite $4
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 16387
                csWait 40
                setActscript $0,eas_Jump
                setActscript $7,eas_Jump
                setActscriptWait $1F,eas_Jump
                setActscript $0,eas_Jump
                setActscript $7,eas_Jump
                setActscriptWait $1F,eas_Jump
                csWait 50
                followEntity $7,$0,$2
                followEntity $1F,$7,$2
                csc_end
cs_5F594:       newEntity $1C,6,15,UP,$FF
                textCursor $DB9
                nextSingleText $0,$1C   ; "Sir Astral!  {LEADER}!{W1}"
                setDest $1F,6,10
                setFacing $0,DOWN
                setFacing $7,DOWN
                setFacing $1F,DOWN
                setCamDest 1,6
                nextSingleText $0,$1C   ; "{LEADER}, wait!{W1}"
                entityActionsWait $1C
                 moveUp 4
                endActions
                nextSingleText $0,$1C   ; "May I join your force?{W1}"
                csWait 30
                setFacing $1F,UP
                csWait 30
                nextSingleText $80,$1F  ; "Well...{W1}"
                setFacing $1F,DOWN
                nextText $0,$1C         ; "You can trust me.{N}I'm a born fighter.{W2}"
                nextText $0,$1C         ; "As you know, I want to die.{W2}"
                nextSingleText $0,$1C   ; "I will die fighting for your{N}cause, if you let me.{W1}"
                csWait 40
                setFacing $1F,UP
                nextSingleText $80,$1F  ; "He's a hero in Galam.{N}I think he should join us.{W1}"
                nod $7
                nod $0
                setFacing $1F,DOWN
                csWait 20
                nod $1F
                nextSingleText $0,$1F   ; "{NAME;28}, please come{N}with us.  You'll be a great{N}help.{W1}"
                join $1C
                setActscriptWait $1C,eas_Jump
                setActscriptWait $1C,eas_Jump
                nextSingleText $0,$1C   ; "Oh, thank you!  I know I can{N}take the King of the Devils!{W1}"
                setFacing $1F,UP
                followEntity $1C,$1F,$2
                csc_end
