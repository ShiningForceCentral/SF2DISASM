
; ASM FILE data\battles\entries\battle40\cs_regiontriggered_1.asm :
; 0x4E8A8..0x4E9B2 : Region-activated cutscene 1 for battle 40
rbcs_battle40_1:cameraSpeed $30
                setCamDest 10,17
                setBlocks 11,11,1,1,15,21
                csWait 5
                setBlocks 11,11,1,1,17,20
                csWait 5
                setBlocks 11,11,1,1,13,19
                csWait 5
                setBlocks 11,11,1,1,11,22
                csWait 5
                setBlocks 11,11,1,1,16,21
                csWait 5
                setBlocks 11,11,1,1,15,22
                csWait 4
                setBlocks 11,11,1,1,14,20
                csWait 4
                setBlocks 11,11,1,1,15,20
                csWait 4
                setBlocks 11,11,1,1,16,22
                csWait 4
                setBlocks 11,11,1,1,16,23
                csWait 4
                setBlocks 11,11,1,1,14,22
                csWait 3
                setBlocks 11,11,1,1,10,23
                csWait 3
                setBlocks 11,11,1,1,16,20
                csWait 3
                setBlocks 11,11,1,1,13,20
                csWait 3
                setBlocks 11,11,1,1,14,21
                csWait 3
                setBlocks 11,11,1,1,17,21
                csWait 2
                setBlocks 11,11,1,1,18,22
                csWait 2
                setBlocks 11,11,1,1,16,19
                csWait 2
                setBlocks 11,11,1,1,17,22
                csWait 2
                setBlocks 11,11,1,1,17,23
                csWait 2
                setBlocks 11,11,1,1,12,19
                csWait 1
                setBlocks 11,11,1,1,18,20
                csWait 1
                setBlocks 11,11,1,1,13,22
                csWait 1
                setBlocks 11,11,1,1,15,19
                csWait 1
                setBlocks 11,11,1,1,19,22
                setF 387                ; Set after the first set of tile changes in the Oddeye battle
                csc_end
