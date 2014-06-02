

; ---------------------------------------------------------------------------

; enum Animation
ANIM_SPRITE_DEATH_SPIN_DELAY: equ $3
ANIM_SPRITE_DEATH_NUM_SPINS: equ $B

; ---------------------------------------------------------------------------

; enum Traps
TRAP_SOUNDCOM: equ $0
TRAP_CHECKFLAG: equ $1
TRAP_SETFLAG: equ $2
TRAP_CLEARFLAG: equ $3
TRAP_TEXTBOX: equ $5
TRAP_MAPSCRIPT: equ $6
TRAP_VINTFUNCTIONS: equ $9

; ---------------------------------------------------------------------------

; enum GraphicsValues
GFX_MAX_SPRITES_TO_LOAD: equ $7
GFX_DIAMENU_ICON_NUM_PIXELS: equ $240

; ---------------------------------------------------------------------------

; enum Combatant
COM_ALLY_START: equ $0
COM_POS_IDX: equ $0
COM_BIT_SORT: equ $6
COM_POS_TYPE: equ $7
COM_ALLIES_COUNTER: equ $1D
COM_ALLY_END: equ $1D
COM_ALLIES_NUM: equ $1E
COM_ENEMIES_COUNTER: equ $1F
COM_ALLY_SPACEEND: equ $1F
COM_ALL_COUNTER: equ $3D
COM_IDX_REALMASK: equ $3F
COM_ALLYENDENEMYSTARTDIFFERENCE: equ $60
COM_TYPE_REALMASK: equ $80
COM_ENEMY_START: equ $80
COM_ENEMY_END: equ $9F
COM_ENEMY_SPACEEND: equ $A0

; ---------------------------------------------------------------------------

; enum Combatant_Idx
COM_IDX_SIZE: equ $6
COM_IDX_MASK: equ $3F

; ---------------------------------------------------------------------------

; enum Combatant_Type
COM_TYPE_MASK: equ $1
COM_TYPE_SIZE: equ $1

; ---------------------------------------------------------------------------

; enum Combatant_Offsets

; ---------------------------------------------------------------------------

; enum Combatant_Status_Bitfield
COM_STATUS_MASK_MUDDLE2: equ $8
COM_STATUS_MASK_MUDDLE: equ $30
COM_STATUS_MASK_SLEEP: equ $C0

; ---------------------------------------------------------------------------

; enum CharDef
CHAR_IDX_BOWIE: equ $0
CHARDEF_STARTDATA_ENTRYSIZE: equ $6
CHAR_IDX_PETER: equ $7
CHAR_CLASS_FIRSTPROMOTED: equ $C
CHAR_CLASS_EXTRALEVEL: equ $14
CHAR_IDX_LEMON: equ $1C
CHAR_MAX_IDX: equ $1D
CHAR_STATCAP_AGI_BASE: equ $64
CHAR_STATCAP_AGI_CURRENT: equ $7F
CHAR_STATCAP_LEVEL: equ $C8
CHAR_STATCAP_HP: equ $C8
CHAR_STATCAP_MP: equ $C8
CHAR_STATCAP_ATK: equ $C8
CHAR_STATCAP_DEF: equ $C8
CHAR_STATCAP_MOV: equ $C8
CHAR_STATCAP_EXP: equ $C8
CHAR_STATCAP_AGI_DECREASING: equ $C8

; ---------------------------------------------------------------------------

; enum ClassIdx
CLASSIDX_SORC: equ $12
CLASSIDX_MMNK: equ $14
CLASSIDX_NINJ: equ $1B

; ---------------------------------------------------------------------------

; enum Force
FORCE_MAX_SIZE: equ $C
FORCE_MAX_GOLD: equ $98967F

; ---------------------------------------------------------------------------

; enum Enemy
ENEMYIDX_BURST_ROCK: equ $20
ENEMYIDX_TAROS: equ $58

; ---------------------------------------------------------------------------

; enum CharEntry
CHAR_STATUS_MASK_STUN: equ $1
CHAR_STATUS_BIT_POISON: equ $1
CHAR_ITEMSLOTS_COUNTER: equ $3
CHAR_SPELLSLOTS_COUNTER: equ $3
CHAR_ITEMSLOTS: equ $4
CHAR_SPELLSLOTS: equ $4
CHAR_STATUS_MASK_CURSE: equ $4
CHAR_BIT_ENEMY: equ $7
CHAR_NAME_COUNTER: equ $9
CHAR_NAMELENGTH: equ $A
CHAR_PROWESS_MASK_CRIT: equ $F
CHAR_ENTRY_SIZE: equ $38
CHAR_STATUS_MASK_SILENCE: equ $300

; ---------------------------------------------------------------------------

; enum CharEntry_Offsets
CHAR_OFFSET_NAME: equ $0
CHAR_OFFSET_CLASS_IDX: equ $A
CHAR_OFFSET_LEVEL: equ $B
CHAR_OFFSET_HP_MAX: equ $C
CHAR_OFFSET_HP_CURRENT: equ $E
CHAR_OFFSET_MP_MAX: equ $10
CHAR_OFFSET_MP_CURRENT: equ $11
CHAR_OFFSET_ATK_MAX: equ $12
CHAR_OFFSET_ATK_CURRENT: equ $13
CHAR_OFFSET_DEF_MAX: equ $14
CHAR_OFFSET_DEF_CURRENT: equ $15
CHAR_OFFSET_AGI_MAX: equ $16
CHAR_OFFSET_AGI_CURRENT: equ $17
CHAR_OFFSET_MOV_MAX: equ $18
CHAR_OFFSET_MOV_CURRENT: equ $19
CHAR_OFFSET_RESIST_BASE: equ $1A
CHAR_OFFSET_RESIST_CURRENT: equ $1C
CHAR_OFFSET_SPECIAL_BASE: equ $1E
CHAR_OFFSET_PROWESS_CURRENT: equ $1F
CHAR_OFFSET_ITEM_0: equ $20
CHAR_OFFSET_ITEM_1: equ $22
CHAR_OFFSET_ITEM_2: equ $24
CHAR_OFFSET_ITEM_3: equ $26
CHAR_OFFSET_SPELL_0: equ $28
CHAR_OFFSET_STATUS: equ $2C
CHAR_OFFSET_X: equ $2E
CHAR_OFFSET_Y: equ $2F
CHAR_OFFSET_EXP: equ $30
CHAR_OFFSET_MOVETYPE: equ $31
CHAR_OFFSET_KILLS: equ $32
CHAR_OFFSET_DEFEATS: equ $36
CHAR_OFFSET_ENEMYIDX: equ $37

; ---------------------------------------------------------------------------

; enum ClassDef
CLASSIDX_BRGN: equ $16

; ---------------------------------------------------------------------------

; enum EnemyAI
ENEMYAI_THRESHOLD_HEAL1: equ $2
ENEMYAI_THRESHOLD_HEAL2: equ $E
ENEMYAI_THRESHOLD_HEAL3: equ $1C

; ---------------------------------------------------------------------------

; enum Controller_Input_A_Bitfield
INPUT_A_UP_BIT: equ $0
INPUT_A_DOWN_BIT: equ $1
INPUT_A_LEFT_BIT: equ $2
INPUT_A_RIGHT_BIT: equ $3
INPUT_A_B_BIT: equ $4
INPUT_A_C_BIT: equ $5
INPUT_A_A_BIT: equ $6
INPUT_A_START_BIT: equ $7

; ---------------------------------------------------------------------------

; enum ItemDef
ITEM_SELLPRICE_BITSHIFTRIGHT: equ $2
ITEM_SELLPRICE_MULTIPLIER: equ $3
ITEMDEF_OFFSET_MAXRANGE: equ $4
ITEMDEF_OFFSET_MINRANGE: equ $5
ITEMDEF_LIFE_RING_RECOVERY: equ $5
ITEMDEF_OFFSET_PRICE: equ $6
ITEMDEF_OFFSET_TYPE: equ $8
ITEMDEF_OFFSET_SPELL: equ $9
ITEMDEF_OFFSET_STATINFO1: equ $A
ITEM_MAX_IDX: equ $7F

; ---------------------------------------------------------------------------

; enum Deals
DEALS_ADDAMT_EVEN: equ $1
DEALS_MAX_NUM_PER_ITEM: equ $F
DEALS_BIT_REMAINDER: equ $10
DEALS_ADDAMT_ODD: equ $10

; ---------------------------------------------------------------------------

; enum Caravan
CARAVAN_MAX_ITEMS: equ $3F

; ---------------------------------------------------------------------------

; enum ItemDef_Idx
ITEMIDX_ANGEL_WING: equ $4
ITEMIDX_HEALING_RAIN: equ $8
ITEMIDX_POWER_RING: equ $13
ITEMIDX_PROTECT_RING: equ $14
ITEMIDX_QUICK_RING: equ $15
ITEMIDX_RUNNING_RING: equ $16
ITEMIDX_ACHILLES_SWORD: equ $3D
ITEMIDX_COUNTER_SWORD: equ $44
ITEMIDX_IRON_BALL: equ $66
ITEMIDX_GISARME: equ $6D
ITEMIDX_TAROS_SWORD: equ $6E
ITEMIDX_LIFE_RING: equ $7C
ITEMIDX_CHIRRUP_SANDALS: equ $7E
ITEMIDX_NOTHING: equ $7F

; ---------------------------------------------------------------------------

; enum ItemDef_Type_Bitfield
ITEMTYPE_BIT_WEAPON: equ $1
ITEMTYPE_IDX_WEAPON: equ $1
ITEMTYPE_MASK_WEAPON: equ $2
ITEMTYPE_BIT_RING: equ $2
ITEMTYPE_BIT_RARE: equ $3
ITEMTYPE_MASK_RING: equ $4
ITEMTYPE_BIT_UNSELLABLE: equ $4
ITEMTYPE_BIT_CURSED: equ $6
ITEMTYPE_MASK_WEAPONORRING: equ $6
ITEMTYPE_MASK_RARE: equ $8
ITEMTYPE_MASK_UNSELLABLE: equ $10

; ---------------------------------------------------------------------------

; enum ItemEntry
ITEM_OFFSET_IDXANDEQUIPBYTE: equ $1
ITEM_MASK_IDXANDBROKEN: equ $807F

; ---------------------------------------------------------------------------

; enum ItemEntry_Idx
ITEM_IDX_BITSIZE: equ $7

; ---------------------------------------------------------------------------

; enum ItemEntry_Props
ITEM_BIT_EQUIPPED: equ $7
ITEM_UPPERBIT_BROKEN: equ $7
ITEM_BIT_ENEMYUSE: equ $D
ITEM_BIT_BROKEN: equ $F
ITEM_MASK_IDX: equ $7F

; ---------------------------------------------------------------------------

; enum MapDef
MAP_SIZE_MAXHEIGHT: equ $30
MAP_SIZE_MAXWIDTH: equ $30
MAP_BLOCKIDX_CLOSEDCHEST: equ $D801
MAP_BLOCKIDX_OPENCHEST: equ $D802
MAP_NULLPOSITION: equ $FFFF

; ---------------------------------------------------------------------------

; enum Map_Entity
ENTITYDEF_OFFSET_X: equ $0
ENTITYDEF_OFFSET_Y: equ $2
ENTITYDEF_SIZE_BITS: equ $5
ENTITYDEF_OFFSET_XDEST: equ $C
ENTITYDEF_OFFSET_YDEST: equ $E
ENTITYDEF_OFFSET_FACING: equ $10
ENTITYDEF_OFFSET_ENTNUM: equ $12
ENTITYDEF_OFFSET_MAPSPRITE: equ $13
ENTITYDEF_OFFSET_ACTSCRIPTADDR: equ $14
ENTITYDEF_OFFSET_XSPEED: equ $1A
ENTITYDEF_OFFSET_YSPEED: equ $1B
ENTITYDEF_OFFSET_FLAGS_A: equ $1C
ENTITYDEF_OFFSET_FLAGS_B: equ $1D
ENTITYDEF_OFFSET_ANIMCOUNTER: equ $1E
ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER: equ $1F
ENTITYDEF_SIZE: equ $20
ENTITYIDX_UNITCURSOR: equ $30

; ---------------------------------------------------------------------------

; enum SoundCommands
SOUND_COMMAND_INIT_DRIVER: equ $20
SOUND_COMMAND_WAIT_MUSIC_END: equ $F0
SOUND_COMMAND_PLAY_PREVIOUS_MUSIC: equ $FB
SOUND_COMMAND_FADE_OUT: equ $FD
SOUND_COMMAND_GET_D0_PARAMETER: equ $FFFF

; ---------------------------------------------------------------------------

; enum Music
MUSIC_NOTHING: equ $0
MUSIC_MAIN_THEME: equ $1
MUSIC_ATTACK: equ $2
MUSIC_PROMOTED_ATTACK: equ $3
MUSIC_PROMOTED_ATTACK_LOOP: equ $4
MUSIC_ENEMY_ATTACK: equ $5
MUSIC_BOSS_ATTACK: equ $6
MUSIC_ZEON_ATTACK: equ $7
MUSIC_TOWN: equ $8
MUSIC_INTRO: equ $9
MUSIC_WITCH: equ $A
MUSIC_SUSPEND: equ $B
MUSIC_SAD_THEME_2: equ $C
MUSIC_ELVEN_TOWN: equ $D
MUSIC_MITULA: equ $E
MUSIC_SAD_THEME_3: equ $F
MUSIC_SAD_THEME_1: equ $10
MUSIC_PIANO_THEME: equ $11
MUSIC_CORRUPTED_SAVE: equ $12
MUSIC_JOIN: equ $13
MUSIC_SAD_JOIN: equ $14
MUSIC_SAVE: equ $15
MUSIC_CURE: equ $16
MUSIC_UNUSED_REVIVE: equ $17
MUSIC_REVIVE: equ $18
MUSIC_PROMOTION: equ $19
MUSIC_CURSED_ITEM: equ $1A
MUSIC_ITEM: equ $1B
MUSIC_TITLE: equ $1C
MUSIC_BATTLE_THEME_3: equ $21
MUSIC_BATTLE_THEME_1: equ $22
MUSIC_SHRINE: equ $23
MUSIC_FINAL_BATTLE: equ $24
MUSIC_MITHRIL_DIGGERS: equ $25
MUSIC_CASTLE: equ $26
MUSIC_HEADQUARTERS: equ $27
MUSIC_MITULA_SHRINE: equ $28
MUSIC_ENDING: equ $29

; ---------------------------------------------------------------------------

; enum Sfx
SFX_MENU_SWITCH: equ $41
SFX_MENU_SELECTION: equ $42
SFX_VALIDATION: equ $43
SFX_REFUSAL: equ $44
SFX_DIALOG_BLEEP_1: equ $45
SFX_DIALOG_BLEEP_2: equ $46
SFX_DIALOG_BLEEP_3: equ $47
SFX_DIALOG_BLEEP_4: equ $48
SFX_DIALOG_BLEEP_5: equ $49
SFX_DIALOG_BLEEP_6: equ $4A
SFX_DIALOG_BLEEP_7: equ $4B
SFX_DIALOG_BLEEP_8: equ $4C
SFX_SPELL_CAST: equ $4D
SFX_DOOR_OPEN_HIGH_PITCH: equ $4E
SFX_WALKING: equ $4F
SFX_UNUSED_FROM_LANDSTALKER: equ $50
SFX_LIGHTNING_1: equ $51
SFX_LIGHTNING_2: equ $52
SFX_HIT_1: equ $53
SFX_HIT_2: equ $54
SFX_BLAST: equ $55
SFX_SWORDS_HIT: equ $56
SFX_JUMP: equ $57
SFX_FALLING: equ $58
SFX_WARP: equ $59
SFX_CHIRRUP_SANDALS: equ $5A
SFX_MONSTER_DIALOG_BLEEP: equ $5B
SFX_DOOR_OPEN: equ $5C
SFX_BIG_DOOR_RUMBLE: equ $5D
SFX_MONSTER_SCREAM: equ $5E
SFX_BUUBOBI: equ $5F
SFX_SECRET_PATH_ROCK: equ $60
SFX_PSH: equ $61
SFX_PSHHH: equ $62
SFX_BLOAB: equ $63
SFX_BLO: equ $64
SFX_LANDSTALKER_ITEM: equ $65
SFX_LEVEL_UP: equ $66
SFX_PRISM_LASER_LOADING: equ $67
SFX_LANDSTALKER_SWITCH: equ $68
SFX_SFCD_STATUES: equ $69
SFX_DESOUL: equ $6A
SFX_SITD_HOWL: equ $6B
SFX_PRISM_LASER_FIRING: equ $6C
SFX_BOOST: equ $6D
SFX_DESOUL_HOVERING: equ $6E
SFX_PRISM_LASER_CUTSCENE_FIRING: equ $6F
SFX_TAROS_DIALOG_BLEEP: equ $70
SFX_HEALING: equ $71
SFX_BLAST_SPELL: equ $72
SFX_WING_FLAP: equ $73
SFX_BATTLEFIELD_DEATH: equ $74
SFX_DEMON_BREATH: equ $75
SFX_INTRO_LIGHTNING: equ $76
SFX_BOLT_SPELL: equ $77
SFX_TINKLING: equ $78

; ---------------------------------------------------------------------------

; enum SpellDef
SPELLDEF_OFFSET_MPCOST: equ $1
SPELLDEF_OFFSET_ANIMIDX: equ $2
SPELLDEF_OFFSET_PROPS: equ $3
SPELLDEF_OFFSET_MAXRANGE: equ $4
SPELLDEF_OFFSET_MINRANGE: equ $5
SPELLDEF_OFFSET_RADIUS: equ $6
SPELLDEF_OFFSET_POWER: equ $7
SPELLDEF_SIZE: equ $8
MAX_SPELL_IDX: equ $3F

; ---------------------------------------------------------------------------

; enum SpellDef_Props
SPELLDEF_TYPE_ATTACK: equ $0
SPELLDEF_TYPE_HEAL: equ $1
SPELLDEF_RESIST_MINOR: equ $1
SPELLDEF_TYPE_STATUS: equ $2
SPELLDEF_RESIST_MAJOR: equ $2
SPELLDEF_PROPS_TYPE_MASK: equ $3
SPELLDEF_RESIST_WEAKNESS: equ $3
SPELLDEF_LEVELS_NUM: equ $4
SPELLDEF_PROPS_BIT_AFFECTEDBYSILENCE: equ $7

; ---------------------------------------------------------------------------

; enum SpellDef_Idx
SPELLIDX_DESOUL: equ $8
SPELLIDX_EGRESS: equ $A
SPELLIDX_BLAZE: equ $B
SPELLIDX_FREEZE: equ $C
SPELLIDX_BOLT: equ $D
SPELLIDX_BLAST: equ $E
SPELLIDX_KATON: equ $1B
SPELLIDX_RAIJIN: equ $1C
SPELLIDX_DAO: equ $1D
SPELLIDX_APOLLO: equ $1E
SPELLIDX_NEPTUN: equ $1F
SPELLIDX_ATLAS: equ $20
SPELLIDX_NOTHING: equ $3F

; ---------------------------------------------------------------------------

; enum SpellEntry
SPELL_OFFSET_IDX: equ $0
SPELL_MASK_RESIST: equ $3
SPELL_OFFSET_LV: equ $6
SPELL_IDX_REALMASK: equ $3F
SPELL_MASK_LV: equ $C0
SPELL_MASK: equ $FF
SPELL_MASK_ALLRESIST: equ $C0FF

; ---------------------------------------------------------------------------

; enum SpellEntry_Idx
SPELL_IDX_BITSIZE: equ $6
SPELL_MASK_IDX: equ $3F

; ---------------------------------------------------------------------------

; enum SpellEntry_LV
SPELL_LV_BITSIZE: equ $2
SPELL_UPPERMASK_LV: equ $3

; ---------------------------------------------------------------------------

; enum Battle
ACTION_ATTACK: equ $0
ACTION_SPELL: equ $1
ACTION_ITEM: equ $2
ACTION_BURSTROCK: equ $4
BATTLE_INACTIONCHANCEDIVISOR_CURSE: equ $4
BATTLE_INACTIONCHANCEDIVISOR_STUN: equ $4
ACTION_NOTHING: equ $5
ACTION_PRISMLASER: equ $6
BATTLEIDX_TAROS: equ $12
MAX_BTL_IDX: equ $2C
BATTLEIDX_FAIRY_WOODS: equ $2C

; ---------------------------------------------------------------------------

; enum Battle_Cutscene
BTLANIM_ATTACK: equ $0
BTLANIM_DODGE: equ $1
BTLANIM_EFFECT: equ $2
BTLSCENE_ACTION_OFFSET_ITEMORSPELL: equ $2
BTLANIM_RANGED: equ $6
BTLSCENE_STACKNEGSIZE: equ $FF68

; ---------------------------------------------------------------------------

; enum Battle_Cutscene_Stack
BCSTACK_OFFSET_CUTOFF: equ $1
BCSTACK_OFFSET_CRIT: equ $3
BCSTACK_OFFSET_TARGETDIES: equ $4
BCSTACK_OFFSET_DODGE: equ $5
BCSTACK_OFFSET_RANGED: equ $6
BCSTACK_OFFSET_SAMESIDE: equ $7
BCSTACK_OFFSET_MUDDLED: equ $8
BCSTACK_OFFSET_INACTION_CURSE: equ $9
BCSTACK_OFFSET_INACTION_STUN: equ $A
BCSTACK_OFFSET_SILENCED: equ $B
BCSTACK_OFFSET_COUNTER: equ $C
BCSTACK_OFFSET_DOUBLE: equ $D
BCSTACK_OFFSET_INEFFECTIVEATTACK: equ $E
BCSTACK_OFFSET_EXPLODE: equ $10
BCSTACK_OFFSET_EXPLODECHAR: equ $11
BCSTACK_OFFSET_DEBUGCOUNTER: equ $14
BCSTACK_OFFSET_DEBUGDOUBLE: equ $15
BCSTACK_OFFSET_DEBUGCRIT: equ $16
BCSTACK_OFFSET_DEBUGDODGE: equ $17

; ---------------------------------------------------------------------------

; enum Def_Lengths
SIZE_ITEM: equ $2
BITS_HALFBYTE: equ $4
SIZE_ITEMDEF: equ $10

; ---------------------------------------------------------------------------

; enum Flags
FLAG_COUNT_FORCEMEMBERS_JOINED: equ $20
FLAGIDX_RAFT: equ $40
FLAGIDX_FOLLOWERS_ASTRAL: equ $46
FLAGIDX_BTLCUTSCENE_GIZMOS: equ $18F
FLAGIDX_BATTLE0: equ $190
FLAG_MASK: equ $3FF

; ---------------------------------------------------------------------------

; enum Codes
CODE_NOTHING_BYTE: equ $FF
CODE_TERMINATOR_BYTE: equ $FF
CODE_NOTHING_WORD: equ $FFFF
CODE_TERMINATOR_WORD: equ $FFFF

; ---------------------------------------------------------------------------

; enum Special_Offsets
NRO: equ $FF000000

; ---------------------------------------------------------------------------

; enum Text_Index
TEXTIDX_CHANGEYOURMIND: equ $4
TEXTIDX_HQ: equ $2E
TEXTIDX_CARAVANDESC_ITEMHASEFFECT: equ $5D
TEXTIDX_CARAVANDESC_ITEMHASNOEFFECT: equ $5E
TEXTIDX_CARAVANDESC_EVERYBODY: equ $5F
TEXTIDX_CARAVANDESC_ITEMISFOR: equ $60
TEXTIDX_CARAVANDESC_ITEMFORNOBODY: equ $61
TEXTIDX_CARAVANDESC_ITEMFORNAME: equ $62
TEXTIDX_CARAVANDESC_NEWLINE: equ $63
TEXTIDX_CARAVANDESC_TOEQUIP: equ $64
TEXTIDX_CARAVANDESC_SELLPRICE: equ $65
TEXTIDX_CARAVANDESC_UNSELLABLE: equ $66
TEXTIDX_BATTLE_DAMAGE_ALLY: equ $11C
TEXTIDX_BATTLE_DAMAGE_ENEMY: equ $11D
TEXTIDX_BATTLE_DODGE: equ $11E
TEXTIDX_BATTLE_CRITDAMAGE: equ $11F
TEXTIDX_BATTLE_HEAVYDAMAGE: equ $120
TEXTIDX_BATTLE_INEFFECTIVEATTACK: equ $121
TEXTIDX_BATTLE_CUTOFF: equ $126
TEXTIDX_BATTLE_SILENCED: equ $128
TEXTIDX_BATTLE_CURSEDSTUNNED: equ $167
TEXTIDX_BATTLE_STUNNED: equ $169
TEXTIDX_BATTLE_PICKEDUPITEM: equ $18B
TEXTIDX_BATTLE_DROPPEDITEM: equ $18C
TEXTIDX_END: equ $FFFF

; ---------------------------------------------------------------------------

; enum Windowing
WINDOW_DIALOGUE_TILELINECOUNTER_BATTLE: equ $3
WINDOW_NUMPROMPT_STACK_OFFSET_WINDOWTILESEND: equ $4
WINDOW_DIALOGUE_TILELINECOUNTER_EVENT: equ $5
WINDOW_MEMBER_KD_TEXT_DEFEATS_LENGTH: equ $6
WINDOW_MEMBER_KD_TEXT_KILLS_LENGTH: equ $6
WINDOW_NUMPROMPT_STACK_OFFSET_WINDOWIDX: equ $6
WINDOW_NUMPROMPT_STACK_OFFSET_NUM: equ $8
WINDOW_NUMPROMPT_STACK_OFFSET_MINNUM: equ $A
WINDOW_NUMPROMPT_STACK_OFFSET_MAXNUM: equ $C
WINDOW_NUMPROMPT_STACK_NEGSIZE: equ $10
WINDOW_DIALOGUE_WIDTHINTILES: equ $1A
WINDOW_MEMBER_KD_TEXT_DEFEATS_OFFSET: equ $24
WINDOW_MEMBER_STATS_TEXT_CLASS_OFFSET: equ $2C
WINDOW_MEMBER_KD_TEXT_KILLS_OFFSET: equ $72
WINDOW_MEMBER_KD_VDPTILEORDER_BYTESIZE: equ $C0
WINDOW_MEMBER_PORTRAIT_POSITION: equ $201
WINDOW_MEMBER_KD_POSITION: equ $20B
WINDOW_MEMBER_GOLD_POSITION: equ $217
WINDOW_MEMBER_STATS_VDPTILEORDER_BYTESIZE: equ $444
WINDOW_MEMBER_PORTRAIT_SIZE: equ $80A
WINDOW_MEMBER_KD_SIZE: equ $80C
WINDOW_MEMBER_GOLD_SIZE: equ $80C
WINDOW_MEMBER_STATS_POSITION: equ $A01
WINDOW_MEMBER_STATS_SIZE: equ $151A
WINDOW_MEMBER_STATS_DEST: equ $2001
WINDOW_MEMBER_KD_DEST: equ $F80B
WINDOW_MEMBER_GOLD_DEST: equ $F81C
WINDOW_MEMBER_PORTRAIT_DEST: equ $F8F6

; ---------------------------------------------------------------------------

; enum Text
TEXT_CODE_NEWLINE: equ $B
TEXT_CODE_MOVEDOWN: equ $D
TEXT_CODE_TOGGLEFONTCOLOR: equ $5C

; ---------------------------------------------------------------------------

; enum VDP_Tile
VDPTILE_PALETTE3_MASK: equ $C000
VDPTILE_IDX_DIALOGUEWINDOW_TOPLEFTBORDER: equ $C060
VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER: equ $C061
VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER: equ $C070
VDPTILE_IDX_DIALOGUEWINDOW_FIRSTINNERBOXTILE: equ $C640
VDPTILE_IDX_SCREEN_BLACKBAR: equ $C77C
VDPTILE_IDX_DIALOGUEWINDOW_TOPRIGHTBORDER: equ $C860
VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER: equ $C870
VDPTILE_STATUSEFFECT_CURSE: equ $C0ECC0ED

; ---------------------------------------------------------------------------

; enum Status_Effects
STATUSEFFECT_LASTING_EFFECTS_MASK: equ $7

; ---------------------------------------------------------------------------

; enum Gold
GOLD_STARTING_AMOUNT: equ $3C