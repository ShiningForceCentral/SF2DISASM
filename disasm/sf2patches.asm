
; 0 = OFF, 1 = ON

; Debugging facilitations
EASY_DEBUG_MODE:                    equ 0       ; Activate Debug Mode automatically when booting up the game.
EASY_BATTLE_TEST:                   equ 0       ; If Debug Mode is activated, go to Battle Test instead of playing the intro cutscene.
EASY_CONFIGURATION_MODE:            equ 0       ; Activate Configuration Mode automatically, and skip checking if the Start button is pressed.

; Fixes
FIX_SEARCH_IN_BATTLE:               equ 1       ; Restore the ability to search chests during battle.
FIX_INCREASE_DOUBLE_RESETS_COUNTER: equ 1       ; Equipment that increases the chance to double attack also erroneously set the chance to counter attack to 1/32.
FIX_GARBLED_HP_BAR:                 equ 1       ; Prevent drawing garbage pixels when HP is greater then 600. (Keep drawing black bars instead.)
FIX_KIWI_SPELLS_LEARNING_LEVEL:     equ 1       ; Kiwi's base class is wrongfully treated as promoted for the purpose of learning spells.
FIX_HIGINS_SPELL:                   equ 1       ; Prevent unequipping from possibly corrupting characters spell entries.
FIX_MOVEMENT_GLITCH:                equ 1       ; The movement glitch is used in battles to reach places which are out of the controlled character's moving boundaries.
FIX_PRISM_FLOWER_OVERWORLD_ENTRANCE:equ 1       ; On Map 77, walking to the right on the tile closest to the bottom mountain brings the player into the Prism Flower battle rather than to the world map to the right.
FIX_DWARVEN_MINER_VOICE:            equ 1       ; A cutscene has a fairy NPC concluding her dialogue, and when the dwarf delivers his first line, it uses the same female NPC speech sound effect until his follow-up dialogue line.
FIX_CARAVAN_FREE_REPAIR_EXPLOIT:    equ 1       ; Preserve the broken bit when items are stored in the Caravan. (Inventory is reducded to 32 items unless SRAM is expanded.)
FIX_GIZMO_ARRANGEMENT:              equ 1       ; Gizmos spread out into battle places during cutscene.
FIX_CRIT_TABLE:                     equ 1       ; Make the "Increase Crit" effect never lower damage potential.
FIX_GOLD_GIFT:                      equ 1       ; Gold increases when Minister gives you gift in New Granseal
FIX_CARAVAN_DESCRIPTIONS:           equ 1       ; Breaks up character list into chuncks of 4
FIX_SHIP_PRIEST:                    equ 1       ; Ensure priest onboard broken-up ship is usable for church action during battle 08
FIX_LABYRINTH_DELETION:             equ 1       ; Prevent a section of the labyrinth from being deleted due to AI region activation
FIX_ENEMY_BATTLE_EQUIP:             equ 1       ; Enemies will equip battle items as designated in spriteset
FIX_MISSING_RANDOM_BATTLES:         equ 1       ; Adds zone events for random battles without

; Quality of life features
ACCURATE_LAND_EFFECT_DISPLAY:       equ 0       ; Read values to be displayed from a table. Damage multipliers are converted to reduction percent values during assembly through a macro.
CAPITALIZED_CHARACTER_NAMES:        equ 0       ; Capitalize allies and enemies names, as well as change "JAR" and the Chess Army's "DARK BISHOP" to "Jaro" and "Bishop".
NO_AI_JARO:                         equ 0       ; 
NO_AI_PETER:                        equ 0       ; 
NO_DARKNESS_IN_CAVES:               equ 0       ; The darkness gimmick in caves is disabled.
NO_RANDOM_BATTLES:                  equ 0       ; 0 = Battles    1 = No Battles
SPELLS_REFRESH_STATUS_COUNTERS:     equ 0       ; Boost, Slow, and Attack spells refresh status counters instead of failing, as long as the counter is increased by at least 1. Battle messages display the actual regained stats values.
TRADEABLE_ITEMS                     equ 0       ; Allows trading items in battle without full inventory
CUTSCENE_PROTECTION:                equ 1       ; Prevents game from freezing if dead character is needed for scene after leader death (as Slade for battle 5)
CARAVAN_IN_TOWER:                   equ 0       ; Adds access to Caravan before tower climb battle
MINIATURES_SHOP:                    equ 0       ; Places a shopworker on the desktop and floor of the Miniatures Room

; Misc. features
AGILITY_AFFECTS_CHANCE_TO_DODGE:    equ 0       ; Adjust chance to dodge proportionally to the difference between the attacker's and the target's current AGI.
BOWIE_CAN_DIE:                      equ 0       ; Bowie's death does not cause defeat.
BOWIE_CAN_LEAVE_BATTLE_PARTY:       equ 0       ; Player is required to leave at least one member in the party. Message #20 should be edited to reflect this new rule.
DIAGONAL_LASERS:                    equ 0       ; Allows laser based enemies to fire in 8 directions (Up, Up-Left, Left, Down-Left, etc).
EXPANDED_RANGES:                    equ 1       ; Weapons/spells can have ranges up to 7 and spell radii up to 4
PERCENT_POISON_DAMAGE:              equ 0       ; 1-100 = n% of max HP
PLAYER_DEFEAT_IS_GAME_OVER:         equ 0       ; On player defeat, rather than halve the gold and return to town, reset the game.
SEND_DESTROYED_ITEMS_TO_DEALS:      equ 0       ; Add item that was destroyed upon usage to shop deals if rare and if not a consumable.
SEND_DROPPED_ITEMS_TO_CARAVAN:      equ 0       ; If character inventory is full, add dropped item to the Caravan instead of shop deals, regardless of rarity. If the Caravan itself is full, then drops follow the usual routine: go to deals if rare, or become lost completely if not rare.
SOUND_TEST_RESTORATION:             equ 1       ; Reimplement Sound Test functions that are missing in the US version. Based on Earl's patch.
TRAP_DAMAGE_RAISES_WITH_DIFFICULTY: equ 0       ; Increase Laser/Burst Rock damage with difficulty   Normal:100%  Hard:125%  Super: 150%  Ouch: 175%
DIFFICULTY_FACTORS:                 equ 1       ; Allow 4 distinct difficulties
LEARN_SPELL_AT_PROMOTION:           equ 0       ; Allows learning 1 spell immeadiately upon promotion
PER_LEVEL_CHURCH_COST:              equ 0       ; Raise/Cure cost based on ally level (double cost per promo level)
ADDITIONAL_EQUIPEFFECTS:            equ 0       ; Add new equipeffects to offer more options (Set ATK, Increase Resistance, Decrease Double...)

; AI enhancements
HEALER_AI_ENHANCEMENTS:             equ 1       ; See SF2_AI_Healing_Rewrite.txt for more details.
DEBUFF_AI_ENHANCEMENTS:             equ 1       ; Increase debuff options enemeies can use

; Menu enhancements
THREE_DIGITS_STATS:                 equ 0       ; 
FULL_CLASS_NAMES:                   equ 0       ; 
EIGHT_CHARACTERS_MEMBER_NAMES:      equ 0       ; 
EXTENDED_SPELL_NAMES:               equ 0       ; 
ALTERNATE_JEWEL_ICONS_DISPLAY:      equ 0       ; 1 = small icons, 2 = no display
SHOW_ENEMY_LEVEL:                   equ 0       ; 
SHOW_ALL_SPELLS_IN_MEMBER_SCREEN:   equ 0       ; 

; Music resuming
MUSIC_RESUMING:                     equ 0       ; Replace the original sound driver with Wiz's custom driver.
RESUME_BATTLEFIELD_MUSIC_ONLY:      equ 0       ; Do not resume battlescene music.
RESUME_MUSIC_AFTER_JOIN_JINGLE:     equ 0       ; Resume background music after playing a "Joined the Force" jingle.

; New special screens
CHAPTER_SCREEN:                     equ 0       ; Patch implementation with template SFCD screen as applicable example.

; ROM expansions
EXPANDED_ROM:                       equ 1       ; Build a 4MB ROM and manage SRAM mapping.
MEMORY_MAPPER:                      equ 0       ; Build a 6MB ROM and manage both ROM and SRAM mapping, supporting both SEGA and Extended SSF mappers.
SSF_SYSTEM_ID:                      equ 0       ; Put "SEGA SSF" string in ROM header to activate memory mapper on Mega EverDrive cartridges.
EXPANDED_SRAM:                      equ 1       ; Expand SRAM from 8KB to 32KB.
RELOCATED_SAVED_DATA_TO_SRAM:       equ 0       ; Relocate currently loaded saved data from system RAM to cartridge SRAM.
EXPANDED_FORCE_MEMBERS:             equ 1       ; Enable all 32 force members supported by the engine instead of 30.
EXPANDED_CLASSES:                   equ 1       ; Enable support for 64 classes
EXPANDED_ITEMS_AND_SPELLS:          equ 1       ; Expand number of items from 127 to 255, and number of spells from 44 to 63. Forces build of 4MB ROM with 32KB SRAM.
OPTIMIZED_ROM_LAYOUT:               equ 1       ; Align ROM sections to next word boundary to consolidate free space.
REGION_FREE_ROM:                    equ 1       ; Skip checking system region, omit including related function, and update ROM header.

; Assembler optimizations
OPTIMIZED_PC_RELATIVE_ADDRESSING:   equ 1       ; Optimize to PC relative addressing.
OPTIMIZED_SHORT_BRANCHES:           equ 1       ; Optimize short branches.
OPTIMIZED_ABSOLUTE_LONG_ADDRESSING: equ 1       ; Optimize absolute long addressing.
OPTIMIZED_ZERO_DISPLACEMENTS:       equ 1       ; Optimize zero displacements.
OPTIMIZED_ADDS_TO_QUICK_FORM:       equ 1       ; Optimize adds to quick form.
OPTIMIZED_SUBS_TO_QUICK_FORM:       equ 1       ; Optimize subtract to quick form.
OPTIMIZED_MOVE_TO_QUICK_FORM:       equ 1       ; Optimize move to quick form.

    
    ; If standard build, and either THREE_DIGITS_STATS or FULL_CLASS_NAMES
    ; are enabled, implement a second member list stats page.
    if (STANDARD_BUILD&(THREE_DIGITS_STATS|FULL_CLASS_NAMES)=1)
secondMemberListStatsPage = 1
    else
secondMemberListStatsPage = 0
    endif
    
    ; If standard build, and either EXPANDED_ROM, EXTENDED_SSF_MAPPER, or EXPANDED_ITEMS_AND_SPELLS
    ; are enabled, build an expanded ROM.
    if (STANDARD_BUILD&(EXPANDED_ROM!MEMORY_MAPPER!EXPANDED_ITEMS_AND_SPELLS)=1)
expandedRom = 1
    else
expandedRom = 0
    endif
    
    ; If standard build, and either EXPANDED_SRAM, RELOCATED_SAVED_DATA_TO_SRAM, or EXPANDED_ITEMS_AND_SPELLS
    ; are enabled, expand SRAM.
    if (STANDARD_BUILD&(EXPANDED_SRAM!RELOCATED_SAVED_DATA_TO_SRAM!EXPANDED_ITEMS_AND_SPELLS)=1)
expandedSram = 1
    else
expandedSram = 0
    endif
    
    ; If standard build, and either OPTIMIZED_ROM_LAYOUT or REGION_FREE_ROM are enabled,
    ; build a region free ROM to make space for relocated pointers in a non-expanded ROM.
    if (STANDARD_BUILD&(OPTIMIZED_ROM_LAYOUT!REGION_FREE_ROM)=1)
regionFreeRom = 1
    else
regionFreeRom = 0
    endif
    
    
    ; Apply optional assembler optimizations.
    if (STANDARD_BUILD&OPTIMIZED_PC_RELATIVE_ADDRESSING=1)
        opt op+     ; Switches to PC relative addressing from absolute long addressing if this is permissible in the current code context.
    endif
    if (STANDARD_BUILD&OPTIMIZED_SHORT_BRANCHES=1)
        opt os+     ; Backwards relative branches will use the short form if this is permissible in the current code context.
    endif
    if (STANDARD_BUILD&OPTIMIZED_ABSOLUTE_LONG_ADDRESSING=1)
        opt ow+     ; If the absolute long addressing mode is used but the address will only occupy a word, the Assembler will switch to the short form.
    endif
    if (STANDARD_BUILD&OPTIMIZED_ZERO_DISPLACEMENTS=1)
        opt oz+     ; If the address register is used with a zero displacement, the Assembler will switch to the address register indirect mode.
    endif
    
    ; When these options are enabled, provided that it is permissible in the current code context, all ADD, SUB and MOVE instructions are coded as quick forms.
    if (STANDARD_BUILD&OPTIMIZED_ADDS_TO_QUICK_FORM=1)
        opt oaq+
    endif
    if (STANDARD_BUILD&OPTIMIZED_SUBS_TO_QUICK_FORM=1)
        opt osq+
    endif
    if (STANDARD_BUILD&OPTIMIZED_MOVE_TO_QUICK_FORM=1)
        opt omq+
    endif
