
; ASM FILE data\battles\entries\battle40\cs_regiontriggered_2.asm :
; 0x4E9B2..0x4EA94 : Region-activated cutscene 2 for battle 40
rbcs_battle40_2:cameraSpeed $30
                setCamDest 13,8
                setBlocks 11,11,1,1,19,10
                csWait 5
                setBlocks 11,11,1,1,19,11
                csWait 5
                setBlocks 11,11,1,1,20,12
                csWait 5
                setBlocks 11,11,1,1,21,11
                csWait 5
                setBlocks 11,11,1,1,21,12
                csWait 5
                setBlocks 11,11,1,1,22,12
                csWait 4
                setBlocks 11,11,1,1,19,12
                csWait 4
                setBlocks 11,11,1,1,18,11
                csWait 4
                setBlocks 11,11,1,1,20,13
                csWait 4
                setBlocks 11,11,1,1,19,13
                csWait 4
                setBlocks 11,11,1,1,18,10
                csWait 3
                setBlocks 11,11,1,1,18,12
                csWait 3
                setBlocks 11,11,1,1,18,13
                csWait 3
                setBlocks 11,11,1,1,17,12
                csWait 3
                setBlocks 11,11,1,1,19,14
                csWait 3
                setBlocks 11,11,1,1,20,14
                csWait 2
                setBlocks 11,11,1,1,21,14
                csWait 2
                setBlocks 11,11,1,1,17,10
                csWait 2
                setBlocks 11,11,1,1,16,12
                csWait 2
                setBlocks 11,11,1,1,17,13
                csWait 2
                setBlocks 11,11,1,1,13,14
                setF 388                ; Set after the second set of tile changes in the Oddeye battle
                csc_end
