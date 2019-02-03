
; ASM FILE data\maps\global\flagswitchedmaps.asm :
; 0x7988..0x799C : Flag-switched maps
FlagSwitchedMaps:
                dc.w 3, $280, 4         ; maps to change if flags are set
                                        ; map idx (word), flag (word), new map idx (word)
                dc.w 71, 530, 78
                dc.w 58, 999, 59
                dc.w $FFFF
