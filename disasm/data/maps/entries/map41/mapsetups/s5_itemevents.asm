
; ASM FILE data\maps\entries\map41\mapsetups\s5_itemevents.asm :
; 0x5F46C..0x5F4A0 : 
ms_map41_Section5:
                msItemEvent 6, 8, UP, ITEM_FORCE_SWORD, Map41_ItemEvent0-ms_map41_Section5
                msDefaultItemEvent Map41_DefaultItemEvent1-ms_map41_Section5

; =============== S U B R O U T I N E =======================================


Map41_DefaultItemEvent1:
                
                rts

    ; End of function Map41_DefaultItemEvent1


; =============== S U B R O U T I N E =======================================


Map41_ItemEvent0:
                
                 
                chkFlg  930             ; Set after opening Devil's Head with the Force Sword
                bne.s   return_5F49E
                script  cs_5F4B8
                setFlg  930             ; Set after opening Devil's Head with the Force Sword
                chkFlg  28              ; Lemon joined
                bne.s   loc_5F49A
                script  cs_5F594
                setFlg  71              ; Lemon is a follower
loc_5F49A:
                
                move.w  #-1,d6
return_5F49E:
                
                rts

    ; End of function Map41_ItemEvent0

