
; ASM FILE data\battles\entries\battle27\cs_battlestart.asm :
; 0x4BE6A..0x4BE8C : Start cutscene for battle 27
bscs_battle27:  textCursor 2658
                cameraSpeed $30
                setCameraEntity 133
                nextSingleText $0,133   ; "Where did you come from?{N}What are you doing here?{W1}"
                setCameraEntity 132
                nextSingleText $0,132   ; "Don't you know about the{N}restrictions?{W1}"
                setCameraEntity 128
                nextSingleText $0,128   ; "Even if you didn't know,{N}that's just to bad.{W1}"
                csc_end
