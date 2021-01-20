
; ASM FILE data\maps\entries\map37\mapsetups\s6_initfunction_999.asm :
; 0x5FAA4..0x5FB30 : 

; =============== S U B R O U T I N E =======================================


ms_map37_flag999_InitFunction:
                
                jsr     InitNazcaShipForceMembers
                chkFlg  256             ; TEMP FLAG #00
                bne.s   return_5FABA
                script  cs_5FABC
                setFlg  256             ; TEMP FLAG #00
return_5FABA:
                
                rts

    ; End of function ms_map37_flag999_InitFunction

cs_5FABC:       textCursor 3359
                reloadMap 6,6
                setPos ALLY_BOWIE,8,12,UP
                setPos ALLY_PETER,13,12,UP
                setPos ALLY_ZYNK,10,10,DOWN
                setPos 128,10,11,UP
                stopEntity 128
                playSound MUSIC_STOP
                fadeInB
                nextText $80,ALLY_PETER ; "Ouch!  Hey, {NAME;26}!{N}I like your wild driving!{W2}"
                nextSingleText $80,ALLY_PETER ; "Where's Sir Astral?{W1}"
                setFacing ALLY_PETER,RIGHT
                csWait 20
                setFacing ALLY_PETER,LEFT
                csWait 20
                setFacing ALLY_PETER,RIGHT
                csWait 20
                setFacing ALLY_PETER,LEFT
                csWait 20
                shiver ALLY_PETER
                nextSingleText $80,ALLY_PETER ; "Oh, there he is!{W1}"
                setActscriptWait ALLY_PETER,eas_Init
                entityActionsWait ALLY_PETER
                 moveLeft 3
                 faceUp 1
                endActions
                nextSingleText $80,ALLY_PETER ; "Sir Astral!  Are you OK?{W1}"
                setFacing ALLY_PETER,LEFT
                nextSingleText $80,ALLY_PETER ; "{LEADER}, come on!{W1}"
                csc_end
