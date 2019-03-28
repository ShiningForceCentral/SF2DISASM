
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
                
                 
                chkFlg  $208            ; Battle 20 completed
                bne.s   return_4FB30
                script  cs_4FB64
return_4FB30:
                
                rts

	; End of function Map67_ZoneEvent1


; =============== S U B R O U T I N E =======================================

Map67_ZoneEvent0:
                
                 
                chkFlg  $2EF            ; Set after Elric opens the passage to Devil's Tail
                bne.s   return_4FB56
                chkFlg  $D              ; Elric joined
                beq.s   return_4FB56
                move.w  #$D,d0
                jsr     j_GetCurrentHP
                tst.w   d1
                beq.s   return_4FB56
                script  cs_4FC32
                setFlg  $2EF            ; Set after Elric opens the passage to Devil's Tail
return_4FB56:
                
                rts

	; End of function Map67_ZoneEvent0


; =============== S U B R O U T I N E =======================================

Map67_DefaultZoneEvent:
                
                move.w  #$15,d0
                jsr     CheckRandomBattle
                rts

	; End of function Map67_DefaultZoneEvent

cs_4FB64:       textCursor $9EF
                setActscriptWait $1F,eas_Init
                setActscriptWait $1E,eas_Init
                setActscriptWait $7,eas_Init
                setActscriptWait $1F,eas_Jump
                nextSingleText $0,$1F   ; "Wait!{W1}"
                setDest $1F,60,27
                csWait 5
                setActscript $1F,eas_461B6
                csWait 120
                setCamDest 53,24
                setDest $7,59,27
                setFacing $7,RIGHT
                nextSingleText $C0,$7   ; "What's wrong, Oddler?{W1}"
                setDest $0,60,26
                setFacing $0,DOWN
                setFacing $1F,UP
                nextSingleText $0,$1F   ; "{LEADER}...{NAME;7}...can{N}you hear that?{W1}"
                nextSingleText $C0,$7   ; "Hear what?{W1}"
                csWait 5
                setActscript $7,eas_461B6
                csWait 120
                setFacing $7,DOWN
                nextSingleText $C0,$7   ; "I don't hear anything.{W1}"
                entityActionsWait $1F
                 moveDown 1
                endActions
                csWait 5
                setActscript $1F,eas_461B6
                csWait 120
                nextText $0,$1F         ; "Somebody is crying for help...{W2}"
                nextSingleText $0,$1F   ; "from...over here.{W1}"
                setDest $1F,57,25
                setPos $1F,63,63,DOWN
                csWait 40
                setDest $7,57,25
                setPos $7,63,63,DOWN
                setDest $0,57,25
                setPos $0,63,63,DOWN
                warp $33,$B,$16,$1
                csc_end
cs_4FC32:       textCursor $A21
                newEntity $D,57,25,UP,MAPSPRITE_TAROS
                setActscriptWait $D,eas_Init
                entityActionsWait $D
                 moveUp 1
                endActions
                setFacing $0,UP
                setFacing $7,UP
                setFacing $1F,UP
                nextSingleText $0,$D    ; "Fairy said, move this rock{N}in this manner, and...{W1}"
                csWait 30
                playSound SFX_SECRET_PATH_ROCK
                csWait 30
                setFacing $D,DOWN
                setActscriptWait $D,eas_Jump
                setActscriptWait $D,eas_Jump
                nextSingleText $0,$D    ; "Got it!  Thanks, fairy!{W1}"
                setQuake 1
                playSound SFX_BIG_DOOR_RUMBLE
                csWait 20
                setFacing $D,UP
                csWait 20
                playSound SFX_DESOUL_HOVERING
                setBlocks 0,0,3,2,56,22
                csWait 30
                setQuake 0
                csWait 30
                setFacing $D,DOWN
                nextSingleText $0,$D    ; "{LEADER}, come on.{W1}"
                entityActionsWait $D
                 moveUp 1
                endActions
                hide $D
                entityActionsWait $0
                 moveUp 1
                endActions
                entityActions $0
                 moveUp 1
                endActions
                warp $20,$1D,$3,$2
                csc_end
