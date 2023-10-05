
; ASM FILE data\stats\items\spellcastmessages-standard.asm :

; Spells that display a special message for all levels.
table_SpellcastMessagesForIndexes:
                
                dc.w SPELL_SPOIT, MESSAGE_SPELLCAST_PUT_ON_A_DEMON_SMILE    ; {NAME} put on{N}a demon's smile.
                dc.w SPELL_FLAME, MESSAGE_SPELLCAST_BELCHED_OUT_FLAMES      ; {NAME} belched{N}out flames!
                dc.w SPELL_KIWI, MESSAGE_SPELLCAST_BELCHED_OUT_FLAMES       ; {NAME} belched{N}out flames!
                dc.w SPELL_SNOW, MESSAGE_SPELLCAST_BLEW_OUT_A_SNOWSTORM     ; {NAME} blew out{N}a snowstorm!
                dc.w SPELL_DEMON, MESSAGE_SPELLCAST_CAST_DEMON_BREATH       ; {NAME} cast{N}demon breath!
                dc.w SPELL_ODDEYE, MESSAGE_SPELLCAST_ODD_EYE_BEAM           ; Odd-eye beam!
                dc.w SPELL_DAO, MESSAGE_SPELLCAST_SUMMONED                  ; {NAME} summoned{N}{SPELL}!{D1}
                dc.w SPELL_APOLLO, MESSAGE_SPELLCAST_SUMMONED               ; {NAME} summoned{N}{SPELL}!{D1}
                dc.w SPELL_NEPTUN, MESSAGE_SPELLCAST_SUMMONED               ; {NAME} summoned{N}{SPELL}!{D1}
                dc.w SPELL_ATLAS, MESSAGE_SPELLCAST_SUMMONED                ; {NAME} summoned{N}{SPELL}!{D1}
                
                tableEnd


; Spells that display a different special message for each level.
table_SpellcastMessagesForEntries:
                
                dc.w SPELL_AQUA|SPELL_LV1, MESSAGE_SPELLCAST_BLEW_OUT_AQUA_BREATH   ; {NAME} blew out{N}aqua-breath!
                dc.w SPELL_AQUA|SPELL_LV2, MESSAGE_SPELLCAST_BLEW_OUT_BUBBLE_BREATH ; {NAME} blew out{N}bubble-breath!
                
                tableEnd
