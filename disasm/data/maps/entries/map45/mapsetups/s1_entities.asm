
; ASM FILE data\maps\entries\map45\mapsetups\s1_entities.asm :
; 0x5FF7A..0x60024 : 
ms_map45_Entities:
                msFixedEntity 6, 6, DOWN, 25, eas_Init
                msWalkingEntity 12, 30, DOWN, 185, 12, 30, 1
                msFixedEntity 12, 27, RIGHT, 185, eas_Init
                msFixedEntity 13, 27, LEFT, 185, eas_Init
                msFixedEntity 12, 24, DOWN, 146, eas_Init
                msFixedEntity 15, 28, UP, 184, eas_5FFC4
                msFixedEntity 9, 26, UP, 184, eas_5FFC8
                msFixedEntity 63, 63, UP, 181, eas_Init
                msFixedEntity 63, 63, UP, 180, eas_Init
                msEntitiesEnd
eas_5FFC4:       ac_wait 16
eas_5FFC8:       ac_11 $0
                 ac_setSpeed 20,20
                 ac_12 $0
                 ac_13 $0
                 ac_set1Cb7 $FFFF
                 ac_setAnimCounter $0
                 ac_setFacing DOWN
                 ac_updateSprite
                 ac_moveRel 0,65535
                 ac_wait 8
                 ac_moveRel 0,0
                 ac_setFacing RIGHT
                 ac_updateSprite
                 ac_wait 8
                 ac_setFacing UP
                 ac_updateSprite
                 ac_moveRel 0,1
                 ac_wait 8
                 ac_moveRel 0,0
                 ac_setFacing RIGHT
                 ac_updateSprite
                 ac_wait 8
word_60020:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFA8
                dc.w (eas_5FFC8-word_60020) & $FFFF
