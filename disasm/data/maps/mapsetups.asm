
; ASM FILE data\maps\mapsetups.asm :
; 0x4F6E2..0x4FA70 : Map setups table
MapSetups:      dc.w 3                  ; list of map event addresses and flags to check
		dc.l ms_map3
		dc.w $261               ; set after the scene where Astral exorcises the Gizmo
		dc.l ms_map3_flag261
		dc.w $1FA               ; Battle 6 completed
		dc.l ms_map3_flag1FA
		dc.w $21F               ; Battle 43 completed
		dc.l ms_map3_flag21F
		dc.w $FFFD
		dc.w 4                  ; for map 4
		dc.l ms_map4
		dc.w $FFFD
		dc.w 5                  ; map 5
		dc.l ms_map5
		dc.w $28A               ; set after event at Hawel's house
		dc.l ms_map5_flag28A
		dc.w $212               ; Battle 30 completed
		dc.l ms_map5_flag212
		dc.w $1C                ; Lemon joined
		dc.l ms_map5_flag1C
		dc.w $FFFD
		dc.w 6
		dc.l ms_map6
		dc.w $2BD               ; set after the scene with Peter and the kids in New Granseal
		dc.l ms_map6_flag2BD
		dc.w $2BE               ; set after the scene with Peter at the Castle (ends with you leaving the Castle)
		dc.l ms_map6_flag2BE
		dc.w $FFFD
		dc.w 7
		dc.l ms_map7
		dc.w $2BD               ; set after the scene with Peter and the kids in New Granseal
		dc.l ms_map7_flag2BD
		dc.w $2BE               ; set after the scene with Peter at the Castle (ends with you leaving the Castle)
		dc.l ms_map7
		dc.w $325               ; set after coming back to New Granseal after Creed's Mansion,when Astral joins
		dc.l ms_map7_flag325
		dc.w $FFFD
		dc.w 8
		dc.l ms_map8
		dc.w $2C4               ; set after the scene in Ribble where the mayor confronts Bowie
		dc.l ms_map8_flag2C4
		dc.w $FFFD
		dc.w 9
		dc.l ms_map9
		dc.w $206               ; Battle 18 completed
		dc.l ms_map9_flag206
		dc.w $FFFD
		dc.w $A
		dc.l ms_map10
		dc.w $2D2               ; set after speaking with Volcanon
		dc.l ms_map10_flag2D2
		dc.w $FFFD
		dc.w $B
		dc.l ms_map11
		dc.w $FFFD
		dc.w $C
		dc.l ms_map12
		dc.w $FFFD
		dc.w $D
		dc.l ms_map13
		dc.w $2C6               ; set after Oddler wanders down from the mountain
		dc.l ms_map13_flag2C6
		dc.w $31F               ; set after you agree to kill Zeon in Bedoe (King's yes/no dialog)
		dc.l ms_map13_flag31F
		dc.w $201               ; Battle 13 completed
		dc.l ms_map13_flag201
		dc.w $FFFD
		dc.w $E
		dc.l ms_map14
		dc.w $1CA
		dc.l ms_map14_flag1CA
		dc.w $FFFD
		dc.w $F
		dc.l ms_map15
		dc.w $212               ; Battle 30 completed
		dc.l ms_map15_flag212
		dc.w $FFFD
		dc.w $10
		dc.l ms_map16
		dc.w $297               ; set after Galam and Lemon leave with their army
		dc.l ms_map16_flag297
		dc.w $212               ; Battle 30 completed
		dc.l ms_map16_flag212
		dc.w $FFFD
		dc.w $11
		dc.l ms_map17
		dc.w $1F9               ; Battle 5 completed
		dc.l ms_map17_flag1F9
		dc.w $212               ; Battle 30 completed
		dc.l ms_map17_flag212
		dc.w $FFFD
		dc.w $12
		dc.l ms_map18
		dc.w $212               ; Battle 30 completed
		dc.l ms_map18_flag212
		dc.w $FFFD
		dc.w $13
		dc.l ms_map19
		dc.w $1F5               ; Battle 1 completed
		dc.l ms_map19_flag1F5
		dc.w $261               ; set after the scene where Astral exorcises the Gizmo
		dc.l ms_map19_flag261
		dc.w $1FA               ; Battle 6 completed
		dc.l ms_map19_flag1FA
		dc.w $1FB               ; Battle 7 completed
		dc.l ms_map19_flag1FB
		dc.w $21F               ; Battle 43 completed
		dc.l ms_map19_flag21F
		dc.w $3D6
		dc.l ms_map19_flag3D6
		dc.w $FFFD
		dc.w $14
		dc.l ms_map20
		dc.w $1F5               ; Battle 1 completed
		dc.l ms_map20_flag1F5
		dc.w $261               ; set after the scene where Astral exorcises the Gizmo
		dc.l ms_map20_flag261
		dc.w $1FA               ; Battle 6 completed
		dc.l ms_map20_flag1FA
		dc.w $21F               ; Battle 43 completed
		dc.l ms_map20_flag21F
		dc.w $FFFD
		dc.w $15
		dc.l ms_map21
		dc.w $1F5               ; Battle 1 completed
		dc.l ms_map21_flag1F5
		dc.w $261               ; set after the scene where Astral exorcises the Gizmo
		dc.l ms_map21_flag261
		dc.w $1FA               ; Battle 6 completed
		dc.l ms_map21_flag1FA
		dc.w $21F               ; Battle 43 completed
		dc.l ms_map21_flag21F
		dc.w $FFFD
		dc.w $16
		dc.l ms_map22
		dc.w $20A               ; Battle 22 completed
		dc.l ms_map22_flag20A
		dc.w $FFFD
		dc.w $17
		dc.l ms_map23
		dc.w $2FA               ; set after the fairy tags along at Creed's
		dc.l ms_map23_flag2FA
		dc.w $FFFD
		dc.w $18
		dc.l ms_map24
		dc.w $FFFD
		dc.w $19
		dc.l ms_map25
		dc.w $FFFD
		dc.w $1A
		dc.l ms_map26
		dc.w $FFFD
		dc.w $1B
		dc.l ms_map27
		dc.w $20B               ; Battle 23 completed
		dc.l ms_map27_flag20B
		dc.w $FFFD
		dc.w $1C
		dc.l ms_map28
		dc.w $FFFD
		dc.w $1D
		dc.l ms_map29
		dc.w $FFFD
		dc.w $1E
		dc.l ms_map30
		dc.w $311               ; set after the fairy tags along at Creed's
		dc.l ms_map30_flag311
		dc.w $2F9               ; set after the dwarf gives Bowie the cannon
		dc.l ms_map30_flag2F9
		dc.w $FFFD
		dc.w $1F
		dc.l ms_map31
		dc.w $33E               ; set after the Gyan join scene in the Moun underground
		dc.l ms_map31_flag33E
		dc.w $FFFD
		dc.w $21
		dc.l ms_map33
		dc.w $20B               ; Battle 23 completed
		dc.l ms_map33_flag20B
		dc.w $30F               ; set after the scene where Creed restores the Force and heads down the basement
		dc.l ms_map33
		dc.w $310               ; set after the event in the basement of Creed's Mansion
		dc.l ms_map33_flag310
		dc.w $312               ; set after Oddler elects to stay behind at Creed's Mansion
		dc.l ms_map33_flag312
		dc.w $16                ; Frayja joined
		dc.l ms_map33
		dc.w $FFFD
		dc.w $22
		dc.l ms_map34
		dc.w $310               ; set after the event in the basement of Creed's Mansion
		dc.l ms_map34_flag310
		dc.w $FFFD
		dc.w $24
		dc.l ms_map36
		dc.w $212               ; Battle 30 completed
		dc.l ms_map36_flag212
		dc.w $FFFD
		dc.w $25
		dc.l ms_map37
		dc.w $3E7               ; set after the Nazca ship shootdown scene
		dc.l ms_map37_flag3E7
		dc.w $FFFD
		dc.w $26
		dc.l ms_map38
		dc.w $FFFD
		dc.w $27
		dc.l ms_map39
		dc.w $33E               ; set after the Gyan join scene in the Moun underground
		dc.l ms_map39_flag33E
		dc.w $FFFD
		dc.w $28
		dc.l ms_map40
		dc.w $1FA               ; Battle 6 completed
		dc.l ms_map40_flag1FA
		dc.w $1FB               ; Battle 7 completed
		dc.l ms_map40
		dc.w $FFFD
		dc.w $29
		dc.l ms_map41
		dc.w $FFFD
		dc.w $2A
		dc.l ms_map42
		dc.w $FFFD
		dc.w $2B
		dc.l ms_map43
		dc.w $264               ; set after event at Hawel's house
		dc.l ms_map43_flag264
		dc.w $FFFD
		dc.w $2C
		dc.l ms_map44
		dc.w $261               ; set after the scene where Astral exorcises the Gizmo
		dc.l ms_map44_flag261
		dc.w $1FA               ; Battle 6 completed
		dc.l ms_map44_flag1FA
		dc.w $1FB               ; Battle 7 completed
		dc.l ms_map44_flag1FB
		dc.w $FFFD
		dc.w $2D
		dc.l ms_map45
		dc.w $FFFD
		dc.w $2E
		dc.l ms_map46
		dc.w $FFFD
		dc.w $33
		dc.l ms_map51
		dc.w $208               ; Battle 20 completed
		dc.l ms_map51_flag208
		dc.w $FFFD
		dc.w $34
		dc.l ms_map52
		dc.w $200               ; Battle 12 completed
		dc.l ms_map52_flag200
		dc.w $FFFD
		dc.w $37
		dc.l ms_map55
		dc.w $FFFD
		dc.w $38
		dc.l ms_map56
		dc.w $FFFD
		dc.w $3B
		dc.l ms_map59
		dc.w $21F               ; Battle 43 completed
		dc.l ms_map59_flag21F
		dc.w $FFFD
		dc.w $3D
		dc.l ms_map61
		dc.w $2D9               ; ???
		dc.l ms_map61_flag2D9
		dc.w $FFFD
		dc.w $3E
		dc.l ms_map62
		dc.w $4D                ; Old man is a follower
		dc.l ms_map62_flag4D
		dc.w $FFFD
		dc.w $3F
		dc.l ms_map63
		dc.w $1D                ; Claude joined
		dc.l ms_map63_flag1D
		dc.w $FFFD
		dc.w 0
		dc.l ms_map0
		dc.w $FFFD
		dc.w 1
		dc.l ms_map1
		dc.w $FFFD
		dc.w 2
		dc.l ms_map2
		dc.w $212               ; Battle 30 completed
		dc.l ms_map2_flag212
		dc.w $FFFD
		dc.w $42
		dc.l ms_map66
		dc.w $FFFD
		dc.w $43
		dc.l ms_map67
		dc.w $FFFD
		dc.w $44
		dc.l ms_map68
		dc.w $FFFD
		dc.w $45
		dc.l ms_map69
		dc.w $FFFD
		dc.w $46
		dc.l ms_map70
		dc.w $FFFD
		dc.w $48
		dc.l ms_map72
		dc.w $FFFD
		dc.w $49
		dc.l ms_map73
		dc.w $FFFD
		dc.w $4A
		dc.l ms_map74
		dc.w $FFFD
		dc.w $4B
		dc.l ms_map75
		dc.w $FFFD
		dc.w $4C
		dc.l ms_map76
		dc.w $FFFD
		dc.w $4D
		dc.l ms_map77
		dc.w $FFFD
		dc.w $FFFF
