
; ASM FILE data\maps\entries\map09\mapsetups\s5_itemevents.asm :
; 0x568A4..0x568C4 : 
ms_map9_Section5:
                msItemEvent 16, 58, NO_DIRECTION, ITEM_ACHILLES_SWORD, Map9_ItemEvent0-ms_map9_Section5
                msDefaultItemEvent Map9_DefaultItemEvent1-ms_map9_Section5

; =============== S U B R O U T I N E =======================================


Map9_ItemEvent0:
                
                 
                chkFlg  727             ; Set after presenting the Achilles Sword to Rohde (yes/no to the Caravan regardless)
                bne.s   Map9_DefaultItemEvent1
                script  cs_569BC
                setFlg  727             ; Set after presenting the Achilles Sword to Rohde (yes/no to the Caravan regardless)
                moveq   #-1,d6
Map9_DefaultItemEvent1:
                
                rts

    ; End of function Map9_ItemEvent0

