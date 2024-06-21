
; ASM FILE data\maps\entries\map63\mapsetups\s5_itemevents.asm :
; 0x5CA26..0x5CA50 : 
ms_map63_Section5:
                msItemEvent 21, 26, UP, ITEM_ARM_OF_GOLEM, Map63_ItemEvent0-ms_map63_Section5
                msDefaultItemEvent Map63_DefaultItemEvent1-ms_map63_Section5

; =============== S U B R O U T I N E =======================================


Map63_ItemEvent0:
                
                 
                chkFlg  29              ; Claude joined
                bne.s   loc_5CA4C
                moveq   #ITEM_ARM_OF_GOLEM,d0
                jsr     RemoveItemFromInventory
                script  cs_5CBB4
                move.w  #-1,d6
                bra.s   Map63_DefaultItemEvent1
loc_5CA4C:
                
                clr.w   d6
Map63_DefaultItemEvent1:
                
                rts

    ; End of function Map63_ItemEvent0

