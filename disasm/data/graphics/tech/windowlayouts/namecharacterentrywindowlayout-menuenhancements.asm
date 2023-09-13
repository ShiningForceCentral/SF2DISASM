
; ASM FILE data\graphics\tech\windowlayouts\namecharacterentrywindowlayout-menuenhancements.asm :
; Name character entry window layout : Included when patch EIGHT_CHARACTERS_MEMBER_NAMES is enabled.
NameEntryWindowLayout:
                
; Syntax        vdpBaseTile [VDPTILE_]index[|mirror|flip]
                
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
                vdpBaseTile UNDERSCORE
                vdpBaseTile UNDERSCORE
                vdpBaseTile UNDERSCORE
                vdpBaseTile UNDERSCORE
                vdpBaseTile UNDERSCORE
                vdpBaseTile UNDERSCORE
                vdpBaseTile UNDERSCORE
                vdpBaseTile UNDERSCORE
                vdpBaseTile V_BORDER|MIRROR
                
; 3rd line
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
                
