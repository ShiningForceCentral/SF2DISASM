
; ASM FILE data\battles\entries\battle27\cs_battlestart.asm :
; 0x4BE6A..0x4BE8C : Start cutscene for battle 27
bscs_battle27:  textCursor $A62
                cameraSpeed $30
                setCameraEntity $85
                nextSingleText $0,$85   ; "Where did you come from?{N}What are you doing here?{W1}"
                setCameraEntity $84
                nextSingleText $0,$84   ; "Don't you know about the{N}restrictions?{W1}"
                setCameraEntity $80
                nextSingleText $0,$80   ; "Even if you didn't know,{N}that's just to bad.{W1}"
                csc_end
