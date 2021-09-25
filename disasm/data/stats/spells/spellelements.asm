
; ASM FILE data\stats\spells\spellelements.asm :
; 0xC24E..0xC27A : Spell elements table
tbl_SpellElements:
                
; Syntax        spellElement [SPELLELEMENT_]enum (or index)
                
                spellElement NEUTRAL    ; 0: HEAL
                spellElement NEUTRAL    ; 1: AURA
                spellElement STATUS     ; 2: DETOX
                spellElement STATUS     ; 3: BOOST
                spellElement STATUS     ; 4: SLOW
                spellElement STATUS     ; 5: ATTACK
                spellElement STATUS     ; 6: DISPEL
                spellElement STATUS     ; 7: MUDDLE
                spellElement STATUS     ; 8: DESOUL
                spellElement STATUS     ; 9: SLEEP
                spellElement NEUTRAL    ; 10: EGRESS
                spellElement FIRE       ; 11: BLAZE
                spellElement ICE        ; 12: FREEZE
                spellElement LIGHTNING  ; 13: BOLT
                spellElement WIND       ; 14: BLAST
                spellElement NEUTRAL    ; 15: SPOIT
                spellElement NEUTRAL    ; 16: HEALIN
                spellElement FIRE       ; 17: FLAME
                spellElement ICE        ; 18: SNOW
                spellElement NEUTRAL    ; 19: DEMON
                spellElement NEUTRAL    ; 20: POWER
                spellElement NEUTRAL    ; 21: GUARD
                spellElement NEUTRAL    ; 22: SPEED
                spellElement NEUTRAL    ; 23: IDATEN
                spellElement NEUTRAL    ; 24: HEALTH
                spellElement NEUTRAL    ; 25: B.ROCK
                spellElement NEUTRAL    ; 26: LASER
                spellElement NEUTRAL    ; 27: KATON
                spellElement NEUTRAL    ; 28: RAIJIN
                spellElement WIND       ; 29: DAO
                spellElement FIRE       ; 30: APOLLO
                spellElement ICE        ; 31: NEPTUN
                spellElement NEUTRAL    ; 32: ATLAS
                spellElement NEUTRAL    ; 33: POWDER
                spellElement NEUTRAL    ; 34: G.TEAR
                spellElement NEUTRAL    ; 35: HANNY
                spellElement NEUTRAL    ; 36: BRAVE
                spellElement FIRE       ; 37: F.BALL
                spellElement ICE        ; 38: BREZAD
                spellElement LIGHTNING  ; 39: THUNDR
                spellElement ICE        ; 40: AQUA
                spellElement FIRE       ; 41: KIWI
                spellElement NEUTRAL    ; 42: SHINE
                spellElement LIGHTNING  ; 43: ODDEYE
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    spellElement NEUTRAL    ; 44: 
                    spellElement NEUTRAL    ; 45: 
                    spellElement NEUTRAL    ; 46: 
                    spellElement NEUTRAL    ; 47: 
                    spellElement NEUTRAL    ; 48: 
                    spellElement NEUTRAL    ; 49: 
                    spellElement NEUTRAL    ; 50: 
                    spellElement NEUTRAL    ; 51: 
                    spellElement NEUTRAL    ; 52: 
                    spellElement NEUTRAL    ; 53: 
                    spellElement NEUTRAL    ; 54: 
                    spellElement NEUTRAL    ; 55: 
                    spellElement NEUTRAL    ; 56: 
                    spellElement NEUTRAL    ; 57: 
                    spellElement NEUTRAL    ; 58: 
                    spellElement NEUTRAL    ; 59: 
                    spellElement NEUTRAL    ; 60: 
                    spellElement NEUTRAL    ; 61: 
                    spellElement NEUTRAL    ; 62: 
                endif
