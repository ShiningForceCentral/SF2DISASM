
; GAME SECTION 16 :
; 0x1D8000..0x1E0000 : Icons
; FREE SPACE : 126 bytes.


p_Icons:        dc.l Icon000
                includeIfVanillaRom "data\graphics\icons\entries.asm"       ; Icons
                includeIfExpandedRom "data\stats\allies\growthcurves.asm"   ; Stat growth curves
                includeIfExpandedRom "data\stats\allies\stats\entries.asm"  ; Ally stats
                wordAlign
                includeIfExpandedRom "data\stats\allies\allystartdefs.asm"      ; Ally start definitions
                includeIfExpandedRom "data\stats\allies\classes\classdefs.asm"  ; Class definitions
                align $1E0000
