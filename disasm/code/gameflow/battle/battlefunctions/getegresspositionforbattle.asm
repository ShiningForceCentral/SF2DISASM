
; ASM FILE code\gameflow\battle\battlefunctions\getegresspositionforbattle.asm :
; 0x23E50..0x23EB0 : Get Egress Position For Battle function

; =============== S U B R O U T I N E =======================================

; HARDCODED special cases


GetEgressPositionForBattle:
                
                clr.b   d7
                getSavedByte CURRENT_BATTLE, d7
                cmpi.b  #BATTLE_VERSUS_GESHP,d7
                bne.s   loc_23E60
                clrFlg  438             ; Battle 38 unlocked - BATTLE_VERSUS_GESHP              
loc_23E60:
                
                cmpi.b  #BATTLE_TO_ANCIENT_SHRINE,d7
                bne.s   loc_23E6A
                clrFlg  439             ; Battle 39 unlocked - BATTLE_TO_ANCIENT_SHRINE         
loc_23E6A:
                
                cmpi.b  #BATTLE_VERSUS_KRAKEN,d7
                bne.s   loc_23E76
                moveq   #MAP_POLCA,d0
                bra.w   loc_23EAA
loc_23E76:
                
                cmpi.b  #BATTLE_TO_TAROS_SHRINE,d7
                bne.s   loc_23E82
                moveq   #MAP_HASSAN,d0
                bra.w   loc_23EAA
loc_23E82:
                
                cmpi.b  #BATTLE_POLCA_VILLAGE,d7
                bne.s   loc_23E8E
                moveq   #MAP_MOUNT_VOLCANON,d0
                bra.w   loc_23EAA
loc_23E8E:
                
                cmpi.b  #BATTLE_PACALON,d7
                bne.s   loc_23E9A
                moveq   #MAP_PACALON_CASTLE,d0
                bra.w   loc_23EAA
loc_23E9A:
                
                cmpi.b  #BATTLE_TO_MOUN,d7
                bne.s   loc_23EA6
                moveq   #MAP_PACALON,d0
                bra.w   loc_23EAA
loc_23EA6:
                
                getSavedByte EGRESS_MAP, d0
loc_23EAA:
                
                jsr     (GetSavepointForMap).w
                rts

    ; End of function GetEgressPositionForBattle

