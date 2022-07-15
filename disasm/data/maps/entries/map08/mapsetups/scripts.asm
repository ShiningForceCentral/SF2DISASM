
; ASM FILE data\maps\entries\map08\mapsetups\scripts.asm :
; 0x563B2..0x56636 : 
cs_563B2:       textCursor 1291
                setActscriptWait 129,eas_DeactivateAutoFacing
                entityActionsWait 129
                 moveRight 4
                endActions
                nextSingleText $0,129   ; "Hmmm?{W1}"
                customActscriptWait 129
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 129
                 moveLeft 2
                endActions
                setFacing 129,DOWN
                nextSingleText $0,129   ; "You're a spy from the new{N}town, aren't you?{W1}"
                entityActionsWait 129
                 moveUp 2
                endActions
                nextSingleText $0,129   ; "You're back again!{N}Mayor!  Mayor!{W1}"
                setActscriptWait 129,eas_Init
                customActscriptWait 129
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setFacing 129,UP
                entityActionsWait 129
                 moveUp 8
                endActions
                setPos 129,15,7,DOWN
                csc_end
cs_56422:       textCursor 1294
                setActscriptWait ALLY_PETER,eas_Init
                setDest ALLY_PETER,14,10
                setFacing ALLY_PETER,UP
                setActscriptWait ALLY_BOWIE,eas_DeactivateAutoFacing
                setActscriptWait ALLY_PETER,eas_DeactivateAutoFacing
                customActscriptWait 129
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 30
                entityActions ALLY_BOWIE
                 moveDown 1
                endActions
                setActscriptWait 128,eas_BumpDown
                entityActionsWait 128
                 moveDown 1
                endActions
                csWait 30
                entityActions ALLY_BOWIE
                 moveDown 1
                endActions
                entityActions ALLY_PETER
                 moveDown 1
                endActions
                setActscriptWait 128,eas_BumpDown
                entityActionsWait 128
                 moveDown 1
                endActions
                csWait 30
                entityActions ALLY_BOWIE
                 moveDown 1
                endActions
                entityActions ALLY_PETER
                 moveDown 1
                endActions
                setActscriptWait 128,eas_BumpDown
                entityActionsWait 128
                 moveDown 1
                endActions
                csWait 30
                entityActions ALLY_BOWIE
                 moveDown 1
                endActions
                entityActions ALLY_PETER
                 moveDown 1
                endActions
                setActscriptWait 128,eas_BumpDown
                entityActionsWait 128
                 moveDown 1
                endActions
                csWait 30
                entityActions ALLY_BOWIE
                 moveDown 1
                endActions
                entityActions ALLY_PETER
                 moveDown 1
                endActions
                setActscriptWait 128,eas_BumpDown
                entityActionsWait 128
                 moveDown 1
                endActions
                nextSingleText $0,128   ; "Who are you?{N}What are you?{W1}"
                entityActionsWait 129
                 moveLeft 1
                 moveDown 4
                 moveRight 1
                 moveDown 1
                endActions
                nextText $0,129         ; "A group of soldiers were{N}just here.{W2}"
                nextSingleText $0,129   ; "Soldiers must be waiting{N}beyond the gate.{N}Be careful!{W1}"
                nextText $0,128         ; "You're so persistent.{N}What do you want?!{W2}"
                nextText $0,128         ; "You suddenly appear in{N}Parmecia, and build a castle?{W2}"
                nextText $0,128         ; "I don't know who you are,{N}but all big cities like war!{W2}"
                nextSingleText $0,128   ; "I've never seen such{N}impolite and violent guests!{W1}"
                nextText $0,129         ; "He's right!{W2}"
                nextSingleText $0,129   ; "You came here to capture{N}Parmecia!{W1}"
                nextSingleText $0,128   ; "We'll never obey you!{N}Go away!{W1}"
                setActscriptWait 129,eas_Init
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                entityActions 128
                 moveUp 1
                endActions
                entityActionsWait 129
                 moveUp 1
                endActions
                setActscriptWait ALLY_PETER,eas_Jump
                nextSingleText $0,ALLY_PETER ; "You talk too much!{W1}"
                setFacing ALLY_BOWIE,DOWN
                nextText $0,ALLY_PETER  ; "Hey, {LEADER}!{N}Why don't you say something?{W2}"
                nextSingleText $0,ALLY_PETER ; "I can't stand this!{W1}"
                entityActionsWait ALLY_PETER
                 moveLeft 1
                 moveUp 1
                endActions
                setFacing ALLY_BOWIE,UP
                nextSingleText $0,ALLY_PETER ; "Hey, you!  I think I{N}understand how you feel,{N}but listen to me!{W1}"
                setFacing 128,DOWN
                setFacing 129,DOWN
                nextSingleText $0,128   ; "Why?{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                nextText $0,ALLY_PETER  ; "I'm not from Granseal.{N}I just visited there....{W2}"
                nextText $0,ALLY_PETER  ; "You think they came to{N}Parmecia to conquer it?{N}Well, you're wrong.{W2}"
                nextText $0,ALLY_PETER  ; "They were forced to leave{N}their island due to a{N}disaster.{W2}"
                nextSingleText $0,ALLY_PETER ; "They're good people!{N}You don't have to be so{N}paranoid!{W1}"
                nextSingleText $0,128   ; "Who are you?{W1}"
                nextSingleText $0,ALLY_PETER ; "I'm {NAME;7}!{N}I'm a phoenix that lives in{N}Mt. Volcano.{W1}"
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                nextSingleText $0,128   ; "A phoenix!{N}The legendary bird?{W1}"
                nextSingleText $0,ALLY_PETER ; "I don't know if we're{N}legendary or not....{W1}"
                nextText $0,128         ; "I'm very glad to meet{N}you!{W2}"
                nextSingleText $0,128   ; "Oh, they're friends of yours.{N}My, my!{W1}"
                nextText $0,129         ; "Of course, we of Ribble{N}will become allies of{N}Granseal.{W2}"
                nextSingleText $0,129   ; "I promise that we will{N}welcome you when you visit{N}us again!{W1}"
                fadeOutB
                loadMapEntities ce_55FBE
                setActscriptWait ALLY_BOWIE,eas_Init
                setBlocks 32,2,1,1,25,12
                setBlocks 32,2,1,1,22,24
                setBlocks 32,2,1,1,7,25
                setBlocks 32,3,2,1,6,15
                setF 709                ; Set after the mayor in Ribble scene... this flag unlocks the doors
                executeSubroutine csub_56632
                followEntity ALLY_PETER,ALLY_BOWIE,2
                csWait 50
                fadeInB
                csc_end

; =============== S U B R O U T I N E =======================================


csub_56632:
                
                jmp     (csub_56632_0).w

    ; End of function csub_56632

