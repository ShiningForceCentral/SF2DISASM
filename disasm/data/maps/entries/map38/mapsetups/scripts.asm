
; ASM FILE data\maps\entries\map38\mapsetups\scripts.asm :
; 0x5DE2E..0x5DF84 : 
cs_5DE2E:       textCursor $86A
                stopEntity $8E
                playSound $FD
                setCamDest 8,0
                shiver $89
                playSound MUSIC_SAD_THEME_3
                nextSingleText $0,$89   ; "Sir Petro, don't leave me{N}alone!{W1}"
                nextSingleText $0,$8E   ; "Paseran...I'm sorry.{W1}"
                shiver $89
                nextSingleText $0,$89   ; "You promised to fly me in{N}the sky!{W1}"
                nextText $0,$8E         ; "I know...with the Nazca{N}Ship...I promised...{W2}"
                nextText $0,$8E         ; "I'd fly home...to see my{N}family....{W2}"
                nextSingleText $0,$8E   ; "To show them how wonderful{N}the ancients were....{W1}"
                shiver $89
                playSound $FD
                nextSingleText $0,$89   ; "Petro!  No!{W1}"
                playSound $FB
                csc_end
cs_5DE76:       textCursor $879
                setActscriptWait $7,eas_Init
                setActscriptWait $1F,eas_Init
                setCameraEntity $1A
                setDest $0,12,9
                setDest $7,12,8
                setDest $7,13,8
                setDest $1F,12,8
                setDest $1F,14,8
                setActscriptWait $1A,eas_Init
                setDest $1A,11,8
                setFacing $0,LEFT
                setFacing $7,LEFT
                setFacing $1F,LEFT
                entityActionsWait $1A
                 moveLeft 2
                endActions
                entityActionsWait $7
                 moveLeft 2
                endActions
                entityActionsWait $1F
                 moveLeft 1
                endActions
                entityActionsWait $1A
                 moveDown 1
                endActions
                entityActionsWait $1A
                 moveRight 1
                endActions
                entityActionsWait $1A
                 moveUp 1
                endActions
                entityActionsWait $1A
                 moveLeft 2
                endActions
                setActscriptWait $1A,eas_Jump
                setActscript $1A,eas_Jump
                nextSingleText $0,$7    ; "What's wrong with {NAME;26}?{W1}"
                nextSingleText $0,$1F   ; "I have no idea, but he's{N}obviously disturbed!{W1}"
                entityActionsWait $1A
                 moveUp 1
                endActions
                entityActionsWait $1A
                 moveRight 1
                endActions
                entityActionsWait $1A
                 moveDown 1
                endActions
                entityActionsWait $1A
                 moveLeft 2
                endActions
                csWait 30
                nod $1A
                setFacing $1A,RIGHT
                nextSingleText $0,$1A   ; "{LEADER}, Sir Astral!{N}I am angry!{W2}"
                nextSingleText $0,$1A   ; "I cannot forgive the{N}devils!{W2}"
                nextSingleText $0,$1A   ; "I have overridden my{N}restrictions on fighting.{W2}"
                nextSingleText $0,$1A   ; "I am joining your force as{N}a soldier!{W1}"
                join $1A
                clearF $4C              ; Zynk is a follower
                nextSingleText $0,$1A   ; "Let us go defeat the Devil{N}Army!{W1}"
                followEntity $7,$0,$2
                followEntity $1F,$7,$2
                followEntity $1A,$1F,$2
                csc_end
