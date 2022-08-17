
; ASM FILE data\maps\entries\map18\mapsetups\s6_initfunction_530.asm :
; 0x61298..0x6143C : 

; =============== S U B R O U T I N E =======================================


ms_map18_flag530_InitFunction:
                
                 
                chkFlg  920             ; Set after the scene with Zeon plays as you leave the Galam Drawbridge area
                bne.s   loc_612A8
                script  cs_612BE
                setFlg  920             ; Set after the scene with Zeon plays as you leave the Galam Drawbridge area
loc_612A8:
                
                move.w  #$80,d0 
                jsr     MoveEntityOutOfMap
                move.w  #$82,d0 
                jsr     MoveEntityOutOfMap
                rts

    ; End of function ms_map18_flag530_InitFunction

cs_612BE:       textCursor 3681
                mapLoad MAP_ZEON_ARENA,8,4
                setPos ALLY_BOWIE,63,63,DOWN
                setPos ALLY_PETER,63,63,DOWN
                setPos FOLLOWER_B,63,63,DOWN
                setPos ALLY_ZYNK,63,63,DOWN
                fadeInFromBlackHalf
                nextSingleText $80,130  ; "{LEADER} defeated Red{N}Baron too?  Is that what{N}you said, Geshp?{W1}"
                nod 128
                nextSingleText $0,128   ; "Yes, sir...I'm sorry.{W1}"
                nextText $80,130        ; "Once again, my minions have{N}failed me.{W2}"
                nextSingleText $80,130  ; "Are my soldiers that weak?{W1}"
                shiver 128
                setSize 128,21
                nextText $0,128         ; "Yes...oh, no!  I mean, they{N}were strong enough.{W2}"
                nextSingleText $0,128   ; "But {LEADER} and his force{N}were smarter.{W1}"
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 3
                csWait 30
                setActscriptWait 128,eas_Init
                csWait 30
                setQuake 0
                nextText $80,130        ; "No more excuses!{W2}"
                nextSingleText $80,130  ; "This is your last chance.{N}Kill {LEADER} this time,{N}or I'll kill you!{W1}"
                setActscriptWait 128,eas_DeactivateAutoFacing
                customActscriptWait 128
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 128
                 moveDown 1
                endActions
                shiver 128
                nextSingleText $0,128   ; "Ah...yes, sir.  I'll kill{N}{LEADER} this time.{N}I stake my life on it.{W1}"
                nextSingleText $80,130  ; "Bring the Jewel of Evil back{N}to me!{W1}"
                nextSingleText $0,128   ; "Yes, sir!{W1}"
                setFacing 128,DOWN
                csWait 40
                setActscript 128,eas_RotateRightHighSpeed
                csWait 40
                animEntityFX 128,6
                setPos 128,63,63,DOWN
                csWait 150
                setPriority 131,$FFFF
                setPriority 129,$0
                setActscript 131,eas_Transparent
                setPos 131,13,12,DOWN
                csWait 50
                setPos 129,13,12,UP
                animEntityFX 129,7
                csWait 50
                hide 131
                csWait 40
                customActscriptWait 129
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 129
                 moveUp 2
                endActions
                nod 129
                csWait 50
                nextSingleText $80,130  ; "You were right, Odd Eye.{W1}"
                entityActionsWait 129
                 moveUp 1
                endActions
                nextSingleText $0,129   ; "Of course.{W1}"
                nextText $80,130        ; "I can't trust Geshp anymore.{W2}"
                nextSingleText $80,130  ; "If he fails, you must battle{N}{LEADER}.{W1}"
                shiver 129
                nextText $0,129         ; "You want me to kill{N}{LEADER}?{W2}"
                customActscriptWait 129
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 20
                entityActionsWait 129
                 moveDown 1
                endActions
                csWait 30
                nextText $0,129         ; "He's probably much stronger{N}now.{N}Hmmm, sounds interesting.{W2}"
                setActscriptWait 129,eas_Init
                setFacing 129,UP
                nextSingleText $0,129   ; "I'll do it.  If this comes{N}to pass, it will be his final{N}battle.{W1}"
                csWait 30
                executeSubroutine csub_61426
                warp MAP_GALAM_CASTLE_EXIT,9,10,DOWN
                csc_end

; =============== S U B R O U T I N E =======================================


csub_61426:
                
                lea     (PALETTE_1_CURRENT).l,a0
                lea     (PALETTE_1_BASE).l,a1
                moveq   #$F,d0
loc_61434:
                
                move.l  (a0)+,(a1)+
                dbf     d0,loc_61434
                rts

    ; End of function csub_61426

