
; ASM FILE code\common\menus\menuengine_02.asm :
; 0x110A4..0x114BE : Menu engine
pt_layouts_SpellLevelIndicator:
                dc.l layout_SpellLevelIndicator
                dc.l layout_SpellLevelIndicator
                dc.l layout_SpellLevelIndicator
                dc.l layout_SpellLevelIndicator
                dc.l layout_SpellLevelIndicator_1in2
                dc.l layout_SpellLevelIndicator_2
                dc.l layout_SpellLevelIndicator_2
                dc.l layout_SpellLevelIndicator_2
                dc.l layout_SpellLevelIndicator_1in3
                dc.l layout_SpellLevelIndicator_2in3
                dc.l layout_SpellLevelIndicator_3
                dc.l layout_SpellLevelIndicator_3
                dc.l layout_SpellLevelIndicator_1in4
                dc.l layout_SpellLevelIndicator_2in4
                dc.l layout_SpellLevelIndicator_3in4
                dc.l layout_SpellLevelIndicator_4
layout_SpellLevelIndicator:
                
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
                
layout_SpellLevelIndicator_2:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                
layout_SpellLevelIndicator_3:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL2
                vdpBaseTile SPACE
                
layout_SpellLevelIndicator_4:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                
layout_SpellLevelIndicator_1in2:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL6
                vdpBaseTile SPELL_LEVEL5
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                
layout_SpellLevelIndicator_2in3:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPELL_LEVEL5|MIRROR
                vdpBaseTile SPELL_LEVEL8
                vdpBaseTile SPACE
                
layout_SpellLevelIndicator_3in4:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL6
                vdpBaseTile SPELL_LEVEL5
                
layout_SpellLevelIndicator_1in3:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL6
                vdpBaseTile SPELL_LEVEL5
                vdpBaseTile SPELL_LEVEL5|MIRROR
                vdpBaseTile SPELL_LEVEL8
                vdpBaseTile SPACE
                
layout_SpellLevelIndicator_2in4:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL3
                vdpBaseTile SPELL_LEVEL1|MIRROR
                vdpBaseTile SPELL_LEVEL5|MIRROR
                vdpBaseTile SPELL_LEVEL7
                vdpBaseTile SPELL_LEVEL5
                
layout_SpellLevelIndicator_1in4:
                vdpBaseTile SPELL_LEVEL1
                vdpBaseTile SPELL_LEVEL6
                vdpBaseTile SPELL_LEVEL5
                vdpBaseTile SPELL_LEVEL5|MIRROR
                vdpBaseTile SPELL_LEVEL7
                vdpBaseTile SPELL_LEVEL5
                
pt_tiles_Menu:  dc.l $85010204          ; starting with references to uncompressed main menu tiles
                dc.l $80010203
                dc.l $80010204
                dc.l p_tiles_ItemMenu
                dc.l p_tiles_BattlefieldMenu
                dc.l p_tiles_ChurchMenu
                dc.l p_tiles_ShopMenu
                dc.l p_tiles_CaravanMenu
                dc.l p_tiles_DepotMenu
                
pt_MenuOptionNames:
                dc.l pt_FieldMenuNames
                dc.l pt_BattleMenuWithStayNames
                dc.l pt_BattleMenuWithSearchNames
                dc.l pt_ItemMenuNames
                dc.l pt_BattlefieldMenuNames
                dc.l pt_ChurchMenuNames
                dc.l pt_ShopMenuNames
                dc.l pt_CaravanMenuNames
                dc.l pt_DepotMenuNames
                
pt_FieldMenuNames:
                dc.l aMember            
                dc.l aMagic             
                dc.l aItem              
                dc.l aSearch            
aMember:        dc.b 'MEMBER',0
aMagic:         dc.b 'MAGIC',0
aItem:          dc.b 'ITEM',0
aSearch:        dc.b 'SEARCH',0
                align
                
pt_BattleMenuWithStayNames:
                dc.l aAttack_0          
                dc.l aMagic_0           
                dc.l aItem_0            
                dc.l aStay              
aAttack_0:      dc.b 'ATTACK',0
aMagic_0:       dc.b 'MAGIC',0
aItem_0:        dc.b 'ITEM',0
aStay:          dc.b 'STAY',0
                align
                
pt_BattleMenuWithSearchNames:
                dc.l aAttack_1          
                dc.l aMagic_1           
                dc.l aItem_1            
                dc.l aSearch_0          
aAttack_1:      dc.b 'ATTACK',0
aMagic_1:       dc.b 'MAGIC',0
aItem_1:        dc.b 'ITEM',0
aSearch_0:      dc.b 'SEARCH',0
                align
                
pt_ItemMenuNames:
                dc.l aUse               
                dc.l aGive              
                dc.l aEquip             
                dc.l aDrop              
aUse:           dc.b 'USE',0
aGive:          dc.b 'GIVE',0
aEquip:         dc.b 'EQUIP',0
aDrop:          dc.b 'DROP',0
                align
                
pt_BattlefieldMenuNames:
                dc.l aMember_0          
                dc.l aMap               
                dc.l aSpeed_0           
                dc.l aQuit              
aMember_0:      dc.b 'MEMBER',0
aMap:           dc.b 'MAP',0
aSpeed_0:       dc.b 'SPEED',0
aQuit:          dc.b 'QUIT',0
                align
                
pt_ChurchMenuNames:
                dc.l aRaise             
                dc.l aCure              
                dc.l aPromo_            
                dc.l aSave              
aRaise:         dc.b 'RAISE',0
aCure:          dc.b 'CURE',0
aPromo_:        dc.b 'PROMO.',0
aSave:          dc.b 'SAVE',0
                align
                
pt_ShopMenuNames:
                dc.l aBuy               
                dc.l aSell              
                dc.l aRepair            
                dc.l aDeals             
aBuy:           dc.b 'BUY',0
aSell:          dc.b 'SELL',0
aRepair:        dc.b 'REPAIR',0
aDeals:         dc.b 'DEALS',0
                align
                
pt_CaravanMenuNames:
                dc.l aJoin              
                dc.l aDepot             
                dc.l aItem_2            
                dc.l aPurge             
aJoin:          dc.b 'JOIN',0
aDepot:         dc.b 'DEPOT',0
aItem_2:        dc.b 'ITEM',0
aPurge:         dc.b 'PURGE',0
                align
                
pt_DepotMenuNames:
                dc.l aLook              
                dc.l aDepos_            
                dc.l aDerive            
                dc.l aDrop_0            
aLook:          dc.b 'LOOK',0
aDepos_:        dc.b 'DEPOS.',0
aDerive:        dc.b 'DERIVE',0
aDrop_0:        dc.b 'DROP',0
                align
                
tiles_DiamondMenuBorder1:
                dc.b 2
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
tiles_DiamondMenuBorder2:
                dc.b 2
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
tiles_DiamondMenuBorder3:
                dc.b $22
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
tiles_DiamondMenuBorder4:
                dc.b $22
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


OpenBattleEquipWindow:
                
                movem.l d0-a2,-(sp)
                move.w  #WINDOW_BATTLEEQUIP_SIZE,d0
                move.w  #$F612,d1
                jsr     (CreateWindow).w
                move.w  d0,((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w
                lea     layout_BattleEquipWindow(pc), a0
                move.w  #180,d7
                jsr     (CopyBytes).w   
                bsr.w   WriteBattleEquipWindowLayout
                move.w  ((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w,d0
                move.w  #$212,d1
                move.w  #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function OpenBattleEquipWindow


; =============== S U B R O U T I N E =======================================


HideBattleEquipWindow:
                
                movem.l d0-a2,-(sp)
                bsr.w   WriteBattleEquipWindowLayout
                move.w  ((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w,d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function HideBattleEquipWindow


; =============== S U B R O U T I N E =======================================


CloseBattleEquipWindow:
                
                movem.l d0-a2,-(sp)
                move.w  ((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w,d0
                move.w  #$F612,d1
                moveq   #4,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  ((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w,d0
                jsr     (DeleteWindow).w
                movem.l (sp)+,d0-a2
                rts

    ; End of function CloseBattleEquipWindow


; =============== S U B R O U T I N E =======================================

windowLayoutStartAddress = -4

WriteBattleEquipWindowLayout:
                
                link    a6,#-4
                move.w  ((BATTLE_EQUIP_WINDOW_SLOT-$1000000)).w,d0
                move.w  #WINDOW_BATTLEEQUIP_STATS_TILE_COORDS,d1
                jsr     (GetWindowTileAddress).w
                move.l  a1,windowLayoutStartAddress(a6)
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentAtt
                move.w  d1,d0
                movea.l windowLayoutStartAddress(a6),a1
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentDef
                move.w  d1,d0
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #40,a1          ; second stat offset
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentAgi
                move.w  d1,d0
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #80,a1          ; third stat offset
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue
                move.w  ((MOVING_BATTLE_ENTITY_INDEX-$1000000)).w,d0
                jsr     j_GetCurrentMov
                move.w  d1,d0
                movea.l windowLayoutStartAddress(a6),a1
                adda.w  #120,a1         ; fourth stat offset
                moveq   #STATS_DIGITS_NUMBER,d7
                bsr.w   WriteStatValue
                unlk    a6
                rts

    ; End of function WriteBattleEquipWindowLayout

