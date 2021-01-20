
; ASM FILE data\maps\entries\map61\mapsetups\scripts.asm :
; 0x5C6CA..0x5C76A : 
cs_5C6CA:       textCursor 3642
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_A,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setDest ALLY_BOWIE,4,9
                setFacing ALLY_BOWIE,UP
                setDest ALLY_PETER,6,9
                setFacing ALLY_PETER,UP
                setCamDest 0,5
                setDest FOLLOWER_A,5,7
                setDest FOLLOWER_B,5,9
                setFacing FOLLOWER_B,UP
                setFacing FOLLOWER_A,DOWN
                nextSingleText $0,FOLLOWER_A ; "It's my job!{W1}"
                setFacing FOLLOWER_A,UP
                nextSingleText $0,FOLLOWER_A ; "Row...sham...bow!{W1}"
                entityFlashWhite FOLLOWER_A,$28
                playSound SFX_BATTLEFIELD_DEATH
                setQuake 2
                setBlocks 11,0,1,1,5,6
                csWait 30
                setQuake 0
                setFacing FOLLOWER_A,DOWN
                nextSingleText $0,FOLLOWER_A ; "OK, you go first!{W1}"
                setStoryFlag 15         ; Battle 15 unlocked - BATTLE_SHRINE_SOUTH_OF_RIBBLE    
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                followEntity FOLLOWER_A,FOLLOWER_B,2
                csc_end
