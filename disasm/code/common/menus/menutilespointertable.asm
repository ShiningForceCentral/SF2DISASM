
; ASM FILE code\common\menus\menutilespointertable.asm :
; 0x1115C..0x11180 : Menu tiles pointer table
pt_tiles_Menu:  dc.l $85010204          ; starting with references to uncompressed main menu tiles
                dc.l $80010203
                dc.l $80010204
                dc.l p_tiles_ItemMenu
                dc.l p_tiles_BattlefieldMenu
                dc.l p_tiles_ChurchMenu
                dc.l p_tiles_ShopMenu
                dc.l p_tiles_CaravanMenu
                dc.l p_tiles_DepotMenu
                
