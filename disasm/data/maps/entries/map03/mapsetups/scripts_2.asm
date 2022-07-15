
; ASM FILE data\maps\entries\map03\mapsetups\scripts_2.asm :
; 0x628C8..0x6299A : 
cs_628C8:       textCursor 3915
                nextText $0,135         ; "I envy you.{N}I'm an old woman now.{W2}"
                nextSingleText $0,135   ; "Nobody kisses me anymore.{W1}"
                setDest ALLY_BOWIE,25,28
                setFacing ALLY_BOWIE,UP
                setDest 136,25,27
                setFacing 136,RIGHT
                setFacing 135,LEFT
                nextText $0,136         ; "You're wrong!{W2}"
                nextSingleText $0,136   ; "I'll kiss you!{W1}"
                csWait 10
                setActscriptWait 135,eas_Jump
                setActscriptWait 135,eas_Jump
                csc_end
cs_6290C:       hideText
                entityActionsWait 138
                 moveDown 1
                endActions
                setDest ALLY_BOWIE,42,10
                setDest ALLY_KAZIN,42,10
                setDest ALLY_SARAH,42,10
                setDest ALLY_JAHA,42,10
                setDest ALLY_CHESTER,42,10
                followEntity ALLY_BOWIE,138,2
                followEntity ALLY_KAZIN,138,5
                followEntity ALLY_SARAH,138,6
                followEntity ALLY_JAHA,ALLY_KAZIN,2
                followEntity ALLY_CHESTER,ALLY_SARAH,2
                entityActionsWait 138
                 moveDown 1
                 moveLeft 1
                 moveDown 1
                 moveDown 1
                 moveDown 1
                endActions
                entityActionsWait 138
                 moveDown 3
                 moveLeft 6
                 eaWait 10
                endActions
                entityActionsWait 138
                 moveUp 8
                 moveLeft 6
                 moveUp 2
                 eaWait 10
                 moveUp 6
                endActions
                warp MAP_GRANSEAL_CASTLE_2F,26,30,UP
                csc_end
