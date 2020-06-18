
; GAME SECTION 09 :
; 0x0C8000..0x100000 : Entity Sprites
; FREE SPACE : 1315 bytes.


                includeIfVanillaRom "data\graphics\mapsprites\entries.asm"    ; Map sprites
                includeIfExpandedRom "data\graphics\battles\spells\entries.asm"    ; Spell Graphics
                alignIfExpandedRom $E0000
                includeIfExpandedRom "data\battles\terrainentries.asm"    ; Battle terrain data
                align $100000
