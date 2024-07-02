; SF2CONST.ASM INCLUDED AT START OF SF2.ASM

saveSlotSize   = SAVE_SLOT_SIZE
savedDataStart = $FFE800
saveSlotsStart = $2000B1
    if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
savedDataStart = $2000B1
saveSlotsStart = savedDataStart+saveSlotSize
    endif

; START OF SEGMENT SRAM OFFSETS FROM SRAM:00200000 TO 0:00204000
byte_200000: equ $200000
SRAM_START: equ $200001

    if (STANDARD_BUILD&MEMORY_MAPPER=1)
SRAM_TEST_SPACE: equ $200061
    endif

SAVED_ERRCODE_BYTE0: equ $200081
SAVED_ERRCODE_BYTE1: equ $200083
SAVED_ERRCODE_BYTE2: equ $200085
SAVED_ERRCODE_BYTE3: equ $200087
SAVED_ERRCODE_BYTE4: equ $200089
SAVED_ERRCODE_BYTE5: equ $20008B
SAVED_ERRCODE_BYTE6: equ $20008D
SAVED_ERRCODE_BYTE7: equ $20008F

                rsset saveSlotsStart
SAVE1_DATA:     rs.b SAVE_SLOT_SIZE
SRAM_STRING:    rs.b SRAM_STRING_LENGTH
SAVE_FLAGS:     rs.b SAVE_FLAGS_SIZE ; bits 0-1: busy save slots flags, bit 7: game completed
SAVE1_CHECKSUM: rs.b SAVE_CHECKSUM_SIZE
SAVE2_CHECKSUM: rs.b SAVE_CHECKSUM_SIZE
SAVE2_DATA:     rs.b SAVE_SLOT_SIZE

savedDataTotalSize = (__RS-saveSlotsStart)/2

SAVED_DATA_TOTAL_SIZE: equ savedDataTotalSize

    if (SAVED_DATA_TOTAL_SIZE>SRAM_SIZE)
        inform 3,"Fatal error: Excessive SRAM usage. Current=%d Max=%d",SAVED_DATA_TOTAL_SIZE,SRAM_SIZE
    endif

; END OF SEGMENT SRAM OFFSETS FROM SRAM:00200000 TO 0:00204000

; START OF SEGMENT Z80 OFFSETS FROM Z80:A00000 TO 0:00A0FFFF
Z80_Memory: equ $A00000

z80Channel1NotInUse = $A01383
    if (STANDARD_BUILD=1)
z80Channel1NotInUse = $A01813
    endif
Z80_CHANNEL_1_NOT_IN_USE: equ z80Channel1NotInUse

Z80_SoundDriverFadeInData: equ $A01FFC
Z80_SoundDriverMusicLevel: equ $A01FFD
Z80_SoundDriverCommand: equ $A01FFF
; END OF SEGMENT Z80 OFFSETS FROM Z80:A00000 TO 0:00A0FFFF

; START OF SEGMENT IO OFFSETS FROM IO:A10000 TO 0:00A10FFF
HW_Info: equ $A10001 ; 7-MODE  (R)  0: Domestic Model
                                        ;              1: Overseas Model
                                        ; 6-VMOD  (R)  0: NTSC CPU clock 7.67 MHz
                                        ;              1: PAL CPU clock 7.60 MHz
                                        ; 5-DISK  (R)  0: FDD unit connected
                                        ;              1: FDD unit not connected
                                        ; 4-RSV   (R)  Currently not used
                                        ; 3-0 VER (R)  MEGA DRIVE version ($0 to $F)
DATA1: equ $A10003 ; PD7 (RW)
                                        ; PD6 (RW) TH
                                        ; PD5 (RW) TR
                                        ; PD4 (RW) TL
                                        ; PD3 (RW) RIGHT
                                        ; PD2 (RW) LEFT
                                        ; PD1 (RW) DOWN
                                        ; PDO (RW) UP
                                        ; 
DATA2: equ $A10005
DATA3: equ $A10007
CTRL1: equ $A10008
CTRL1_BIS: equ $A10009 ; INT (RW) 0: TH-INT PROHIBITED
                                        ;          1: TH-INT ALLOWED
                                        ; PC6 (RW) 0: PD6 INPUT MODE
                                        ;          1: OUTPUT MODE
                                        ; PC5 (RW) 0: PD5 INPUT MODE
                                        ;          1: OUTPUT MODE
                                        ; PC4 (RW) 0: PD4 INPUT MODE
                                        ;          1: OUTPUT MODE
                                        ; PC3 (RW) 0: PD3 INPUT MODE
                                        ;          1: OUTPUT MODE
                                        ; PC2 (RW) 0: PD2 INPUT MODE
                                        ;          1: OUTPUT MODE
                                        ; PC1 (RW) 0: PD1 INPUT MODE
                                        ;          1: OUTPUT MODE
                                        ; PCO (RW) 0: PDO INPUT MODE
                    CTRL2: equ $A1000B
CTRL3: equ $A1000C
CTRL3_BIS: equ $A1000D
TxDATA1: equ $A1000F
RxDATA1: equ $A10011
SCTRL1: equ $A10013
TxDATA2: equ $A10015
RxDATA2: equ $A10017
SCTRL2: equ $A10019
TxDATA3: equ $A1001B
RxDATA3: equ $A1001D
SCTRL3: equ $A1001F
; END OF SEGMENT IO OFFSETS FROM IO:A10000 TO 0:00A10FFF

; START OF SEGMENT Control OFFSETS FROM Control:A11000 TO 0:00A11FFF
MemMode: equ $A11000 ; D8 ( W)   0: ROM MODE
                                        ;           1: D-RAM MODE
Z80BusReq: equ $A11100 ; D8 ( W)   0: BUSREQ CANCEL
                                        ;           1: BUSREQ REQUEST
                                        ;    ( R)   0: CPU FUNCTION STOP ACCESSIBLE
                                        ;           1: FUNCTIONING
Z80BusReset: equ $A11200 ; D8 ( W)   0: RESET REQUEST
                                        ;           1: RESET CANCEL
; END OF SEGMENT Control OFFSETS FROM Control:A11000 TO 0:00A11FFF

; START OF SEGMENT Mapper
EXTENDED_SSF_IO_STATUS: equ $A130E4
EXTENDED_SSF_CTRL0: equ $A130F0
SEGA_MAPPER_CTRL0: equ $A130F1
ROM_BANK1: equ $A130F3  ; bank for $080000-$0FFFFF
ROM_BANK2: equ $A130F5  ; bank for $100000-$17FFFF
ROM_BANK3: equ $A130F7  ; bank for $180000-$1FFFFF
ROM_BANK4: equ $A130F9  ; bank for $200000-$27FFFF
ROM_BANK5: equ $A130FB  ; bank for $280000-$2FFFFF
ROM_BANK6: equ $A130FD  ; bank for $300000-$37FFFF
ROM_BANK7: equ $A130FF  ; bank for $380000-$3FFFFF
; END OF SEGMENT Mapper

; START OF SEGMENT VDP OFFSETS FROM VDP:00C00000 TO 0:00C00012
VDP_Data: equ $C00000
VDP_Control: equ $C00004
HV_Counter: equ $C00008
PSG: equ $C00011
; END OF SEGMENT VDP OFFSETS FROM VDP:00C00000 TO 0:00C00012

; START OF SEGMENT RAM OFFSETS FROM RAM:FF0000 TO 0:01000000
FF0000_RAM_START: equ $FF0000 ; Tileset 3, Map layout, Battlescene script ...
ENDING_KISS_PICTURE_LOADING_SPACE: equ $FF0C00
FF1000_MAP_TILESET_4: equ $FF1000 ; Current map tileset 4
FF2000_LOADING_SPACE: equ $FF2000 ; Tileset 4, Map blocks, Battlescene background tileset 1, Weaponsprites ...
FF3000_MAP_TILESET_1: equ $FF3000 ; Current Map Tileset 1
FF3800_LOADING_SPACE: equ $FF3800 ; Battle scene background tileset 2
byte_FF4000: equ $FF4000 ; cleared up to FF4800 after loading weaponsprite
FF4400_LOADING_SPACE: equ $FF4400 ; Total movecosts array
byte_FF4A00: equ $FF4A00
FF4D00_LOADING_SPACE: equ $FF4D00 ; - Movable grid array (0 = movable space, -1 = not movable)
                                        ; - Exploration special sprite
FF5000_LOADING_SPACE: equ $FF5000 ; Enemy battlesprite
FF5600_LOADING_SPACE: equ $FF5600 ; map-aligned array of target combatant indexes
word_FF5C00: equ $FF5C00 ; related to map block copy
word_FF5C02: equ $FF5C02 ; related to map block copy
word_FF5C04: equ $FF5C04 ; related to map block copy
word_FF5C06: equ $FF5C06 ; related to map block copy
byte_FF5C08: equ $FF5C08 ; related to map block copy
BATTLE_TERRAIN_ARRAY: equ $FF5F00 ; 2304 bytes : 48*48 (battle max dimensions)
                                        ;   - bytes 0-3 = terrain type
                                        ;   - bytes 6-7 = obtruction flags
MAP_LAYOUT_HISTORY_MAP_SIZES: equ $FF6000
FF6800_MAP_LOADING_LEFT_HISTORY_MAP: equ $FF6800 ; Usage : 
                                        ; - map blocks
                                        ; - map layout
FF6802_LOADING_SPACE: equ $FF6802 ; Usage : 
                                        ; - Current Map Tileset 2
                                        ; - Textbox tiles 
                                        ; - Battlescene transition tiles
                                        ; - Battlesprite frame
                                        ; - Map block loading maps for next right tile and next bottom tile
                                        ; - Ending kiss picture
                                        ; - Title screen font
                                        ; - Ending credits font generation
byte_FF6942: equ $FF6942 ; used when loading shop inventory window item icon and price tag tiles
byte_FF6C02: equ $FF6C02 ; related to dialogue cursor blinking
byte_FF7002: equ $FF7002 ; related to dialogue cursor blinking
byte_FF7402: equ $FF7402 ; related to dialogue cursor blinking
byte_FF7802: equ $FF7802 ; related to dialogue cursor blinking
ALLY_BATTLESPRITE_FRAME_LOADING_SPACE: equ $FF7A02
byte_FF7C02: equ $FF7C02 ; related to dialogue cursor blinking
FF8002_LOADING_SPACE: equ $FF8002 ; loading space for mapsprites, special sprites, and battlescene transition tiles
FF8800_MAP_LOADING_UPPER_HISTORY_MAP: equ $FF8800
FF8804_LOADING_SPACE: equ $FF8804 ; Usage : 
                                        ; - Loading space for compressed tiles before DMA
                                        ; - SaveRAM integrity check
                                        ; - Number of targets reachable by physical attack
                                        ; - AI targeting priority calculation
                                        ; - Portrait tiles loading
                                        ; - Menu icon #1 (top) tiles displayed in menus
                                        ; - Battlesprite/Invocation sprite frame
                                        ; - Ending credits font
TEMP_NAME_ENTRY_SPACE: equ $FF8805 ; temporary space used when naming characters
TARGETS_REACHABLE_BY_SPELL_NUMBER: equ $FF8806
TARGETS_REACHABLE_BY_ITEM_NUMBER: equ $FF8808
byte_FF8809: equ $FF8809 ; related to witch menu bubble
ATTACK_COMMAND_ITEM_SLOT: equ $FF880A
ATTACK_COMMAND_SPELL: equ $FF880C ; spell index
TARGETS_REACHABLE_BY_ATTACK_LIST: equ $FF880E
TARGETS_REACHABLE_BY_SPELL_LIST: equ $FF883E
TARGETS_REACHABLE_BY_ITEM_LIST: equ $FF886E
ATTACK_MOVEMENT_TO_REACHABLE_TARGETS: equ $FF889E ; movement to each reachable target
SPELL_MOVEMENT_TO_REACHABLE_TARGETS: equ $FF88CE
ITEM_MOVEMENT_TO_REACHABLE_TARGETS: equ $FF88FE
byte_FF8904: equ $FF8904
ATTACK_TARGET_PRIORITIES_LIST: equ $FF892E ; list of target priorities for physical attack
SPELL_TARGET_PRIORITIES_LIST: equ $FF895E ; list of target priorities for spell
FF8984_LOADING_SPACE: equ $FF8984 ; Loading space for icon #2 tiles displayed in menus
ITEM_TARGET_PRIORITIES_LIST: equ $FF898E ; list of target priorities for item usage
FF8A04_LOADING_SPACE: equ $FF8A04 ; loading space for MP bar tiles
FF8A44_LOADING_SPACE: equ $FF8A44 ; Loading space for icon #2 (left) tiles displayed in menus
FF8B04_LOADING_SPACE: equ $FF8B04 ; Loading space for icon #3 (right) tiles displayed in menus
FF8C02_LOADING_SPACE: equ $FF8C02 ; loading space for battlescene ground platform
FF8C84_LOADING_SPACE: equ $FF8C84 ; Loading space for icon #4 (bottom) tiles displayed in menus
FF8D04_LOADING_SPACE: equ $FF8D04
FF8E04_LOADING_SPACE: equ $FF8E04
FF8EC4_LOADING_SPACE: equ $FF8EC4
FF8F04_LOADING_SPACE: equ $FF8F04
ENEMY_BATTLESPRITE_LOADING_SPACE: equ $FF9002
FF9004_LOADING_SPACE: equ $FF9004
FF9104_LOADING_SPACE: equ $FF9104
FF9202_LOADING_SPACE: equ $FF9202
FF9284_LOADING_SPACE: equ $FF9284
FF9802_LOADING_SPACE: equ $FF9802
BATTLE_ENTITY_MOVE_STRING: equ $FF9804
byte_FF9904: equ $FF9904 ; related to scrolling data update
byte_FF9984: equ $FF9984 ; related to scrolling data update
byte_FF9A04: equ $FF9A04 ; related to scrolling data update
byte_FF9A84: equ $FF9A84 ; related to scrolling data update
CURRENT_MAP_TILESET_2_COPY: equ $FF9B04 ; copy of current map tileset 2 (animated tiles)
FF9C02_LOADING_SPACE: equ $FF9C02
FFA202_LOADING_SPACE: equ $FFA202
VIEW_PLANE_A_X_COUNTER: equ $FFA804
VIEW_PLANE_B_X_COUNTER: equ $FFA806
VIEW_PLANE_A_Y_COUNTER: equ $FFA808
VIEW_PLANE_B_Y_COUNTER: equ $FFA80A
QUAKE_AMPLITUDE: equ $FFA80C
TILE_PALETTE_MASK: equ $FFA80E
VIEW_PLANE_A_PIXEL_X: equ $FFA810
VIEW_PLANE_A_PIXEL_Y: equ $FFA812
VIEW_PLANE_B_PIXEL_X: equ $FFA814
VIEW_PLANE_B_PIXEL_Y: equ $FFA816
VIEW_PLANE_A_PIXEL_X_DEST: equ $FFA818
VIEW_PLANE_A_PIXEL_Y_DEST: equ $FFA81A
VIEW_PLANE_B_PIXEL_X_DEST: equ $FFA81C
VIEW_PLANE_B_PIXEL_Y_DEST: equ $FFA81E
PLANE_A_SCROLL_SPEED_X: equ $FFA820
PLANE_A_SCROLL_SPEED_Y: equ $FFA822
PLANE_B_SCROLL_SPEED_X: equ $FFA824
PLANE_B_SCROLL_SPEED_Y: equ $FFA826
word_FFA828: equ $FFA828 ; related to view data update
VIEW_SCROLLING_PLANES_BITFIELD: equ $FFA82A ; 3 = Plane A H, 2 = Plane A V, 1 = Plane B H, 0 = Plane B V
VIEW_TARGET_ENTITY: equ $FFA82C ; -1 = None
VIEW_PLANE_UPDATE_TOGGLE_BITFIELD: equ $FFA82D ; 1 = Plane B update, 0 = Plane A update
MAP_AREA_LAYER1_STARTX: equ $FFA82E ; Start of map properties
MAP_AREA_LAYER1_STARTY: equ $FFA830
MAP_AREA_LAYER1_ENDX: equ $FFA832
MAP_AREA_LAYER1_ENDY: equ $FFA834
MAP_AREA_LAYER2_STARTX: equ $FFA836
MAP_AREA_LAYER2_STARTY: equ $FFA838
MAP_AREA_BACKGROUND_STARTX: equ $FFA83A
MAP_AREA_BACKGROUND_STARTY: equ $FFA83C
MAP_AREA_LAYER1_PARALLAX_X: equ $FFA83E
MAP_AREA_LAYER1_PARALLAX_Y: equ $FFA840
MAP_AREA_LAYER2_PARALLAX_X: equ $FFA842
MAP_AREA_LAYER2_PARALLAX_Y: equ $FFA844
MAP_AREA_LAYER1_AUTOSCROLL_X: equ $FFA846
MAP_AREA_LAYER1_AUTOSCROLL_Y: equ $FFA847
MAP_AREA_LAYER2_AUTOSCROLL_X: equ $FFA848
MAP_AREA_LAYER2_AUTOSCROLL_Y: equ $FFA849
MAP_EVENT_TYPE: equ $FFA84A
MAP_EVENT_PARAM_1: equ $FFA84C
MAP_EVENT_PARAM_2: equ $FFA84D
MAP_EVENT_PARAM_3: equ $FFA84E
MAP_EVENT_PARAM_4: equ $FFA84F
MAP_EVENT_PARAM_5: equ $FFA850
TILE_ANIMATION_DATA_ADDRESS: equ $FFA86A
TILE_ANIMATION_COUNTER: equ $FFA86E
TILE_ANIMATION_MAP_INDEX: equ $FFA870
WINDOW_LAYOUTS_END_POINTER: equ $FFA87A
WINDOW_ENTRIES: equ $FFA87E ; 16-byte entries : layout pointer, width, height, X, Y, start/destination animation coordinates
FIX_WINDOWS_POSITIONS_TOGGLE: equ $FFA8FE
UPDATE_WINDOWS_TOGGLE: equ $FFA8FF ; set true to update VDP Plane A during VInt
MOVING_WINDOWS_BITFIELD: equ $FFA900

; Entity Data
ENTITY_DATA: equ $FFA902
ENTITY_Y: equ ENTITY_DATA+ENTITYDEF_OFFSET_Y
ENTITY_X_DEST: equ ENTITY_DATA+ENTITYDEF_OFFSET_XDEST
ENTITY_Y_DEST: equ ENTITY_DATA+ENTITYDEF_OFFSET_YDEST
ENTITY_FACING: equ ENTITY_DATA+ENTITYDEF_OFFSET_FACING
ENTITY_MAPSPRITE: equ ENTITY_DATA+ENTITYDEF_OFFSET_MAPSPRITE
ENTITY_ANIMATION_COUNTER: equ ENTITY_DATA+ENTITYDEF_OFFSET_ANIMCOUNTER
OTHER_ENTITIES_DATA: equ ENTITY_DATA+NEXT_ENTITYDEF ; Start of entities after first one (Bowie)
ENTITY_RAFT_DATA: equ ENTITY_DATA+NEXT_ENTITYDEF*ENTITY_RAFT
ENTITY_SPECIAL_SPRITE_DATA: equ ENTITY_DATA+NEXT_ENTITYDEF*ENTITY_SPECIAL_SPRITE
ENTITY_SPECIAL_SPRITE_DESTINATION: equ ENTITY_SPECIAL_SPRITE_DATA+ENTITYDEF_OFFSET_XDEST
ENTITY_SPECIAL_SPRITE_LAYER: equ ENTITY_SPECIAL_SPRITE_DATA+ENTITYDEF_OFFSET_LAYER
ENTITY_CURSOR_DATA: equ ENTITY_DATA+NEXT_ENTITYDEF*ENTITY_CURSOR

EXPLORATION_ENTITIES: equ $FFAF22
FOLLOWERS_LIST: equ $FFAF23 ; list of entities following player, $FF ends
byte_FFAF26: equ $FFAF26
word_FFAF42: equ $FFAF42
SPRITE_SIZE: equ $FFAF44
MAP_AREA_LAYER_TYPE: equ $FFAF46 ; 0 = Map on background (Plane B), 1 = Map on foreground (Plane A)
byte_FFAF47: equ $FFAF47
SPRITES_TO_LOAD_NUMBER: equ $FFAF67 ; cleared on update of entities
                                        ; looks like it can reach a maximum of 7 sprite graphics to update per VInt
SPRITES_FRAME_COUNTER: equ $FFAF69
SPRITES_FRAME_COUNTER_START: equ $FFAF6A
SPRITES_FRAME_BLINKING_THRESHOLD: equ $FFAF6B ; sprite will blink (i.e., moved off-screen) while sprite frame counter is greater or equal to this value
DIALOGUE_WINDOW_INDEX: equ $FFAF6C ; 0 = nothing, 1 = text only, 2 = text + portrait
DIALOGUE_VDPTILE_ROW_SCROLLING_OFFSET: equ $FFAF6E ; number of VDP tile "rows" to offset when writing VDP tile indexes (0, 2, or 4)
STRING_BYTE: equ $FFAF70
STRING_BIT_COUNTER: equ $FFAF72
DECODED_TEXT_SYMBOL: equ $FFAF74 ; determines which huffman tree to use for next symbol decoding
MINISTATUS_WINDOW_INDEX: equ $FFAF76
DISPLAYED_ICON_1: equ $FFAF7A
DISPLAYED_ICON_2: equ $FFAF7C
DISPLAYED_ICON_3: equ $FFAF7E
DISPLAYED_ICON_4: equ $FFAF80
LEVELUP_ARGUMENTS: equ $FFAF82 ; arguments passed to level up messages :
                                        ;  0: new level
                                        ;  1: HP
                                        ;  2: MP
                                        ;  3: Attack
                                        ;  4: Defense
                                        ;  5: Agility
                                        ;  6: learned spell index
                                        ;  7: learned spell level
CURRENT_MEMBERS_LIST_SUMMARY_PAGE: equ $FFAF8C ; 0 = main
                                        ; 1 = item
                                        ; 2 = magic
CURSOR_RADIUS: equ $FFAF8E
BATTLE_ENTITY_CHOSEN_X: equ $FFAF90
BATTLE_ENTITY_CHOSEN_Y: equ $FFAF91
IS_TARGETING: equ $FFAF93 ; used to determine whether to create a second mini status window
WINDOW_LAYOUT_SHIFT_DIRECTION: equ $FFAF9E ; members list : 0 = up, 1 = down
                                        ; shop inventory : 0 = left, 1 = right
byte_FFAFA0: equ $FFAFA0 ; related to sprites (64 bytes)
BATTLESCENE_BATTLESPRITE_TOGGLE: equ $FFAFA1 ; $010101010101010101 all 9 parts shown
BATTLESCENE_WEAPONSPRITE_TOGGLE: equ $FFAFAA ; $01010101 all 4 parts shown
BATTLESCENE_GROUNDSPRITE_TOGGLE: equ $FFAFAE ; $010101 all 3 parts shown
byte_FFAFB0: equ $FFAFB0
byte_FFAFB1: equ $FFAFB1
word_FFAFB2: equ $FFAFB2
byte_FFAFB4: equ $FFAFB4
byte_FFAFC6: equ $FFAFC6
byte_FFAFCE: equ $FFAFCE
CURRENT_DIAMOND_MENU_CHOICE: equ $FFAFE7 ; choice index in a diamond menu (0=up, 1=left, 2=right, 3=down)
SPEECH_SOUND_TOGGLE: equ $FFAFFB
BLINK_TILES_NUMBER: equ $FFAFFE ; holds number of tiles to change for eye animation
BLINK_DATA: equ $FFB000 ; start of eye animation data (x pos, y pos, new tile index (2 bytes))
BLINK_COUNTER: equ $FFB03C
MOUTH_TILES_NUMBER: equ $FFB03E ; holds number of tiles to change for mouth animation
MOUTH_DATA: equ $FFB040 ; start of mouth animation data (x pos, y pos, new tile index (2 bytes))
word_FFB07C: equ $FFB07C
PORTRAIT_VDPTILES: equ $FFB07E
PORTRAIT_WINDOW_INDEX: equ $FFB080
BLINK_CONTROL_TOGGLE: equ $FFB082 ; handle portrait blinking during VInt if true
CURRENTLY_TYPEWRITING: equ $FFB083 ; flag for whether or not we're done with typewritering
PORTRAIT_IS_MIRRORED_TOGGLE: equ $FFB084
PORTRAIT_IS_ON_RIGHT_TOGGLE: equ $FFB085
GOLD_WINDOW_INDEX: equ $FFB086
LAND_EFFECT_WINDOW_INDEX: equ $FFB088
TIMER_WINDOW_INDEX: equ $FFB08A
ALLY_NAME_WINDOW_INDEX: equ $FFB08C
BATTLE_ACTOR_X: equ $FFB08E
BATTLE_ACTOR_Y: equ $FFB090
BATTLE_TARGET_Y: equ $FFB092
BATTLE_TARGET_X: equ $FFB094
MINISTATUS_WINDOW_WIDTH: equ $FFB096
MOVE_SFX: equ $FFB098
CURRENT_SAVE_SLOT: equ $FFB09A

    if (STANDARD_BUILD&MEMORY_MAPPER=1)     ; Tested working SRAM control type :
SRAM_CONTROL: equ $FFB09B                   ;  -1: EverDrive Extended SSF mapper
    endif                                   ;   0: SEGA mapper
                                            ;   1: Memory mapping error
CURRENT_SPEECH_SFX: equ $FFB09C
SPEECH_SFX_COPY: equ $FFB09E
CURRENT_PORTRAIT: equ $FFB0A0
SOUND_COMMANDS_DEACTIVATED: equ $FFB0A3
ROM_CHECKSUM: equ $FFB0A4
SPECIAL_TURBO_TOGGLE: equ $FFB0A8
DEBUG_MODE_TOGGLE: equ $FFB0A9
CONTROL_OPPONENT_TOGGLE: equ $FFB0AA
AUTO_BATTLE_TOGGLE: equ $FFB0AB
CONFIGURATION_MODE_TOGGLE: equ $FFB0AC
MAP_AREA_MUSIC_INDEX: equ $FFB0AD
GENERIC_LIST: equ $FFB0AE ; generic index list space
GENERIC_LIST_LENGTH: equ $FFB12E ; number of entries in the generic index list
CURRENT_SHOP_PAGE: equ $FFB130
CURRENT_SHOP_SELECTION: equ $FFB132
word_FFB134: equ $FFB134
DISPLAYED_MEMBERS_LIST_FIRST_ENTRY: equ $FFB136 ; first entry in currently displayed portion of member list
DISPLAYED_MEMBERS_LIST_SELECTED_ENTRY: equ $FFB138 ; selected entry in currently displayed portion of member list
SELECTED_ITEM_INDEX: equ $FFB13A ; currently selected item index
CURRENT_ITEM_SUBMENU_ACTION: equ $FFB13C ; 0 = use
                                        ; 1 = give
                                        ; 2 = drop
                                        ; 3 = equip
CURRENT_MEMBERS_LIST_PAGE: equ $FFB13D
WINDOW_IS_PRESENT: equ $FFB13F ; textbox state ? 1 without window, 2 with window
ENTITY_EVENT_INDEX_LIST: equ $FFB140 ; 1 byte holding related entity index per entity event
ENTITY_EVENT_ALLY_JARO: equ $FFB157
ENTITY_EVENT_ENEMY_START: equ $FFB160
ENTITY_EVENT_ENEMY_JAR: equ $FFB16F
ENTITY_EVENT_ENEMY_END: equ $FFB17F
CHEST_CONTENTS: equ $FFB180 ; item index
BATTLESCENE_MUSIC_INDEX: equ $FFB188
MOVING_BATTLE_ENTITY_INDEX: equ $FFB18A
TEMP_ITEM_OR_SPELL: equ $FFB18C ; Usage : 
                                        ; - currently highlighted icon
                                        ; - item or spell, for the purpose of creating range grid
BATTLE_EQUIP_WINDOW_SLOT: equ $FFB18E
VIEW_SCROLLING_SPEED: equ $FFB194
word_FFB196: equ $FFB196
MOUTH_CONTROL_TOGGLE: equ $FFB198
DEACTIVATE_WINDOW_HIDING: equ $FFB199
HIDE_WINDOWS_TOGGLE: equ $FFB19A ; also set when scrolling
AFTER_INTRO_JUMP_POINTER: equ $FFB19C
ENTITY_WALKING_PARAMETERS: equ $FFB1A0 ; used for walking actscript with dynamic parameters
                                        ; also holds the current address byte when checking the next debug mode input at the start of the game
dword_FFB1A4: equ $FFB1A4
WARP_SFX: equ $FFB1A8
CONFIGURATION_MODE_OR_GAME_STAFF_POINTER: equ $FFB1AA
AI_LAST_TARGET_TABLE: equ $FFB1AC ; Table of most recent target for each enemy
byte_FFB1DC: equ $FFB1DC
BATTLE_REGION_FLAGS_TO_BE_TRIGGERED: equ $FFB20C ; Region flags to be triggered at the start of next battle turn

; Battlescene Data
BATTLESCENE_BACKGROUND_MODIFICATION_POINTER: equ $FFB3C0 ; start of battlescene data
word_FFB3C4: equ $FFB3C4
BATTLESCENE_BATTLESPRITE_MODIFICATION_POINTER: equ $FFB3C6
word_FFB3CA: equ $FFB3CA
BATTLESCENE_FRAME_COUNTER: equ $FFB3CC
byte_FFB3CD: equ $FFB3CD
BATTLESCENE_ENEMY: equ $FFB3CE ; combatant index of current enemy in battlescene
BATTLESCENE_ENEMYBATTLESPRITE: equ $FFB3D0 ; battlesprite index of current enemy in battlescene
BATTLESCENE_ENEMYBATTLEPALETTE: equ $FFB3D2 ; battlesprite palette index of current enemy in battlescene
BATTLESCENE_ALLY: equ $FFB3D4 ; combatant index of current ally in battlescene
BATTLESCENE_ALLYBATTLESPRITE: equ $FFB3D6 ; battlesprite index of current ally in battlescene
BATTLESCENE_ALLYBATTLEPALETTE: equ $FFB3D8 ; battlesprite palette index of current ally in battlescene
BATTLESCENE_WEAPONSPRITE: equ $FFB3DA ; battlesprite index of current ally's equipped weapon in battlescene
BATTLESCENE_WEAPONPALETTE: equ $FFB3DC ; battlesprite palette index of current ally's equipped weapon in battlescene
BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_SPEED: equ $FFB3DE
BATTLESCENE_ENEMYBATTLESPRITE_ANIMATION_COUNTER: equ $FFB3E0
BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_SPEED: equ $FFB3E2 ; battlesprite animation speed counter
BATTLESCENE_ALLYBATTLESPRITE_ANIMATION_COUNTER: equ $FFB3E4 ; battlesprite animation speed counter
BATTLESCENE_ENEMYBATTLEANIMATION: equ $FFB3E6 ; battle animation index of current enemy in battlescene
BATTLESCENE_ALLYBATTLEANIMATION: equ $FFB3E8 ; battle animation index of current ally in battlescene
word_FFB3EA: equ $FFB3EA
word_FFB3EC: equ $FFB3EC
word_FFB3EE: equ $FFB3EE
word_FFB3F0: equ $FFB3F0
BATTLESCENE_ALLY_X: equ $FFB3F2
BATTLESCENE_ALLY_Y: equ $FFB3F4
BATTLESCENE_ENEMY_X_SPEED: equ $FFB3F6
BATTLESCENE_ENEMY_Y_SPEED: equ $FFB3F8
BATTLESCENE_ALLY_X_SPEED: equ $FFB3FA
BATTLESCENE_ALLY_Y_SPEED: equ $FFB3FC
word_FFB3FE: equ $FFB3FE
BATTLESCENE_ALLY_COPY: equ $FFB400
DEAD_COMBATANTS_LIST_LENGTH: equ $FFB402
byte_FFB404: equ $FFB404
SPELLANIMATION_PROPERTIES: equ $FFB406
byte_FFB41E: equ $FFB41E
byte_FFB496: equ $FFB496
byte_FFB532: equ $FFB532 ; related to spellanimations
dword_FFB536: equ $FFB536
byte_FFB53A: equ $FFB53A
BATTLESCENE_BACKGROUND_PALETTE: equ $FFB542
word_FFB562: equ $FFB562
byte_FFB568: equ $FFB568
byte_FFB569: equ $FFB569
byte_FFB56A: equ $FFB56A
byte_FFB56B: equ $FFB56B
ACTOR_TO_MAKE_IDLE: equ $FFB56C
WAITING_FOR_BATTLESCENE_GRAPHICS_UPDATE: equ $FFB56D
byte_FFB56E: equ $FFB56E ; bit 0 = ally battlesprite VDP tileset (alternates between two frames when idle)
                                        ;     1 = battlescene graphics update toggle
                                        ;     2 = idle frame toggle
byte_FFB56F: equ $FFB56F ; bit 0 = 
                                        ;     1 = mirrored ally
                                        ;     2 = mirrored enemy
                                        ;     3 = 
                                        ;     4 =
WEAPON_FRAME_INDEX: equ $FFB570
WEAPON_FRAME_LAYER: equ $FFB571
WEAPON_FRAME_X: equ $FFB572
WEAPON_FRAME_Y: equ $FFB573
WEAPON_IDLE_FRAME1_INDEX: equ $FFB574
WEAPON_IDLE_FRAME1_X: equ $FFB576
WEAPON_IDLE_FRAME1_Y: equ $FFB577
WEAPON_IDLE_FRAME2_X: equ $FFB578
WEAPON_IDLE_FRAME2_Y: equ $FFB579
ALLY_BATTLESPRITE_PROP1: equ $FFB57A ; ally battlesprite second word, first byte
ALLY_BATTLESPRITE_PROP2: equ $FFB57B ; ally battlesprite second word, first byte
ENEMY_BATTLESPRITE_PROP1: equ $FFB57C ; enemy battlesprite second word
ENEMY_BATTLESPRITE_PROP2: equ $FFB57D ; enemy battlesprite second word, first byte
BATTLESCENE_ALLY_STATUS_ANIMATION: equ $FFB57E ; status effect sprite displayed in battlescene for ally :
                                        ;     0 = none
                                        ;     1 = silence
                                        ;     2 = muddle
                                        ;     3 = sleep
                                        ;     4 = stun
BATTLESCENE_ENEMY_STATUS_ANIMATION: equ $FFB57F ; status effect sprite displayed in battlescene for enemy :
                                        ;     0 = none
                                        ;     1 = silence
                                        ;     2 = muddle
                                        ;     3 = sleep
                                        ;     4 = stun
byte_FFB580: equ $FFB580
byte_FFB581: equ $FFB581
BATTLESCENE_BACKGROUND: equ $FFB582
byte_FFB583: equ $FFB583
UPDATE_SPELLANIMATION_TOGGLE: equ $FFB584
byte_FFB585: equ $FFB585
SPELLANIMATION_VARIATION_AND_MIRRORED_BIT: equ $FFB586
CURRENT_SPELLANIMATION: equ $FFB587
byte_FFB588: equ $FFB588
BATTLESCENE_ACTOR_SWITCH_STATE: equ $FFB589 ; battlescene actor switching state: 1 = waiting, 2 = currently switching, 3 = done
DEAD_COMBATANTS_LIST: equ $FFB58A
byte_FFB59A: equ $FFB59A ; end of battlescene data
BATTLESCENE_GOLD: equ $FFB62A
BATTLESCENE_EXP: equ $FFB62C
CURRENT_BATTLEACTION: equ $FFB62E ; Refer to enum Battleactions
BATTLEACTION_ITEM_OR_SPELL: equ $FFB630 ; item or spell index for current battlescene action
BATTLEACTION_ITEM_OR_SPELL_COPY: equ $FFB632 ; item or spell index
BATTLEACTION_ITEM_SLOT: equ $FFB634
BATTLESCENE_ATTACK_TYPE: equ $FFB636 ; 0 = main attack, 1 = second attack, 2 = counter attack
BATTLESCENE_SPELL_INDEX: equ $FFB638
BATTLESCENE_SPELL_LEVEL: equ $FFB63A
BATTLESCENE_ITEM: equ $FFB63C
TARGETS_LIST_LENGTH: equ $FFB63E
BATTLE_PARTY_MEMBERS_NUMBER: equ $FFB640 ; number of party members in battle party (1 to 12)
OTHER_PARTY_MEMBERS_NUMBER: equ $FFB642 ; number of party members not in battle party
CUTSCENE_DIALOG_INDEX: equ $FFB646 ; set to 105A at beginning of intro
SKIP_CUTSCENE_TEXT: equ $FFB648 ; set if debug mode and P2 Start
BATTLESCENE_FIRST_ALLY: equ $FFB64A
BATTLESCENE_LAST_ALLY: equ $FFB64B
BATTLESCENE_FIRST_ENEMY: equ $FFB64C
BATTLESCENE_LAST_ENEMY: equ $FFB64D
BATTLESCENE_ATTACKER: equ $FFB64E
BATTLESCENE_ATTACKER_COPY: equ $FFB64F
byte_FFB651: equ $FFB651 ; related to entity facing ?
TARGETS_LIST: equ $FFB652 ; - indexes of currently available targets in battle
                                        ; - chosen targets during battlescene
                                        ; - character indexes that can equip an item when asking about it in the caravan
                                        ; 
OTHER_FORCE_MEMBERS_LIST: equ $FFB653
BATTLE_PARTY_MEMBERS: equ $FFB682 ; indexes of party members currently in battle party
RESERVE_MEMBERS: equ $FFB68E ; indexes of party members currently not in battle party
ENEMY_LIST: equ $FFB6A2 ; unused

    if (TEST_BUILD=1)
TEST_BUILD_CURRENT_MESSAGE: equ $FFB6C0
    endif

MOVECOSTS_TABLE: equ $FFB6C2 ; table of 16 move cost values for currently moving battle entity, corresponding to terrain types
CURRENT_SHOP_INDEX: equ $FFB6D2
DIALOGUE_TYPEWRITING_CURRENT_X: equ $FFB6D4
DIALOGUE_TYPEWRITING_CURRENT_Y: equ $FFB6D5
USE_REGULAR_DIALOGUE_FONT: equ $FFB6D6
COMPRESSED_STRING_LENGTH: equ $FFB6D7
DIALOGUE_REGULAR_TILE_TOGGLE: equ $FFB6D8 ; 0 = special symbol, 1 = regular tile
DIALOGUE_NAME_INDEX_1: equ $FFB6E8
DIALOGUE_NAME_INDEX_2: equ $FFB6EA
DIALOGUE_NAME_INDEX_3: equ $FFB6EC
DIALOGUE_STRING_TO_PRINT: equ $FFB6F0
DIALOGUE_NUMBER: equ $FFB776
CURRENT_ITEM_PRICE: equ $FFB778
CURRENT_DIALOGUE_ASCII_BYTE_ADDRESS: equ $FFB77A ; address of current ASCII byte in RAM (for printing names in dialogue text)
COMPRESSED_STRING_POINTER: equ $FFB77E ; address of current Huffman-encoded script byte
CURRENT_DIALOGUE_NAME_INDEX_POINTER: equ $FFB782 ; address of current name index in RAM, to be displayed in dialogue window
EQUIPPABLE_ITEMS: equ $FFB786 ; 4 entries, 4 bytes each (1-2 = item index, 3-4 = slot number (4 for none))
WINDOW_TILE_LAYOUTS: equ $FFB800 ; tile index data for currently needed art (portraits, diamond menu+window)
byte_FFB812: equ $FFB812
byte_FFB852: equ $FFB852
PLANE_A_MAP_LAYOUT: equ $FFC000 ; Plane A layout
byte_FFC180: equ $FFC180
byte_FFC1B8: equ $FFC1B8
byte_FFC286: equ $FFC286
byte_FFC350: equ $FFC350
byte_FFC358: equ $FFC358
byte_FFC398: equ $FFC398
byte_FFC41A: equ $FFC41A
PRESS_START_BUTTON_LAYOUT: equ $FFC480 ; "PRESS START BUTTON" string displayed on the title screen
PLANE_A_MAP_AND_WINDOWS_LAYOUT: equ $FFC800
byte_FFCC86: equ $FFCC86
PALETTE_1_CURRENT: equ $FFD000
PALETTE_1_CURRENT_01: equ $FFD002
PALETTE_1_CURRENT_02: equ $FFD004
PALETTE_2_CURRENT: equ $FFD020
PALETTE_3_CURRENT: equ $FFD040
PALETTE_3_CURRENT_02: equ $FFD044
PALETTE_4_CURRENT: equ $FFD060
PALETTE_1_BASE: equ $FFD080
PALETTE_1_BASE_01: equ $FFD082
PALETTE_1_BASE_02: equ $FFD084
PALETTE_1_BASE_0E: equ $FFD09C ; Battlescene weapon palette
PALLETE_2_BASE: equ $FFD0A0
PALETTE_3_BASE: equ $FFD0C0
PALETTE_4_BASE: equ $FFD0E0
HORIZONTAL_SCROLL_DATA: equ $FFD100
byte_FFD1C0: equ $FFD1C0
VERTICAL_SCROLL_DATA: equ $FFD500
DMA_QUEUE: equ $FFD550
VDP_COMMAND_QUEUE: equ $FFD780
byte_FFDB80: equ $FFDB80
SPRITE_TABLE: equ $FFDC80 ; Start of sprite properties table -- 64 entries, 8 bytes per entry : 
                                        ;   0-1 = y
                                        ;   2   = size
                                        ;   3   = link
                                        ;   4-5 = tile + flags
                                        ;   6-7 = x
                                        ; 
                                        ; 00
SPRITE_00_LINK: equ $FFDC83 ; linked sprite index
SPRITE_00_VDPTILE: equ $FFDC84
SPRITE_01: equ $FFDC88 ; 01-09: Ally battlesprite
                                        ; 01-16: all ally battlesprite data
SPRITE_01_VDPTILE: equ $FFDC8C
SPRITE_03: equ $FFDC98 ; 03-00: Sega Logo
SPRITE_TRADEMARK: equ $FFDCA0 ; 04: Trademark
SPRITE_TRADEMARK_VDPTILE: equ $FFDCA4
SPRITE_05: equ $FFDCA8 ; 05-15: "II" of 'Shining Force II'
SPRITE_07: equ $FFDCB8 ; 07
SPRITE_07_LINK: equ $FFDCBB
SPRITE_BATTLE_CURSOR: equ $FFDCC0 ; 08-15: battle cursor
                                        ; 08-12: name highlight
SPRITE_NAME_HIGHLIGHT_LINK: equ $FFDCCB ; last name highlight sprite +3
SPRITE_BATTLESCENE_WEAPON: equ $FFDCD0 ; 10-13: battlescene weapon
SPRITE_NAME_HIGHLIGHT_LINK_NEW: equ $FFDCD3 ; last name highlight sprite link if EIGHT_CHARACTERS_MEMBER_NAMES=1
SPRITE_BATTLESCENE_GROUND: equ $FFDCF0 ; 14-16: battlescene ground
SPRITE_BATTLESCENE_GROUND_VDPTILE: equ $FFDCF4 ; 14
SPRITE_BATTLESCENE_GROUND_X: equ $FFDCF6 ; 14
SPRITE_16: equ $FFDD00 ; 16
SPRITE_17: equ $FFDD08 ; start of battlescene status effect sprites
                                        ; 17-64: battle entities
SPRITE_18: equ $FFDD10 ; 18
SPRITE_19: equ $FFDD18 ; 19
SPRITE_20: equ $FFDD20 ; start of battlescene invocation sprites
                                        ; 20-28: 
                                        ; 29-37:
SPRITE_20_VDPTILE: equ $FFDD24
SPRITE_38: equ $FFDDB0 ; 38-59: spell animations
SPRITE_40: equ $FFDDC0 ; 40: blaze spell animation
SPRITE_46: equ $FFDDF0 ; 46: large exploration "special" mapsprite
SPRITE_60: equ $FFDE60 ; 60: large battlefield "special" mapsprite
SPRITE_63: equ $FFDE78
SPRITE_63_LINK: equ $FFDE7B
LOADED_NUMBER: equ $FFDE80
byte_FFDE85: equ $FFDE85
VINT_PARAMETERS: equ $FFDE94
VDP_COMMAND_COUNTER: equ $FFDE95
DMA_QUEUE_SIZE: equ $FFDE96
PLAYER_1_INPUT: equ $FFDE97 ; 80=start, 40=A, 20=C, 10=B, 8=right, 4=left, 2=down, 1=up
PLAYER_2_INPUT: equ $FFDE99 ; 80=start, 40=A, 20=C, 10=B, 8=right, 4=left, 2=down, 1=up
CURRENT_PLAYER_INPUT: equ $FFDE9B ; Contains P1_INPUT when FFDEED counter max reached
PRIMARY_WALKING_DIRECTION: equ $FFDE9C ; first direction moved (same as above) if still moving (or holding move buttons)
CONTROLLING_UNIT_CURSOR: equ $FFDE9D
byte_FFDE9E: equ $FFDE9E
byte_FFDE9F: equ $FFDE9F
FRAME_COUNTER: equ $FFDEA0
byte_FFDEA1: equ $FFDEA1 ; never used
DMA_ADDR_MSBYTE: equ $FFDEA2
RANDOM_SEED: equ $FFDEA4 ; random seed (updated every second when idle on map, every tick when idle in menu)
word_FFDEA6: equ $FFDEA6
word_FFDEA8: equ $FFDEA8
VDP_REG00_STATUS: equ $FFDEAA
VDP_REG01_STATUS: equ $FFDEAC
VDP_REG01_VALUE: equ $FFDEAD
VDP_REG0B_VALUE: equ $FFDEC1
VDP_COMMAND_QUEUE_POINTER: equ $FFDED0
DMA_QUEUE_POINTER: equ $FFDED4
SOUND_COMMAND_QUEUE: equ $FFDED8 ; up to 4 word values :
                                        ; xx FC : update music volume to xx
MUSIC_STACK_LENGTH: equ $FFDEE0 ; up to $A
MUSIC_STACK: equ $FFDEE1 ; history of music previously played
WAIT_FOR_MUSIC_END: equ $FFDEEB ; if set, check if music's being played
LAST_PLAYER_INPUT: equ $FFDEEC
INPUT_REPEAT_DELAYER: equ $FFDEED ; Applys a delay before using input again when hold.
FADING_SETTING: equ $FFDEF0
FADING_COUNTER_MAX: equ $FFDEF2
FADING_POINTER: equ $FFDEF3 ; decremented when value $8x
FADING_COUNTER: equ $FFDEF4 ; has to be 01 to start fade routine
FADING_PALETTE_BITFIELD: equ $FFDEF5 ; palette fading bitfield (1=1st palette, 2=2nd, 4=3rd, 8=4th)
VINT_ENABLED: equ $FFDEF6 ; bit7 is set when VInt is enabled
WAITING_NEXT_VINT: equ $FFDEF7
VINT_FUNCS_ENABLED_BITFIELD: equ $FFDEF8
SECONDS_COUNTER_FRAMES: equ $FFDEF9
VINT_FUNC_ADDRS: equ $FFDEFA
SECONDS_COUNTER: equ $FFDF1E
SPECIAL_BATTLE_TIME: equ $FFDF22
GAME_INTRO_STACK_POINTER_BACKUP: equ $FFDF26
PALETTE_1_COPY: equ $FFDF2A
PALETTE_2_COPY: equ $FFDF4A
FADING_TIMER_WORD: equ $FFDFAA
FADING_TIMER_BYTE: equ $FFDFAB
RANDOM_WAITING_FOR_INPUT: equ $FFDFB0 ; "random" value for determining AI/hit chance??
PLANE_B_LAYOUT: equ $FFE000
byte_FFE0DC: equ $FFE0DC
PLANE_B_WITCH_HEAD: equ $FFE15C
BATTLESCENE_ENEMY_LAYOUT: equ $FFE184
byte_FFE19C: equ $FFE19C
byte_FFE21E: equ $FFE21E
byte_FFE29E: equ $FFE29E
byte_FFE31C: equ $FFE31C

    if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
ALLY_NAME_LOADING_SPACE: equ $FFE800
    endif

; Start of Saved Data
COMBATANT_ENTRIES:          equ savedDataStart+SAVED_DATA_OFFSET_COMBATANT_ENTRIES
CURRENT_GOLD:               equ savedDataStart+SAVED_DATA_OFFSET_CURRENT_GOLD
DEALS_ITEMS:                equ savedDataStart+SAVED_DATA_OFFSET_DEALS_ITEMS ; amount of each item in the deals section (stacked 2 items to a byte, 4 bits per item, max 0xF amt of each item)
CARAVAN_ITEMS_NUMBER:       equ savedDataStart+SAVED_DATA_OFFSET_CARAVAN_ITEMS_NUMBER ; number of items in caravan
CARAVAN_ITEMS:              equ savedDataStart+SAVED_DATA_OFFSET_CARAVAN_ITEMS ; indexes of items in caravan (1 byte each, $7F for no item, 64 items)
GAME_FLAGS:                 equ savedDataStart+SAVED_DATA_OFFSET_GAME_FLAGS
BATTLE_AREA_X:              equ savedDataStart+SAVED_DATA_OFFSET_BATTLE_AREA_X ; camera lock x1
BATTLE_AREA_Y:              equ savedDataStart+SAVED_DATA_OFFSET_BATTLE_AREA_Y
BATTLE_AREA_WIDTH:          equ savedDataStart+SAVED_DATA_OFFSET_BATTLE_AREA_WIDTH ; camera lock x2
BATTLE_AREA_HEIGHT:         equ savedDataStart+SAVED_DATA_OFFSET_BATTLE_AREA_HEIGHT
PLAYER_TYPE:                equ savedDataStart+SAVED_DATA_OFFSET_PLAYER_TYPE ; holds which player entity type we are (00=BOWIE, 01=caravan, 02=raft)
CURRENT_MAP:                equ savedDataStart+SAVED_DATA_OFFSET_CURRENT_MAP ; holds which map index we're currently using
CURRENT_BATTLE:             equ savedDataStart+SAVED_DATA_OFFSET_CURRENT_BATTLE ; holds which battle we're currently doing
RAFT_MAP:                   equ savedDataStart+SAVED_DATA_OFFSET_RAFT_MAP
RAFT_X:                     equ savedDataStart+SAVED_DATA_OFFSET_RAFT_X
RAFT_Y:                     equ savedDataStart+SAVED_DATA_OFFSET_RAFT_Y
MESSAGE_SPEED:              equ savedDataStart+SAVED_DATA_OFFSET_MESSAGE_SPEED ; [0, 3]
NO_BATTLE_MESSAGES_TOGGLE:  equ savedDataStart+SAVED_DATA_OFFSET_NO_BATTLE_MESSAGES_TOGGLE ; 1 = no battle messages
EGRESS_MAP:                 equ savedDataStart+SAVED_DATA_OFFSET_EGRESS_MAP ; holds which map index to teleport back to after we EGRESS or lose
BATTLE_TURN_ORDER:          equ savedDataStart+SAVED_DATA_OFFSET_BATTLE_TURN_ORDER ; current turn order 2 byte pairs (index, altered agility score)
CURRENT_BATTLE_TURN:        equ savedDataStart+SAVED_DATA_OFFSET_CURRENT_BATTLE_TURN ; current turn index * 2  current turn index * 2 (i.e., current byte of BATTLE_TURN_ORDER)
SAVED_SECONDS_COUNTER:      equ savedDataStart+SAVED_DATA_OFFSET_SAVED_SECONDS_COUNTER
SPECIAL_BATTLE_RECORD:      equ savedDataStart+SAVED_DATA_OFFSET_SPECIAL_BATTLE_RECORD
ENEMY_ITEM_DROPPED_FLAGS:   equ savedDataStart+SAVED_DATA_OFFSET_ENEMY_ITEM_DROPPED_FLAGS
MITHRIL_WEAPONS_ON_ORDER:   equ savedDataStart+SAVED_DATA_OFFSET_MITHRIL_WEAPONS_ON_ORDER ; current mithril weapon index (may be after too, for multiple)

ERRCODE_BYTE0: equ $FFFFF8 
ERRCODE_BYTE1: equ $FFFFF9 
ERRCODE_BYTE2: equ $FFFFFA 
ERRCODE_BYTE3: equ $FFFFFB 
ERRCODE_BYTE4: equ $FFFFFC 
ERRCODE_BYTE5: equ $FFFFFD 
ERRCODE_BYTE6: equ $FFFFFE 
ERRCODE_BYTE7: equ $FFFFFF 
; END OF SEGMENT RAM OFFSETS FROM RAM:FF0000 TO 0:01000000

