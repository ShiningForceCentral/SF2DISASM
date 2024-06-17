
; ASM FILE data\stats\specialmovetypes-standard.asm :
;

; Large 2x2 mapblocks mapsprites. 
; Note that the engine can normally handle a maximum of 10 sprites, and also that each sprite has a unique hardcoded behavior.
table_SpecialSprites:
                
; Syntax        dc.w entityMapspriteIndex, specialMapspriteIndex, 0 if ally/NPC or -1 if enemy (for the purpose of determining minimap indicators)
                
                dc.w MAPSPRITE_TAROS, SPECIALSPRITE_TAROS, -1
                dc.w MAPSPRITE_KRAKEN_HEAD, SPECIALSPRITE_KRAKEN_1, -1
                dc.w MAPSPRITE_NAZCA_SHIP, SPECIALSPRITE_NAZCA_SHIP, 0
                dc.w MAPSPRITE_EVIL_SPIRIT, SPECIALSPRITE_EVIL_SPIRIT, 0
                dc.w MAPSPRITE_ZEON, SPECIALSPRITE_ZEON_1, -1
                dc.w MAPSPRITE_SPECIAL10, SPECIALSPRITE_ZEON_2, -1
                dc.w MAPSPRITE_SPECIAL9, SPECIALSPRITE_KRAKEN_2, -1
                dc.w MAPSPRITE_SPECIAL8, SPECIALSPRITE_KRAKEN_3, -1
                dc.w MAPSPRITE_SPECIAL7, SPECIALSPRITE_KRAKEN_4, -1
                dc.w MAPSPRITE_SPECIAL6, SPECIALSPRITE_KRAKEN_5, -1
                
                tableEnd.w
