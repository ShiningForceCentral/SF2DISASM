
; ASM FILE data\graphics\tech\windowlayouts\namecharacterentrywindowlayout.asm :
; 0x16204..0x1623A : Name character entry window layout
NameEntryWindowLayout:
                dc.w $C060
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                
                if (EIGHT_CHARACTERS_MEMBER_NAMES=1)
                dc.w $C061
                endif
                
                dc.w $C860
                dc.w $C070
                dc.w $C05F
                dc.w $C05F
                dc.w $C05F
                dc.w $C05F
                dc.w $C05F
                dc.w $C05F
                dc.w $C05F
                
                if (EIGHT_CHARACTERS_MEMBER_NAMES=1)
                dc.w $C05F
                endif
                
                dc.w $C870
                dc.w $D060
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                
                if (EIGHT_CHARACTERS_MEMBER_NAMES=1)
                dc.w $D061
                endif
                
                dc.w $D860
