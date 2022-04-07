
; GAME SECTION 19 : ROM EXPANSION.

        include "data\battles\spritesetentries.asm"         ; Battle sprite sets
        include "code\specialscreens\title\graphics.asm"    ; Title Screen Graphics
        include "code\specialscreens\suspend\graphics.asm"  ; Suspend String Graphics
        include "code\specialscreens\endkiss\graphics.asm"  ; End Kiss Graphics
        include "code\specialscreens\credits\gamestaff.asm" ; Game Staff        
        wordAlign
        include "code\specialscreens\jewelend\graphics.asm"             ; Jewel End Graphics
        include "data\graphics\mapsprites\entries.asm"                  ; Map sprites
        include "code\common\tech\graphics\specialspritesentries.asm"   ; Special Sprites Entries
        include "data\graphics\tech\backgroundlayout.asm"               ; Battle Background Layout
        include "data\graphics\battles\backgrounds\entries.asm"         ; Backgrounds
        include "data\maps\entries.asm"                                 ; Map entries table
        alignIfExtendedSsf $400000
        objIfExtendedSsf $200000
        include "data\graphics\battles\battlesprites\enemies\entries.asm"   ; Enemy battlesprites
        wordAlign
        include "data\graphics\battles\battlesprites\allies\entries.asm"    ; Ally battlesprites
        wordAlign
        include "data\graphics\battles\weapons\entries.asm"                 ; Weapons
        include "data\graphics\battles\weapons\palettes\entries.asm"        ; Weapon Palettes
        objendIfExtendedSsf
        alignIfNotExtendedSsf $400000
        alignIfExtendedSsf $600000
