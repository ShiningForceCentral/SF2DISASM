
; ASM FILE data\maps\entries\map37\mapsetups\s6_initfunction_3E7.asm :
; 0x5FAA4..0x5FB30 : 

; =============== S U B R O U T I N E =======================================

ms_map37_flag3E7_InitFunction:
                
                jsr     InitNazcaShipForceMembers
                chkFlg  $100            ; TEMP FLAG #00
                bne.s   return_5FABA
                script  cs_5FABC
                setFlg  $100            ; TEMP FLAG #00
return_5FABA:
                
                rts

	; End of function ms_map37_flag3E7_InitFunction

cs_5FABC:       textCursor $D1F
                reloadMap 6,6
                setPos $0,8,12,UP
                setPos $7,13,12,UP
                setPos $1A,10,10,DOWN
                setPos $80,10,11,UP
                stopEntity $80
                playSound MUSIC_STOP
                fadeInB
                nextText $80,$7         ; "Ouch!  Hey, {NAME;26}!{N}I like your wild driving!{W2}"
                nextSingleText $80,$7   ; "Where's Sir Astral?{W1}"
                setFacing $7,RIGHT
                csWait 20
                setFacing $7,LEFT
                csWait 20
                setFacing $7,RIGHT
                csWait 20
                setFacing $7,LEFT
                csWait 20
                shiver $7
                nextSingleText $80,$7   ; "Oh, there he is!{W1}"
                setActscriptWait $7,eas_Init
                entityActionsWait $7
                 moveLeft 3
                 faceUp 1
                endActions
                nextSingleText $80,$7   ; "Sir Astral!  Are you OK?{W1}"
                setFacing $7,LEFT
                nextSingleText $80,$7   ; "{LEADER}, come on!{W1}"
                csc_end
