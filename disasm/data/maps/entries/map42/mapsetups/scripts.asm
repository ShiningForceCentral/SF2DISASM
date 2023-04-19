
; ASM FILE data\maps\entries\map42\mapsetups\scripts.asm :
; 0x5FE9A..0x5FF62 : 
cs_5FE9A:       textCursor 3337
                nextText $FF,255        ; "The Jewel of Light begins{N}to glow.{W2}"
                nextSingleText $FF,255  ; "The light seems to pull{N}{LEADER}.{D3}"
                setActscriptWait ALLY_BOWIE,eas_Init
                entityActionsWait ALLY_BOWIE
                 moveDown 1
                 moveDown 1
                 moveRight 1
                 moveRight 1
                 moveRight 1
                 moveRight 1
                endActions
                entityActionsWait ALLY_BOWIE
                 moveRight 1
                 moveRight 1
                 moveRight 1
                 moveUp 1
                 moveUp 1
                endActions
                entityActionsWait ALLY_BOWIE
                 moveUp 1
                 moveUp 1
                endActions
                csWait 60
                nextSingleText $FF,255  ; "The jewel glows even{N}brighter.{W1}"
                hideText
                csWait 40
                flashScreenWhite $14
                playSound SFX_BATTLEFIELD_DEATH
                setQuake 2
                setBlocks 33,1,1,1,26,18
                csWait 20
                setQuake 0
                csWait 60
                nextSingleText $0,FOLLOWER_B ; "Oh, an opening!{N}The light is leading us!{W1}"
                csc_end
cs_5FF06:       textCursor 3335
                hideText
                entityFlashWhite ALLY_BOWIE,$3C
                setBlocks 33,2,1,1,39,2
                newEntity 128,39,2,DOWN,MAPSPRITE_OBJECT3
                setActscript 128,eas_AnimSpeedx2
                executeSubroutine csub_5FF56
                hide 128
                setQuake 2
                setBlocks 0,32,7,6,0,0
                csWait 60
                playSound SFX_BATTLEFIELD_DEATH
                csWait 20
                setQuake 0
                nextSingleText $FF,255  ; "Sounds like something opened{N}somewhere.{W1}"
                nextSingleText $0,FOLLOWER_B ; "You got it!  All we have to{N}do is find the door to the{N}tower!{W1}"
                csc_end

; =============== S U B R O U T I N E =======================================


csub_5FF56:
                
                move.w  #$43,d0 
                moveq   #1,d1
                jmp     GetMandatoryItem

    ; End of function csub_5FF56

