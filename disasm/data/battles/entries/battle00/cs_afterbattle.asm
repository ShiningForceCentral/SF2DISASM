
; ASM FILE data\battles\entries\battle00\cs_afterbattle.asm :
; 0x4F47A..0x4F48A : Cutscene after battle 0
abcs_battle00:  textCursor 466
                playSound MUSIC_ITEM
                nextSingleText $FF,255  ; "Game over!{W1}"
                hideText
                csc_end
