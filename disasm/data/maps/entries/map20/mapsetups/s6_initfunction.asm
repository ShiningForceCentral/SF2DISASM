
; ASM FILE data\maps\entries\map20\mapsetups\s6_initfunction.asm :
; 0x53966..0x53B66 : 

; =============== S U B R O U T I N E =======================================

ms_map20_InitFunction:
                
                cmpi.l  #$22803780,((ENTITY_DATA-$1000000)).w
                bne.s   byte_53988      
                chkFlg  $25D            ; Set after the scene in the King's bedroom
                bne.s   byte_53982
                script  cs_53996
                setFlg  $25D            ; Set after the scene in the King's bedroom
                bra.s   byte_53988      
byte_53982:
                
                script  cs_53B60
byte_53988:
                
                chkFlg  $1FB            ; Battle 7 completed
                beq.s   return_53994
                script  cs_53FD8
return_53994:
                
                rts

	; End of function ms_map20_InitFunction

cs_53996:       textCursor $880
                setPos $0,23,39,DOWN
                setPos $1,23,38,DOWN
                setPos $2,23,37,DOWN
                setActscriptWait $0,eas_Init
                setActscriptWait $1,eas_Init
                setActscriptWait $2,eas_Init
                fadeInB
                csWait 20
                setFacing $0,LEFT
                csWait 20
                setCamDest 12,34
                setFacing $0,DOWN
                nextSingleText $0,$80   ; "Mmmm....{N}Hmmm...mmmm....{W1}"
                nextSingleText $0,$81   ; "Oh, father!{N}Please wake up.{W1}"
                entityActionsWait $83
                 moveRight 1
                endActions
                setFacing $83,UP
                nextSingleText $0,$83   ; "Sir Astral?{W1}"
                nextSingleText $80,$82  ; "Hmmm.  Nothing is wrong{N}with his body, but...{W1}"
                setPriority $82,$0
                setPriority $83,$FFFF
                setActscriptWait $83,eas_BumpUp
                setActscriptWait $83,eas_BumpUp
                nextSingleText $0,$83   ; "He is suffering badly from{N}something....{W1}"
                setFacing $82,DOWN
                nextSingleText $80,$82  ; "Perhaps...it might be...{N}{D1}Well?{W1}"
                csWait 30
                setFacing $82,RIGHT
                setCamDest 17,34
                setFacing $82,DOWN
                csWait 40
                setFacing $82,RIGHT
                csWait 40
                customActscriptWait $82
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $82
                 moveRight 2
                endActions
                setActscriptWait $82,eas_Init
                nextSingleText $0,$82   ; "What are you doing here?!{W1}"
                setCamDest 17,34
                setActscript $0,eas_Jump
                setActscript $1,eas_Jump
                setActscriptWait $2,eas_Jump
                setActscript $0,eas_Jump
                setActscript $1,eas_Jump
                setActscriptWait $2,eas_Jump
                nextSingleText $80,$2   ; "Oops!{W1}"
                entityActionsWait $2
                 moveLeft 2
                 moveDown 1
                endActions
                nextSingleText $80,$2   ; "Sorry, sir!{W1}"
                entityActionsWait $1
                 moveLeft 1
                endActions
                setFacing $1,DOWN
                setFacing $0,LEFT
                nextSingleText $80,$1   ; "Well, we just followed you....{W1}"
                entityActionsWait $82
                 moveRight 1
                endActions
                setFacing $82,UP
                nextSingleText $80,$82  ; "Don't lie to me.{N}You wanted to see the{N}castle, didn't you?{W1}"
                entityActionsWait $83
                 moveUp 1
                endActions
                setFacing $83,RIGHT
                nextSingleText $0,$83   ; "Sir Astral, who are they?{W1}"
                csWait 5
                setActscript $82,eas_461B6
                nextSingleText $80,$82  ; "Oh...{D1}well...{D1}(mumble)...{D1}{N}They're my pupils....{W1}"
                entityActionsWait $83
                 moveRight 1
                endActions
                setFacing $82,LEFT
                nextText $0,$83         ; "So they are.   They look{N}like good kids.{W1}"
                nextSingleText $0,$83   ; "You must have a special{N}reason to have them here,{N}right?{W1}"
                nextSingleText $80,$82  ; "Um...{D1}I didn't mean for...{W1}"
                setFacing $82,UP
                csWait 40
                setFacing $82,RIGHT
                csWait 30
                nextSingleText $FF,$FF  ; "Astral glares at {LEADER}.{W1}"
                entityActionsWait $82
                 moveLeft 1
                endActions
                nextSingleText $80,$82  ; "(Cough){N}You said the door of the{N}Ancient Tower is open.{W2}{N}There must be a connection{N}between the open door and{N}the King's sickness.{W1}"
                setFacing $82,DOWN
                csWait 60
                setFacing $82,LEFT
                nextSingleText $80,$82  ; "I called them here to help{N}me investigate the tower.{W1}"
                nod $83
                entityActionsWait $82
                 moveRight 1
                endActions
                nextSingleText $80,$82  ; "Now, pupils.  Follow me.{W1}"
                setFacing $82,UP
                nextSingleText $80,$82  ; "Don't give me any more{N}trouble!{W1}"
                entityActions $1
                 moveUp 1
                endActions
                entityActionsWait $82
                 moveUp 1
                 moveRight 1
                 moveUp 1
                endActions
                followEntity $1,$0,$2
                followEntity $2,$1,$2
cs_53B60:       hide $82
                csc_end
