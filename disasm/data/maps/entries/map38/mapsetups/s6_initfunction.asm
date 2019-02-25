
; ASM FILE data\maps\entries\map38\mapsetups\s6_initfunction.asm :
; 0x5DD58..0x5DE2E : 

; =============== S U B R O U T I N E =======================================

ms_map38_InitFunction:
                
                 
                chkFlg  $399            ; Set after Zynk leaves you at the Galam Drawbridge (for Roft/Petro death scene)
                beq.s   byte_5DD78      
                setFlg  $38F            ; Set after the Petro death scene in Roft
                chkFlg  $1A             ; Zynk joined
                bne.s   byte_5DD78      
                chkFlg  $104            ; TEMP FLAG #04
                bne.s   byte_5DD78      
                script  cs_5DD8E
                setFlg  $104            ; TEMP FLAG #04
byte_5DD78:
                
                chkFlg  $38E            ; Set after the initial scene on entering Roft (where the guy thinks you're Galam)
                bne.s   return_5DD8C
                script  cs_5DD9C
                setFlg  $38E            ; Set after the initial scene on entering Roft (where the guy thinks you're Galam)
                setFlg  $102            ; TEMP FLAG #02
return_5DD8C:
                
                rts

	; End of function ms_map38_InitFunction

cs_5DD8E:       newEntity $1A,11,8,DOWN,$FF
                setFacing $1A,DOWN
                csc_end
cs_5DD9C:       setPos $80,14,26,DOWN
                textCursor $854
                csWait 1
                setPos $0,14,28,UP
                setPos $7,13,29,UP
                setPos $1F,14,29,UP
                jumpIfFlagSet $4C,cs_5DE22; Zynk is a follower
cs_5DDC2:       playSound MUSIC_TOWN
                fadeInB
                setCameraEntity $80
                setActscriptWait $80,eas_Jump
                nextSingleText $0,$80   ; "Galam soldiers!  Run!{W1}"
                entityActionsWait $80
                 moveLeft 2
                endActions
                entityActionsWait $80
                 moveUp 1
                endActions
                entityActionsWait $80
                 moveLeft 2
                endActions
                setFacing $0,LEFT
                setFacing $7,LEFT
                setFacing $1F,LEFT
                nextSingleText $0,$7    ; "No, wait!  We're not Galam{N}soldiers!{W1}"
                setFacing $80,RIGHT
                nextSingleText $0,$80   ; "No...?{W1}"
                entityActionsWait $80
                 moveDown 2
                endActions
                entityActionsWait $80
                 moveRight 2
                endActions
                nextSingleText $0,$80   ; "Oops.  My mistake.{W2}"
                nextSingleText $0,$80   ; "Oh, it's obvious.  I can see{N}it in your eyes.{W1}"
                csc_end
cs_5DE22:       setPos $1A,15,29,UP
                jump cs_5DDC2
