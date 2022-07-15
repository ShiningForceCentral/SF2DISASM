
; ASM FILE data\maps\entries\map51\mapsetups\s6_initfunction.asm :
; 0x5C3CA..0x5C454 : 

; =============== S U B R O U T I N E =======================================


ms_map51_InitFunction:
                
                 
                chkFlg  470             ; Set after you approach the pond to rescue Elric at the Harpy Pond
                bne.s   return_5C3D6
                script  cs_5C3D8
return_5C3D6:
                
                rts

    ; End of function ms_map51_InitFunction

cs_5C3D8:       textCursor 2550
                setActscriptWait FOLLOWER_B,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_BOWIE,11,22,UP
                setPos FOLLOWER_B,10,22,UP
                setPos ALLY_PETER,9,22,UP
                fadeInB
                entityActionsWait FOLLOWER_B
                 moveUp 2
                endActions
                csWait 5
                setActscript FOLLOWER_B,eas_2xRightLeft
                csWait 120
                setFacing FOLLOWER_B,UP
                nextSingleText $0,FOLLOWER_B ; "It's coming from this{N}direction.{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 2
                endActions
                nextSingleText $0,ALLY_PETER ; "Look!  Over there!{W1}"
                setCamDest 2,2
                csWait 50
                nextSingleText $C0,ALLY_ELRIC ; "Help me!{W1}"
                nextText $0,ALLY_PETER  ; "An...elven boy?{N}He's stuck in the pond.{W2}"
                nextSingleText $0,ALLY_PETER ; "He must be very tired.{N}Let's pull him out.{W1}"
                setCameraEntity ALLY_BOWIE
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                csc_end
                dc.b $FF
                dc.b $FF
