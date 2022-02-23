CAPITALIZED_CHARACTER_NAMES: equ 0              ; 0 = OFF, 1 = ON
DISABLE_REGION_LOCK: equ 0                      ; 0 = OFF, 1 = ON
SOUND_TEST_RESTORATION: equ 0                   ; 0 = OFF, 1 = ON
MUSIC_RESUMING: equ 0                           ; 0 = OFF, 1 = ON
; Debugging facilitations
EASY_BATTLE_TEST: equ 0                         ; 0 = OFF, 1 = ON
EASY_CONFIGURATION_MODE: equ 0                  ; 0 = OFF, 1 = ON
EASY_DEBUG_MODE: equ 0                          ; 0 = OFF, 1 = ON
; Bugfixes
BUGFIX_SEARCH_IN_BATTLE: equ 0                  ; 0 = OFF, 1 = ON
BUGFIX_SKIPPED_TURNS: equ 0                     ; 0 = OFF, 1 = ON. Fixes cases where a combatant can miss a turn because of AGI getting higher than 127.
BUGFIX_INCREASE_DOUBLE_RESETS_COUNTER: equ 0    ; 0 = OFF, 1 = ON
BUGFIX_GODDESS_STAFF_DEALS_ABUSE: equ 0         ; 0 = OFF, 1 = ON
BUGFIX_GARBLED_HP_BAR: equ 0                    ; 0 = OFF, 1 = ON. Prevents drawing garbage pixels when HP is greater then 600.
BUGFIX_KIWI_SPELLS_LEARNING_LEVEL: equ 0        ; 0 = OFF, 1 = ON. Kiwi's base class is wrongfully treated as promoted for the purpose of learning spells.
BUGFIX_HIGINS_SPELL: equ 0                      ; 0 = OFF, 1 = ON. Prevent unequipping from possibly corrupting characters spell entries.
BUGFIX_MOVEMENT_GLITCH: equ 0                   ; 0 = OFF, 1 = ON.
FIX_CARAVAN_FREE_REPAIR_EXPLOIT: equ 0          ; 0 = OFF, 1 = ON.
FIX_PRISM_FLOWER_OVERWORLD_ENTRANCE: equ 0      ; 0 = OFF, 1 = ON. On Map 77, walking to the right on the tile closest to the bottom mountain brings the player into the Prism Flower battle rather than to the world map to the right.
; Data expansions
FORCE_MEMBERS_EXPANSION: equ 0                  ; 0 = OFF, 1 = ON. Enable the use of 2 additional force members.
ITEMS_AND_SPELLS_EXPANSION: equ 0               ; 0 = OFF, 1 = ON. Requires 4MB expanded ROM layout! Also requires to increase save slot size by at least 64 bytes to accomodate doubled deals items list length.
; Battle mechanics
BOWIE_CAN_DIE: equ 0                            ; 0 = OFF, 1 = ON. Bowie's death does not cause defeat.
BOWIE_CAN_LEAVE_BATTLE_PARTY: equ 0             ; 0 = OFF, 1 = ON. Player is required to leave at least one member in the party. Message #20 should be edited to reflect this new rule.
PERCENT_POISON_DAMAGE: equ 0                    ; 0 = OFF, 1-100 = n% of max HP
; Menu enhancements
THREE_DIGITS_STATS: equ 0                       ; 0 = OFF, 1 = ON
EIGHT_CHARACTERS_MEMBER_NAMES: equ 0            ; 0 = OFF, 1 = ON
FULL_CLASS_NAMES: equ 0                         ; 0 = OFF, 1 = ON
ALTERNATE_JEWEL_ICONS_DISPLAY: equ 0            ; 0 = OFF, 1 = small icons, 2 = no display
EXTENDED_SPELL_NAMES: equ 0                     ; 0 = OFF, 1 = ON
SHOW_ENEMY_LEVEL: equ 0                         ; 0 = OFF, 1 = ON
SHOW_ALL_SPELLS_IN_MEMBER_SCREEN: equ 0         ; 0 = OFF, 1 = ON
; Hardware modifications
EXPANDED_SRAM: equ 0                            ; 0 = OFF, 1 = ON. Expands SRAM to 32KB.
EXPANDED_SAVE_SLOT_SIZE: equ 0                  ; 0 = OFF, 1-1024 = Additional save slot bytes. 1024 is recommeneded as the max value. Requires EXPANDED_SRAM enabled.
