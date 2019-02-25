
; ASM FILE data\maps\entries\map03\mapsetups\scripts_2.asm :
; 0x628C8..0x6299A : 
cs_628C8:       textCursor $F4B
                nextText $0,$87         ; "I envy you.{N}I'm an old woman now.{W2}"
                nextSingleText $0,$87   ; "Nobody kisses me anymore.{W1}"
                setDest $0,25,28
                setFacing $0,UP
                setDest $88,25,27
                setFacing $88,RIGHT
                setFacing $87,LEFT
                nextText $0,$88         ; "You're wrong!{W2}"
                nextSingleText $0,$88   ; "I'll kiss you!{W1}"
                csWait 10
                setActscriptWait $87,eas_Jump
                setActscriptWait $87,eas_Jump
                csc_end
cs_6290C:       hideText
                entityActionsWait $8A
                 moveDown 1
                endActions
                setDest $0,42,10
                setDest $4,42,10
                setDest $1,42,10
                setDest $3,42,10
                setDest $2,42,10
                followEntity $0,$8A,$2
                followEntity $4,$8A,$5
                followEntity $1,$8A,$6
                followEntity $3,$4,$2
                followEntity $2,$1,$2
                entityActionsWait $8A
                 moveDown 1
                 moveLeft 1
                 moveDown 1
                 moveDown 1
                 moveDown 1
                endActions
                entityActionsWait $8A
                 moveDown 3
                 moveLeft 6
                 eaWait 10
                endActions
                entityActionsWait $8A
                 moveUp 8
                 moveLeft 6
                 moveUp 2
                 eaWait 10
                 moveUp 6
                endActions
                warp $13,$1A,$1E,$1
                csc_end
