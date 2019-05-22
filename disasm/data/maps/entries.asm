
; ASM FILE data\maps\entries.asm :
; 0x94B8A..0xC7ECC : Map entries
pt_MapData:     dc.l Map00
                dc.l Map01
                dc.l Map02
                dc.l Map03
                dc.l Map04
                dc.l Map05
                dc.l Map06
                dc.l Map07
                dc.l Map08
                dc.l Map09
                dc.l Map10
                dc.l Map11
                dc.l Map12
                dc.l Map13
                dc.l Map14
                dc.l Map15
                dc.l Map16
                dc.l Map17
                dc.l Map18
                dc.l Map19
                dc.l Map20
                dc.l Map21
                dc.l Map22
                dc.l Map23
                dc.l Map24
                dc.l Map25
                dc.l Map26
                dc.l Map27
                dc.l Map28
                dc.l Map29
                dc.l Map30
                dc.l Map31
                dc.l Map32
                dc.l Map33
                dc.l Map34
                dc.l Map35
                dc.l Map36
                dc.l Map37
                dc.l Map38
                dc.l Map39
                dc.l Map40
                dc.l Map41
                dc.l Map42
                dc.l Map43
                dc.l Map44
                dc.l Map45
                dc.l Map46
                dc.l Map47
                dc.l Map48
                dc.l Map49
                dc.l Map50
                dc.l Map51
                dc.l Map52
                dc.l Map53
                dc.l Map54
                dc.l Map55
                dc.l Map56
                dc.l Map57
                dc.l Map58
                dc.l Map59
                dc.l Map60
                dc.l Map61
                dc.l Map62
                dc.l Map63
                dc.l Map64
                dc.l Map65
                dc.l Map66
                dc.l Map67
                dc.l Map68
                dc.l Map69
                dc.l Map70
                dc.l Map71
                dc.l Map72
                dc.l Map73
                dc.l Map74
                dc.l Map75
                dc.l Map76
                dc.l Map77
                dc.l Map78
Map00:          include "data\maps\entries\map00\00-tilesets.asm"    ; 
                dc.l Map00s0_Blocks
                dc.l Map00s1_Layout
                dc.l Map00s2_Areas
                dc.l Map00s3_FlagEvents 
                dc.l Map00s4_StepEvents
                dc.l Map00s5_RoofEvents
                dc.l Map00s6_WarpEvents
                dc.l Map00s7_ChestItems
                dc.l Map00s8_OtherItems
                dc.l Map00s9_Animations
Map00s2_Areas:  include "data\maps\entries\map00\2-areas.asm"    ; 
Map00s3_FlagEvents:include "data\maps\entries\map00\3-flag-events.asm"    ; 
Map00s4_StepEvents:include "data\maps\entries\map00\4-step-events.asm"    ; 
Map00s5_RoofEvents:include "data\maps\entries\map00\5-roof-events.asm"    ; 
Map00s6_WarpEvents:include "data\maps\entries\map00\6-warp-events.asm"    ; 
Map00s7_ChestItems:include "data\maps\entries\map00\7-chest-items.asm"    ; 
Map00s8_OtherItems:include "data\maps\entries\map00\8-other-items.asm"    ; 
Map00s0_Blocks: incbin "data/maps/entries/map00/0-blocks.bin"
Map00s1_Layout: incbin "data/maps/entries/map00/1-layout.bin"
Map00s9_Animations:include "data\maps\entries\map00\9-animations.asm"    ; 
Map01:          include "data\maps\entries\map01\00-tilesets.asm"    ; 
                dc.l Map01s0_Blocks
                dc.l Map01s1_Layout
                dc.l Map01s2_Areas
                dc.l Map01s3_FlagEvents 
                dc.l Map01s4_StepEvents
                dc.l Map01s5_RoofEvents
                dc.l Map01s6_WarpEvents
                dc.l Map01s7_ChestItems 
                dc.l Map01s8_OtherItems
                dc.l Map01s9_Animations
Map01s2_Areas:  include "data\maps\entries\map01\2-areas.asm"    ; 
Map01s3_FlagEvents:include "data\maps\entries\map01\3-flag-events.asm"    ; 
Map01s4_StepEvents:include "data\maps\entries\map01\4-step-events.asm"    ; 
Map01s5_RoofEvents:include "data\maps\entries\map01\5-roof-events.asm"    ; 
Map01s6_WarpEvents:include "data\maps\entries\map01\6-warp-events.asm"    ; 
Map01s7_ChestItems:include "data\maps\entries\map01\7-chest-items.asm"    ; 
Map01s8_OtherItems:include "data\maps\entries\map01\8-other-items.asm"    ; 
Map01s0_Blocks: incbin "data/maps/entries/map01/0-blocks.bin"
Map01s1_Layout: incbin "data/maps/entries/map01/1-layout.bin"
Map01s9_Animations:include "data\maps\entries\map01\9-animations.asm"    ; 
Map02:          include "data\maps\entries\map02\00-tilesets.asm"    ; 
                dc.l Map02s0_Blocks
                dc.l Map02s1_Layout
                dc.l Map02s2_Areas
                dc.l Map02s3_FlagEvents 
                dc.l Map02s4_StepEvents
                dc.l Map02s5_RoofEvents
                dc.l Map02s6_WarpEvents
                dc.l Map02s7_ChestItems
                dc.l Map02s8_OtherItems
                dc.l $FFFFFFFF
Map02s2_Areas:  include "data\maps\entries\map02\2-areas.asm"    ; 
Map02s3_FlagEvents:include "data\maps\entries\map02\3-flag-events.asm"    ; 
Map02s4_StepEvents:include "data\maps\entries\map02\4-step-events.asm"    ; 
Map02s5_RoofEvents:include "data\maps\entries\map02\5-roof-events.asm"    ; 
Map02s6_WarpEvents:include "data\maps\entries\map02\6-warp-events.asm"    ; 
Map02s7_ChestItems:include "data\maps\entries\map02\7-chest-items.asm"    ; 
Map02s8_OtherItems:include "data\maps\entries\map02\8-other-items.asm"    ; 
Map02s0_Blocks: incbin "data/maps/entries/map02/0-blocks.bin"
Map02s1_Layout: incbin "data/maps/entries/map02/1-layout.bin"
Map03:          include "data\maps\entries\map03\00-tilesets.asm"    ; 
                dc.l Map03s0_Blocks
                dc.l Map03s1_Layout
                dc.l Map03s2_Areas
                dc.l Map03s3_FlagEvents 
                dc.l Map03s4_StepEvents
                dc.l Map03s5_RoofEvents
                dc.l Map03s6_WarpEvents
                dc.l Map03s7_ChestItems
                dc.l Map03s8_OtherItems
                dc.l Map03s9_Animations
Map03s2_Areas:  include "data\maps\entries\map03\2-areas.asm"    ; 
Map03s3_FlagEvents:include "data\maps\entries\map03\3-flag-events.asm"    ; 
Map03s4_StepEvents:include "data\maps\entries\map03\4-step-events.asm"    ; 
Map03s5_RoofEvents:include "data\maps\entries\map03\5-roof-events.asm"    ; 
Map03s6_WarpEvents:include "data\maps\entries\map03\6-warp-events.asm"    ; 
Map03s7_ChestItems:include "data\maps\entries\map03\7-chest-items.asm"    ; 
Map03s8_OtherItems:include "data\maps\entries\map03\8-other-items.asm"    ; 
Map03s0_Blocks: incbin "data/maps/entries/map03/0-blocks.bin"
Map03s1_Layout: incbin "data/maps/entries/map03/1-layout.bin"
Map03s9_Animations:include "data\maps\entries\map03\9-animations.asm"    ; 
Map04:          include "data\maps\entries\map04\00-tilesets.asm"    ; 
                dc.l Map04s0_Blocks
                dc.l Map04s1_Layout
                dc.l Map04s2_Areas
                dc.l Map04s3_FlagEvents 
                dc.l Map04s4_StepEvents
                dc.l Map04s5_RoofEvents
                dc.l Map04s6_WarpEvents
                dc.l Map04s7_ChestItems
                dc.l Map04s8_OtherItems
                dc.l Map03s9_Animations
Map04s2_Areas:  include "data\maps\entries\map04\2-areas.asm"    ; 
Map04s3_FlagEvents:include "data\maps\entries\map04\3-flag-events.asm"    ; 
Map04s4_StepEvents:include "data\maps\entries\map04\4-step-events.asm"    ; 
Map04s5_RoofEvents:include "data\maps\entries\map04\5-roof-events.asm"    ; 
Map04s6_WarpEvents:include "data\maps\entries\map04\6-warp-events.asm"    ; 
Map04s7_ChestItems:include "data\maps\entries\map04\7-chest-items.asm"    ; 
Map04s8_OtherItems:include "data\maps\entries\map04\8-other-items.asm"    ; 
Map04s0_Blocks: incbin "data/maps/entries/map04/0-blocks.bin"
Map04s1_Layout: incbin "data/maps/entries/map04/1-layout.bin"
Map05:          include "data\maps\entries\map05\00-tilesets.asm"    ; 
                dc.l Map05s0_Blocks
                dc.l Map05s1_Layout
                dc.l Map05s2_Areas
                dc.l Map05s3_FlagEvents 
                dc.l Map05s4_StepEvents
                dc.l Map05s5_RoofEvents
                dc.l Map05s6_WarpEvents
                dc.l Map05s7_ChestItems
                dc.l Map05s8_OtherItems
                dc.l $FFFFFFFF
Map05s2_Areas:  include "data\maps\entries\map05\2-areas.asm"    ; 
Map05s3_FlagEvents:include "data\maps\entries\map05\3-flag-events.asm"    ; 
Map05s4_StepEvents:include "data\maps\entries\map05\4-step-events.asm"    ; 
Map05s5_RoofEvents:include "data\maps\entries\map05\5-roof-events.asm"    ; 
Map05s6_WarpEvents:include "data\maps\entries\map05\6-warp-events.asm"    ; 
Map05s7_ChestItems:include "data\maps\entries\map05\7-chest-items.asm"    ; 
Map05s8_OtherItems:include "data\maps\entries\map05\8-other-items.asm"    ; 
Map05s0_Blocks: incbin "data/maps/entries/map05/0-blocks.bin"
Map05s1_Layout: incbin "data/maps/entries/map05/1-layout.bin"
Map06:          include "data\maps\entries\map06\00-tilesets.asm"    ; 
                dc.l Map06s0_Blocks
                dc.l Map06s1_Layout
                dc.l Map06s2_Areas
                dc.l Map06s3_FlagEvents 
                dc.l Map06s4_StepEvents
                dc.l Map06s5_RoofEvents
                dc.l Map06s6_WarpEvents
                dc.l Map06s7_ChestItems
                dc.l Map06s8_OtherItems
                dc.l Map06s9_Animations
Map06s2_Areas:  include "data\maps\entries\map06\2-areas.asm"    ; 
Map06s3_FlagEvents:include "data\maps\entries\map06\3-flag-events.asm"    ; 
Map06s4_StepEvents:include "data\maps\entries\map06\4-step-events.asm"    ; 
Map06s5_RoofEvents:include "data\maps\entries\map06\5-roof-events.asm"    ; 
Map06s6_WarpEvents:include "data\maps\entries\map06\6-warp-events.asm"    ; 
Map06s7_ChestItems:include "data\maps\entries\map06\7-chest-items.asm"    ; 
Map06s8_OtherItems:include "data\maps\entries\map06\8-other-items.asm"    ; 
Map06s0_Blocks: incbin "data/maps/entries/map06/0-blocks.bin"
Map06s1_Layout: incbin "data/maps/entries/map06/1-layout.bin"
Map06s9_Animations:include "data\maps\entries\map06\9-animations.asm"    ; 
Map07:          include "data\maps\entries\map07\00-tilesets.asm"    ; 
                dc.l Map07s0_Blocks
                dc.l Map07s1_Layout
                dc.l Map07s2_Areas
                dc.l Map07s3_FlagEvents
                dc.l Map07s4_StepEvents
                dc.l Map07s5_RoofEvents
                dc.l Map07s6_WarpEvents
                dc.l Map07s7_ChestItems
                dc.l Map07s8_OtherItems 
                dc.l Map06s9_Animations
Map07s2_Areas:  include "data\maps\entries\map07\2-areas.asm"    ; 
Map07s3_FlagEvents:include "data\maps\entries\map07\3-flag-events.asm"    ; 
Map07s4_StepEvents:include "data\maps\entries\map07\4-step-events.asm"    ; 
Map07s5_RoofEvents:include "data\maps\entries\map07\5-roof-events.asm"    ; 
Map07s6_WarpEvents:include "data\maps\entries\map07\6-warp-events.asm"    ; 
Map07s7_ChestItems:include "data\maps\entries\map07\7-chest-items.asm"    ; 
Map07s8_OtherItems:include "data\maps\entries\map07\8-other-items.asm"    ; 
Map07s0_Blocks: incbin "data/maps/entries/map07/0-blocks.bin"
Map07s1_Layout: incbin "data/maps/entries/map07/1-layout.bin"
Map08:          include "data\maps\entries\map08\00-tilesets.asm"    ; 
                dc.l Map08s0_Blocks
                dc.l Map08s1_Layout
                dc.l Map08s2_Areas
                dc.l Map08s3_FlagEvents 
                dc.l Map08s4_StepEvents
                dc.l Map08s5_RoofEvents
                dc.l Map08s6_WarpEvents
                dc.l Map08s7_ChestItems
                dc.l Map08s8_OtherItems
                dc.l $FFFFFFFF
Map08s2_Areas:  include "data\maps\entries\map08\2-areas.asm"    ; 
Map08s3_FlagEvents:include "data\maps\entries\map08\3-flag-events.asm"    ; 
Map08s4_StepEvents:include "data\maps\entries\map08\4-step-events.asm"    ; 
Map08s5_RoofEvents:include "data\maps\entries\map08\5-roof-events.asm"    ; 
Map08s6_WarpEvents:include "data\maps\entries\map08\6-warp-events.asm"    ; 
Map08s7_ChestItems:include "data\maps\entries\map08\7-chest-items.asm"    ; 
Map08s8_OtherItems:include "data\maps\entries\map08\8-other-items.asm"    ; 
Map08s0_Blocks: incbin "data/maps/entries/map08/0-blocks.bin"
Map08s1_Layout: incbin "data/maps/entries/map08/1-layout.bin"
Map09:          include "data\maps\entries\map09\00-tilesets.asm"    ; 
                dc.l Map09s0_Blocks
                dc.l Map09s1_Layout
                dc.l Map09s2_Areas
                dc.l Map09s3_FlagEvents
                dc.l Map09s4_StepEvents
                dc.l Map09s5_RoofEvents
                dc.l Map09s6_WarpEvents
                dc.l Map09s7_ChestItems 
                dc.l Map09s8_OtherItems
                dc.l Map09s9_Animations
Map09s2_Areas:  include "data\maps\entries\map09\2-areas.asm"    ; 
Map09s3_FlagEvents:include "data\maps\entries\map09\3-flag-events.asm"    ; 
Map09s4_StepEvents:include "data\maps\entries\map09\4-step-events.asm"    ; 
Map09s5_RoofEvents:include "data\maps\entries\map09\5-roof-events.asm"    ; 
Map09s6_WarpEvents:include "data\maps\entries\map09\6-warp-events.asm"    ; 
Map09s7_ChestItems:include "data\maps\entries\map09\7-chest-items.asm"    ; 
Map09s8_OtherItems:include "data\maps\entries\map09\8-other-items.asm"    ; 
Map09s0_Blocks: incbin "data/maps/entries/map09/0-blocks.bin"
Map09s1_Layout: incbin "data/maps/entries/map09/1-layout.bin"
Map10:          include "data\maps\entries\map10\00-tilesets.asm"    ; 
                dc.l Map10s0_Blocks
                dc.l Map10s1_Layout
                dc.l Map10s2_Areas
                dc.l Map10s3_FlagEvents
                dc.l Map10s4_StepEvents
                dc.l Map10s5_RoofEvents
                dc.l Map10s6_WarpEvents
                dc.l Map10s7_ChestItems
                dc.l Map10s8_OtherItems
                dc.l Map06s9_Animations
Map10s2_Areas:  include "data\maps\entries\map10\2-areas.asm"    ; 
Map10s3_FlagEvents:include "data\maps\entries\map10\3-flag-events.asm"    ; 
Map10s4_StepEvents:include "data\maps\entries\map10\4-step-events.asm"    ; 
Map10s5_RoofEvents:include "data\maps\entries\map10\5-roof-events.asm"    ; 
Map10s6_WarpEvents:include "data\maps\entries\map10\6-warp-events.asm"    ; 
Map10s7_ChestItems:include "data\maps\entries\map10\7-chest-items.asm"    ; 
Map10s8_OtherItems:include "data\maps\entries\map10\8-other-items.asm"    ; 
Map10s0_Blocks: incbin "data/maps/entries/map10/0-blocks.bin"
Map10s1_Layout: incbin "data/maps/entries/map10/1-layout.bin"
Map11:          include "data\maps\entries\map11\00-tilesets.asm"    ; 
                dc.l Map11s0_Blocks
                dc.l Map11s1_Layout
                dc.l Map11s2_Areas
                dc.l Map11s3_FlagEvents
                dc.l Map11s4_StepEvents
                dc.l Map11s5_RoofEvents
                dc.l Map11s6_WarpEvents
                dc.l Map11s7_ChestItems
                dc.l Map11s8_OtherItems
                dc.l $FFFFFFFF
Map11s2_Areas:  include "data\maps\entries\map11\2-areas.asm"    ; 
Map11s3_FlagEvents:include "data\maps\entries\map11\3-flag-events.asm"    ; 
Map11s4_StepEvents:include "data\maps\entries\map11\4-step-events.asm"    ; 
Map11s5_RoofEvents:include "data\maps\entries\map11\5-roof-events.asm"    ; 
Map11s6_WarpEvents:include "data\maps\entries\map11\6-warp-events.asm"    ; 
Map11s7_ChestItems:include "data\maps\entries\map11\7-chest-items.asm"    ; 
Map11s8_OtherItems:include "data\maps\entries\map11\8-other-items.asm"    ; 
Map11s0_Blocks: incbin "data/maps/entries/map11/0-blocks.bin"
Map11s1_Layout: incbin "data/maps/entries/map11/1-layout.bin"
Map12:          include "data\maps\entries\map12\00-tilesets.asm"    ; 
                dc.l Map12s0_Blocks
                dc.l Map12s1_Layout
                dc.l Map12s2_Areas
                dc.l Map12s3_FlagEvents
                dc.l Map12s4_StepEvents
                dc.l Map12s5_RoofEvents
                dc.l Map12s6_WarpEvents
                dc.l Map12s7_ChestItems
                dc.l Map12s8_OtherItems
                dc.l $FFFFFFFF
Map12s2_Areas:  include "data\maps\entries\map12\2-areas.asm"    ; 
Map12s3_FlagEvents:include "data\maps\entries\map12\3-flag-events.asm"    ; 
Map12s4_StepEvents:include "data\maps\entries\map12\4-step-events.asm"    ; 
Map12s5_RoofEvents:include "data\maps\entries\map12\5-roof-events.asm"    ; 
Map12s6_WarpEvents:include "data\maps\entries\map12\6-warp-events.asm"    ; 
Map12s7_ChestItems:include "data\maps\entries\map12\7-chest-items.asm"    ; 
Map12s8_OtherItems:include "data\maps\entries\map12\8-other-items.asm"    ; 
Map12s0_Blocks: incbin "data/maps/entries/map12/0-blocks.bin"
Map12s1_Layout: incbin "data/maps/entries/map12/1-layout.bin"
Map13:          include "data\maps\entries\map13\00-tilesets.asm"    ; 
                dc.l Map13s0_Blocks
                dc.l Map13s1_Layout
                dc.l Map13s2_Areas
                dc.l Map13s3_FlagEvents
                dc.l Map13s4_StepEvents
                dc.l Map13s5_RoofEvents
                dc.l Map13s6_WarpEvents
                dc.l Map13s7_ChestItems
                dc.l Map13s8_OtherItems
                dc.l $FFFFFFFF
Map13s2_Areas:  include "data\maps\entries\map13\2-areas.asm"    ; 
Map13s3_FlagEvents:include "data\maps\entries\map13\3-flag-events.asm"    ; 
Map13s4_StepEvents:include "data\maps\entries\map13\4-step-events.asm"    ; 
Map13s5_RoofEvents:include "data\maps\entries\map13\5-roof-events.asm"    ; 
Map13s6_WarpEvents:include "data\maps\entries\map13\6-warp-events.asm"    ; 
Map13s7_ChestItems:include "data\maps\entries\map13\7-chest-items.asm"    ; 
Map13s8_OtherItems:include "data\maps\entries\map13\8-other-items.asm"    ; 
Map13s0_Blocks: incbin "data/maps/entries/map13/0-blocks.bin"
Map13s1_Layout: incbin "data/maps/entries/map13/1-layout.bin"
Map14:          include "data\maps\entries\map14\00-tilesets.asm"    ; 
                dc.l Map14s0_Blocks
                dc.l Map14s1_Layout
                dc.l Map14s2_Areas
                dc.l Map14s3_FlagEvents
                dc.l Map14s4_StepEvents
                dc.l Map14s5_RoofEvents
                dc.l Map14s6_WarpEvents
                dc.l Map14s7_ChestItems
                dc.l Map14s8_OtherItems
                dc.l Map14s9_Animations
Map14s2_Areas:  include "data\maps\entries\map14\2-areas.asm"    ; 
Map14s3_FlagEvents:include "data\maps\entries\map14\3-flag-events.asm"    ; 
Map14s4_StepEvents:include "data\maps\entries\map14\4-step-events.asm"    ; 
Map14s5_RoofEvents:include "data\maps\entries\map14\5-roof-events.asm"    ; 
Map14s6_WarpEvents:include "data\maps\entries\map14\6-warp-events.asm"    ; 
Map14s7_ChestItems:include "data\maps\entries\map14\7-chest-items.asm"    ; 
Map14s8_OtherItems:include "data\maps\entries\map14\8-other-items.asm"    ; 
Map14s0_Blocks: incbin "data/maps/entries/map14/0-blocks.bin"
Map14s1_Layout: incbin "data/maps/entries/map14/1-layout.bin"
Map14s9_Animations:include "data\maps\entries\map14\9-animations.asm"    ; 
Map15:          include "data\maps\entries\map15\00-tilesets.asm"    ; 
                dc.l Map15s0_Blocks
                dc.l Map15s1_Layout
                dc.l Map15s2_Areas
                dc.l Map15s3_FlagEvents
                dc.l Map15s4_StepEvents
                dc.l Map15s5_RoofEvents
                dc.l Map15s6_WarpEvents
                dc.l Map15s7_ChestItems
                dc.l Map15s8_OtherItems
                dc.l Map15s9_Animations
Map15s2_Areas:  include "data\maps\entries\map15\2-areas.asm"    ; 
Map15s3_FlagEvents:include "data\maps\entries\map15\3-flag-events.asm"    ; 
Map15s4_StepEvents:include "data\maps\entries\map15\4-step-events.asm"    ; 
Map15s5_RoofEvents:include "data\maps\entries\map15\5-roof-events.asm"    ; 
Map15s6_WarpEvents:include "data\maps\entries\map15\6-warp-events.asm"    ; 
Map15s7_ChestItems:include "data\maps\entries\map15\7-chest-items.asm"    ; 
Map15s8_OtherItems:include "data\maps\entries\map15\8-other-items.asm"    ; 
Map15s0_Blocks: incbin "data/maps/entries/map15/0-blocks.bin"
Map15s1_Layout: incbin "data/maps/entries/map15/1-layout.bin"
Map15s9_Animations:include "data\maps\entries\map15\9-animations.asm"    ; 
Map16:          include "data\maps\entries\map16\00-tilesets.asm"    ; 
                dc.l Map16s0_Blocks
                dc.l Map16s1_Layout
                dc.l Map16s2_Areas
                dc.l Map16s3_FlagEvents 
                dc.l Map16s4_StepEvents
                dc.l Map16s5_RoofEvents
                dc.l Map16s6_WarpEvents
                dc.l Map16s7_ChestItems
                dc.l Map16s8_OtherItems
                dc.l Map09s9_Animations
Map16s2_Areas:  include "data\maps\entries\map16\2-areas.asm"    ; 
Map16s3_FlagEvents:include "data\maps\entries\map16\3-flag-events.asm"    ; 
Map16s4_StepEvents:include "data\maps\entries\map16\4-step-events.asm"    ; 
Map16s5_RoofEvents:include "data\maps\entries\map16\5-roof-events.asm"    ; 
Map16s6_WarpEvents:include "data\maps\entries\map16\6-warp-events.asm"    ; 
Map16s7_ChestItems:include "data\maps\entries\map16\7-chest-items.asm"    ; 
Map16s8_OtherItems:include "data\maps\entries\map16\8-other-items.asm"    ; 
Map16s0_Blocks: incbin "data/maps/entries/map16/0-blocks.bin"
Map16s1_Layout: incbin "data/maps/entries/map16/1-layout.bin"
Map16s9_Animations:include "data\maps\entries\map16\9-animations.asm"    ; 
Map17:          include "data\maps\entries\map17\00-tilesets.asm"    ; 
                dc.l Map17s0_Blocks
                dc.l Map17s1_Layout
                dc.l Map17s2_Areas
                dc.l Map17s3_FlagEvents 
                dc.l Map17s4_StepEvents
                dc.l Map17s5_RoofEvents
                dc.l Map17s6_WarpEvents
                dc.l Map17s7_ChestItems
                dc.l Map17s8_OtherItems
                dc.l $FFFFFFFF
Map17s2_Areas:  include "data\maps\entries\map17\2-areas.asm"    ; 
Map17s3_FlagEvents:include "data\maps\entries\map17\3-flag-events.asm"    ; 
Map17s4_StepEvents:include "data\maps\entries\map17\4-step-events.asm"    ; 
Map17s5_RoofEvents:include "data\maps\entries\map17\5-roof-events.asm"    ; 
Map17s6_WarpEvents:include "data\maps\entries\map17\6-warp-events.asm"    ; 
Map17s7_ChestItems:include "data\maps\entries\map17\7-chest-items.asm"    ; 
Map17s8_OtherItems:include "data\maps\entries\map17\8-other-items.asm"    ; 
Map17s0_Blocks: incbin "data/maps/entries/map17/0-blocks.bin"
Map17s1_Layout: incbin "data/maps/entries/map17/1-layout.bin"
Map18:          include "data\maps\entries\map18\00-tilesets.asm"    ; 
                dc.l Map18s0_Blocks
                dc.l Map18s1_Layout
                dc.l Map18s2_Areas
                dc.l Map18s3_FlagEvents 
                dc.l Map18s4_StepEvents
                dc.l Map18s5_RoofEvents
                dc.l Map18s6_WarpEvents
                dc.l Map18s7_ChestItems
                dc.l Map18s8_OtherItems
                dc.l $FFFFFFFF
Map18s2_Areas:  include "data\maps\entries\map18\2-areas.asm"    ; 
Map18s3_FlagEvents:include "data\maps\entries\map18\3-flag-events.asm"    ; 
Map18s4_StepEvents:include "data\maps\entries\map18\4-step-events.asm"    ; 
Map18s5_RoofEvents:include "data\maps\entries\map18\5-roof-events.asm"    ; 
Map18s6_WarpEvents:include "data\maps\entries\map18\6-warp-events.asm"    ; 
Map18s7_ChestItems:include "data\maps\entries\map18\7-chest-items.asm"    ; 
Map18s8_OtherItems:include "data\maps\entries\map18\8-other-items.asm"    ; 
Map18s0_Blocks: incbin "data/maps/entries/map18/0-blocks.bin"
Map18s1_Layout: incbin "data/maps/entries/map18/1-layout.bin"
Map19:          include "data\maps\entries\map19\00-tilesets.asm"    ; 
                dc.l Map19s0_Blocks
                dc.l Map19s1_Layout
                dc.l Map19s2_Areas
                dc.l Map19s3_FlagEvents
                dc.l Map19s4_StepEvents
                dc.l Map19s5_RoofEvents
                dc.l Map19s6_WarpEvents
                dc.l Map19s7_ChestItems
                dc.l Map19s8_OtherItems
                dc.l $FFFFFFFF
Map19s2_Areas:  include "data\maps\entries\map19\2-areas.asm"    ; 
Map19s3_FlagEvents:include "data\maps\entries\map19\3-flag-events.asm"    ; 
Map19s4_StepEvents:include "data\maps\entries\map19\4-step-events.asm"    ; 
Map19s5_RoofEvents:include "data\maps\entries\map19\5-roof-events.asm"    ; 
Map19s6_WarpEvents:include "data\maps\entries\map19\6-warp-events.asm"    ; 
Map19s7_ChestItems:include "data\maps\entries\map19\7-chest-items.asm"    ; 
Map19s8_OtherItems:include "data\maps\entries\map19\8-other-items.asm"    ; 
Map19s0_Blocks: incbin "data/maps/entries/map19/0-blocks.bin"
Map19s1_Layout: incbin "data/maps/entries/map19/1-layout.bin"
Map20:          include "data\maps\entries\map20\00-tilesets.asm"    ; 
                dc.l Map20s0_Blocks
                dc.l Map20s1_Layout
                dc.l Map20s2_Areas
                dc.l Map20s3_FlagEvents
                dc.l Map20s4_StepEvents
                dc.l Map20s5_RoofEvents
                dc.l Map20s6_WarpEvents
                dc.l Map20s7_ChestItems
                dc.l Map20s8_OtherItems
                dc.l $FFFFFFFF
Map20s2_Areas:  include "data\maps\entries\map20\2-areas.asm"    ; 
Map20s3_FlagEvents:include "data\maps\entries\map20\3-flag-events.asm"    ; 
Map20s4_StepEvents:include "data\maps\entries\map20\4-step-events.asm"    ; 
Map20s5_RoofEvents:include "data\maps\entries\map20\5-roof-events.asm"    ; 
Map20s6_WarpEvents:include "data\maps\entries\map20\6-warp-events.asm"    ; 
Map20s7_ChestItems:include "data\maps\entries\map20\7-chest-items.asm"    ; 
Map20s8_OtherItems:include "data\maps\entries\map20\8-other-items.asm"    ; 
Map20s0_Blocks: incbin "data/maps/entries/map20/0-blocks.bin"
Map20s1_Layout: incbin "data/maps/entries/map20/1-layout.bin"
Map21:          include "data\maps\entries\map21\00-tilesets.asm"    ; 
                dc.l Map21s0_Blocks
                dc.l Map21s1_Layout
                dc.l Map21s2_Areas
                dc.l Map21s3_FlagEvents
                dc.l Map21s4_StepEvents
                dc.l Map21s5_RoofEvents
                dc.l Map21s6_WarpEvents
                dc.l Map21s7_ChestItems
                dc.l Map21s8_OtherItems
                dc.l $FFFFFFFF
Map21s2_Areas:  include "data\maps\entries\map21\2-areas.asm"    ; 
Map21s3_FlagEvents:include "data\maps\entries\map21\3-flag-events.asm"    ; 
Map21s4_StepEvents:include "data\maps\entries\map21\4-step-events.asm"    ; 
Map21s5_RoofEvents:include "data\maps\entries\map21\5-roof-events.asm"    ; 
Map21s6_WarpEvents:include "data\maps\entries\map21\6-warp-events.asm"    ; 
Map21s7_ChestItems:include "data\maps\entries\map21\7-chest-items.asm"    ; 
Map21s8_OtherItems:include "data\maps\entries\map21\8-other-items.asm"    ; 
Map21s0_Blocks: incbin "data/maps/entries/map21/0-blocks.bin"
Map21s1_Layout: incbin "data/maps/entries/map21/1-layout.bin"
Map22:          include "data\maps\entries\map22\00-tilesets.asm"    ; 
                dc.l Map22s0_Blocks
                dc.l Map22s1_Layout
                dc.l Map22s2_Areas
                dc.l Map22s3_FlagEvents 
                dc.l Map22s4_StepEvents
                dc.l Map22s5_RoofEvents
                dc.l Map22s6_WarpEvents
                dc.l Map22s7_ChestItems
                dc.l Map22s8_OtherItems
                dc.l $FFFFFFFF
Map22s2_Areas:  include "data\maps\entries\map22\2-areas.asm"    ; 
Map22s3_FlagEvents:include "data\maps\entries\map22\3-flag-events.asm"    ; 
Map22s4_StepEvents:include "data\maps\entries\map22\4-step-events.asm"    ; 
Map22s5_RoofEvents:include "data\maps\entries\map22\5-roof-events.asm"    ; 
Map22s6_WarpEvents:include "data\maps\entries\map22\6-warp-events.asm"    ; 
Map22s7_ChestItems:include "data\maps\entries\map22\7-chest-items.asm"    ; 
Map22s8_OtherItems:include "data\maps\entries\map22\8-other-items.asm"    ; 
Map22s0_Blocks: incbin "data/maps/entries/map22/0-blocks.bin"
Map22s1_Layout: incbin "data/maps/entries/map22/1-layout.bin"
Map23:          include "data\maps\entries\map23\00-tilesets.asm"    ; 
                dc.l Map23s0_Blocks
                dc.l Map23s1_Layout
                dc.l Map23s2_Areas
                dc.l Map23s3_FlagEvents
                dc.l Map23s4_StepEvents
                dc.l Map23s5_RoofEvents
                dc.l Map23s6_WarpEvents
                dc.l Map23s7_ChestItems
                dc.l Map23s8_OtherItems
                dc.l Map06s9_Animations
Map23s2_Areas:  include "data\maps\entries\map23\2-areas.asm"    ; 
Map23s3_FlagEvents:include "data\maps\entries\map23\3-flag-events.asm"    ; 
Map23s4_StepEvents:include "data\maps\entries\map23\4-step-events.asm"    ; 
Map23s5_RoofEvents:include "data\maps\entries\map23\5-roof-events.asm"    ; 
Map23s6_WarpEvents:include "data\maps\entries\map23\6-warp-events.asm"    ; 
Map23s7_ChestItems:include "data\maps\entries\map23\7-chest-items.asm"    ; 
Map23s8_OtherItems:include "data\maps\entries\map23\8-other-items.asm"    ; 
Map23s0_Blocks: incbin "data/maps/entries/map23/0-blocks.bin"
Map23s1_Layout: incbin "data/maps/entries/map23/1-layout.bin"
Map24:          include "data\maps\entries\map24\00-tilesets.asm"    ; 
                dc.l Map23s0_Blocks
                dc.l Map23s1_Layout
                dc.l Map24s2_Areas
                dc.l Map24s3_FlagEvents 
                dc.l Map24s4_StepEvents
                dc.l Map24s5_RoofEvents
                dc.l Map24s6_WarpEvents
                dc.l Map24s7_ChestItems
                dc.l Map24s8_OtherItems
                dc.l $FFFFFFFF
Map24s2_Areas:  include "data\maps\entries\map24\2-areas.asm"    ; 
Map24s3_FlagEvents:include "data\maps\entries\map24\3-flag-events.asm"    ; 
Map24s4_StepEvents:include "data\maps\entries\map24\4-step-events.asm"    ; 
Map24s5_RoofEvents:include "data\maps\entries\map24\5-roof-events.asm"    ; 
Map24s6_WarpEvents:include "data\maps\entries\map24\6-warp-events.asm"    ; 
Map24s7_ChestItems:include "data\maps\entries\map24\7-chest-items.asm"    ; 
Map24s8_OtherItems:include "data\maps\entries\map24\8-other-items.asm"    ; 
Map25:          include "data\maps\entries\map25\00-tilesets.asm"    ; 
                dc.l Map25s0_Blocks
                dc.l Map25s1_Layout
                dc.l Map25s2_Areas
                dc.l Map25s3_FlagEvents
                dc.l Map25s4_StepEvents
                dc.l Map25s5_RoofEvents
                dc.l Map25s6_WarpEvents
                dc.l Map25s7_ChestItems
                dc.l Map25s8_OtherItems
                dc.l Map06s9_Animations
Map25s2_Areas:  include "data\maps\entries\map25\2-areas.asm"    ; 
Map25s3_FlagEvents:include "data\maps\entries\map25\3-flag-events.asm"    ; 
Map25s4_StepEvents:include "data\maps\entries\map25\4-step-events.asm"    ; 
Map25s5_RoofEvents:include "data\maps\entries\map25\5-roof-events.asm"    ; 
Map25s6_WarpEvents:include "data\maps\entries\map25\6-warp-events.asm"    ; 
Map25s7_ChestItems:include "data\maps\entries\map25\7-chest-items.asm"    ; 
Map25s8_OtherItems:include "data\maps\entries\map25\8-other-items.asm"    ; 
Map25s0_Blocks: incbin "data/maps/entries/map25/0-blocks.bin"
Map25s1_Layout: incbin "data/maps/entries/map25/1-layout.bin"
Map26:          include "data\maps\entries\map26\00-tilesets.asm"    ; 
                dc.l Map26s0_Blocks
                dc.l Map26s1_Layout
                dc.l Map26s2_Areas
                dc.l Map26s3_FlagEvents
                dc.l Map26s4_StepEvents
                dc.l Map26s5_RoofEvents
                dc.l Map26s6_WarpEvents
                dc.l Map26s7_ChestItems
                dc.l Map26s8_OtherItems
                dc.l $FFFFFFFF
Map26s2_Areas:  include "data\maps\entries\map26\2-areas.asm"    ; 
Map26s3_FlagEvents:include "data\maps\entries\map26\3-flag-events.asm"    ; 
Map26s4_StepEvents:include "data\maps\entries\map26\4-step-events.asm"    ; 
Map26s5_RoofEvents:include "data\maps\entries\map26\5-roof-events.asm"    ; 
Map26s6_WarpEvents:include "data\maps\entries\map26\6-warp-events.asm"    ; 
Map26s7_ChestItems:include "data\maps\entries\map26\7-chest-items.asm"    ; 
Map26s8_OtherItems:include "data\maps\entries\map26\8-other-items.asm"    ; 
Map26s0_Blocks: incbin "data/maps/entries/map26/0-blocks.bin"
Map26s1_Layout: incbin "data/maps/entries/map26/1-layout.bin"
Map27:          include "data\maps\entries\map27\00-tilesets.asm"    ; 
                dc.l Map27s0_Blocks
                dc.l Map27s1_Layout
                dc.l Map27s2_Areas
                dc.l Map27s3_FlagEvents
                dc.l Map27s4_StepEvents
                dc.l Map27s5_RoofEvents
                dc.l Map27s6_WarpEvents
                dc.l Map27s7_ChestItems
                dc.l Map27s8_OtherItems
                dc.l $FFFFFFFF
Map27s2_Areas:  include "data\maps\entries\map27\2-areas.asm"    ; 
Map27s3_FlagEvents:include "data\maps\entries\map27\3-flag-events.asm"    ; 
Map27s4_StepEvents:include "data\maps\entries\map27\4-step-events.asm"    ; 
Map27s5_RoofEvents:include "data\maps\entries\map27\5-roof-events.asm"    ; 
Map27s6_WarpEvents:include "data\maps\entries\map27\6-warp-events.asm"    ; 
Map27s7_ChestItems:include "data\maps\entries\map27\7-chest-items.asm"    ; 
Map27s8_OtherItems:include "data\maps\entries\map27\8-other-items.asm"    ; 
Map27s0_Blocks: incbin "data/maps/entries/map27/0-blocks.bin"
Map27s1_Layout: incbin "data/maps/entries/map27/1-layout.bin"
Map28:          include "data\maps\entries\map28\00-tilesets.asm"    ; 
                dc.l Map28s0_Blocks
                dc.l Map28s1_Layout
                dc.l Map28s2_Areas
                dc.l Map28s3_FlagEvents 
                dc.l Map28s4_StepEvents
                dc.l Map28s5_RoofEvents
                dc.l Map28s6_WarpEvents
                dc.l Map28s7_ChestItems
                dc.l Map28s8_OtherItems
                dc.l Map28s9_Animations
Map28s2_Areas:  include "data\maps\entries\map28\2-areas.asm"    ; 
Map28s3_FlagEvents:include "data\maps\entries\map28\3-flag-events.asm"    ; 
Map28s4_StepEvents:include "data\maps\entries\map28\4-step-events.asm"    ; 
Map28s5_RoofEvents:include "data\maps\entries\map28\5-roof-events.asm"    ; 
Map28s6_WarpEvents:include "data\maps\entries\map28\6-warp-events.asm"    ; 
Map28s7_ChestItems:include "data\maps\entries\map28\7-chest-items.asm"    ; 
Map28s8_OtherItems:include "data\maps\entries\map28\8-other-items.asm"    ; 
Map28s0_Blocks: incbin "data/maps/entries/map28/0-blocks.bin"
Map28s1_Layout: incbin "data/maps/entries/map28/1-layout.bin"
Map28s9_Animations:include "data\maps\entries\map28\9-animations.asm"    ; 
Map29:          include "data\maps\entries\map29\00-tilesets.asm"    ; 
                dc.l Map29s0_Blocks
                dc.l Map29s1_Layout
                dc.l Map29s2_Areas
                dc.l Map29s3_FlagEvents
                dc.l Map29s4_StepEvents
                dc.l Map29s5_RoofEvents
                dc.l Map29s6_WarpEvents
                dc.l Map29s7_ChestItems
                dc.l Map29s8_OtherItems
                dc.l Map29s9_Animations
Map29s2_Areas:  include "data\maps\entries\map29\2-areas.asm"    ; 
Map29s3_FlagEvents:include "data\maps\entries\map29\3-flag-events.asm"    ; 
Map29s4_StepEvents:include "data\maps\entries\map29\4-step-events.asm"    ; 
Map29s5_RoofEvents:include "data\maps\entries\map29\5-roof-events.asm"    ; 
Map29s6_WarpEvents:include "data\maps\entries\map29\6-warp-events.asm"    ; 
Map29s7_ChestItems:include "data\maps\entries\map29\7-chest-items.asm"    ; 
Map29s8_OtherItems:include "data\maps\entries\map29\8-other-items.asm"    ; 
Map29s0_Blocks: incbin "data/maps/entries/map29/0-blocks.bin"
Map29s1_Layout: incbin "data/maps/entries/map29/1-layout.bin"
Map29s9_Animations:include "data\maps\entries\map29\9-animations.asm"    ; 
Map30:          include "data\maps\entries\map30\00-tilesets.asm"    ; 
                dc.l Map30s0_Blocks
                dc.l Map30s1_Layout
                dc.l Map30s2_Areas
                dc.l Map30s3_FlagEvents
                dc.l Map30s4_StepEvents
                dc.l Map30s5_RoofEvents
                dc.l Map30s6_WarpEvents
                dc.l Map30s7_ChestItems
                dc.l Map30s8_OtherItems
                dc.l $FFFFFFFF
Map30s2_Areas:  include "data\maps\entries\map30\2-areas.asm"    ; 
Map30s3_FlagEvents:include "data\maps\entries\map30\3-flag-events.asm"    ; 
Map30s4_StepEvents:include "data\maps\entries\map30\4-step-events.asm"    ; 
Map30s5_RoofEvents:include "data\maps\entries\map30\5-roof-events.asm"    ; 
Map30s6_WarpEvents:include "data\maps\entries\map30\6-warp-events.asm"    ; 
Map30s7_ChestItems:include "data\maps\entries\map30\7-chest-items.asm"    ; 
Map30s8_OtherItems:include "data\maps\entries\map30\8-other-items.asm"    ; 
Map30s0_Blocks: incbin "data/maps/entries/map30/0-blocks.bin"
Map30s1_Layout: incbin "data/maps/entries/map30/1-layout.bin"
Map31:          include "data\maps\entries\map31\00-tilesets.asm"    ; 
                dc.l Map31s0_Blocks
                dc.l Map31s1_Layout
                dc.l Map31s2_Areas
                dc.l Map31s3_FlagEvents 
                dc.l Map31s4_StepEvents
                dc.l Map31s5_RoofEvents
                dc.l Map31s6_WarpEvents
                dc.l Map31s7_ChestItems
                dc.l Map31s8_OtherItems
                dc.l $FFFFFFFF
Map31s2_Areas:  include "data\maps\entries\map31\2-areas.asm"    ; 
Map31s3_FlagEvents:include "data\maps\entries\map31\3-flag-events.asm"    ; 
Map31s4_StepEvents:include "data\maps\entries\map31\4-step-events.asm"    ; 
Map31s5_RoofEvents:include "data\maps\entries\map31\5-roof-events.asm"    ; 
Map31s6_WarpEvents:include "data\maps\entries\map31\6-warp-events.asm"    ; 
Map31s7_ChestItems:include "data\maps\entries\map31\7-chest-items.asm"    ; 
Map31s8_OtherItems:include "data\maps\entries\map31\8-other-items.asm"    ; 
Map31s0_Blocks: incbin "data/maps/entries/map31/0-blocks.bin"
Map31s1_Layout: incbin "data/maps/entries/map31/1-layout.bin"
Map32:          include "data\maps\entries\map32\00-tilesets.asm"    ; 
                dc.l Map32s0_Blocks
                dc.l Map32s1_Layout
                dc.l Map32s2_Areas
                dc.l Map32s3_FlagEvents
                dc.l Map32s4_StepEvents
                dc.l Map32s5_RoofEvents
                dc.l Map32s6_WarpEvents
                dc.l Map32s7_ChestItems
                dc.l Map32s8_OtherItems
                dc.l $FFFFFFFF
Map32s2_Areas:  include "data\maps\entries\map32\2-areas.asm"    ; 
Map32s3_FlagEvents:include "data\maps\entries\map32\3-flag-events.asm"    ; 
Map32s4_StepEvents:include "data\maps\entries\map32\4-step-events.asm"    ; 
Map32s5_RoofEvents:include "data\maps\entries\map32\5-roof-events.asm"    ; 
Map32s6_WarpEvents:include "data\maps\entries\map32\6-warp-events.asm"    ; 
Map32s7_ChestItems:include "data\maps\entries\map32\7-chest-items.asm"    ; 
Map32s8_OtherItems:include "data\maps\entries\map32\8-other-items.asm"    ; 
Map32s0_Blocks: incbin "data/maps/entries/map32/0-blocks.bin"
Map32s1_Layout: incbin "data/maps/entries/map32/1-layout.bin"
Map33:          include "data\maps\entries\map33\00-tilesets.asm"    ; 
                dc.l Map33s0_Blocks
                dc.l Map33s1_Layout
                dc.l Map33s2_Areas
                dc.l Map33s3_FlagEvents 
                dc.l Map33s4_StepEvents
                dc.l Map33s5_RoofEvents
                dc.l Map33s6_WarpEvents
                dc.l Map33s7_ChestItems 
                dc.l Map33s8_OtherItems
                dc.l Map33s9_Animations
Map33s2_Areas:  include "data\maps\entries\map33\2-areas.asm"    ; 
Map33s3_FlagEvents:include "data\maps\entries\map33\3-flag-events.asm"    ; 
Map33s4_StepEvents:include "data\maps\entries\map33\4-step-events.asm"    ; 
Map33s5_RoofEvents:include "data\maps\entries\map33\5-roof-events.asm"    ; 
Map33s6_WarpEvents:include "data\maps\entries\map33\6-warp-events.asm"    ; 
Map33s7_ChestItems:include "data\maps\entries\map33\7-chest-items.asm"    ; 
Map33s8_OtherItems:include "data\maps\entries\map33\8-other-items.asm"    ; 
Map33s0_Blocks: incbin "data/maps/entries/map33/0-blocks.bin"
Map33s1_Layout: incbin "data/maps/entries/map33/1-layout.bin"
Map33s9_Animations:include "data\maps\entries\map33\9-animations.asm"    ; 
Map34:          include "data\maps\entries\map34\00-tilesets.asm"    ; 
                dc.l Map34s0_Blocks
                dc.l Map34s1_Layout
                dc.l Map34s2_Areas
                dc.l Map34s3_FlagEvents
                dc.l Map34s4_StepEvents
                dc.l Map34s5_RoofEvents
                dc.l Map34s6_WarpEvents
                dc.l Map34s7_ChestItems
                dc.l Map34s8_OtherItems
                dc.l Map34s9_Animations
Map34s2_Areas:  include "data\maps\entries\map34\2-areas.asm"    ; 
Map34s3_FlagEvents:include "data\maps\entries\map34\3-flag-events.asm"    ; 
Map34s4_StepEvents:include "data\maps\entries\map34\4-step-events.asm"    ; 
Map34s5_RoofEvents:include "data\maps\entries\map34\5-roof-events.asm"    ; 
Map34s6_WarpEvents:include "data\maps\entries\map34\6-warp-events.asm"    ; 
Map34s7_ChestItems:include "data\maps\entries\map34\7-chest-items.asm"    ; 
Map34s8_OtherItems:include "data\maps\entries\map34\8-other-items.asm"    ; 
Map34s0_Blocks: incbin "data/maps/entries/map34/0-blocks.bin"
Map34s1_Layout: incbin "data/maps/entries/map34/1-layout.bin"
Map34s9_Animations:include "data\maps\entries\map34\9-animations.asm"    ; 
Map35:          include "data\maps\entries\map35\00-tilesets.asm"    ; 
                dc.l Map35s0_Blocks
                dc.l Map35s1_Layout
                dc.l Map35s2_Areas
                dc.l Map35s3_FlagEvents
                dc.l Map35s4_StepEvents
                dc.l Map35s5_RoofEvents
                dc.l Map35s6_WarpEvents
                dc.l Map35s7_ChestItems
                dc.l Map35s8_OtherItems
                dc.l $FFFFFFFF
Map35s2_Areas:  include "data\maps\entries\map35\2-areas.asm"    ; 
Map35s3_FlagEvents:include "data\maps\entries\map35\3-flag-events.asm"    ; 
Map35s4_StepEvents:include "data\maps\entries\map35\4-step-events.asm"    ; 
Map35s5_RoofEvents:include "data\maps\entries\map35\5-roof-events.asm"    ; 
Map35s6_WarpEvents:include "data\maps\entries\map35\6-warp-events.asm"    ; 
Map35s7_ChestItems:include "data\maps\entries\map35\7-chest-items.asm"    ; 
Map35s8_OtherItems:include "data\maps\entries\map35\8-other-items.asm"    ; 
Map35s0_Blocks: incbin "data/maps/entries/map35/0-blocks.bin"
Map35s1_Layout: incbin "data/maps/entries/map35/1-layout.bin"
Map36:          include "data\maps\entries\map36\00-tilesets.asm"    ; 
                dc.l Map36s0_Blocks
                dc.l Map36s1_Layout
                dc.l Map36s2_Areas
                dc.l Map36s3_FlagEvents
                dc.l Map36s4_StepEvents
                dc.l Map36s5_RoofEvents
                dc.l Map36s6_WarpEvents
                dc.l Map36s7_ChestItems
                dc.l Map36s8_OtherItems
                dc.l $FFFFFFFF
Map36s2_Areas:  include "data\maps\entries\map36\2-areas.asm"    ; 
Map36s3_FlagEvents:include "data\maps\entries\map36\3-flag-events.asm"    ; 
Map36s4_StepEvents:include "data\maps\entries\map36\4-step-events.asm"    ; 
Map36s5_RoofEvents:include "data\maps\entries\map36\5-roof-events.asm"    ; 
Map36s6_WarpEvents:include "data\maps\entries\map36\6-warp-events.asm"    ; 
Map36s7_ChestItems:include "data\maps\entries\map36\7-chest-items.asm"    ; 
Map36s8_OtherItems:include "data\maps\entries\map36\8-other-items.asm"    ; 
Map36s0_Blocks: incbin "data/maps/entries/map36/0-blocks.bin"
Map36s1_Layout: incbin "data/maps/entries/map36/1-layout.bin"
Map37:          include "data\maps\entries\map37\00-tilesets.asm"    ; 
                dc.l Map37s0_Blocks
                dc.l Map37s1_Layout
                dc.l Map37s2_Areas
                dc.l Map37s3_FlagEvents
                dc.l Map37s4_StepEvents
                dc.l Map37s5_RoofEvents
                dc.l Map37s6_WarpEvents
                dc.l Map37s7_ChestItems
                dc.l Map37s8_OtherItems
                dc.l $FFFFFFFF
Map37s2_Areas:  include "data\maps\entries\map37\2-areas.asm"    ; 
Map37s3_FlagEvents:include "data\maps\entries\map37\3-flag-events.asm"    ; 
Map37s4_StepEvents:include "data\maps\entries\map37\4-step-events.asm"    ; 
Map37s5_RoofEvents:include "data\maps\entries\map37\5-roof-events.asm"    ; 
Map37s6_WarpEvents:include "data\maps\entries\map37\6-warp-events.asm"    ; 
Map37s7_ChestItems:include "data\maps\entries\map37\7-chest-items.asm"    ; 
Map37s8_OtherItems:include "data\maps\entries\map37\8-other-items.asm"    ; 
Map37s0_Blocks: incbin "data/maps/entries/map37/0-blocks.bin"
Map37s1_Layout: incbin "data/maps/entries/map37/1-layout.bin"
Map38:          include "data\maps\entries\map38\00-tilesets.asm"    ; 
                dc.l Map38s0_Blocks
                dc.l Map38s1_Layout
                dc.l Map38s2_Areas
                dc.l Map38s3_FlagEvents
                dc.l Map38s4_StepEvents
                dc.l Map38s5_RoofEvents
                dc.l Map38s6_WarpEvents
                dc.l Map38s7_ChestItems 
                dc.l Map38s8_OtherItems
                dc.l Map15s9_Animations
Map38s2_Areas:  include "data\maps\entries\map38\2-areas.asm"    ; 
Map38s3_FlagEvents:include "data\maps\entries\map38\3-flag-events.asm"    ; 
Map38s4_StepEvents:include "data\maps\entries\map38\4-step-events.asm"    ; 
Map38s5_RoofEvents:include "data\maps\entries\map38\5-roof-events.asm"    ; 
Map38s6_WarpEvents:include "data\maps\entries\map38\6-warp-events.asm"    ; 
Map38s7_ChestItems:include "data\maps\entries\map38\7-chest-items.asm"    ; 
Map38s8_OtherItems:include "data\maps\entries\map38\8-other-items.asm"    ; 
Map38s0_Blocks: incbin "data/maps/entries/map38/0-blocks.bin"
Map38s1_Layout: incbin "data/maps/entries/map38/1-layout.bin"
Map39:          include "data\maps\entries\map39\00-tilesets.asm"    ; 
                dc.l Map39s0_Blocks
                dc.l Map39s1_Layout
                dc.l Map39s2_Areas
                dc.l Map39s3_FlagEvents
                dc.l Map39s4_StepEvents
                dc.l Map39s5_RoofEvents
                dc.l Map39s6_WarpEvents
                dc.l Map39s7_ChestItems
                dc.l Map39s8_OtherItems
                dc.l Map06s9_Animations
Map39s2_Areas:  include "data\maps\entries\map39\2-areas.asm"    ; 
Map39s3_FlagEvents:include "data\maps\entries\map39\3-flag-events.asm"    ; 
Map39s4_StepEvents:include "data\maps\entries\map39\4-step-events.asm"    ; 
Map39s5_RoofEvents:include "data\maps\entries\map39\5-roof-events.asm"    ; 
Map39s6_WarpEvents:include "data\maps\entries\map39\6-warp-events.asm"    ; 
Map39s7_ChestItems:include "data\maps\entries\map39\7-chest-items.asm"    ; 
Map39s8_OtherItems:include "data\maps\entries\map39\8-other-items.asm"    ; 
Map39s0_Blocks: incbin "data/maps/entries/map39/0-blocks.bin"
Map39s1_Layout: incbin "data/maps/entries/map39/1-layout.bin"
Map40:          include "data\maps\entries\map40\00-tilesets.asm"    ; 
                dc.l Map40s0_Blocks
                dc.l Map40s1_Layout
                dc.l Map40s2_Areas
                dc.l Map40s3_FlagEvents
                dc.l Map40s4_StepEvents
                dc.l Map40s5_RoofEvents
                dc.l Map40s6_WarpEvents
                dc.l Map40s7_ChestItems
                dc.l Map40s8_OtherItems
                dc.l $FFFFFFFF
Map40s2_Areas:  include "data\maps\entries\map40\2-areas.asm"    ; 
Map40s3_FlagEvents:include "data\maps\entries\map40\3-flag-events.asm"    ; 
Map40s4_StepEvents:include "data\maps\entries\map40\4-step-events.asm"    ; 
Map40s5_RoofEvents:include "data\maps\entries\map40\5-roof-events.asm"    ; 
Map40s6_WarpEvents:include "data\maps\entries\map40\6-warp-events.asm"    ; 
Map40s7_ChestItems:include "data\maps\entries\map40\7-chest-items.asm"    ; 
Map40s8_OtherItems:include "data\maps\entries\map40\8-other-items.asm"    ; 
Map40s0_Blocks: incbin "data/maps/entries/map40/0-blocks.bin"
Map40s1_Layout: incbin "data/maps/entries/map40/1-layout.bin"
Map41:          include "data\maps\entries\map41\00-tilesets.asm"    ; 
                dc.l Map41s0_Blocks
                dc.l Map41s1_Layout
                dc.l Map41s2_Areas
                dc.l Map41s3_FlagEvents
                dc.l Map41s4_StepEvents
                dc.l Map41s5_RoofEvents
                dc.l Map41s6_WarpEvents
                dc.l Map41s7_ChestItems
                dc.l Map41s8_OtherItems
                dc.l Map41s9_Animations
Map41s2_Areas:  include "data\maps\entries\map41\2-areas.asm"    ; 
Map41s3_FlagEvents:include "data\maps\entries\map41\3-flag-events.asm"    ; 
Map41s4_StepEvents:include "data\maps\entries\map41\4-step-events.asm"    ; 
Map41s5_RoofEvents:include "data\maps\entries\map41\5-roof-events.asm"    ; 
Map41s6_WarpEvents:include "data\maps\entries\map41\6-warp-events.asm"    ; 
Map41s7_ChestItems:include "data\maps\entries\map41\7-chest-items.asm"    ; 
Map41s8_OtherItems:include "data\maps\entries\map41\8-other-items.asm"    ; 
Map41s9_Animations:include "data\maps\entries\map41\9-animations.asm"    ; 
Map41s0_Blocks: incbin "data/maps/entries/map41/0-blocks.bin"
Map41s1_Layout: incbin "data/maps/entries/map41/1-layout.bin"
Map42:          include "data\maps\entries\map42\00-tilesets.asm"    ; 
                dc.l Map42s0_Blocks
                dc.l Map42s1_Layout
                dc.l Map42s2_Areas
                dc.l Map42s3_FlagEvents 
                dc.l Map42s4_StepEvents
                dc.l Map42s5_RoofEvents
                dc.l Map42s6_WarpEvents
                dc.l Map42s7_ChestItems
                dc.l Map42s8_OtherItems
                dc.l $FFFFFFFF
Map42s2_Areas:  include "data\maps\entries\map42\2-areas.asm"    ; 
Map42s3_FlagEvents:include "data\maps\entries\map42\3-flag-events.asm"    ; 
Map42s4_StepEvents:include "data\maps\entries\map42\4-step-events.asm"    ; 
Map42s5_RoofEvents:include "data\maps\entries\map42\5-roof-events.asm"    ; 
Map42s6_WarpEvents:include "data\maps\entries\map42\6-warp-events.asm"    ; 
Map42s7_ChestItems:include "data\maps\entries\map42\7-chest-items.asm"    ; 
Map42s8_OtherItems:include "data\maps\entries\map42\8-other-items.asm"    ; 
Map42s0_Blocks: incbin "data/maps/entries/map42/0-blocks.bin"
Map42s1_Layout: incbin "data/maps/entries/map42/1-layout.bin"
Map43:          include "data\maps\entries\map43\00-tilesets.asm"    ; 
                dc.l Map43s0_Blocks
                dc.l Map43s1_Layout
                dc.l Map43s2_Areas
                dc.l Map43s3_FlagEvents
                dc.l Map43s4_StepEvents
                dc.l Map43s5_RoofEvents
                dc.l Map43s6_WarpEvents
                dc.l Map43s7_ChestItems
                dc.l Map43s8_OtherItems
                dc.l $FFFFFFFF
Map43s2_Areas:  include "data\maps\entries\map43\2-areas.asm"    ; 
Map43s3_FlagEvents:include "data\maps\entries\map43\3-flag-events.asm"    ; 
Map43s4_StepEvents:include "data\maps\entries\map43\4-step-events.asm"    ; 
Map43s5_RoofEvents:include "data\maps\entries\map43\5-roof-events.asm"    ; 
Map43s6_WarpEvents:include "data\maps\entries\map43\6-warp-events.asm"    ; 
Map43s7_ChestItems:include "data\maps\entries\map43\7-chest-items.asm"    ; 
Map43s8_OtherItems:include "data\maps\entries\map43\8-other-items.asm"    ; 
Map43s0_Blocks: incbin "data/maps/entries/map43/0-blocks.bin"
Map43s1_Layout: incbin "data/maps/entries/map43/1-layout.bin"
Map44:          include "data\maps\entries\map44\00-tilesets.asm"    ; 
                dc.l Map44s0_Blocks
                dc.l Map44s1_Layout
                dc.l Map44s2_Areas
                dc.l Map44s3_FlagEvents
                dc.l Map44s4_StepEvents
                dc.l Map44s5_RoofEvents
                dc.l Map44s6_WarpEvents
                dc.l Map44s7_ChestItems
                dc.l Map44s8_OtherItems
                dc.l Map44s9_Animations
Map44s2_Areas:  include "data\maps\entries\map44\2-areas.asm"    ; 
Map44s3_FlagEvents:include "data\maps\entries\map44\3-flag-events.asm"    ; 
Map44s4_StepEvents:include "data\maps\entries\map44\4-step-events.asm"    ; 
Map44s5_RoofEvents:include "data\maps\entries\map44\5-roof-events.asm"    ; 
Map44s6_WarpEvents:include "data\maps\entries\map44\6-warp-events.asm"    ; 
Map44s7_ChestItems:include "data\maps\entries\map44\7-chest-items.asm"    ; 
Map44s8_OtherItems:include "data\maps\entries\map44\8-other-items.asm"    ; 
Map44s9_Animations:include "data\maps\entries\map44\9-animations.asm"    ; 
Map44s0_Blocks: incbin "data/maps/entries/map44/0-blocks.bin"
Map44s1_Layout: incbin "data/maps/entries/map44/1-layout.bin"
Map45:          include "data\maps\entries\map45\00-tilesets.asm"    ; 
                dc.l Map45s0_Blocks
                dc.l Map45s1_Layout
                dc.l Map45s2_Areas
                dc.l Map45s3_FlagEvents
                dc.l Map45s4_StepEvents
                dc.l Map45s5_RoofEvents
                dc.l Map45s6_WarpEvents
                dc.l Map45s7_ChestItems
                dc.l Map45s8_OtherItems
                dc.l Map45s9_Animations
Map45s2_Areas:  include "data\maps\entries\map45\2-areas.asm"    ; 
Map45s3_FlagEvents:include "data\maps\entries\map45\3-flag-events.asm"    ; 
Map45s4_StepEvents:include "data\maps\entries\map45\4-step-events.asm"    ; 
Map45s5_RoofEvents:include "data\maps\entries\map45\5-roof-events.asm"    ; 
Map45s6_WarpEvents:include "data\maps\entries\map45\6-warp-events.asm"    ; 
Map45s7_ChestItems:include "data\maps\entries\map45\7-chest-items.asm"    ; 
Map45s8_OtherItems:include "data\maps\entries\map45\8-other-items.asm"    ; 
Map45s9_Animations:include "data\maps\entries\map45\9-animations.asm"    ; 
Map45s0_Blocks: incbin "data/maps/entries/map45/0-blocks.bin"
Map45s1_Layout: incbin "data/maps/entries/map45/1-layout.bin"
Map46:          include "data\maps\entries\map46\00-tilesets.asm"    ; 
                dc.l Map07s0_Blocks
                dc.l Map07s1_Layout
                dc.l Map46s2_Areas
                dc.l Map46s3_FlagEvents 
                dc.l Map46s4_StepEvents
                dc.l Map46s5_RoofEvents
                dc.l Map46s6_WarpEvents
                dc.l Map46s7_ChestItems
                dc.l Map46s8_OtherItems 
                dc.l $FFFFFFFF
Map46s2_Areas:  include "data\maps\entries\map46\2-areas.asm"    ; 
Map46s3_FlagEvents:include "data\maps\entries\map46\3-flag-events.asm"    ; 
Map46s4_StepEvents:include "data\maps\entries\map46\4-step-events.asm"    ; 
Map46s5_RoofEvents:include "data\maps\entries\map46\5-roof-events.asm"    ; 
Map46s6_WarpEvents:include "data\maps\entries\map46\6-warp-events.asm"    ; 
Map46s7_ChestItems:include "data\maps\entries\map46\7-chest-items.asm"    ; 
Map46s8_OtherItems:include "data\maps\entries\map46\8-other-items.asm"    ; 
Map47:          include "data\maps\entries\map47\00-tilesets.asm"    ; 
                dc.l Map47s0_Blocks
                dc.l Map47s1_Layout
                dc.l Map47s2_Areas
                dc.l Map47s3_FlagEvents
                dc.l Map47s4_StepEvents
                dc.l Map47s5_RoofEvents
                dc.l Map47s6_WarpEvents
                dc.l Map47s7_ChestItems
                dc.l Map47s7_ChestItems
                dc.l Map47s9_Animations
Map47s2_Areas:  include "data\maps\entries\map47\2-areas.asm"    ; 
Map47s3_FlagEvents:include "data\maps\entries\map47\3-flag-events.asm"    ; 
Map47s4_StepEvents:include "data\maps\entries\map47\4-step-events.asm"    ; 
Map47s5_RoofEvents:include "data\maps\entries\map47\5-roof-events.asm"    ; 
Map47s6_WarpEvents:include "data\maps\entries\map47\6-warp-events.asm"    ; 
Map47s7_ChestItems:include "data\maps\entries\map47\7-chest-items.asm"    ; 
Map47s9_Animations:include "data\maps\entries\map47\9-animations.asm"    ; 
Map47s0_Blocks: incbin "data/maps/entries/map47/0-blocks.bin"
Map47s1_Layout: incbin "data/maps/entries/map47/1-layout.bin"
Map48:          include "data\maps\entries\map48\00-tilesets.asm"    ; 
                dc.l Map48s0_Blocks
                dc.l Map48s1_Layout
                dc.l Map48s2_Areas
                dc.l Map48s3_FlagEvents
                dc.l Map48s4_StepEvents
                dc.l Map48s5_RoofEvents
                dc.l Map48s6_WarpEvents
                dc.l Map48s7_ChestItems
                dc.l Map48s8_OtherItems
                dc.l Map48s9_Animations
Map48s2_Areas:  include "data\maps\entries\map48\2-areas.asm"    ; 
Map48s3_FlagEvents:include "data\maps\entries\map48\3-flag-events.asm"    ; 
Map48s4_StepEvents:include "data\maps\entries\map48\4-step-events.asm"    ; 
Map48s5_RoofEvents:include "data\maps\entries\map48\5-roof-events.asm"    ; 
Map48s6_WarpEvents:include "data\maps\entries\map48\6-warp-events.asm"    ; 
Map48s7_ChestItems:include "data\maps\entries\map48\7-chest-items.asm"    ; 
Map48s8_OtherItems:include "data\maps\entries\map48\8-other-items.asm"    ; 
Map48s9_Animations:include "data\maps\entries\map48\9-animations.asm"    ; 
Map48s0_Blocks: incbin "data/maps/entries/map48/0-blocks.bin"
Map48s1_Layout: incbin "data/maps/entries/map48/1-layout.bin"
Map49:          include "data\maps\entries\map49\00-tilesets.asm"    ; 
                dc.l Map49s0_Blocks
                dc.l Map49s1_Layout
                dc.l Map49s2_Areas
                dc.l Map49s3_FlagEvents
                dc.l Map49s4_StepEvents
                dc.l Map49s5_RoofEvents
                dc.l Map49s6_WarpEvents
                dc.l Map49s7_ChestItems
                dc.l Map49s8_OtherItems
                dc.l Map49s9_Animations
Map49s2_Areas:  include "data\maps\entries\map49\2-areas.asm"    ; 
Map49s3_FlagEvents:include "data\maps\entries\map49\3-flag-events.asm"    ; 
Map49s4_StepEvents:include "data\maps\entries\map49\4-step-events.asm"    ; 
Map49s5_RoofEvents:include "data\maps\entries\map49\5-roof-events.asm"    ; 
Map49s6_WarpEvents:include "data\maps\entries\map49\6-warp-events.asm"    ; 
Map49s7_ChestItems:include "data\maps\entries\map49\7-chest-items.asm"    ; 
Map49s8_OtherItems:include "data\maps\entries\map49\8-other-items.asm"    ; 
Map49s9_Animations:include "data\maps\entries\map49\9-animations.asm"    ; 
Map49s0_Blocks: incbin "data/maps/entries/map49/0-blocks.bin"
Map49s1_Layout: incbin "data/maps/entries/map49/1-layout.bin"
Map50:          include "data\maps\entries\map50\00-tilesets.asm"    ; 
                dc.l Map50s0_Blocks
                dc.l Map50s1_Layout
                dc.l Map50s2_Areas
                dc.l Map50s3_FlagEvents 
                dc.l Map50s4_StepEvents
                dc.l Map50s5_RoofEvents
                dc.l Map50s6_WarpEvents
                dc.l Map50s7_ChestItems 
                dc.l Map50s8_OtherItems
                dc.l Map50s9_Animations
Map50s2_Areas:  include "data\maps\entries\map50\2-areas.asm"    ; 
Map50s3_FlagEvents:include "data\maps\entries\map50\3-flag-events.asm"    ; 
Map50s4_StepEvents:include "data\maps\entries\map50\4-step-events.asm"    ; 
Map50s5_RoofEvents:include "data\maps\entries\map50\5-roof-events.asm"    ; 
Map50s6_WarpEvents:include "data\maps\entries\map50\6-warp-events.asm"    ; 
Map50s7_ChestItems:include "data\maps\entries\map50\7-chest-items.asm"    ; 
Map50s8_OtherItems:include "data\maps\entries\map50\8-other-items.asm"    ; 
Map50s9_Animations:include "data\maps\entries\map50\9-animations.asm"    ; 
Map50s0_Blocks: incbin "data/maps/entries/map50/0-blocks.bin"
Map50s1_Layout: incbin "data/maps/entries/map50/1-layout.bin"
Map51:          include "data\maps\entries\map51\00-tilesets.asm"    ; 
                dc.l Map51s0_Blocks
                dc.l Map51s1_Layout
                dc.l Map51s2_Areas
                dc.l Map51s3_FlagEvents
                dc.l Map51s4_StepEvents
                dc.l Map51s5_RoofEvents
                dc.l Map51s6_WarpEvents
                dc.l Map51s7_ChestItems
                dc.l Map51s8_OtherItems
                dc.l $FFFFFFFF
Map51s2_Areas:  include "data\maps\entries\map51\2-areas.asm"    ; 
Map51s3_FlagEvents:include "data\maps\entries\map51\3-flag-events.asm"    ; 
Map51s4_StepEvents:include "data\maps\entries\map51\4-step-events.asm"    ; 
Map51s5_RoofEvents:include "data\maps\entries\map51\5-roof-events.asm"    ; 
Map51s6_WarpEvents:include "data\maps\entries\map51\6-warp-events.asm"    ; 
Map51s7_ChestItems:include "data\maps\entries\map51\7-chest-items.asm"    ; 
Map51s8_OtherItems:include "data\maps\entries\map51\8-other-items.asm"    ; 
Map51s0_Blocks: incbin "data/maps/entries/map51/0-blocks.bin"
Map51s1_Layout: incbin "data/maps/entries/map51/1-layout.bin"
Map52:          include "data\maps\entries\map52\00-tilesets.asm"    ; 
                dc.l Map52s0_Blocks
                dc.l Map52s1_Layout
                dc.l Map52s2_Areas
                dc.l Map52s3_FlagEvents
                dc.l Map52s4_StepEvents
                dc.l Map52s5_RoofEvents
                dc.l Map52s6_WarpEvents
                dc.l Map52s7_ChestItems
                dc.l Map52s8_OtherItems
                dc.l $FFFFFFFF
Map52s2_Areas:  include "data\maps\entries\map52\2-areas.asm"    ; 
Map52s3_FlagEvents:include "data\maps\entries\map52\3-flag-events.asm"    ; 
Map52s4_StepEvents:include "data\maps\entries\map52\4-step-events.asm"    ; 
Map52s5_RoofEvents:include "data\maps\entries\map52\5-roof-events.asm"    ; 
Map52s6_WarpEvents:include "data\maps\entries\map52\6-warp-events.asm"    ; 
Map52s7_ChestItems:include "data\maps\entries\map52\7-chest-items.asm"    ; 
Map52s8_OtherItems:include "data\maps\entries\map52\8-other-items.asm"    ; 
Map52s0_Blocks: incbin "data/maps/entries/map52/0-blocks.bin"
Map52s1_Layout: incbin "data/maps/entries/map52/1-layout.bin"
Map53:          include "data\maps\entries\map53\00-tilesets.asm"    ; 
                dc.l Map53s0_Blocks
                dc.l Map53s1_Layout
                dc.l Map53s2_Areas
                dc.l Map53s3_FlagEvents
                dc.l Map53s4_StepEvents
                dc.l Map53s5_RoofEvents
                dc.l Map53s6_WarpEvents
                dc.l Map53s7_ChestItems
                dc.l Map53s8_OtherItems
                dc.l Map06s9_Animations
Map53s2_Areas:  include "data\maps\entries\map53\2-areas.asm"    ; 
Map53s3_FlagEvents:include "data\maps\entries\map53\3-flag-events.asm"    ; 
Map53s4_StepEvents:include "data\maps\entries\map53\4-step-events.asm"    ; 
Map53s5_RoofEvents:include "data\maps\entries\map53\5-roof-events.asm"    ; 
Map53s6_WarpEvents:include "data\maps\entries\map53\6-warp-events.asm"    ; 
Map53s7_ChestItems:include "data\maps\entries\map53\7-chest-items.asm"    ; 
Map53s8_OtherItems:include "data\maps\entries\map53\8-other-items.asm"    ; 
Map53s0_Blocks: incbin "data/maps/entries/map53/0-blocks.bin"
Map53s1_Layout: incbin "data/maps/entries/map53/1-layout.bin"
Map54:          include "data\maps\entries\map54\00-tilesets.asm"    ; 
                dc.l Map54s0_Blocks
                dc.l Map54s1_Layout
                dc.l Map54s2_Areas
                dc.l Map54s3_FlagEvents 
                dc.l Map54s4_StepEvents
                dc.l Map54s5_RoofEvents
                dc.l Map54s6_WarpEvents
                dc.l Map54s7_ChestItems
                dc.l Map54s8_OtherItems
                dc.l Map54s9_Animations
Map54s2_Areas:  include "data\maps\entries\map54\2-areas.asm"    ; 
Map54s3_FlagEvents:include "data\maps\entries\map54\3-flag-events.asm"    ; 
Map54s4_StepEvents:include "data\maps\entries\map54\4-step-events.asm"    ; 
Map54s5_RoofEvents:include "data\maps\entries\map54\5-roof-events.asm"    ; 
Map54s6_WarpEvents:include "data\maps\entries\map54\6-warp-events.asm"    ; 
Map54s7_ChestItems:include "data\maps\entries\map54\7-chest-items.asm"    ; 
Map54s8_OtherItems:include "data\maps\entries\map54\8-other-items.asm"    ; 
Map54s0_Blocks: incbin "data/maps/entries/map54/0-blocks.bin"
Map54s1_Layout: incbin "data/maps/entries/map54/1-layout.bin"
Map54s9_Animations:include "data\maps\entries\map54\9-animations.asm"    ; 
Map55:          include "data\maps\entries\map55\00-tilesets.asm"    ; 
                dc.l Map55s0_Blocks
                dc.l Map55s1_Layout
                dc.l Map55s2_Areas
                dc.l Map55s3_FlagEvents
                dc.l Map55s4_StepEvents
                dc.l Map55s5_RoofEvents
                dc.l Map55s6_WarpEvents
                dc.l Map55s7_ChestItems
                dc.l Map55s8_OtherItems
                dc.l $FFFFFFFF
Map55s2_Areas:  include "data\maps\entries\map55\2-areas.asm"    ; 
Map55s3_FlagEvents:include "data\maps\entries\map55\3-flag-events.asm"    ; 
Map55s4_StepEvents:include "data\maps\entries\map55\4-step-events.asm"    ; 
Map55s5_RoofEvents:include "data\maps\entries\map55\5-roof-events.asm"    ; 
Map55s6_WarpEvents:include "data\maps\entries\map55\6-warp-events.asm"    ; 
Map55s7_ChestItems:include "data\maps\entries\map55\7-chest-items.asm"    ; 
Map55s8_OtherItems:include "data\maps\entries\map55\8-other-items.asm"    ; 
Map55s0_Blocks: incbin "data/maps/entries/map55/0-blocks.bin"
Map55s1_Layout: incbin "data/maps/entries/map55/1-layout.bin"
Map56:          include "data\maps\entries\map56\00-tilesets.asm"    ; 
                dc.l Map56s0_Blocks
                dc.l Map56s1_Layout
                dc.l Map56s2_Areas
                dc.l Map56s3_FlagEvents
                dc.l Map56s4_StepEvents
                dc.l Map56s5_RoofEvents
                dc.l Map56s6_WarpEvents
                dc.l Map56s7_ChestItems
                dc.l Map56s8_OtherItems
                dc.l $FFFFFFFF
Map56s2_Areas:  include "data\maps\entries\map56\2-areas.asm"    ; 
Map56s3_FlagEvents:include "data\maps\entries\map56\3-flag-events.asm"    ; 
Map56s4_StepEvents:include "data\maps\entries\map56\4-step-events.asm"    ; 
Map56s5_RoofEvents:include "data\maps\entries\map56\5-roof-events.asm"    ; 
Map56s6_WarpEvents:include "data\maps\entries\map56\6-warp-events.asm"    ; 
Map56s7_ChestItems:include "data\maps\entries\map56\7-chest-items.asm"    ; 
Map56s8_OtherItems:include "data\maps\entries\map56\8-other-items.asm"    ; 
Map56s0_Blocks: incbin "data/maps/entries/map56/0-blocks.bin"
Map56s1_Layout: incbin "data/maps/entries/map56/1-layout.bin"
Map57:          include "data\maps\entries\map57\00-tilesets.asm"    ; 
                dc.l Map57s0_Blocks
                dc.l Map57s1_Layout
                dc.l Map57s2_Areas
                dc.l Map57s3_FlagEvents 
                dc.l Map57s4_StepEvents
                dc.l Map57s5_RoofEvents
                dc.l Map57s6_WarpEvents
                dc.l Map57s7_ChestItems
                dc.l Map57s8_OtherItems
                dc.l $FFFFFFFF
Map57s2_Areas:  include "data\maps\entries\map57\2-areas.asm"    ; 
Map57s3_FlagEvents:include "data\maps\entries\map57\3-flag-events.asm"    ; 
Map57s4_StepEvents:include "data\maps\entries\map57\4-step-events.asm"    ; 
Map57s5_RoofEvents:include "data\maps\entries\map57\5-roof-events.asm"    ; 
Map57s6_WarpEvents:include "data\maps\entries\map57\6-warp-events.asm"    ; 
Map57s7_ChestItems:include "data\maps\entries\map57\7-chest-items.asm"    ; 
Map57s8_OtherItems:include "data\maps\entries\map57\8-other-items.asm"    ; 
Map57s0_Blocks: incbin "data/maps/entries/map57/0-blocks.bin"
Map57s1_Layout: incbin "data/maps/entries/map57/1-layout.bin"
Map58:          include "data\maps\entries\map58\00-tilesets.asm"    ; 
                dc.l Map58s0_Blocks
                dc.l Map58s1_Layout
                dc.l Map58s2_Areas
                dc.l Map58s3_FlagEvents
                dc.l Map58s4_StepEvents
                dc.l Map58s5_RoofEvents
                dc.l Map58s6_WarpEvents
                dc.l Map58s7_ChestItems
                dc.l Map58s7_ChestItems
                dc.l $FFFFFFFF
Map58s2_Areas:  include "data\maps\entries\map58\2-areas.asm"    ; 
Map58s3_FlagEvents:include "data\maps\entries\map58\3-flag-events.asm"    ; 
Map58s4_StepEvents:include "data\maps\entries\map58\4-step-events.asm"    ; 
Map58s5_RoofEvents:include "data\maps\entries\map58\5-roof-events.asm"    ; 
Map58s6_WarpEvents:include "data\maps\entries\map58\6-warp-events.asm"    ; 
Map58s7_ChestItems:include "data\maps\entries\map58\7-chest-items.asm"    ; 
Map58s0_Blocks: incbin "data/maps/entries/map58/0-blocks.bin"
Map58s1_Layout: incbin "data/maps/entries/map58/1-layout.bin"
Map59:          include "data\maps\entries\map59\00-tilesets.asm"    ; 
                dc.l Map59s0_Blocks
                dc.l Map59s1_Layout
                dc.l Map59s2_Areas
                dc.l Map59s3_FlagEvents 
                dc.l Map59s4_StepEvents
                dc.l Map59s5_RoofEvents
                dc.l Map59s6_WarpEvents
                dc.l Map59s7_ChestItems
                dc.l Map59s8_OtherItems
                dc.l $FFFFFFFF
Map59s2_Areas:  include "data\maps\entries\map59\2-areas.asm"    ; 
Map59s3_FlagEvents:include "data\maps\entries\map59\3-flag-events.asm"    ; 
Map59s4_StepEvents:include "data\maps\entries\map59\4-step-events.asm"    ; 
Map59s5_RoofEvents:include "data\maps\entries\map59\5-roof-events.asm"    ; 
Map59s6_WarpEvents:include "data\maps\entries\map59\6-warp-events.asm"    ; 
Map59s7_ChestItems:include "data\maps\entries\map59\7-chest-items.asm"    ; 
Map59s8_OtherItems:include "data\maps\entries\map59\8-other-items.asm"    ; 
Map59s0_Blocks: incbin "data/maps/entries/map59/0-blocks.bin"
Map59s1_Layout: incbin "data/maps/entries/map59/1-layout.bin"
Map60:          include "data\maps\entries\map60\00-tilesets.asm"    ; 
                dc.l Map60s0_Blocks
                dc.l Map60s1_Layout
                dc.l Map60s2_Areas
                dc.l Map60s3_FlagEvents 
                dc.l Map60s4_StepEvents
                dc.l Map60s5_RoofEvents
                dc.l Map60s6_WarpEvents
                dc.l Map60s7_ChestItems
                dc.l Map60s8_OtherItems
                dc.l $FFFFFFFF
Map60s2_Areas:  include "data\maps\entries\map60\2-areas.asm"    ; 
Map60s3_FlagEvents:include "data\maps\entries\map60\3-flag-events.asm"    ; 
Map60s4_StepEvents:include "data\maps\entries\map60\4-step-events.asm"    ; 
Map60s5_RoofEvents:include "data\maps\entries\map60\5-roof-events.asm"    ; 
Map60s6_WarpEvents:include "data\maps\entries\map60\6-warp-events.asm"    ; 
Map60s7_ChestItems:include "data\maps\entries\map60\7-chest-items.asm"    ; 
Map60s8_OtherItems:include "data\maps\entries\map60\8-other-items.asm"    ; 
Map60s0_Blocks: incbin "data/maps/entries/map60/0-blocks.bin"
Map60s1_Layout: incbin "data/maps/entries/map60/1-layout.bin"
Map61:          include "data\maps\entries\map61\00-tilesets.asm"    ; 
                dc.l Map61s0_Blocks
                dc.l Map61s1_Layout
                dc.l Map61s2_Areas
                dc.l Map61s3_FlagEvents 
                dc.l Map61s4_StepEvents
                dc.l Map61s5_RoofEvents
                dc.l Map61s6_WarpEvents
                dc.l Map61s7_ChestItems
                dc.l Map61s8_OtherItems
                dc.l $FFFFFFFF
Map61s2_Areas:  include "data\maps\entries\map61\2-areas.asm"    ; 
Map61s3_FlagEvents:include "data\maps\entries\map61\3-flag-events.asm"    ; 
Map61s4_StepEvents:include "data\maps\entries\map61\4-step-events.asm"    ; 
Map61s5_RoofEvents:include "data\maps\entries\map61\5-roof-events.asm"    ; 
Map61s6_WarpEvents:include "data\maps\entries\map61\6-warp-events.asm"    ; 
Map61s7_ChestItems:include "data\maps\entries\map61\7-chest-items.asm"    ; 
Map61s8_OtherItems:include "data\maps\entries\map61\8-other-items.asm"    ; 
Map61s0_Blocks: incbin "data/maps/entries/map61/0-blocks.bin"
Map61s1_Layout: incbin "data/maps/entries/map61/1-layout.bin"
Map62:          include "data\maps\entries\map62\00-tilesets.asm"    ; 
                dc.l Map62s0_Blocks
                dc.l Map62s1_Layout
                dc.l Map62s2_Areas
                dc.l Map62s3_FlagEvents
                dc.l Map62s4_StepEvents
                dc.l Map62s5_RoofEvents
                dc.l Map62s6_WarpEvents
                dc.l Map62s7_ChestItems
                dc.l Map62s8_OtherItems
                dc.l $FFFFFFFF
Map62s2_Areas:  include "data\maps\entries\map62\2-areas.asm"    ; 
Map62s3_FlagEvents:include "data\maps\entries\map62\3-flag-events.asm"    ; 
Map62s4_StepEvents:include "data\maps\entries\map62\4-step-events.asm"    ; 
Map62s5_RoofEvents:include "data\maps\entries\map62\5-roof-events.asm"    ; 
Map62s6_WarpEvents:include "data\maps\entries\map62\6-warp-events.asm"    ; 
Map62s7_ChestItems:include "data\maps\entries\map62\7-chest-items.asm"    ; 
Map62s8_OtherItems:include "data\maps\entries\map62\8-other-items.asm"    ; 
Map62s0_Blocks: incbin "data/maps/entries/map62/0-blocks.bin"
Map62s1_Layout: incbin "data/maps/entries/map62/1-layout.bin"
Map63:          include "data\maps\entries\map63\00-tilesets.asm"    ; 
                dc.l Map63s0_Blocks
                dc.l Map63s1_Layout
                dc.l Map63s2_Areas
                dc.l Map63s3_FlagEvents
                dc.l Map63s4_StepEvents
                dc.l Map63s5_RoofEvents
                dc.l Map63s6_WarpEvents
                dc.l Map63s7_ChestItems
                dc.l Map63s8_OtherItems
                dc.l $FFFFFFFF
Map63s2_Areas:  include "data\maps\entries\map63\2-areas.asm"    ; 
Map63s3_FlagEvents:include "data\maps\entries\map63\3-flag-events.asm"    ; 
Map63s4_StepEvents:include "data\maps\entries\map63\4-step-events.asm"    ; 
Map63s5_RoofEvents:include "data\maps\entries\map63\5-roof-events.asm"    ; 
Map63s6_WarpEvents:include "data\maps\entries\map63\6-warp-events.asm"    ; 
Map63s7_ChestItems:include "data\maps\entries\map63\7-chest-items.asm"    ; 
Map63s8_OtherItems:include "data\maps\entries\map63\8-other-items.asm"    ; 
Map63s0_Blocks: incbin "data/maps/entries/map63/0-blocks.bin"
Map63s1_Layout: incbin "data/maps/entries/map63/1-layout.bin"
Map64:          include "data\maps\entries\map64\00-tilesets.asm"    ; 
                dc.l Map64s0_Blocks
                dc.l Map64s1_Layout
                dc.l Map64s2_Areas
                dc.l Map64s3_FlagEvents
                dc.l Map64s4_StepEvents
                dc.l Map64s5_RoofEvents
                dc.l Map64s6_WarpEvents
                dc.l Map64s7_ChestItems
                dc.l Map64s8_OtherItems
                dc.l $FFFFFFFF
Map64s2_Areas:  include "data\maps\entries\map64\2-areas.asm"    ; 
Map64s3_FlagEvents:include "data\maps\entries\map64\3-flag-events.asm"    ; 
Map64s4_StepEvents:include "data\maps\entries\map64\4-step-events.asm"    ; 
Map64s5_RoofEvents:include "data\maps\entries\map64\5-roof-events.asm"    ; 
Map64s6_WarpEvents:include "data\maps\entries\map64\6-warp-events.asm"    ; 
Map64s7_ChestItems:include "data\maps\entries\map64\7-chest-items.asm"    ; 
Map64s8_OtherItems:include "data\maps\entries\map64\8-other-items.asm"    ; 
Map64s0_Blocks: incbin "data/maps/entries/map64/0-blocks.bin"
Map64s1_Layout: incbin "data/maps/entries/map64/1-layout.bin"
Map65:          include "data\maps\entries\map65\00-tilesets.asm"    ; 
                dc.l Map65s0_Blocks
                dc.l Map65s1_Layout
                dc.l Map65s2_Areas
                dc.l Map65s3_FlagEvents
                dc.l Map65s4_StepEvents
                dc.l Map65s5_RoofEvents
                dc.l Map65s6_WarpEvents
                dc.l Map65s7_ChestItems
                dc.l Map65s8_OtherItems
                dc.l $FFFFFFFF
Map65s2_Areas:  include "data\maps\entries\map65\2-areas.asm"    ; 
Map65s3_FlagEvents:include "data\maps\entries\map65\3-flag-events.asm"    ; 
Map65s4_StepEvents:include "data\maps\entries\map65\4-step-events.asm"    ; 
Map65s5_RoofEvents:include "data\maps\entries\map65\5-roof-events.asm"    ; 
Map65s6_WarpEvents:include "data\maps\entries\map65\6-warp-events.asm"    ; 
Map65s7_ChestItems:include "data\maps\entries\map65\7-chest-items.asm"    ; 
Map65s8_OtherItems:include "data\maps\entries\map65\8-other-items.asm"    ; 
Map65s0_Blocks: incbin "data/maps/entries/map65/0-blocks.bin"
Map65s1_Layout: incbin "data/maps/entries/map65/1-layout.bin"
Map66:          include "data\maps\entries\map66\00-tilesets.asm"    ; 
                dc.l Map66s0_Blocks
                dc.l Map66s1_Layout
                dc.l Map66s2_Areas
                dc.l Map66s3_FlagEvents 
                dc.l Map66s4_StepEvents
                dc.l Map66s5_RoofEvents
                dc.l Map66s6_WarpEvents
                dc.l Map66s7_ChestItems
                dc.l Map66s8_OtherItems
                dc.l Map66s9_Animations
Map66s2_Areas:  include "data\maps\entries\map66\2-areas.asm"    ; 
Map66s3_FlagEvents:include "data\maps\entries\map66\3-flag-events.asm"    ; 
Map66s4_StepEvents:include "data\maps\entries\map66\4-step-events.asm"    ; 
Map66s5_RoofEvents:include "data\maps\entries\map66\5-roof-events.asm"    ; 
Map66s6_WarpEvents:include "data\maps\entries\map66\6-warp-events.asm"    ; 
Map66s7_ChestItems:include "data\maps\entries\map66\7-chest-items.asm"    ; 
Map66s8_OtherItems:include "data\maps\entries\map66\8-other-items.asm"    ; 
Map66s0_Blocks: incbin "data/maps/entries/map66/0-blocks.bin"
Map66s1_Layout: incbin "data/maps/entries/map66/1-layout.bin"
Map66s9_Animations:include "data\maps\entries\map66\9-animations.asm"    ; 
Map67:          include "data\maps\entries\map67\00-tilesets.asm"    ; 
                dc.l Map67s0_Blocks
                dc.l Map67s1_Layout
                dc.l Map67s2_Areas
                dc.l Map67s3_FlagEvents 
                dc.l Map67s4_StepEvents
                dc.l Map67s5_RoofEvents
                dc.l Map67s6_WarpEvents
                dc.l Map67s7_ChestItems
                dc.l Map67s8_OtherItems
                dc.l Map67s9_Animations
Map67s2_Areas:  include "data\maps\entries\map67\2-areas.asm"    ; 
Map67s3_FlagEvents:include "data\maps\entries\map67\3-flag-events.asm"    ; 
Map67s4_StepEvents:include "data\maps\entries\map67\4-step-events.asm"    ; 
Map67s5_RoofEvents:include "data\maps\entries\map67\5-roof-events.asm"    ; 
Map67s6_WarpEvents:include "data\maps\entries\map67\6-warp-events.asm"    ; 
Map67s7_ChestItems:include "data\maps\entries\map67\7-chest-items.asm"    ; 
Map67s8_OtherItems:include "data\maps\entries\map67\8-other-items.asm"    ; 
Map67s0_Blocks: incbin "data/maps/entries/map67/0-blocks.bin"
Map67s1_Layout: incbin "data/maps/entries/map67/1-layout.bin"
Map67s9_Animations:include "data\maps\entries\map67\9-animations.asm"    ; 
Map68:          include "data\maps\entries\map68\00-tilesets.asm"    ; 
                dc.l Map68s0_Blocks
                dc.l Map68s1_Layout
                dc.l Map68s2_Areas
                dc.l Map68s3_FlagEvents
                dc.l Map68s4_StepEvents
                dc.l Map68s5_RoofEvents
                dc.l Map68s6_WarpEvents
                dc.l Map68s7_ChestItems
                dc.l Map68s8_OtherItems
                dc.l Map68s9_Animations
Map68s2_Areas:  include "data\maps\entries\map68\2-areas.asm"    ; 
Map68s3_FlagEvents:include "data\maps\entries\map68\3-flag-events.asm"    ; 
Map68s4_StepEvents:include "data\maps\entries\map68\4-step-events.asm"    ; 
Map68s5_RoofEvents:include "data\maps\entries\map68\5-roof-events.asm"    ; 
Map68s6_WarpEvents:include "data\maps\entries\map68\6-warp-events.asm"    ; 
Map68s7_ChestItems:include "data\maps\entries\map68\7-chest-items.asm"    ; 
Map68s8_OtherItems:include "data\maps\entries\map68\8-other-items.asm"    ; 
Map68s0_Blocks: incbin "data/maps/entries/map68/0-blocks.bin"
Map68s1_Layout: incbin "data/maps/entries/map68/1-layout.bin"
Map68s9_Animations:include "data\maps\entries\map68\9-animations.asm"    ; 
Map69:          include "data\maps\entries\map69\00-tilesets.asm"    ; 
                dc.l Map69s0_Blocks
                dc.l Map69s1_Layout
                dc.l Map69s2_Areas
                dc.l Map69s3_FlagEvents 
                dc.l Map69s4_StepEvents
                dc.l Map69s5_RoofEvents
                dc.l Map69s6_WarpEvents
                dc.l Map69s7_ChestItems
                dc.l Map69s8_OtherItems
                dc.l Map69s9_Animations
Map69s2_Areas:  include "data\maps\entries\map69\2-areas.asm"    ; 
Map69s3_FlagEvents:include "data\maps\entries\map69\3-flag-events.asm"    ; 
Map69s4_StepEvents:include "data\maps\entries\map69\4-step-events.asm"    ; 
Map69s5_RoofEvents:include "data\maps\entries\map69\5-roof-events.asm"    ; 
Map69s6_WarpEvents:include "data\maps\entries\map69\6-warp-events.asm"    ; 
Map69s7_ChestItems:include "data\maps\entries\map69\7-chest-items.asm"    ; 
Map69s8_OtherItems:include "data\maps\entries\map69\8-other-items.asm"    ; 
Map69s0_Blocks: incbin "data/maps/entries/map69/0-blocks.bin"
Map69s1_Layout: incbin "data/maps/entries/map69/1-layout.bin"
Map69s9_Animations:include "data\maps\entries\map69\9-animations.asm"    ; 
Map70:          include "data\maps\entries\map70\00-tilesets.asm"    ; 
                dc.l Map70s0_Blocks
                dc.l Map70s1_Layout
                dc.l Map70s2_Areas
                dc.l Map70s3_FlagEvents
                dc.l Map70s4_StepEvents
                dc.l Map70s5_RoofEvents
                dc.l Map70s6_WarpEvents
                dc.l Map70s7_ChestItems
                dc.l Map70s8_OtherItems
                dc.l Map70s9_Animations
Map70s2_Areas:  include "data\maps\entries\map70\2-areas.asm"    ; 
Map70s3_FlagEvents:include "data\maps\entries\map70\3-flag-events.asm"    ; 
Map70s4_StepEvents:include "data\maps\entries\map70\4-step-events.asm"    ; 
Map70s5_RoofEvents:include "data\maps\entries\map70\5-roof-events.asm"    ; 
Map70s6_WarpEvents:include "data\maps\entries\map70\6-warp-events.asm"    ; 
Map70s7_ChestItems:include "data\maps\entries\map70\7-chest-items.asm"    ; 
Map70s8_OtherItems:include "data\maps\entries\map70\8-other-items.asm"    ; 
Map70s0_Blocks: incbin "data/maps/entries/map70/0-blocks.bin"
Map70s1_Layout: incbin "data/maps/entries/map70/1-layout.bin"
Map70s9_Animations:include "data\maps\entries\map70\9-animations.asm"    ; 
Map71:          include "data\maps\entries\map71\00-tilesets.asm"    ; 
                dc.l Map71s0_Blocks
                dc.l Map71s1_Layout
                dc.l Map71s2_Areas
                dc.l Map71s3_FlagEvents
                dc.l Map71s4_StepEvents
                dc.l Map71s5_RoofEvents
                dc.l Map71s6_WarpEvents
                dc.l Map71s7_ChestItems
                dc.l Map71s8_OtherItems
                dc.l Map71s9_Animations
Map71s2_Areas:  include "data\maps\entries\map71\2-areas.asm"    ; 
Map71s3_FlagEvents:include "data\maps\entries\map71\3-flag-events.asm"    ; 
Map71s4_StepEvents:include "data\maps\entries\map71\4-step-events.asm"    ; 
Map71s5_RoofEvents:include "data\maps\entries\map71\5-roof-events.asm"    ; 
Map71s6_WarpEvents:include "data\maps\entries\map71\6-warp-events.asm"    ; 
Map71s7_ChestItems:include "data\maps\entries\map71\7-chest-items.asm"    ; 
Map71s8_OtherItems:include "data\maps\entries\map71\8-other-items.asm"    ; 
Map71s0_Blocks: incbin "data/maps/entries/map71/0-blocks.bin"
Map71s1_Layout: incbin "data/maps/entries/map71/1-layout.bin"
Map71s9_Animations:include "data\maps\entries\map71\9-animations.asm"    ; 
Map72:          include "data\maps\entries\map72\00-tilesets.asm"    ; 
                dc.l Map72s0_Blocks
                dc.l Map72s1_Layout
                dc.l Map72s2_Areas
                dc.l Map72s3_FlagEvents 
                dc.l Map72s4_StepEvents
                dc.l Map72s5_RoofEvents
                dc.l Map72s6_WarpEvents
                dc.l Map72s7_ChestItems
                dc.l Map72s8_OtherItems
                dc.l Map72s9_Animations
Map72s2_Areas:  include "data\maps\entries\map72\2-areas.asm"    ; 
Map72s3_FlagEvents:include "data\maps\entries\map72\3-flag-events.asm"    ; 
Map72s4_StepEvents:include "data\maps\entries\map72\4-step-events.asm"    ; 
Map72s5_RoofEvents:include "data\maps\entries\map72\5-roof-events.asm"    ; 
Map72s6_WarpEvents:include "data\maps\entries\map72\6-warp-events.asm"    ; 
Map72s7_ChestItems:include "data\maps\entries\map72\7-chest-items.asm"    ; 
Map72s8_OtherItems:include "data\maps\entries\map72\8-other-items.asm"    ; 
Map72s0_Blocks: incbin "data/maps/entries/map72/0-blocks.bin"
Map72s1_Layout: incbin "data/maps/entries/map72/1-layout.bin"
Map72s9_Animations:include "data\maps\entries\map72\9-animations.asm"    ; 
Map73:          include "data\maps\entries\map73\00-tilesets.asm"    ; 
                dc.l Map73s0_Blocks
                dc.l Map73s1_Layout
                dc.l Map73s2_Areas
                dc.l Map73s3_FlagEvents
                dc.l Map73s4_StepEvents
                dc.l Map73s5_RoofEvents
                dc.l Map73s6_WarpEvents
                dc.l Map73s7_ChestItems
                dc.l Map73s8_OtherItems
                dc.l Map73s9_Animations
Map73s2_Areas:  include "data\maps\entries\map73\2-areas.asm"    ; 
Map73s3_FlagEvents:include "data\maps\entries\map73\3-flag-events.asm"    ; 
Map73s4_StepEvents:include "data\maps\entries\map73\4-step-events.asm"    ; 
Map73s5_RoofEvents:include "data\maps\entries\map73\5-roof-events.asm"    ; 
Map73s6_WarpEvents:include "data\maps\entries\map73\6-warp-events.asm"    ; 
Map73s7_ChestItems:include "data\maps\entries\map73\7-chest-items.asm"    ; 
Map73s8_OtherItems:include "data\maps\entries\map73\8-other-items.asm"    ; 
Map73s0_Blocks: incbin "data/maps/entries/map73/0-blocks.bin"
Map73s1_Layout: incbin "data/maps/entries/map73/1-layout.bin"
Map73s9_Animations:include "data\maps\entries\map73\9-animations.asm"    ; 
Map74:          include "data\maps\entries\map74\00-tilesets.asm"    ; 
                dc.l Map74s0_Blocks
                dc.l Map74s1_Layout
                dc.l Map74s2_Areas
                dc.l Map74s3_FlagEvents
                dc.l Map74s4_StepEvents
                dc.l Map74s5_RoofEvents
                dc.l Map74s6_WarpEvents
                dc.l Map74s7_ChestItems
                dc.l Map74s8_OtherItems
                dc.l Map74s9_Animations
Map74s2_Areas:  include "data\maps\entries\map74\2-areas.asm"    ; 
Map74s3_FlagEvents:include "data\maps\entries\map74\3-flag-events.asm"    ; 
Map74s4_StepEvents:include "data\maps\entries\map74\4-step-events.asm"    ; 
Map74s5_RoofEvents:include "data\maps\entries\map74\5-roof-events.asm"    ; 
Map74s6_WarpEvents:include "data\maps\entries\map74\6-warp-events.asm"    ; 
Map74s7_ChestItems:include "data\maps\entries\map74\7-chest-items.asm"    ; 
Map74s8_OtherItems:include "data\maps\entries\map74\8-other-items.asm"    ; 
Map74s0_Blocks: incbin "data/maps/entries/map74/0-blocks.bin"
Map74s1_Layout: incbin "data/maps/entries/map74/1-layout.bin"
Map74s9_Animations:include "data\maps\entries\map74\9-animations.asm"    ; 
Map75:          include "data\maps\entries\map75\00-tilesets.asm"    ; 
                dc.l Map75s0_Blocks
                dc.l Map75s1_Layout
                dc.l Map75s2_Areas
                dc.l Map75s3_FlagEvents 
                dc.l Map75s4_StepEvents
                dc.l Map75s5_RoofEvents
                dc.l Map75s6_WarpEvents
                dc.l Map75s7_ChestItems
                dc.l Map75s8_OtherItems
                dc.l Map75s9_Animations
Map75s2_Areas:  include "data\maps\entries\map75\2-areas.asm"    ; 
Map75s3_FlagEvents:include "data\maps\entries\map75\3-flag-events.asm"    ; 
Map75s4_StepEvents:include "data\maps\entries\map75\4-step-events.asm"    ; 
Map75s5_RoofEvents:include "data\maps\entries\map75\5-roof-events.asm"    ; 
Map75s6_WarpEvents:include "data\maps\entries\map75\6-warp-events.asm"    ; 
Map75s7_ChestItems:include "data\maps\entries\map75\7-chest-items.asm"    ; 
Map75s8_OtherItems:include "data\maps\entries\map75\8-other-items.asm"    ; 
Map75s0_Blocks: incbin "data/maps/entries/map75/0-blocks.bin"
Map75s1_Layout: incbin "data/maps/entries/map75/1-layout.bin"
Map75s9_Animations:include "data\maps\entries\map75\9-animations.asm"    ; 
Map76:          include "data\maps\entries\map76\00-tilesets.asm"    ; 
                dc.l Map76s0_Blocks
                dc.l Map76s1_Layout
                dc.l Map76s2_Areas
                dc.l Map76s3_FlagEvents
                dc.l Map76s4_StepEvents
                dc.l Map76s5_RoofEvents
                dc.l Map76s6_WarpEvents
                dc.l Map76s7_ChestItems
                dc.l Map76s8_OtherItems
                dc.l Map76s9_Animations
Map76s2_Areas:  include "data\maps\entries\map76\2-areas.asm"    ; 
Map76s3_FlagEvents:include "data\maps\entries\map76\3-flag-events.asm"    ; 
Map76s4_StepEvents:include "data\maps\entries\map76\4-step-events.asm"    ; 
Map76s5_RoofEvents:include "data\maps\entries\map76\5-roof-events.asm"    ; 
Map76s6_WarpEvents:include "data\maps\entries\map76\6-warp-events.asm"    ; 
Map76s7_ChestItems:include "data\maps\entries\map76\7-chest-items.asm"    ; 
Map76s8_OtherItems:include "data\maps\entries\map76\8-other-items.asm"    ; 
Map76s0_Blocks: incbin "data/maps/entries/map76/0-blocks.bin"
Map76s1_Layout: incbin "data/maps/entries/map76/1-layout.bin"
Map76s9_Animations:include "data\maps\entries\map76\9-animations.asm"    ; 
Map77:          include "data\maps\entries\map77\00-tilesets.asm"    ; 
                dc.l Map77s0_Blocks
                dc.l Map77s1_Layout
                dc.l Map77s2_Areas
                dc.l Map77s3_FlagEvents 
                dc.l Map77s4_StepEvents
                dc.l Map77s5_RoofEvents
                dc.l Map77s6_WarpEvents
                dc.l Map77s7_ChestItems
                dc.l Map77s8_OtherItems
                dc.l Map77s9_Animations
Map77s2_Areas:  include "data\maps\entries\map77\2-areas.asm"    ; 
Map77s3_FlagEvents:include "data\maps\entries\map77\3-flag-events.asm"    ; 
Map77s4_StepEvents:include "data\maps\entries\map77\4-step-events.asm"    ; 
Map77s5_RoofEvents:include "data\maps\entries\map77\5-roof-events.asm"    ; 
Map77s6_WarpEvents:include "data\maps\entries\map77\6-warp-events.asm"    ; 
Map77s7_ChestItems:include "data\maps\entries\map77\7-chest-items.asm"    ; 
Map77s8_OtherItems:include "data\maps\entries\map77\8-other-items.asm"    ; 
Map77s0_Blocks: incbin "data/maps/entries/map77/0-blocks.bin"
Map77s1_Layout: incbin "data/maps/entries/map77/1-layout.bin"
Map77s9_Animations:include "data\maps\entries\map77\9-animations.asm"    ; 
Map78:          include "data\maps\entries\map78\00-tilesets.asm"    ; 
                dc.l Map78s0_Blocks
                dc.l Map78s1_Layout
                dc.l Map78s2_Areas
                dc.l Map78s3_FlagEvents
                dc.l Map78s4_StepEvents
                dc.l Map78s5_RoofEvents
                dc.l Map78s6_WarpEvents
                dc.l Map78s7_ChestItems
                dc.l Map78s8_OtherItems
                dc.l Map78s9_Animations
Map78s2_Areas:  include "data\maps\entries\map78\2-areas.asm"    ; 
Map78s3_FlagEvents:include "data\maps\entries\map78\3-flag-events.asm"    ; 
Map78s4_StepEvents:include "data\maps\entries\map78\4-step-events.asm"    ; 
Map78s5_RoofEvents:include "data\maps\entries\map78\5-roof-events.asm"    ; 
Map78s6_WarpEvents:include "data\maps\entries\map78\6-warp-events.asm"    ; 
Map78s7_ChestItems:include "data\maps\entries\map78\7-chest-items.asm"    ; 
Map78s8_OtherItems:include "data\maps\entries\map78\8-other-items.asm"    ; 
Map78s0_Blocks: incbin "data/maps/entries/map78/0-blocks.bin"
Map78s1_Layout: incbin "data/maps/entries/map78/1-layout.bin"
Map78s9_Animations:include "data\maps\entries\map78\9-animations.asm"    ; 
