
; ASM FILE data\stats\items\specialcaravandescriptions.asm :
; 0x228A2..0x228A8 : Special Caravan descriptions
tbl_SpecialCaravanDescriptions:
                
; 4 bytes per entry :
;       0:   item index
;       1:   number of lines to display
;       2-3: message index
;
; Syntax        specialCaravanDescription [ITEM_]index, parameter, [MESSAGE_CARAVANDESC_]index
                
                specialCaravanDescription CHIRRUP_SANDALS, 2, CHIRRUP_SANDALS
                
                tableEnd
