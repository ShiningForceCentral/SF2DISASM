
   cpu z80
   listing off
   phase    0
   include "..\macros.asm"
   include "..\enums.asm"
   org 08000h+7000h
    
pt_SFX:         
    dw Sfx_001	; #65 - SFX_MENU_SWITCH
    dw Sfx_002	; #66 - SFX_MENU_SELECTION
    dw Sfx_003	; #67 - SFX_VALIDATION
    dw Sfx_004	; #68 - SFX_REFUSAL
    dw Sfx_005	; #69 - SFX_DIALOG_BLEEP_1
    dw Sfx_006	; #70 - SFX_DIALOG_BLEEP_2
    dw Sfx_007	; #71 - SFX_DIALOG_BLEEP_3
    dw Sfx_008	; #72 - SFX_DIALOG_BLEEP_4
    dw Sfx_009	; #73 - SFX_DIALOG_BLEEP_5
    dw Sfx_010	; #74 - SFX_DIALOG_BLEEP_6
    dw Sfx_011	; #75 - SFX_DIALOG_BLEEP_7
    dw Sfx_012	; #76 - SFX_DIALOG_BLEEP_8
    dw Sfx_013	; #77 - SFX_SPELL_CAST
    dw Sfx_014	; #78 - SFX_DOOR_OPEN_HIGH_PITCH
    dw Sfx_015	; #79 - SFX_WALKING
    dw Sfx_016	; #80 - SFX_UNUSED_FROM_LANDSTALKER
    dw Sfx_017	; #81 - SFX_LIGHTNING_1
    dw Sfx_018	; #82 - SFX_LIGHTNING_2
    dw Sfx_019	; #83 - SFX_HIT_1
    dw Sfx_020	; #84 - SFX_HIT_2
    dw Sfx_021	; #85 - SFX_BLAST
    dw Sfx_022	; #86 - SFX_SWORDS_HIT
    dw Sfx_023	; #87 - SFX_JUMP
    dw Sfx_024	; #88 - SFX_FALLING
    dw Sfx_025	; #89 - SFX_WARP
    dw Sfx_026	; #90 - SFX_CHIRRUP_SANDALS
    dw Sfx_027	; #91 - SFX_MONSTER_DIALOG_BLEEP
    dw Sfx_028	; #92 - SFX_DOOR_OPEN
    dw Sfx_029	; #93 - SFX_BIG_DOOR_RUMBLE
    dw Sfx_030	; #94 - SFX_MONSTER_SCREAM
    dw Sfx_031	; #95 - SFX_BUUBOBI
    dw Sfx_032	; #96 - SFX_SECRET_PATH_ROCK
    dw Sfx_033	; #97 - SFX_PSH
    dw Sfx_034	; #98 - SFX_PSHHH
    dw Sfx_035	; #99 - SFX_BLOAB
    dw Sfx_036	; #100 - SFX_BLO
    dw Sfx_037	; #101 - SFX_LANDSTALKER_ITEM
    dw Sfx_038	; #102 - SFX_LEVEL_UP
    dw Sfx_039	; #103 - SFX_PRISM_LASER_LOADING
    dw Sfx_040	; #104 - SFX_SPAWN
    dw Sfx_041	; #105 - SFX_SFCD_STATUES
    dw Sfx_042	; #106 - SFX_DESOUL
    dw Sfx_043	; #107 - SFX_SITD_HOWL
    dw Sfx_044	; #108 - SFX_PRISM_LASER_FIRING
    dw Sfx_045	; #109 - SFX_BOOST
    dw Sfx_046	; #110 - SFX_DESOUL_HOVERING
    dw Sfx_047	; #111 - SFX_PRISM_LASER_CUTSCENE_FIRING
    dw Sfx_048	; #112 - SFX_TAROS_DIALOG_BLEEP
    dw Sfx_049	; #113 - SFX_HEALING
    dw Sfx_050	; #114 - SFX_BLAST_SPELL
    dw Sfx_051	; #115 - SFX_WING_FLAP
    dw Sfx_052	; #116 - SFX_BATTLEFIELD_DEATH
    dw Sfx_053	; #117 - SFX_DEMON_BREATH
    dw Sfx_054	; #118 - SFX_INTRO_LIGHTNING
    dw Sfx_055	; #119 - SFX_BOLT_SPELL
    dw Sfx_056	; #120 - SFX_TINKLING
		include "001.asm"
		include "002.asm"
		include "003.asm"
		include "004.asm"
		include "005.asm"
		include "006.asm"
		include "007.asm"
		include "008.asm"
		include "009.asm"
		include "010.asm"
		include "011.asm"
		include "012.asm"
		include "013.asm"
		include "014.asm"
		include "015.asm"
		include "016.asm"
		include "017.asm"
		include "018.asm"
		include "019.asm"
		include "020.asm"
		include "021.asm"
		include "022.asm"
		include "023.asm"
		include "024.asm"
		include "025.asm"
		include "026.asm"
		include "027.asm"
		include "028.asm"
		include "029.asm"
		include "030.asm"
		include "031.asm"
		include "032.asm"
		include "033.asm"
		include "034.asm"
		include "035.asm"
		include "036.asm"
		include "037.asm"
		include "038.asm"
		include "039.asm"
		include "040.asm"
		include "041.asm"
		include "042.asm"
		include "043.asm"
		include "044.asm"
		include "045.asm"
		include "046.asm"
		include "047.asm"
		include "048.asm"
		include "049.asm"
		include "050.asm"
		include "051.asm"
		include "052.asm"
		include "053.asm"
		include "054.asm"
		include "055.asm"
		include "056.asm"
