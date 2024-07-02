
; ASM FILE data\graphics\tech\windowlayouts\battleequipwindowlayout.asm :
; 0x114BE..0x11572 : Battlefield equip window layout
layout_BattleEquipWindow:
                
; Syntax        vdpBaseTile [VDPTILE_]enum[|MIRROR|FLIP]
;
; Notes: PALETTE3 and PRIORITY bits are always set.
;        Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
; 1st line
                vdpBaseTile CORNER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile CORNER|MIRROR
                
; 2nd line
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_A
                vdpBaseTile UPPERCASE_T
                vdpBaseTile UPPERCASE_T
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile NUMBER_9
                vdpBaseTile NUMBER_9
                vdpBaseTile V_BORDER|MIRROR
                
; 3rd line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 4th line
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_D
                vdpBaseTile UPPERCASE_E
                vdpBaseTile UPPERCASE_F
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile NUMBER_9
                vdpBaseTile NUMBER_9
                vdpBaseTile V_BORDER|MIRROR
                
; 5th line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 6th line
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_A
                vdpBaseTile UPPERCASE_G
                vdpBaseTile UPPERCASE_I
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile NUMBER_9
                vdpBaseTile NUMBER_9
                vdpBaseTile V_BORDER|MIRROR
                
; 7th line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 8th line
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_M
                vdpBaseTile UPPERCASE_O
                vdpBaseTile UPPERCASE_V
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile NUMBER_9
                vdpBaseTile V_BORDER|MIRROR
                
; 9th line
                vdpBaseTile CORNER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile CORNER|MIRROR|FLIP
