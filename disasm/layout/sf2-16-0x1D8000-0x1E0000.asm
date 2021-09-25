
; GAME SECTION 16 :
; 0x1D8000..0x1E0000 : Icons
; FREE SPACE : 126 bytes.


p_Icons:        dc.l Icon000
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    include "data\stats\items\itemdefs.asm"     ; Item definitions
                    include "data\stats\spells\spelldefs.asm"   ; Spell definitions
                    include "data\stats\items\itemnames.asm"    ; Item names
                    if (EXTENDED_SPELL_NAMES=1)
                        include "data\stats\spells\extendedspellnames.asm"
                    else
                        include "data\stats\spells\spellnames.asm"    ; Spell names
                    endif
                else
                    include "data\graphics\icons\entries.asm"    ; Icons
                endif
                align $8000
