
; ASM FILE data\battles\entries\battle05\cs_afterbattle.asm :
; 0x49B48..0x49BCA : Cutscene after battle 5
abcs_battle05:  textCursor 2332
                setActscriptWait ALLY_SLADE,eas_Init
                entityActionsWait ALLY_SLADE
                 moveDown 1
                 moveLeft 2
                endActions
                setFacing ALLY_SLADE,DOWN
                nextText $0,ALLY_SLADE  ; "This is the Jewel of Light{N}that I stole from the shrine.{W2}"
                nextSingleText $0,ALLY_SLADE ; "The other jewel is missing.{N}I'll give you this one now.{W1}"
                nextText $FF,255        ; "{LEADER} received the{N}Jewel of Light...{W2}{N}The jewel fused to{N}{LEADER}'s neck.{W1}"
                csWait 10
                setActscriptWait ALLY_SLADE,eas_Jump
                setActscriptWait ALLY_SLADE,eas_Jump
                nextText $0,ALLY_SLADE  ; "{LEADER}, did you use{N}magic?{W2}"
                setF 384                ; Set after Bowie obtains the jewel of light/evil... whichever it is
                csWait 30
                nextText $0,ALLY_SLADE  ; "Ummm...I can't remove it!{N}Is it cursed?{W2}"
                setActscriptWait ALLY_SLADE,eas_DeactivateAutoFacing
                nextText $0,ALLY_SLADE  ; "We'll go to the church{N}later to see if it's cursed.{N}At least we have it now.{W1}"
                nextText $0,ALLY_SLADE  ; "The knight said that King{N}Galam took the other jewel{N}with him.{W2}"
                nextSingleText $0,ALLY_SLADE ; "{LEADER}, I'll go to{N}Granseal with you.{W1}"
                join ALLY_SLADE
                nextText $0,ALLY_SLADE  ; "I have an obligation to find{N}the other jewel!{W2}"
                nextSingleText $0,ALLY_SLADE ; "Let's go to Granseal!{W1}"
                clearF 73               ; Slade is a follower
                setStoryFlag 6          ; Battle 6 unlocked - BATTLE_TO_GRANSEAL               
                followEntity ALLY_SLADE,ALLY_BOWIE,2
                warp MAP_GALAM_CASTLE,16,18,DOWN
                csc_end
