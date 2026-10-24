; You can set here battlescene music override for specific player characters, ENABLE_ALLY_SPECIAL_MUSIC patch must be set to 1 for this table to have effect.
; Per-character music override will play if the character DOESN'T use an item, it will play for standard attacks and spells.
; Per-character music override has the highest priority if you also use support/spell music patches.

table_AllyBattlesceneMusics_Unpromoted:
                ; dc.b ALLY_BOWIE, MUSIC_TOWN
                ; dc.b ALLY_PETER, MUSIC_BOSS_ATTACK ; (I'm sure you understand the joke here ;))
                tableEnd.b

table_AllyBattlesceneMusics_Promoted:
                ; dc.b ALLY_BOWIE, MUSIC_CASTLE
                ; dc.b ALLY_PETER, MUSIC_BOSS_ATTACK
                tableEnd.b
