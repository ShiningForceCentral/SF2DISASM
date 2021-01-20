
; ASM FILE data\maps\entries\map00\mapsetups\s3_zoneevents.asm :
; 0x5E3A4..0x5E61E : 
ms_map0_ZoneEvents:
                msZoneEvent 14, 12, Map0_ZoneEvent0-ms_map0_ZoneEvents
                msZoneEvent 15, 12, Map0_ZoneEvent0-ms_map0_ZoneEvents
                msDefaultZoneEvent Map0_DefaultZoneEvent-ms_map0_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map0_ZoneEvent0:
                
                 
                chkFlg  801             ; Set after Zalbard taunts you in the scene outside the Mitula Shrine
                bne.s   Map0_DefaultZoneEvent
                script  cs_5E3C2
                setFlg  801             ; Set after Zalbard taunts you in the scene outside the Mitula Shrine
Map0_DefaultZoneEvent:
                
                rts

    ; End of function Map0_ZoneEvent0

cs_5E3C2:       textCursor 2731
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                nextSingleText $0,128   ; "Welcome, Granseal force!{W1}"
                setActscript FOLLOWER_B,eas_Jump
                setActscript ALLY_BOWIE,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                setFacing ALLY_PETER,DOWN
                nextSingleText $0,ALLY_PETER ; "What?{W1}"
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                csWait 120
                setFacing FOLLOWER_B,UP
                nextSingleText $0,FOLLOWER_B ; "I heard a voice from the{N}other side of the door.{W1}"
                setFacing ALLY_BOWIE,UP
                setDest 32799,13,12
                setDest ALLY_PETER,16,12
                setFacing FOLLOWER_B,UP
                setFacing ALLY_PETER,UP
                setCamDest 8,9
                nextSingleText $0,128   ; "I'm Zalbard.  I'm one of{N}the greater devils.{W1}"
                setActscriptWait FOLLOWER_B,eas_DeactivateAutoFacing
                setActscriptWait ALLY_BOWIE,eas_DeactivateAutoFacing
                setActscriptWait ALLY_PETER,eas_DeactivateAutoFacing
                entityActions FOLLOWER_B
                 moveDown 2
                endActions
                entityActions ALLY_BOWIE
                 moveDown 1
                endActions
                entityActionsWait ALLY_PETER
                 moveDown 2
                endActions
                nextSingleText $0,128   ; "Do come in.  Of course, you{N}can go back now and abandon{N}Mitula!{W1}"
                setFacing ALLY_PETER,LEFT
                nextText $0,ALLY_PETER  ; "Sir Astral...{W2}"
                nextSingleText $0,ALLY_PETER ; "The greater devil that{N}attacked Bedoe was as{N}strong as Volcanon.{W1}"
                nextText $0,128         ; "Are you talking about{N}Sir Odd Eye?{W2}"
                nextSingleText $0,128   ; "Did he fight against{N}Volcanon at Bedoe?{W1}"
                setFacing ALLY_PETER,UP
                nextSingleText $0,FOLLOWER_B ; "Yes.  And he lost.{W1}"
                nextText $0,128         ; "I can't believe it!{N}Odd Eye is the strongest{N}devil among us.{W2}"
                nextText $0,128         ; "But, we haven't been able to{N}contact him lately.{W2}"
                nextText $0,128         ; "This is good news for me.{N}If I get the Jewel of Evil, I{N}can take his place.{W2}"
                nextSingleText $0,128   ; "Now, enter the shrine.{N}Mitula is here.{W1}"
                csWait 60
                nextSingleText $0,ALLY_PETER ; "What should we do?{N}A greater devil awaits us{N}inside.{W1}"
                setFacing ALLY_PETER,LEFT
                setActscriptWait FOLLOWER_B,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                customActscriptWait FOLLOWER_B
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait FOLLOWER_B
                 moveLeft 2
                endActions
                nextSingleText $0,FOLLOWER_B ; "Odd Eye...Odd Eye...{N}Odd...Eye....{W1}"
                nextSingleText $0,ALLY_PETER ; "Sir Astral?{W1}"
                entityActionsWait FOLLOWER_B
                 moveRight 2
                endActions
                nextSingleText $0,FOLLOWER_B ; "I think I've heard that{N}name before....{W1}"
                entityActionsWait ALLY_PETER
                 moveDown 1
                 moveLeft 3
                endActions
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_PETER,UP
                setCamDest 9,12
                setFacing FOLLOWER_B,DOWN
                setActscriptWait FOLLOWER_B,eas_DeactivateAutoFacing
                setActscriptWait ALLY_PETER,eas_DeactivateAutoFacing
                customActscriptWait ALLY_PETER
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions FOLLOWER_B
                 moveDown 2
                endActions
                csWait 16
                entityActions ALLY_PETER
                 moveDown 2
                endActions
                waitIdle FOLLOWER_B
                setActscriptWait ALLY_PETER,eas_StopMoving
                nextSingleText $0,ALLY_PETER ; "Sir Astral?{W1}"
                nextSingleText $0,FOLLOWER_B ; "Hmmmm....{W1}"
                entityActions FOLLOWER_B
                 moveDown 2
                endActions
                entityActions ALLY_PETER
                 moveDown 2
                endActions
                waitIdle FOLLOWER_B
                setActscriptWait ALLY_PETER,eas_StopMoving
                nextSingleText $0,ALLY_PETER ; "Sir Astral!!!{W1}"
                customActscriptWait FOLLOWER_B
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait FOLLOWER_B,eas_Jump
                setActscriptWait FOLLOWER_B,eas_DeactivateAutoFacing
                entityActionsWait FOLLOWER_B
                 moveUp 4
                endActions
                nextSingleText $0,FOLLOWER_B ; "Whhhhhhat?{N}{NAME;7}, don't scare me!{W1}"
                shiver FOLLOWER_B
                customActscriptWait ALLY_PETER
                 ac_setSpeed 32,32      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setCamDest 9,11
                entityActionsWait ALLY_PETER
                 moveUp 3
                endActions
                nextText $0,ALLY_PETER  ; "What's wrong with you?{W2}"
                nextSingleText $0,ALLY_PETER ; "Should we go into the shrine{N}now?{W1}"
                nextSingleText $0,FOLLOWER_B ; "Oh, sorry.{W1}"
                customActscriptWait FOLLOWER_B
                 ac_setSpeed 32,32      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait FOLLOWER_B,eas_Init
                entityActionsWait FOLLOWER_B
                 moveRight 1
                endActions
                setFacing FOLLOWER_B,UP
                nextText $0,FOLLOWER_B  ; "Zalbard...at least he's not{N}as strong as Odd Eye.{W2}"
                nextText $0,FOLLOWER_B  ; "But still, he's a greater{N}devil.{W2}"
                nextSingleText $0,FOLLOWER_B ; "We had better complete our{N}preparations before we go in.{W1}"
                nextSingleText $0,ALLY_BOWIE ; "OK.{W1}"
                nod ALLY_PETER
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                followEntity FOLLOWER_B,ALLY_BOWIE,2
                followEntity ALLY_PETER,FOLLOWER_B,2
                setBlocks 0,38,2,3,14,10
                setF 840                ; Set after the door to the Mitula Shrine is opened
                csc_end
