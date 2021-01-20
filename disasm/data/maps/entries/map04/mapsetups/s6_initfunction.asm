
; ASM FILE data\maps\entries\map04\mapsetups\s6_initfunction.asm :
; 0x51728..0x51840 : 

; =============== S U B R O U T I N E =======================================


ms_map4_InitFunction:
                
                 
                chkFlg  624             ; Set after the soldiers are swallowed up by the earthquake
                bne.s   byte_5173A
                script  cs_51750
                setFlg  624             ; Set after the soldiers are swallowed up by the earthquake
                bra.s   return_51740
byte_5173A:
                
                script  cs_51742
return_51740:
                
                rts

    ; End of function ms_map4_InitFunction

cs_51742:       setPos 128,0,0,RIGHT
                setPos 129,0,0,RIGHT
                csc_end
cs_51750:       textCursor 715
                setPos ALLY_BOWIE,29,4,DOWN
                setPos FOLLOWER_B,28,3,DOWN
                setPos FOLLOWER_A,29,3,DOWN
                setPos 159,30,3,DOWN
                setQuake 1
                fadeInB
                csWait 30
                setQuake 1
                nextSingleText $0,128   ; "Your Majesty!  Sir Astral!{N}Are you alright?{W1}"
                entityActionsWait FOLLOWER_B
                 moveDown 1
                endActions
                nextSingleText $0,FOLLOWER_B ; "You didn't escape?{N}Why are you here?{W1}"
                nextSingleText $0,128   ; "We've been waiting for you.{N}Chasms are appearing in the{N}ground.{W2}{N}Everybody is on the ship{N}to avoid falling into a{N}hole.{W1}"
                setFacing FOLLOWER_B,RIGHT
                nextSingleText $0,FOLLOWER_B ; "Thank you.  {LEADER},{N}hurry to the harbor.{W1}"
                nextSingleText $0,128   ; "Wooooo!{N}Help! Heeeeelp....{W1}"
                setFacing FOLLOWER_B,DOWN
                customActscriptWait 128
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 129
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 128
                 moveDown 1
                endActions
                entityActions 129
                 moveRight 1
                endActions
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 3
                csWait 30
                setBlocks 51,18,11,7,24,3
                csWait 10
                setBlocks 51,25,11,7,24,3
                csWait 10
                setBlocks 51,32,11,7,24,3
                csWait 10
                setActscript 128,eas_FallInEarthquakeCrack
                csWait 5
                setActscriptWait 129,eas_FallInEarthquakeCrack
                playSound SFX_BIG_DOOR_RUMBLE
                setBlocks 51,0,5,4,27,0
                csWait 10
                setBlocks 51,4,5,4,27,0
                csWait 10
                setBlocks 51,8,5,4,27,0
                csWait 30
                setQuake 1
                csWait 30
                setFacing FOLLOWER_B,RIGHT
                nextSingleText $0,FOLLOWER_B ; "That's too cruel....{N}{W2}{LEADER}, go to the{N}harbor from the east side.{N}It's safer.{W1}"
                setActscript FOLLOWER_B,eas_Follower1
                csc_end
