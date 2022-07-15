
; ASM FILE data\maps\entries\map72\mapsetups\s3_zoneevents.asm :
; 0x4FE64..0x4FF24 : 
ms_map72_ZoneEvents:
                msZoneEvent 32, 255, Map72_ZoneEvent0-ms_map72_ZoneEvents
                msZoneEvent 33, 255, Map72_ZoneEvent0-ms_map72_ZoneEvents
                msZoneEvent 34, 255, Map72_ZoneEvent0-ms_map72_ZoneEvents
                msZoneEvent 25, 37, Map72_ZoneEvent3-ms_map72_ZoneEvents
                msZoneEvent 26, 37, Map72_ZoneEvent3-ms_map72_ZoneEvents
                msZoneEvent 27, 37, Map72_ZoneEvent3-ms_map72_ZoneEvents
                msZoneEvent 28, 37, Map72_ZoneEvent3-ms_map72_ZoneEvents
                msZoneEvent 29, 37, Map72_ZoneEvent3-ms_map72_ZoneEvents
                msZoneEvent 30, 37, Map72_ZoneEvent3-ms_map72_ZoneEvents
                msDefaultZoneEvent Map72_DefaultZoneEvent-ms_map72_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map72_ZoneEvent0:
                
                move.w  #$1A,d0
                jsr     CheckRandomBattle
                rts

    ; End of function Map72_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map72_ZoneEvent3:
                
                 
                chkFlg  750             ; Set after Rohde clears the blockage at the North Cliff cave
                bne.s   return_4FF04
                chkFlg  805             ; Set after coming back to New Granseal after Creed's Mansion,when Astral joins
                beq.s   return_4FF04
                chkFlg  256             ; TEMP FLAG #00
                bne.s   return_4FF04
                clrFlg  256             ; TEMP FLAG #00
                moveq   #$72,d1 
                jsr     j_GetItemInventoryLocation
                cmpi.w  #$FFFF,d0
                beq.s   loc_4FEF4
                moveq   #$74,d1 
                jsr     j_GetItemInventoryLocation
                cmpi.w  #$FFFF,d0
                beq.s   loc_4FEE6
                moveq   #$72,d0 
                jsr     RemoveItemFromInventory
                moveq   #$74,d0 
                jsr     RemoveItemFromInventory
                script  cs_4FFDA
                setFlg  750             ; Set after Rohde clears the blockage at the North Cliff cave
                bra.s   loc_4FEF2
loc_4FEE6:
                
                move.w  #$74,((TEXT_NAME_INDEX_1-$1000000)).w 
                script  cs_5023E
loc_4FEF2:
                
                bra.s   byte_4FF00      
loc_4FEF4:
                
                move.w  #$74,((TEXT_NAME_INDEX_1-$1000000)).w 
                script  cs_5023E
byte_4FF00:
                
                setFlg  256             ; TEMP FLAG #00
return_4FF04:
                
                rts

    ; End of function Map72_ZoneEvent3


; =============== S U B R O U T I N E =======================================


Map72_DefaultZoneEvent:
                
                 
                chkFlg  523             ; Battle 23 completed - BATTLE_VERSUS_WILLARD              
                bne.s   loc_4FF18
                move.w  #8,d0
                jsr     CheckRandomBattle
                bra.s   return_4FF22
loc_4FF18:
                
                move.w  #$18,d0
                jsr     CheckRandomBattle
return_4FF22:
                
                rts

    ; End of function Map72_DefaultZoneEvent

