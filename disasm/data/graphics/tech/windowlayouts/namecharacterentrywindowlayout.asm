
; ASM FILE data\graphics\tech\windowlayouts\namecharacterentrywindowlayout.asm :
; 0x16204..0x1623A : Name character entry window layout
NameEntryWindowLayout:
                
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
                vdpBaseTile CORNER|MIRROR|FLIP
                
