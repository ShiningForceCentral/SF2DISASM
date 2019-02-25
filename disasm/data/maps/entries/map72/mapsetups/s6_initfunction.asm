
; ASM FILE data\maps\entries\map72\mapsetups\s6_initfunction.asm :
; 0x4FF2E..0x4FFDA : 

; =============== S U B R O U T I N E =======================================

ms_map72_InitFunction:
                
                 
                chkFlg  $2CC            ; Set after your raft-giving conversation with the mayor in Polca
                beq.s   return_4FF40
                chkFlg  $A              ; Luke joined
                bne.s   return_4FF40
                script  cs_4FF5A
return_4FF40:
                
                rts

	; End of function ms_map72_InitFunction

                resetMap
                reloadMap 0,0
                playSound MUSIC_SAD_THEME_3
                fadeInB
                textCursor $F0
                nextSingleText $0,$0    ; "That's it for today?{W2}{N}Yes, you had better take a{N}rest now.{N}Come back again.{W1}"
                csc_end
cs_4FF5A:       textCursor $614
                newEntity $A,43,47,DOWN,$FF
                csWait 1
                setPos $0,45,47,LEFT
                setPos $7,44,47,DOWN
                setPos $A,43,47,DOWN
                setPos $1F,45,48,LEFT
                playSound MUSIC_MAIN_THEME
                fadeInB
                csWait 40
                nextSingleText $0,$A    ; "Now, let's go to Devil's Tail{N}to see Creed!{W1}"
                setActscriptWait $A,eas_Jump
                setActscriptWait $A,eas_Jump
                csWait 30
                setFacing $7,LEFT
                setFacing $A,RIGHT
                nextSingleText $C0,$7   ; "It sounds like {NAME;10} is{N}going with us.{W1}"
                nextText $0,$A          ; "I am.  I want to fight with{N}{LEADER}.{W2}"
                nextSingleText $0,$A    ; "This might be exciting!{W1}"
                join $A
                setFacing $7,RIGHT
                nextSingleText $C0,$7   ; "I didn't know you were such{N}an adventurer!{W1}"
                setFacing $7,LEFT
                nextSingleText $0,$A    ; "Alright!{N}Wow!  Let's go!{W1}"
                csWait 30
                entityActionsWait $A
                 moveDown 1
                endActions
                hide $A
                setStoryFlag $10        ; Battle 16 unlocked
                csc_end
