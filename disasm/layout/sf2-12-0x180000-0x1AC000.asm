
; GAME SECTION 12 :
; 0x180000..0x1AC000 : Ally battlesprites, status anim tiles, battlescene transition tiles, bolt graphics, ally and enemy animations
; FREE SPACE : 871 bytes.


                include "code\common\tech\pointers\s12_pointers.asm"    ; Game Section 12 Pointers
                include "data\graphics\battles\battlesprites\allies\entries.asm"    ; Ally battlesprites
                include "data\graphics\battles\tech\statusanimation\entries.asm"    ; Status effect animation tiles
                include "data\graphics\battles\tech\battlescenetransition\entries.asm"    ; Battlescene transition tiles
                include "data\graphics\battles\spells\animations\boltanimdata.asm"    ; Bolt spell animation data
                include "data\graphics\battles\battlesprites\allies\animations\entries.asm"    ; Ally animations
                include "data\graphics\battles\battlesprites\enemies\animations\entries.asm"    ; Enemy animations
                align $4000
