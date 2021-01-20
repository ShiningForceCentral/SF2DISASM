
; ASM FILE code\common\menus\menuengine_02.asm :
; 0x110A4..0x114BE : Menu engine
pt_SpellLevelTilesLayouts:
                dc.l SpellLevelTilesLayout1
                dc.l SpellLevelTilesLayout1
                dc.l SpellLevelTilesLayout1
                dc.l SpellLevelTilesLayout1
                dc.l SpellLevelTilesLayout1in2
                dc.l SpellLevelTilesLayout2
                dc.l SpellLevelTilesLayout2
                dc.l SpellLevelTilesLayout2
                dc.l SpellLevelTilesLayout1in3
                dc.l SpellLevelTilesLayout2in3
                dc.l SpellLevelTilesLayout3
                dc.l SpellLevelTilesLayout3
                dc.l SpellLevelTilesLayout1in4
                dc.l SpellLevelTilesLayout2in4
                dc.l SpellLevelTilesLayout3in4
                dc.l SpellLevelTilesLayout4
SpellLevelTilesLayout1:
                
; Syntax        vdpBaseTile [VDPTILE_]enum[|MIRROR|FLIP]
;
; Notes: PALETTE3 and PRIORITY bits are always set.
;        Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL2
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                
SpellLevelTilesLayout2:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                
SpellLevelTilesLayout3:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL2
                vdpBaseTile SPACE
                
SpellLevelTilesLayout4:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                
SpellLevelTilesLayout1in2:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL6
                vdpBaseTile SPELL_LEVEL5
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                
SpellLevelTilesLayout2in3:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPELL_LEVEL5|MIRROR
                vdpBaseTile SPELL_LEVEL8
                vdpBaseTile SPACE
                
SpellLevelTilesLayout3in4:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL6
                vdpBaseTile SPELL_LEVEL5
                
SpellLevelTilesLayout1in3:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL6
                vdpBaseTile SPELL_LEVEL5
                vdpBaseTile SPELL_LEVEL5|MIRROR
                vdpBaseTile SPELL_LEVEL8
                vdpBaseTile SPACE
                
SpellLevelTilesLayout2in4:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPELL_LEVEL5|MIRROR
                vdpBaseTile SPELL_LEVEL7
                vdpBaseTile SPELL_LEVEL5
                
SpellLevelTilesLayout1in4:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL6
                vdpBaseTile SPELL_LEVEL5
                vdpBaseTile SPELL_LEVEL5|MIRROR
                vdpBaseTile SPELL_LEVEL7
                vdpBaseTile SPELL_LEVEL5
                
pt_MenuTiles:   dc.b $85                ; starting with references to uncompressed main menu tiles
                dc.b 1
                dc.b 2
                dc.b 4
                dc.b $80
                dc.b 1
                dc.b 2
                dc.b 3
                dc.b $80
                dc.b 1
                dc.b 2
                dc.b 4
                dc.l p_MenuTiles_Item
                dc.l p_MenuTiles_BattleField
                dc.l p_Menutiles_Church
                dc.l p_MenuTiles_Shop
                dc.l p_MenuTiles_Caravan
                dc.l p_MenuTiles_Depot
pt_MenuOptions: dc.l pt_FieldMenu_Names
                dc.l pt_BattleMenu_Names
                dc.l pt_BattleMenuOverItem_Names
                dc.l pt_ItemMenu_Names
                dc.l pt_BattlefieldMenu_Names
                dc.l pt_ChurchMenu_Names
                dc.l pt_ShopMenu_Names
                dc.l pt_CaravanMenu_Names
                dc.l pt_DepotMenu_Names
pt_FieldMenu_Names:
                dc.l aMember            
                dc.l aMagic             
                dc.l aItem              
                dc.l aSearch            
aMember:        dc.b 'MEMBER',0
aMagic:         dc.b 'MAGIC',0
aItem:          dc.b 'ITEM',0
aSearch:        dc.b 'SEARCH',0
                dc.b $FF
pt_BattleMenu_Names:
                dc.l aAttack_0          
                dc.l aMagic_0           
                dc.l aItem_0            
                dc.l aStay              
aAttack_0:      dc.b 'ATTACK',0
aMagic_0:       dc.b 'MAGIC',0
aItem_0:        dc.b 'ITEM',0
aStay:          dc.b 'STAY',0
                dc.b $FF
pt_BattleMenuOverItem_Names:
                dc.l aAttack_1          
                dc.l aMagic_1           
                dc.l aItem_1            
                dc.l aSearch_0          
aAttack_1:      dc.b 'ATTACK',0
aMagic_1:       dc.b 'MAGIC',0
aItem_1:        dc.b 'ITEM',0
aSearch_0:      dc.b 'SEARCH',0
                dc.b $FF
pt_ItemMenu_Names:
                dc.l aUse               
                dc.l aGive              
                dc.l aEquip             
                dc.l aDrop              
aUse:           dc.b 'USE',0
aGive:          dc.b 'GIVE',0
aEquip:         dc.b 'EQUIP',0
aDrop:          dc.b 'DROP',0
pt_BattlefieldMenu_Names:
                dc.l aMember_0          
                dc.l aMap               
                dc.l aSpeed_0           
                dc.l aQuit              
aMember_0:      dc.b 'MEMBER',0
aMap:           dc.b 'MAP',0
aSpeed_0:       dc.b 'SPEED',0
aQuit:          dc.b 'QUIT',0
pt_ChurchMenu_Names:
                dc.l aRaise             
                dc.l aCure              
                dc.l aPromo_            
                dc.l aSave              
aRaise:         dc.b 'RAISE',0
aCure:          dc.b 'CURE',0
aPromo_:        dc.b 'PROMO.',0
aSave:          dc.b 'SAVE',0
                dc.b $FF
pt_ShopMenu_Names:
                dc.l aBuy               
                dc.l aSell              
                dc.l aRepair            
                dc.l aDeals             
aBuy:           dc.b 'BUY',0
aSell:          dc.b 'SELL',0
aRepair:        dc.b 'REPAIR',0
aDeals:         dc.b 'DEALS',0
pt_CaravanMenu_Names:
                dc.l aJoin              
                dc.l aDepot             
                dc.l aItem_2            
                dc.l aPurge             
aJoin:          dc.b 'JOIN',0
aDepot:         dc.b 'DEPOT',0
aItem_2:        dc.b 'ITEM',0
aPurge:         dc.b 'PURGE',0
pt_DepotMenu_Names:
                dc.l aLook              
                dc.l aDepos_            
                dc.l aDerive            
                dc.l aDrop_0            
aLook:          dc.b 'LOOK',0
aDepos_:        dc.b 'DEPOS.',0
aDerive:        dc.b 'DERIVE',0
aDrop_0:        dc.b 'DROP',0
MenuHBarTiles:  dc.b 2
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $2C
                dc.b $CB
                dc.b $BB
                dc.b $BB
                dc.b 2
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BC
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
byte_11336:     dc.b 2
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $2C
                dc.b $CB
                dc.b $BB
                dc.b $BB
                dc.b $22
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b 2
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
byte_11366:     dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $20
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $22
                dc.b $BB
                dc.b $BB
                dc.b $BC
                dc.b $C2
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $20
byte_11396:     dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $CB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $BB
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $20
                dc.b $BB
                dc.b $BB
                dc.b $BC
                dc.b $C2
                dc.b $CC
                dc.b $CC
                dc.b $CC
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $22
                dc.b $20

; =============== S U B R O U T I N E =======================================


CreateBattleEquipWindow:
                
                movem.l d0-a2,-(sp)
                move.w  #$A09,d0
                move.w  #$F612,d1
                jsr     (CreateWindow).w
                move.w  d0,((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w
                lea     BattleEquipWindowLayout(pc), a0
                move.w  #$B4,d7 
                jsr     (CopyBytes).w   
                bsr.w   DrawBattleEquipWindowStats
                move.w  ((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w,d0
                move.w  #$212,d1
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function CreateBattleEquipWindow


; =============== S U B R O U T I N E =======================================


sub_11404:
                
                movem.l d0-a2,-(sp)
                bsr.w   DrawBattleEquipWindowStats
                move.w  ((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function sub_11404


; =============== S U B R O U T I N E =======================================


HideBattleEquipWindow:
                
                movem.l d0-a2,-(sp)
                move.w  ((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w,d0
                move.w  #$F612,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  ((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w,d0
                jsr     (ClearWindowAndUpdateEndPointer).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function HideBattleEquipWindow


; =============== S U B R O U T I N E =======================================

windowTilesAddress = -4

DrawBattleEquipWindowStats:
                
                link    a6,#-4
                move.w  ((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w,d0
                move.w  #WINDOW_BATTLEEQUIP_STATS_TILE_COORDS,d1
                jsr     (GetWindowTileAddress).w
                move.l  a1,windowTilesAddress(a6)
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentATT
                move.w  d1,d0
                movea.l windowTilesAddress(a6),a1
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentDEF
                move.w  d1,d0
                movea.l windowTilesAddress(a6),a1
                adda.w  #$28,a1 
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentAGI
                move.w  d1,d0
                movea.l windowTilesAddress(a6),a1
                adda.w  #$50,a1 
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentMOV
                move.w  d1,d0
                movea.l windowTilesAddress(a6),a1
                adda.w  #$78,a1 
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue  
                unlk    a6
                rts

    ; End of function DrawBattleEquipWindowStats

