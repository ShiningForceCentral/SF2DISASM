
; ASM FILE data\maps\entries\map14\mapsetups\scripts_1.asm :
; 0x58F5C..0x58F9A : 
cs_58F5C:       moveNextToPlayer 129,DOWN
                textCursor 3204
                nextText $0,129         ; "Are you ready?{W1}"
                yesNo
                jumpIfFlagSet 89,cs_58F7E ; YES/NO prompt answer
                textCursor 3206
                nextSingleText $0,129   ; "I want to leave soon.{N}Finish your preparations.{W1}"
                csc_end
cs_58F7E:       nextSingleText $0,129   ; "Are you ready?{W1}"
                entityActions 129
                 moveDown 4
                endActions
                entityActionsWait ALLY_BOWIE
                 moveDown 4
                endActions
                warp MAP_OVERWORLD_NORTH_SOUTH_PARMECIA_JUNCTION,1,1,DOWN
                csc_end
