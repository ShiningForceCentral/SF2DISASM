
; ASM FILE data\maps\entries\map38\mapsetups\s6_initfunction.asm :
; 0x5DD58..0x5DE2E : 

; =============== S U B R O U T I N E =======================================


ms_map38_InitFunction:
                
                 
                chkFlg  921             ; Set after Zynk leaves you at the Galam Drawbridge (for Roft/Petro death scene)
                beq.s   byte_5DD78      
                setFlg  911             ; Set after the Petro death scene in Roft
                chkFlg  26              ; Zynk joined
                bne.s   byte_5DD78      
                chkFlg  260             ; TEMP FLAG #04
                bne.s   byte_5DD78      
                script  cs_5DD8E
                setFlg  260             ; TEMP FLAG #04
byte_5DD78:
                
                chkFlg  910             ; Set after the initial scene on entering Roft (where the guy thinks you're Galam)
                bne.s   return_5DD8C
                script  cs_5DD9C
                setFlg  910             ; Set after the initial scene on entering Roft (where the guy thinks you're Galam)
                setFlg  258             ; TEMP FLAG #02
return_5DD8C:
                
                rts

    ; End of function ms_map38_InitFunction

cs_5DD8E:       newEntity ALLY_ZYNK,11,8,DOWN,MAPSPRITE_TAROS
                setFacing ALLY_ZYNK,DOWN
                csc_end
cs_5DD9C:       setPos 128,14,26,DOWN
                textCursor 2132
                csWait 1
                setPos ALLY_BOWIE,14,28,UP
                setPos ALLY_PETER,13,29,UP
                setPos FOLLOWER_B,14,29,UP
                jumpIfFlagSet 76,cs_5DE22 ; Zynk is a follower
cs_5DDC2:       playSound MUSIC_TOWN
                fadeInB
                setCameraEntity 128
                setActscriptWait 128,eas_Jump
                nextSingleText $0,128   ; "Galam soldiers!  Run!{W1}"
                entityActionsWait 128
                 moveLeft 2
                endActions
                entityActionsWait 128
                 moveUp 1
                endActions
                entityActionsWait 128
                 moveLeft 2
                endActions
                setFacing ALLY_BOWIE,LEFT
                setFacing ALLY_PETER,LEFT
                setFacing FOLLOWER_B,LEFT
                nextSingleText $0,ALLY_PETER ; "No, wait!  We're not Galam{N}soldiers!{W1}"
                setFacing 128,RIGHT
                nextSingleText $0,128   ; "No...?{W1}"
                entityActionsWait 128
                 moveDown 2
                endActions
                entityActionsWait 128
                 moveRight 2
                endActions
                nextSingleText $0,128   ; "Oops.  My mistake.{W2}"
                nextSingleText $0,128   ; "Oh, it's obvious.  I can see{N}it in your eyes.{W1}"
                csc_end
cs_5DE22:       setPos ALLY_ZYNK,15,29,UP
                jump cs_5DDC2
