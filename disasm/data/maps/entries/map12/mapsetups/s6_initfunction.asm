
; ASM FILE data\maps\entries\map12\mapsetups\s6_initfunction.asm :
; 0x57D04..0x57E36 : 

; =============== S U B R O U T I N E =======================================


ms_map12_InitFunction:
                
                 
                chkFlg  725             ; Set after telling Rohde that you're going to get the Caravan
                bne.s   byte_57D10      
                script  cs_57D22
byte_57D10:
                
                chkFlg  518             ; Battle 18 completed - BATTLE_VERSUS_TAROS                
                beq.s   return_57D20
                move.w  #$80,d0 
                jsr     MoveEntityOutOfMap
return_57D20:
                
                rts

    ; End of function ms_map12_InitFunction

cs_57D22:       textCursor 3197
                cameraSpeed $30
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setPos ALLY_BOWIE,12,31,UP
                setPos ALLY_PETER,13,31,UP
                setPos FOLLOWER_B,11,31,UP
                fadeInB
                entityActions ALLY_BOWIE
                 moveUp 5
                endActions
                entityActions ALLY_PETER
                 moveUp 5
                endActions
                entityActionsWait FOLLOWER_B
                 moveUp 5
                endActions
                nextSingleText $0,128   ; "Stop!{W1}"
                csWait 10
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                csWait 30
                csWait 5
                setActscript ALLY_BOWIE,eas_2xRightLeft
                csWait 5
                setActscript ALLY_PETER,eas_2xUpDown
                csWait 5
                setActscript FOLLOWER_B,eas_2xRightLeft
                csWait 80
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                setFacing ALLY_BOWIE,UP
                setFacing FOLLOWER_B,UP
                nextSingleText $80,ALLY_PETER ; "Who said that?{W1}"
                setCamDest 7,5
                nextSingleText $80,ALLY_PETER ; "Wow, what a huge guy!{W1}"
                csWait 30
                nextSingleText $0,128   ; "Leave here!{N}I'll attack you if you don't!{W1}"
                setCamDest 7,21
                entityActionsWait ALLY_PETER
                 moveDown 1
                endActions
                setFacing ALLY_BOWIE,RIGHT
                setFacing FOLLOWER_B,RIGHT
                setFacing ALLY_PETER,LEFT
                nextText $80,ALLY_PETER ; "Attack us?!  {LEADER},{N}let's get out of here!{W2}"
                nextSingleText $80,ALLY_PETER ; "We don't want to fight him!{W1}"
                csWait 20
                nod ALLY_BOWIE
                nextSingleText $80,ALLY_PETER ; "OK, hurry!{W1}"
                entityActions ALLY_BOWIE
                 moveDown 5
                endActions
                entityActions ALLY_PETER
                 moveDown 5
                endActions
                entityActionsWait FOLLOWER_B
                 moveDown 5
                endActions
                warp MAP_OVERWORLD_AROUND_ELVEN_VILLAGE,55,44,DOWN
                csc_end
