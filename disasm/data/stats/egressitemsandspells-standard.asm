
; ASM FILE data\stats\egressitemsandspells-standard.asm :

; Items that perform the Egress action when used on the field or in battle.
;
table_EgressItems:
                
                dc.b ITEM_ANGEL_WING
                
                tableEnd.b


; Same as above, but for spells.
;
table_EgressSpells:
                
                dc.b SPELL_EGRESS
                
                tableEnd.b

