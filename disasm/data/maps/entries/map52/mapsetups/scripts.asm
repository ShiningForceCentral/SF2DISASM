
; ASM FILE data\maps\entries\map52\mapsetups\scripts.asm :
; 0x5C4EE..0x5C638 : 
cs_5C4EE:       textCursor $575
                cameraSpeed $30
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setDest $0,5,23
                setDest $7,4,22
                entityActionsWait $7
                 moveRight 1
                endActions
                nextSingleText $0,$7    ; "Who are they?{W1}"
                setCamDest 16,4
                csWait 5
                setActscript $81,eas_461B6
                csWait 5
                setActscript $82,eas_461B6
                nextSingleText $0,$7    ; "They're looking for something.{W1}"
                csWait 5
                setActscript $81,eas_461B6
                csWait 5
                setActscript $82,eas_461B6
                entityActionsWait $83
                 moveUp 6
                endActions
                csWait 40
                nextSingleText $0,$83   ; "He's not here...not under{N}the cliff....{W1}"
                entityActionsWait $81
                 moveUp 2
                 moveRight 1
                endActions
                setFacing $80,LEFT
                nextText $0,$81         ; "There are marks of a battle{N}here and there!{W2}"
                nextSingleText $0,$81   ; "Against the birdmen of{N}Bedoe?{W1}"
                nod $80
                nextText $0,$80         ; "Could be...{W2}"
                nextSingleText $0,$80   ; "see those volcanic rocks?{W1}"
                csWait 5
                setActscript $81,eas_461E4
                csWait 60
                nextText $0,$80         ; "Nobody but Volcanon can do{N}that!{W2}"
                setFacing $81,RIGHT
                nextSingleText $0,$80   ; "He has never before killed{N}birdmen, but...{W1}"
                entityActionsWait $83
                 moveDown 1
                endActions
                csWait 40
                customActscriptWait $83
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $83
                 moveDown 2
                 moveLeft 1
                endActions
                nextSingleText $0,$83   ; "Who's that?{W1}"
                setFacing $83,DOWN
                setCamDest 0,17
                setFacing $0,UP
                setFacing $7,DOWN
                csWait 50
                setCamDest 16,7
                setActscriptWait $83,eas_Init
                setActscriptWait $83,eas_46172
                entityActionsWait $83
                 moveUp 1
                endActions
                nextSingleText $0,$83   ; "Stupid Polca kids!{W1}"
                entityActionsWait $80
                 moveDown 2
                 moveLeft 2
                 moveDown 1
                endActions
                nextText $0,$80         ; "Polcan people are cowards that{N}live in peace.{W2}"
                setFacing $80,UP
                setFacing $83,UP
                nextSingleText $0,$80   ; "They shall never return{N}alive!{W1}"
                setStoryFlag $C         ; Battle 12 unlocked
                warp $34,$0,$0,$0
                csc_end
cs_5C622:       setPos $7,22,8,RIGHT
                textCursor $9BD
                fadeInB
                nextText $0,$7          ; "{LEADER}, did you hear{N}that?  He said, he had{N}been waiting for you.{W2}"
                nextSingleText $0,$7    ; "Why do the devils want you?{W1}"
                csc_end
