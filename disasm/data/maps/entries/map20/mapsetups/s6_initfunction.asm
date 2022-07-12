
; ASM FILE data\maps\entries\map20\mapsetups\s6_initfunction.asm :
; 0x53966..0x53B66 : 

; =============== S U B R O U T I N E =======================================


ms_map20_InitFunction:
                
                cmpi.l  #$22803780,((ENTITY_DATA-$1000000)).w
                bne.s   ms_map20_flag501_InitFunction
                chkFlg  605             ; Set after the scene in the King's bedroom
                bne.s   byte_53982
                script  cs_53996
                setFlg  605             ; Set after the scene in the King's bedroom
                bra.s   ms_map20_flag501_InitFunction
byte_53982:
                
                script  cs_53B60
ms_map20_flag501_InitFunction:
                
                chkFlg  507             ; Battle 7 completed - BATTLE_VERSUS_DARK_SMOKES           
                beq.s   return_53994
                script  cs_53FD8
return_53994:
                
                rts

    ; End of function ms_map20_InitFunction

cs_53996:       textCursor 2176
                setPos ALLY_BOWIE,23,39,DOWN
                setPos ALLY_SARAH,23,38,DOWN
                setPos ALLY_CHESTER,23,37,DOWN
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_SARAH,eas_Init
                setActscriptWait ALLY_CHESTER,eas_Init
                fadeInB
                csWait 20
                setFacing ALLY_BOWIE,LEFT
                csWait 20
                setCamDest 12,34
                setFacing ALLY_BOWIE,DOWN
                nextSingleText $0,128   ; "Mmmm....{N}Hmmm...mmmm....{W1}"
                nextSingleText $0,129   ; "Oh, father!{N}Please wake up.{W1}"
                entityActionsWait 131
                 moveRight 1
                endActions
                setFacing 131,UP
                nextSingleText $0,131   ; "Sir Astral?{W1}"
                nextSingleText $80,130  ; "Hmmm.  Nothing is wrong{N}with his body, but...{W1}"
                setPriority 130,$0
                setPriority 131,$FFFF
                setActscriptWait 131,eas_BumpUp
                setActscriptWait 131,eas_BumpUp
                nextSingleText $0,131   ; "He is suffering badly from{N}something....{W1}"
                setFacing 130,DOWN
                nextSingleText $80,130  ; "Perhaps...it might be...{N}{D1}Well?{W1}"
                csWait 30
                setFacing 130,RIGHT
                setCamDest 17,34
                setFacing 130,DOWN
                csWait 40
                setFacing 130,RIGHT
                csWait 40
                customActscriptWait 130
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 130
                 moveRight 2
                endActions
                setActscriptWait 130,eas_Init
                nextSingleText $0,130   ; "What are you doing here?!{W1}"
                setCamDest 17,34
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_SARAH,eas_Jump
                setActscriptWait ALLY_CHESTER,eas_Jump
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_SARAH,eas_Jump
                setActscriptWait ALLY_CHESTER,eas_Jump
                nextSingleText $80,ALLY_CHESTER ; "Oops!{W1}"
                entityActionsWait ALLY_CHESTER
                 moveLeft 2
                 moveDown 1
                endActions
                nextSingleText $80,ALLY_CHESTER ; "Sorry, sir!{W1}"
                entityActionsWait ALLY_SARAH
                 moveLeft 1
                endActions
                setFacing ALLY_SARAH,DOWN
                setFacing ALLY_BOWIE,LEFT
                nextSingleText $80,ALLY_SARAH ; "Well, we just followed you....{W1}"
                entityActionsWait 130
                 moveRight 1
                endActions
                setFacing 130,UP
                nextSingleText $80,130  ; "Don't lie to me.{N}You wanted to see the{N}castle, didn't you?{W1}"
                entityActionsWait 131
                 moveUp 1
                endActions
                setFacing 131,RIGHT
                nextSingleText $0,131   ; "Sir Astral, who are they?{W1}"
                csWait 5
                setActscript 130,eas_2xRightLeft
                nextSingleText $80,130  ; "Oh...{D1}well...{D1}(mumble)...{D1}{N}They're my pupils....{W1}"
                entityActionsWait 131
                 moveRight 1
                endActions
                setFacing 130,LEFT
                nextText $0,131         ; "So they are.   They look{N}like good kids.{W1}"
                nextSingleText $0,131   ; "You must have a special{N}reason to have them here,{N}right?{W1}"
                nextSingleText $80,130  ; "Um...{D1}I didn't mean for...{W1}"
                setFacing 130,UP
                csWait 40
                setFacing 130,RIGHT
                csWait 30
                nextSingleText $FF,255  ; "Astral glares at {LEADER}.{W1}"
                entityActionsWait 130
                 moveLeft 1
                endActions
                nextSingleText $80,130  ; "(Cough){N}You said the door of the{N}Ancient Tower is open.{W2}{N}There must be a connection{N}between the open door and{N}the King's sickness.{W1}"
                setFacing 130,DOWN
                csWait 60
                setFacing 130,LEFT
                nextSingleText $80,130  ; "I called them here to help{N}me investigate the tower.{W1}"
                nod 131
                entityActionsWait 130
                 moveRight 1
                endActions
                nextSingleText $80,130  ; "Now, pupils.  Follow me.{W1}"
                setFacing 130,UP
                nextSingleText $80,130  ; "Don't give me any more{N}trouble!{W1}"
                entityActions ALLY_SARAH
                 moveUp 1
                endActions
                entityActionsWait 130
                 moveUp 1
                 moveRight 1
                 moveUp 1
                endActions
                followEntity ALLY_SARAH,ALLY_BOWIE,2
                followEntity ALLY_CHESTER,ALLY_SARAH,2
cs_53B60:       hide 130
                csc_end
