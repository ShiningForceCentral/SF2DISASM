
; ASM FILE data\maps\entries\map14\mapsetups\s3_zoneevents.asm :
; 0x58E48..0x58EBA : 
ms_map14_ZoneEvents:
                msZoneEvent 45, 5, Map14_ZoneEvent0-ms_map14_ZoneEvents
                msDefaultZoneEvent Map14_DefaultZoneEvent-ms_map14_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map14_ZoneEvent0:
                
                 
                script  cs_58E5C
                setFlg  257             ; TEMP FLAG #01
Map14_DefaultZoneEvent:
                
                rts

    ; End of function Map14_ZoneEvent0

cs_58E5C:       textCursor 2261
                nextText $FF,255        ; "Bring up the plank?"
                yesNo
                jumpIfFlagClear 89,cs_58EB8 ; YES/NO prompt answer
                hideText
                entityActionsWait ALLY_BOWIE
                 moveDown 1
                endActions
                csWait 40
                setActscriptWait 131,eas_DeactivateAutoFacing
                setActscriptWait 132,eas_DeactivateAutoFacing
                setActscriptWait 133,eas_DeactivateAutoFacing
                entityActions ALLY_BOWIE
                 moveDown 3
                endActions
                entityActions 131
                 moveDown 3
                endActions
                entityActions 132
                 moveDown 3
                endActions
                entityActionsWait 133
                 moveDown 3
                endActions
                warp MAP_SHIP_DAMAGED,13,11,DOWN
cs_58EB8:       csc_end
