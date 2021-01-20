
; ASM FILE data\maps\entries\map43\mapsetups\s6_initfunction.asm :
; 0x540A6..0x54348 : 

; =============== S U B R O U T I N E =======================================


ms_map43_InitFunction:
                
                 
                script  cs_540C0
                setFlg  612             ; Set after event at Hawel's house
                setFlg  650             ; Set after event at Hawel's house
                clrFlg  72              ; Kazin is a follower
                move.b  #$2B,((EGRESS_MAP_INDEX-$1000000)).w 
ms_map43_flag612_InitFunction:
                
                rts

    ; End of function ms_map43_InitFunction

cs_540C0:       textCursor 811
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_KAZIN,eas_Init
                setPos 128,7,4,DOWN
                setPos ALLY_BOWIE,6,11,UP
                setPos ALLY_KAZIN,5,11,UP
                customActscriptWait 128
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                stopEntity 128
                reloadMap 0,4
                fadeInB
                csWait 50
                setFacing ALLY_BOWIE,LEFT
                setFacing ALLY_KAZIN,RIGHT
                csWait 30
                nextSingleText $0,ALLY_KAZIN ; "This is Hawel's house.{W1}"
                entityActionsWait ALLY_KAZIN
                 moveLeft 1
                 moveUp 1
                 eaWait 20
                endActions
                nextSingleText $0,ALLY_KAZIN ; "Sir Hawel!{N}Granseal friends are here!{W1}"
                csWait 70
                setFacing ALLY_KAZIN,RIGHT
                csWait 40
                nextSingleText $0,ALLY_KAZIN ; "Strange...{N}There's no answer.{W2}{N}Has he gone somewhere?{N}Well, why don't you wait{N}for him inside?{W1}"
                nod ALLY_BOWIE
                entityActionsWait ALLY_BOWIE
                 moveLeft 2
                endActions
                roofEvent 4,9
                stepEvent 4,9
                stepEvent 11,9
                entityActions ALLY_KAZIN
                 moveUp 3
                endActions
                entityActionsWait ALLY_BOWIE
                 moveUp 3
                endActions
                csWait 30
                customActscriptWait ALLY_KAZIN
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_KAZIN
                 moveRight 1
                endActions
                setFacing ALLY_KAZIN,UP
                playSound $FE
                nextSingleText $0,ALLY_KAZIN ; "Wh...who are you?{N}Oh, Sir Hawel!{W1}"
                playSound MUSIC_ENEMY_ATTACK
                setCamDest 2,0
                setFacing 129,DOWN
                setFacing 130,DOWN
                nextSingleText $0,129   ; "Oops!  You came back early!{W1}"
                entityActionsWait ALLY_KAZIN
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_KAZIN ; "You!  What did you{N}do to Sir Hawel?!{W1}"
                csWait 30
                setFacing 129,RIGHT
                setFacing 130,LEFT
                csWait 30
                setFacing 129,DOWN
                setFacing 130,DOWN
                csWait 30
                setActscript 129,eas_Jump
                setActscriptWait 130,eas_Jump
                setActscript 129,eas_Jump
                setActscriptWait 130,eas_Jump
                customActscriptWait 129
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 130
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait ALLY_KAZIN,eas_Init
                entityActions 130
                 moveDown 2
                 moveRight 4
                 moveDown 5
                endActions
                entityActions 129
                 moveRight 1
                 moveDown 2
                 moveRight 4
                 moveDown 5
                endActions
                entityActionsWait ALLY_KAZIN
                 eaWait 20
                 faceRight 20
                 jumpUp 0
                 moveDown 1
                 moveRight 3
                endActions
                playSound SFX_BLO
                customActscriptWait ALLY_KAZIN
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                hide 129
                hide 130
                csWait 60
                setActscriptWait ALLY_KAZIN,eas_Init
                entityActionsWait ALLY_KAZIN
                 moveRight 1
                endActions
                playSound $FD
                nextSingleText $0,128   ; "Ohhh...{NAME;4}....{W1}"
                entityActionsWait ALLY_KAZIN
                 moveLeft 1
                endActions
                setFacing ALLY_KAZIN,UP
                nextSingleText $0,ALLY_KAZIN ; "Sir...you're alive!{W1}"
                playSound MUSIC_SAD_THEME_1
                nextSingleText $0,128   ; "...It's no use running after{N}them....{W1}"
                entityActionsWait ALLY_KAZIN
                 moveLeft 1
                 moveUp 2
                endActions
                nextSingleText $0,ALLY_KAZIN ; "Are you OK, sir?{N}Why did they do such a{N}cruel thing?{W1}"
                nextSingleText $0,128   ; "They were Galam soldiers.{N}They demanded my notes on{N}Ground Seal.{W2}{N}They suddenly snatched at{N}them, and...(cough)...{W1}"
                shiver 128
                stopEntity 128
                entityActionsWait ALLY_BOWIE
                 moveRight 2
                 moveUp 3
                endActions
                setFacing ALLY_BOWIE,RIGHT
                setFacing ALLY_KAZIN,LEFT
                nextSingleText $0,ALLY_BOWIE ; "(Whisper)....{W1}"
                nextSingleText $0,128   ; "Who...is...it?{N}What...did he...say?{W1}"
                setFacing ALLY_KAZIN,UP
                nextSingleText $0,ALLY_KAZIN ; "He's {LEADER} from{N}Granseal.  He said that{N}Ground Seal has opened.{W1}{N}And a serious disaster{N}took place!{W1}{N}He came to see you for{N}more information.{W1}"
                shiver 128
                stopEntity 128
                nextSingleText $0,128   ; "What?!  The door opened?{N}Who broke the ancient{N}seal?! {W1}"
                nextSingleText $0,ALLY_KAZIN ; "Calm down, sir.{N}Why are you so excited?{W1}"
                nextSingleText $0,128   ; "(Cough, cough)...{NAME;4},{N}listen to me carefully.{N}Grans Island is lost!{W2}{N}That tower is the sacred{N}seal that confines a terrible{N}devil.{W2}{N}Two jewels...(cough)...{N}were...installed to...{W1}"
                shiver 128
                stopEntity 128
                nextSingleText $0,ALLY_KAZIN ; "Stop talking, or you'll die.{W1}"
                nextText $0,128         ; "I'm almost dead anyway...{N}(cough)...(cough)....{W2}"
                nextSingleText $0,128   ; "{NAME;4}, look for the jewels...{N}to seal...ancient...{W1}"
                playSound $FD
                shiver 128
                stopEntity 128
                setPosFlash 128,63,63,DOWN
                entityActionsWait ALLY_KAZIN
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_KAZIN ; "Sir!  Sir Hawel!{N}Don't leave me alone!{N}Oh, no...!{W1}"
                stopEntity ALLY_KAZIN
                csWait 60
                entityActionsWait ALLY_BOWIE
                 moveRight 1
                endActions
                setFacing ALLY_BOWIE,UP
                csWait 30
                startEntity ALLY_KAZIN
                setFacing ALLY_KAZIN,DOWN
                nextText $0,ALLY_KAZIN  ; "Sir Hawel passed away.{W2}{N}I'm going to seal the tower.{N}It's Sir Hawel's last wish.{W2}"
                nextSingleText $0,ALLY_KAZIN ; "{LEADER}, please!{N}His wish is related to{N}your mission, right?{W2}{N}Can you go with me and{N}seal the tower?{W1}"
                join 32772
                nextSingleText $0,ALLY_KAZIN ; "Now, let's go to the{N}Ancient Shrine!{W1}"
                followEntity ALLY_KAZIN,ALLY_BOWIE,2
                clearF 72               ; Kazin is a follower
                setStoryFlag 4          ; Battle 4 unlocked - BATTLE_AMBUSHED_BY_GALAM_SOLDIERS
                csc_end
