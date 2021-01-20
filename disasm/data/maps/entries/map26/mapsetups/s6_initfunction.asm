
; ASM FILE data\maps\entries\map26\mapsetups\s6_initfunction.asm :
; 0x59DDC..0x59F20 : 

; =============== S U B R O U T I N E =======================================


ms_map26_InitFunction:
                
                 
                chkFlg  779             ; Set after the Cotton Balloon pops and you land in Floor World
                bne.s   byte_59DF2      
                script  cs_59E04
                setFlg  779             ; Set after the Cotton Balloon pops and you land in Floor World
                move.b  #$1A,((EGRESS_MAP_INDEX-$1000000)).w
byte_59DF2:
                
                chkFlg  780             ; Set after the man tries to lift the giant ring in Floor World
                beq.s   return_59E02
                move.w  #$81,d0 
                jsr     MoveEntityOutOfMap
return_59E02:
                
                rts

    ; End of function ms_map26_InitFunction

cs_59E04:       textCursor 1739
                setCameraEntity 65535
                reloadMap 21,8
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                stopEntity ALLY_BOWIE
                stopEntity ALLY_PETER
                stopEntity FOLLOWER_B
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait ALLY_PETER
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait FOLLOWER_B
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 130
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 131
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 132
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setPos ALLY_BOWIE,26,7,DOWN
                setPos ALLY_PETER,27,6,DOWN
                setPos FOLLOWER_B,25,6,DOWN
                setPos 130,26,6,UP
                setPos 131,25,5,UP
                setPos 132,27,5,UP
                fadeInB
                entityActions ALLY_BOWIE
                 moveDown 7
                endActions
                entityActions ALLY_PETER
                 moveDown 7
                endActions
                entityActions FOLLOWER_B
                 moveDown 7
                endActions
                entityActions 130
                 moveDown 7
                endActions
                entityActions 131
                 moveDown 7
                endActions
                entityActionsWait 132
                 moveDown 7
                endActions
                csWait 20
                startEntity ALLY_BOWIE
                startEntity ALLY_PETER
                startEntity FOLLOWER_B
                csWait 40
                hide 130
                hide 131
                hide 132
                csWait 30
                nextSingleText $FF,255  ; "The Cotton Balloon popped.{W1}"
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                csc_end
