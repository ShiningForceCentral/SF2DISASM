
; ASM FILE data\maps\entries\map14\mapsetups\s3_zoneevents.asm :
; 0x58E48..0x58EBA : 
ms_map14_ZoneEvents:
                msZoneEvent 45, 5, Map14_ZoneEvent0-ms_map14_ZoneEvents
                msDefaultZoneEvent Map14_DefaultZoneEvent-ms_map14_ZoneEvents

; =============== S U B R O U T I N E =======================================

Map14_ZoneEvent0:
                
                 
                script  cs_58E5C
                setFlg  $101            ; TEMP FLAG #01
Map14_DefaultZoneEvent:
                
                rts

	; End of function Map14_ZoneEvent0

cs_58E5C:       textCursor $8D5
                nextText $FF,$FF        ; "Bring up the plank?"
                yesNo
                jumpIfFlagClear $59,cs_58EB8; YES/NO prompt answer
                hideText
                entityActionsWait $0
                 moveDown 1
                endActions
                csWait 40
                setActscriptWait $83,eas_46172
                setActscriptWait $84,eas_46172
                setActscriptWait $85,eas_46172
                entityActions $0
                 moveDown 3
                endActions
                entityActions $83
                 moveDown 3
                endActions
                entityActions $84
                 moveDown 3
                endActions
                entityActionsWait $85
                 moveDown 3
                endActions
                warp $E,$D,$B,$3
cs_58EB8:       csc_end
