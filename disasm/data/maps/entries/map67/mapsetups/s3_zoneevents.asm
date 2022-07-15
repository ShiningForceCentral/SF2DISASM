
; ASM FILE data\maps\entries\map67\mapsetups\s3_zoneevents.asm :
; 0x4FB0C..0x4FCCE : 
ms_map67_ZoneEvents:
                msZoneEvent 57, 25, Map67_ZoneEvent0-ms_map67_ZoneEvents
                msZoneEvent 56, 26, Map67_ZoneEvent1-ms_map67_ZoneEvents
                msZoneEvent 57, 26, Map67_ZoneEvent1-ms_map67_ZoneEvents
                msZoneEvent 58, 24, Map67_ZoneEvent1-ms_map67_ZoneEvents
                msZoneEvent 58, 25, Map67_ZoneEvent1-ms_map67_ZoneEvents
                msDefaultZoneEvent Map67_DefaultZoneEvent-ms_map67_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map67_ZoneEvent1:
                
                 
                chkFlg  520             ; Battle 20 completed - BATTLE_HARPIES_POND                
                bne.s   return_4FB30
                script  cs_4FB64
return_4FB30:
                
                rts

    ; End of function Map67_ZoneEvent1


; =============== S U B R O U T I N E =======================================


Map67_ZoneEvent0:
                
                 
                chkFlg  751             ; Set after Elric opens the passage to Devil's Tail
                bne.s   return_4FB56
                chkFlg  13              ; Elric joined
                beq.s   return_4FB56
                move.w  #$D,d0
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.s   return_4FB56
                script  cs_4FC32
                setFlg  751             ; Set after Elric opens the passage to Devil's Tail
return_4FB56:
                
                rts

    ; End of function Map67_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map67_DefaultZoneEvent:
                
                move.w  #$15,d0
                jsr     CheckRandomBattle
                rts

    ; End of function Map67_DefaultZoneEvent

cs_4FB64:       textCursor 2543
                setActscriptWait FOLLOWER_B,eas_Init
                setActscriptWait FOLLOWER_A,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $0,FOLLOWER_B ; "Wait!{W1}"
                setDest FOLLOWER_B,60,27
                csWait 5
                setActscript FOLLOWER_B,eas_2xRightLeft
                csWait 120
                setCamDest 53,24
                setDest ALLY_PETER,59,27
                setFacing ALLY_PETER,RIGHT
                nextSingleText $C0,ALLY_PETER ; "What's wrong, Oddler?{W1}"
                setDest ALLY_BOWIE,60,26
                setFacing ALLY_BOWIE,DOWN
                setFacing FOLLOWER_B,UP
                nextSingleText $0,FOLLOWER_B ; "{LEADER}...{NAME;7}...can{N}you hear that?{W1}"
                nextSingleText $C0,ALLY_PETER ; "Hear what?{W1}"
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                csWait 120
                setFacing ALLY_PETER,DOWN
                nextSingleText $C0,ALLY_PETER ; "I don't hear anything.{W1}"
                entityActionsWait FOLLOWER_B
                 moveDown 1
                endActions
                csWait 5
                setActscript FOLLOWER_B,eas_2xRightLeft
                csWait 120
                nextText $0,FOLLOWER_B  ; "Somebody is crying for help...{W2}"
                nextSingleText $0,FOLLOWER_B ; "from...over here.{W1}"
                setDest FOLLOWER_B,57,25
                setPos FOLLOWER_B,63,63,DOWN
                csWait 40
                setDest ALLY_PETER,57,25
                setPos ALLY_PETER,63,63,DOWN
                setDest ALLY_BOWIE,57,25
                setPos ALLY_BOWIE,63,63,DOWN
                warp MAP_HARPY_POOL,11,22,UP
                csc_end
cs_4FC32:       textCursor 2593
                newEntity ALLY_ELRIC,57,25,UP,MAPSPRITE_TAROS
                setActscriptWait ALLY_ELRIC,eas_Init
                entityActionsWait ALLY_ELRIC
                 moveUp 1
                endActions
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                setFacing FOLLOWER_B,UP
                nextSingleText $0,ALLY_ELRIC ; "Fairy said, move this rock{N}in this manner, and...{W1}"
                csWait 30
                playSound SFX_SECRET_PATH_ROCK
                csWait 30
                setFacing ALLY_ELRIC,DOWN
                setActscriptWait ALLY_ELRIC,eas_Jump
                setActscriptWait ALLY_ELRIC,eas_Jump
                nextSingleText $0,ALLY_ELRIC ; "Got it!  Thanks, fairy!{W1}"
                setQuake 1
                playSound SFX_BIG_DOOR_RUMBLE
                csWait 20
                setFacing ALLY_ELRIC,UP
                csWait 20
                playSound SFX_DESOUL_HOVERING
                setBlocks 0,0,3,2,56,22
                csWait 30
                setQuake 0
                csWait 30
                setFacing ALLY_ELRIC,DOWN
                nextSingleText $0,ALLY_ELRIC ; "{LEADER}, come on.{W1}"
                entityActionsWait ALLY_ELRIC
                 moveUp 1
                endActions
                hide ALLY_ELRIC
                entityActionsWait ALLY_BOWIE
                 moveUp 1
                endActions
                entityActions ALLY_BOWIE
                 moveUp 1
                endActions
                warp MAP_UNDERGROUND_PATH_1,29,3,LEFT
                csc_end
