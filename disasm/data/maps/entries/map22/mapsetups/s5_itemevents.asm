
; ASM FILE data\maps\entries\map22\mapsetups\s5_itemevents.asm :
; 0x59604..0x5962E : 
ms_map22_Section5:
                msItemEvent 35, 24, NO_DIRECTION, ITEM_COTTON_BALLOON, Map22_ItemEvent0-ms_map22_Section5
                msDefaultItemEvent Map22_DefaultItemEvent1-ms_map22_Section5

; =============== S U B R O U T I N E =======================================


Map22_ItemEvent0:
                
                moveq   #ITEM_COTTON_BALLOON,d1
                jsr     j_GetItemInventoryLocation
                cmpi.w  #-1,d0
                beq.s   byte_59624
                jsr     j_RemoveItemBySlot
byte_59624:
                
                script  cs_599B2
                moveq   #-1,d6
Map22_DefaultItemEvent1:
                
                rts

    ; End of function Map22_ItemEvent0

