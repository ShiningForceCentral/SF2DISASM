
; GAME SECTION 16 :
; 0x1D8000..0x1E0000 : Icons
; FREE SPACE : 126 bytes.


                includeIfVanillaLayout "code\common\tech\pointers\s16_iconspointer.asm"    ; Game Section 16 Icons Pointer
                includeIfVanillaRom "data\graphics\icons\entries.asm"   ; Icons
                
                includeIfExpandedRom "data\stats\items\itemdefs.asm"        ; Item definitions
                includeIfExpandedRom "data\stats\spells\spelldefs.asm"      ; Spell definitions
                includeIfExpandedRom "data\stats\items\itemnames.asm"       ; Item names
                align
                if (STANDARD_BUILD&EXTENDED_SPELL_NAMES=1)
                    includeIfExpandedRom "data\stats\spells\extendedspellnames.asm"
                else
                    includeIfExpandedRom "data\stats\spells\spellnames.asm"    ; Spell names
                endif
                align
                includeIfExpandedRom "data\stats\allies\growthcurves.asm"   ; Stat growth curves
                includeIfExpandedRom "data\stats\allies\stats\entries.asm"  ; Ally stats
                align
                includeIfExpandedRom "data\stats\allies\allystartdefs.asm"      ; Ally start definitions
                includeIfExpandedRom "data\stats\allies\classes\classdefs-standard.asm"  ; Class definitions
                if (STANDARD_BUILD&FULL_CLASS_NAMES=1)
                    includeIfExpandedRom "data\stats\allies\classes\fullclassnames.asm"
                    align
                endif
                align $1E0000
