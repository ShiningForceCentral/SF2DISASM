
; ASM FILE data\graphics\tech\menus\spelllevelindiacatorlayouts.asm :
; 0x110A4..0x1115C : Spell level indicator layouts
pt_layouts_SpellLevelIndicator:
                dc.l layout_SpellLevelIndicator
                dc.l layout_SpellLevelIndicator
                dc.l layout_SpellLevelIndicator
                dc.l layout_SpellLevelIndicator
                dc.l layout_SpellLevelIndicator_1in2
                dc.l layout_SpellLevelIndicator_2
                dc.l layout_SpellLevelIndicator_2
                dc.l layout_SpellLevelIndicator_2
                dc.l layout_SpellLevelIndicator_1in3
                dc.l layout_SpellLevelIndicator_2in3
                dc.l layout_SpellLevelIndicator_3
                dc.l layout_SpellLevelIndicator_3
                dc.l layout_SpellLevelIndicator_1in4
                dc.l layout_SpellLevelIndicator_2in4
                dc.l layout_SpellLevelIndicator_3in4
                dc.l layout_SpellLevelIndicator_4
layout_SpellLevelIndicator:
                
; Syntax        vdpBaseTile [VDPTILE_]enum[|MIRROR|FLIP]
;
; Notes: PALETTE3 and PRIORITY bits are always set.
;        Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL2
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                
layout_SpellLevelIndicator_2:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                
layout_SpellLevelIndicator_3:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL2
                vdpBaseTile SPACE
                
layout_SpellLevelIndicator_4:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                
layout_SpellLevelIndicator_1in2:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL6
                vdpBaseTile SPELL_LEVEL5
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                
layout_SpellLevelIndicator_2in3:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPELL_LEVEL5|MIRROR
                vdpBaseTile SPELL_LEVEL8
                vdpBaseTile SPACE
                
layout_SpellLevelIndicator_3in4:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL6
                vdpBaseTile SPELL_LEVEL5
                
layout_SpellLevelIndicator_1in3:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL6
                vdpBaseTile SPELL_LEVEL5
                vdpBaseTile SPELL_LEVEL5|MIRROR
                vdpBaseTile SPELL_LEVEL8
                vdpBaseTile SPACE
                
layout_SpellLevelIndicator_2in4:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPELL_LEVEL5|MIRROR
                vdpBaseTile SPELL_LEVEL7
                vdpBaseTile SPELL_LEVEL5
                
layout_SpellLevelIndicator_1in4:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL6
                vdpBaseTile SPELL_LEVEL5
                vdpBaseTile SPELL_LEVEL5|MIRROR
                vdpBaseTile SPELL_LEVEL7
                vdpBaseTile SPELL_LEVEL5
                
