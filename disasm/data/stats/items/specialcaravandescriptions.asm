
; ASM FILE data\stats\items\specialcaravandescriptions.asm :
; 0x228A2..0x228A8 : Special Caravan descriptions
tbl_SpecialCaravanDescriptions:
                
; Syntax        specialCaravanDescription [ITEM_]enum, parameter, [MESSAGE_CARAVANDESC_]enum
;
; Notes: 4 bytes per entry.
;        parameter = Number of lines to display.
;        Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                specialCaravanDescription CHIRRUP_SANDALS, 2, CHIRRUP_SANDALS 
                                                        ; "Chirrup sandals.{W2}"
                                        ; "They make you happy when{N}you wear them.{W1}"
                
                tableEnd
