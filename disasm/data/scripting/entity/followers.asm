
; ASM FILE data\scripting\entity\followers.asm :
; 0x44338..0x4438A : Follower declarations
OverworldFollowers:
                follower $41, FOLLOWER_A, MAPSPRITE_CARAVAN, 0
FollowersTable: follower $42, ALLY_SARAH, $FF, 1
                follower $43, ALLY_PETER, $FF, 1
                follower $48, ALLY_KAZIN, $FF, 1
                follower $49, ALLY_SLADE, $FF, 1
                follower $4A, FOLLOWER_B, MAPSPRITE_ASTRAL, 1
                follower $42, ALLY_CHESTER, $FF, 1
                follower $44, FOLLOWER_B, MAPSPRITE_ODDLER, 1
                follower $4B, ALLY_LUKE, $FF, 1
                follower $45, FOLLOWER_C, MAPSPRITE_FAIRY, 1
                follower $46, FOLLOWER_B, MAPSPRITE_ASTRAL, 1
                follower $4A, FOLLOWER_A, MAPSPRITE_GRANSEAL_KING, 1
                follower $47, ALLY_LEMON, $FF, 1
                follower $4A, FOLLOWER_D, MAPSPRITE_MINISTER, 1
                follower $4C, ALLY_ZYNK, $FF, 1
                follower $4D, FOLLOWER_A, MAPSPRITE_MAN3, 1
                follower $52, ALLY_FRAYJA, $FF, 1
                follower $53, FOLLOWER_A, MAPSPRITE_GRANSEAL_KING, 1
                follower $53, FOLLOWER_D, MAPSPRITE_MINISTER, 1
                follower $54, ALLY_ROHDE, $FF, 1
                
                    tableEnd
