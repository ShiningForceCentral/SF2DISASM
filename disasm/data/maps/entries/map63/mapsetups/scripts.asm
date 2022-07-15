
; ASM FILE data\maps\entries\map63\mapsetups\scripts.asm :
; 0x5CA6E..0x5CDFE : 
cs_5CA6E:       setBlocks 16,54,1,1,13,43
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 20
                setBlocks 16,54,1,1,13,44
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 18
                setBlocks 16,54,1,1,13,45
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 16
                setBlocks 16,54,1,1,13,46
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 14
                setBlocks 16,54,1,1,13,47
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 12
                setBlocks 16,54,1,1,13,48
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 10
                setBlocks 16,54,1,1,14,48
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 8
                setBlocks 16,54,1,1,15,48
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 6
                setBlocks 16,54,1,1,15,49
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 5
                setBlocks 16,54,1,1,15,50
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 4
                setBlocks 16,54,1,1,15,51
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 3
                setBlocks 16,54,1,1,15,52
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 2
                setBlocks 16,54,1,1,15,53
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 1
                setBlocks 16,54,1,1,15,54
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 1
                csc_end
cs_5CB34:       setBlocksVar 16,53,1,1,15,54
                setBlocks 12,43,1,1,13,43
                csWait 30
                setBlocksVar 16,53,1,1,15,53
                setBlocks 16,53,1,1,13,44
                csWait 25
                setBlocksVar 16,53,1,1,15,52
                setBlocks 16,53,1,1,13,45
                csWait 20
                setBlocksVar 16,53,1,1,15,51
                setBlocks 16,53,1,1,13,46
                csWait 15
                setBlocksVar 16,53,1,1,15,50
                setBlocks 16,53,1,1,13,47
                csWait 10
                setBlocksVar 16,53,1,1,15,49
                setBlocks 16,53,1,1,13,48
                csWait 5
                setBlocksVar 16,53,1,1,15,48
                setBlocks 16,53,1,1,14,48
                csWait 1
                csc_end
cs_5CBB4:       textCursor 4179
                nextSingleText $FF,255  ; "{LEADER} put the Arm of{N}Golem on the golem.{W1}"
                setSprite ALLY_CLAUDE,ALLY_CLAUDE
                startEntity ALLY_CLAUDE
                nextSingleText $0,ALLY_CLAUDE ; "O...ooo...wow!{W1}"
                setActscriptWait ALLY_CLAUDE,eas_Jump
                setQuake 2
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 20
                setQuake 0
                csWait 40
                setFacing ALLY_CLAUDE,LEFT
                csWait 20
                setFacing ALLY_CLAUDE,UP
                csWait 20
                setFacing ALLY_CLAUDE,RIGHT
                csWait 20
                setFacing ALLY_CLAUDE,DOWN
                setActscriptWait ALLY_CLAUDE,eas_Jump
                setQuake 2
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 20
                setQuake 0
                csWait 30
                nextText $0,ALLY_CLAUDE ; "That feels good....{N}My power is back!{W1}"
                nextText $0,ALLY_CLAUDE ; "Thank you.{N}I can move again!{N}How can I express...{W1}"
                nextSingleText $0,ALLY_CLAUDE ; "Oh, yes!  I'll join you!{N}I'll protect you!{W1}"
                join ALLY_CLAUDE
                addNewFollower ALLY_CLAUDE
                csc_end
cs_5CC26:       entityFlashWhite ALLY_BOWIE,$32
                setActscript ALLY_BOWIE,eas_RotateRightHighSpeed
                csWait 30
                executeSubroutine FadeOutToWhite
                mapLoad MAP_MAGIC_TUNNEL_PIPE,0,0
                loadEntitiesFromMapSetup 5,4,UP
                executeSubroutine csub_5CDDC
                setActscript ALLY_BOWIE,eas_RotateRightHighSpeed
                executeSubroutine FadeInFromWhite
                csWait 30
                executeSubroutine sub_5CDEC
                csWait 20
                executeSubroutine sub_5CDEC
                csWait 20
                executeSubroutine sub_5CDEC
                csWait 20
                executeSubroutine sub_5CDEC
                csWait 20
                executeSubroutine sub_5CDEC
                csWait 20
                executeSubroutine sub_5CDEC
                csWait 20
                executeSubroutine sub_5CDEC
                csWait 20
                executeSubroutine sub_5CDEC
                csWait 20
                executeSubroutine sub_5CDEC
                csWait 20
                executeSubroutine sub_5CDEC
                csWait 30
                executeSubroutine FadeOutToWhite
                csWait 40
                executeSubroutine sub_5CDF8
                csWait 2
                mapLoad MAP_MAGIC_TUNNEL_HUB,3,3
                loadEntitiesFromMapSetup 8,7,UP
                setActscript ALLY_BOWIE,eas_RotateRightHighSpeed
                executeSubroutine FadeInFromWhite
                csWait 30
                entityFlashWhite ALLY_BOWIE,$32
                setActscriptWait ALLY_BOWIE,eas_Init
                startEntity ALLY_BOWIE
                csc_end
cs_5CCF6:       entityFlashWhite ALLY_BOWIE,$32
                setActscript ALLY_BOWIE,eas_RotateRightHighSpeed
                csWait 30
                executeSubroutine FadeOutToWhite
                mapLoad MAP_MAGIC_TUNNEL_PIPE,0,0
                loadEntitiesFromMapSetup 5,4,UP
                executeSubroutine sub_5CDE4
                setActscript ALLY_BOWIE,eas_RotateRightHighSpeed
                executeSubroutine FadeInFromWhite
                csWait 30
                executeSubroutine sub_5CDF2
                csWait 20
                executeSubroutine sub_5CDF2
                csWait 20
                executeSubroutine sub_5CDF2
                csWait 20
                executeSubroutine sub_5CDF2
                csWait 20
                executeSubroutine sub_5CDF2
                csWait 20
                executeSubroutine sub_5CDF2
                csWait 20
                executeSubroutine sub_5CDF2
                csWait 20
                executeSubroutine sub_5CDF2
                csWait 20
                executeSubroutine sub_5CDF2
                csWait 20
                executeSubroutine sub_5CDF2
                csWait 30
                executeSubroutine FadeOutToWhite
                csWait 40
                executeSubroutine sub_5CDF8
                csWait 2
                mapLoad MAP_MAGIC_TUNNEL_HUB,5,17
                loadEntitiesFromMapSetup 10,21,UP
                setActscript ALLY_BOWIE,eas_RotateRightHighSpeed
                executeSubroutine FadeInFromWhite
                csWait 30
                entityFlashWhite ALLY_BOWIE,$32
                setActscriptWait ALLY_BOWIE,eas_Init
                startEntity ALLY_BOWIE
                jumpIfFlagSet 29,cs_5CDDA ; Claude joined
                setSprite ALLY_CLAUDE,MAPSPRITE_POSE3
                setFacing ALLY_CLAUDE,DOWN
                stopEntity ALLY_CLAUDE
cs_5CDDA:       csc_end

; =============== S U B R O U T I N E =======================================


csub_5CDDC:
                
                move.b  #$A9,((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
                rts

    ; End of function csub_5CDDC


; =============== S U B R O U T I N E =======================================


sub_5CDE4:
                
                move.b  #$57,((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w 
                rts

    ; End of function sub_5CDE4


; =============== S U B R O U T I N E =======================================


sub_5CDEC:
                
                subq.b  #4,((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
                rts

    ; End of function sub_5CDEC


; =============== S U B R O U T I N E =======================================


sub_5CDF2:
                
                addq.b  #4,((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
                rts

    ; End of function sub_5CDF2


; =============== S U B R O U T I N E =======================================


sub_5CDF8:
                
                clr.b   ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
                rts

    ; End of function sub_5CDF8

