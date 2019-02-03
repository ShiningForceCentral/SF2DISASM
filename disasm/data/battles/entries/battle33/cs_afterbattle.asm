
; ASM FILE data\battles\entries\battle33\cs_afterbattle.asm :
; 0x4D09A..0x4D342 : Cutscene after battle 33
abcs_battle33:  textCursor $B3C
                loadMapFadeIn 31,8,6
                loadMapEntities ce_4D322
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setPos $7,13,11,UP
                setActscriptWait $1F,eas_Init
                setPos $1F,12,9,DOWN
                setBlocks 3,39,1,1,16,8
                stopEntity $80
                setActscriptWait $80,eas_46172
                entityActions $80
                 moveDown 1
                endActions
                csWait 4
                setActscriptWait $80,eas_461AA
                entityActions $1A
                 moveDown 1
                endActions
                csWait 2
                setActscriptWait $1A,eas_461AA
                setActscriptWait $1A,eas_45F9C
                fadeInB
                nextSingleText $0,$1F   ; "There may be some survivors{N}somewhere.{W1}"
                csWait 5
                setActscript $0,eas_461B6
                csWait 5
                setActscript $1F,eas_461E4
                csWait 5
                setActscript $7,eas_461B6
                csWait 120
                entityActions $80
                 moveUp 1
                endActions
                csWait 3
                entityActions $80
                 moveDown 1
                endActions
                csWait 3
                entityActions $80
                 moveUp 1
                endActions
                csWait 3
                entityActions $80
                 moveDown 1
                endActions
                csWait 3
                setActscriptWait $80,eas_461AA
                setFacing $7,RIGHT
                setActscriptWait $7,eas_Jump
                csWait 40
                entityActionsWait $7
                 moveRight 3
                endActions
                setFacing $7,UP
                setFacing $0,RIGHT
                setFacing $1F,RIGHT
                customActscriptWait $80
                 ac_setSpeed 24,24      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $80
                 moveUp 1
                endActions
                csWait 8
                setActscriptWait $80,eas_461AA
                csWait 50
                customActscriptWait $80
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $80
                 moveDown 1
                endActions
                csWait 4
                setQuake 2
                setActscriptWait $80,eas_461AA
                csWait 10
                setQuake 0
                csWait 40
                entityActionsWait $7
                 moveUp 2
                endActions
                nextSingleText $0,$80   ; "Do not touch my rock!{W1}"
                setActscriptWait $7,eas_Jump
                setActscriptWait $7,eas_46172
                customActscriptWait $7
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $7
                 moveDown 2
                endActions
                setCamDest 10,6
                customActscriptWait $80
                 ac_setSpeed 24,24      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $80
                 moveUp 1
                endActions
                csWait 8
                setActscriptWait $80,eas_461AA
                nextText $0,$80         ; "Did you defeat all those{N}devils?{W2}"
                nextSingleText $0,$80   ; "I was wondering why it became{N}quiet so suddenly.{W1}"
                entityActions $1F
                 moveRight 3
                 moveUp 1
                endActions
                entityActionsWait $0
                 moveRight 4
                endActions
                setFacing $1F,RIGHT
                setFacing $0,UP
                nextSingleText $0,$1F   ; "Are you a survivor?{N}Are you from Moun?{N}What's your name?{W1}"
                nextSingleText $0,$80   ; "I am {NAME;26}.{N}I am not from Moun.{W1}"
                nextSingleText $0,$1F   ; "Then, where are you from?{W1}"
                nextSingleText $0,$80   ; "The past.{W1}"
                nextSingleText $0,$1F   ; "What do you mean?{W1}"
                nextText $0,$80         ; "I cannot explain.{W2}"
                nextSingleText $0,$80   ; "I am what I am.{N}That is all that I am.{W1}"
                customActscriptWait $80
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $80,eas_JumpRight
                customActscriptWait $80
                 ac_setSpeed 56,56      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $80,eas_46172
                entityActions $80
                 moveDown 1
                endActions
                setPos $1A,16,8,DOWN
                setActscriptWait $1A,eas_Init
                csWait 3
                setActscriptWait $80,eas_461AA
                setQuake 2
                csWait 20
                setQuake 0
                nextText $0,$1F         ; "I've never seen anyone like{N}you.{W2}"
                nextSingleText $0,$1F   ; "Where are the people of{N}Moun?  Were there any{N}survivors?{W1}"
                nextSingleText $C0,$1A  ; "Some.{W1}"
                nextText $0,$1F         ; "That's good news.{W2}"
                nextSingleText $0,$1F   ; "And where are they?{W1}"
                nextSingleText $C0,$1A  ; "Down here.  Follow me.{W1}"
                setPos $1A,63,63,DOWN
                setActscriptWait $7,eas_Jump
                csWait 30
                entityActionsWait $7
                 moveUp 2
                endActions
                setFacing $1F,DOWN
                nextText $0,$1F         ; "{LEADER}, hurry!{N}Follow {NAME;26}!{W2}"
                nextSingleText $0,$1F   ; "{NAME;26} knows where{N}they're hiding.{W1}"
                followEntity $1F,$0,$2
                followEntity $7,$1F,$2
                setF $341               ; set after the scene after you win the battle in Moun plays out
                csc_end
ce_4D322:       mainEntity 11,11,UP
                entity 13,11,UP,7,eas_Init
                entity 16,8,UP,179,eas_Init
                entity 16,8,DOWN,26,eas_Init
                dc.w $FFFF
