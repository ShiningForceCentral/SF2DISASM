
; ASM FILE data\maps\entries\map63\mapsetups\s2_entityevents.asm :
; 0x5C98A..0x5C9E2 : 
ms_map63_EntityEvents:
                msEntityEvent 29, RIGHT, Map63_EntityEvent0-ms_map63_EntityEvents
                msDefaultEntityEvent Map63_DefaultEntityEvent-ms_map63_EntityEvents

; =============== S U B R O U T I N E =======================================


Map63_EntityEvent0:
                
                 
                chkFlg  29              ; Claude joined
                bne.s   Map63_DefaultEntityEvent
                moveq   #$75,d1 
                jsr     j_GetItemInventoryLocation
                cmpi.w  #$FFFF,d0
                bne.s   loc_5C9D2
                move.w  ((SPEECH_SFX-$1000000)).w,((SPEECH_SFX_BACKUP-$1000000)).w
                move.w  #$1D,d0
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((SPEECH_SFX-$1000000)).w
                jsr     LoadAndDisplayCurrentPortrait
                txt     4177            ; "Olooooo...Oloo....{N}Have you seen my arm?{W2}"
                txt     4178            ; "I can't move...without my{N}arm...oloooo....{W1}"
                clsTxt
                bra.s   Map63_DefaultEntityEvent
loc_5C9D2:
                
                moveq   #$75,d0 
                jsr     RemoveItemFromInventory
                script  cs_5CBB4
Map63_DefaultEntityEvent:
                
                rts

    ; End of function Map63_EntityEvent0

