
; ASM FILE data\maps\entries\map63\mapsetups\s6_initfunction.asm :
; 0x5CA50..0x5CDFE : 

; =============== S U B R O U T I N E =======================================

ms_map63_InitFunction:
                
                 
                chkFlg  $1D             ; Claude joined
                bne.s   return_5CA5C
                script  cs_5CA5E
return_5CA5C:
                
                rts

	; End of function ms_map63_InitFunction

cs_5CA5E:       setSprite $1D,$B0
                setFacing $1D,DOWN
                stopEntity $1D
                csc_end
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
cs_5CBB4:       textCursor $1053
                nextSingleText $FF,$FF  ; "{LEADER} put the Arm of{N}Golem on the golem.{W1}"
                setSprite $1D,$1D
                startEntity $1D
                nextSingleText $0,$1D   ; "O...ooo...wow!{W1}"
                setActscriptWait $1D,eas_Jump
                setQuake 2
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 20
                setQuake 0
                csWait 40
                setFacing $1D,LEFT
                csWait 20
                setFacing $1D,UP
                csWait 20
                setFacing $1D,RIGHT
                csWait 20
                setFacing $1D,DOWN
                setActscriptWait $1D,eas_Jump
                setQuake 2
                playSound SFX_DOOR_OPEN_HIGH_PITCH
                csWait 20
                setQuake 0
                csWait 30
                nextText $0,$1D         ; "That feels good....{N}My power is back!{W1}"
                nextText $0,$1D         ; "Thank you.{N}I can move again!{N}How can I express...{W1}"
                nextSingleText $0,$1D   ; "Oh, yes!  I'll join you!{N}I'll protect you!{W1}"
                join $1D
                addNewFollower $1D
                csc_end
cs_5CC26:       entityFlashWhite $0,$32
                setActscript $0,eas_RotateRightHighSpeed
                csWait 30
                executeSubroutine FadeOutToWhite
                mapLoad 64,0,0
                loadEntitiesFromMapSetup 5,4,UP
                executeSubroutine csub_5CDDC
                setActscript $0,eas_RotateRightHighSpeed
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
                mapLoad 63,3,3
                loadEntitiesFromMapSetup 8,7,UP
                setActscript $0,eas_RotateRightHighSpeed
                executeSubroutine FadeInFromWhite
                csWait 30
                entityFlashWhite $0,$32
                setActscriptWait $0,eas_Init
                startEntity $0
                csc_end
cs_5CCF6:       entityFlashWhite $0,$32
                setActscript $0,eas_RotateRightHighSpeed
                csWait 30
                executeSubroutine FadeOutToWhite
                mapLoad 64,0,0
                loadEntitiesFromMapSetup 5,4,UP
                executeSubroutine sub_5CDE4
                setActscript $0,eas_RotateRightHighSpeed
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
                mapLoad 63,5,17
                loadEntitiesFromMapSetup 10,21,UP
                setActscript $0,eas_RotateRightHighSpeed
                executeSubroutine FadeInFromWhite
                csWait 30
                entityFlashWhite $0,$32
                setActscriptWait $0,eas_Init
                startEntity $0
                jumpIfFlagSet $1D,cs_5CDDA; Claude joined
                setSprite $1D,$B0
                setFacing $1D,DOWN
                stopEntity $1D
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

