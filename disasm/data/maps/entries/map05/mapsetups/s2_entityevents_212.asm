
; ASM FILE data\maps\entries\map05\mapsetups\s2_entityevents_212.asm :
; 0x6043A..0x604C8 : 
ms_map5_flag212_EntityEvents:
                msEntityEvent 28, DOWN, Map5_212_EntityEvent0-ms_map5_flag212_EntityEvents
                msEntityEvent 27, UP, Map5_212_EntityEvent1-ms_map5_flag212_EntityEvents
                msEntityEvent 128, DOWN, Map5_212_EntityEvent2-ms_map5_flag212_EntityEvents
                msEntityEvent 129, DOWN, Map5_212_EntityEvent3-ms_map5_flag212_EntityEvents
                msEntityEvent 130, RIGHT, Map5_212_EntityEvent4-ms_map5_flag212_EntityEvents
                msDefaultEntityEvent Map5_212_DefaultEntityEvent-ms_map5_flag212_EntityEvents

; =============== S U B R O U T I N E =======================================

Map5_212_EntityEvent0:
                
                 
                txt     $D9B            ; "I can't believe it!{N}I want to die, but I can't!{W1}"
                rts

    ; End of function Map5_212_EntityEvent0


; =============== S U B R O U T I N E =======================================

Map5_212_EntityEvent1:
                
                 
                script  cs_60F18
                rts

    ; End of function Map5_212_EntityEvent1


; =============== S U B R O U T I N E =======================================

Map5_212_EntityEvent2:
                
                jsr     j_ChurchMenuActions
                rts

    ; End of function Map5_212_EntityEvent2


; =============== S U B R O U T I N E =======================================

Map5_212_EntityEvent3:
                
                move.b  #$1D,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     j_ShopMenuActions
                rts

    ; End of function Map5_212_EntityEvent3


; =============== S U B R O U T I N E =======================================

Map5_212_EntityEvent4:
                
                 
                chkFlg  $1C             ; Lemon joined
                beq.s   byte_60494      
                move.w  ((SPEECH_SFX-$1000000)).w,((SPEECH_SFX_BACKUP-$1000000)).w
                clr.w   ((SPEECH_SFX-$1000000)).w
                clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
                txt     $1A7            ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
                txt     $FF2            ; "A hole.{W1}"
                bra.s   Map5_212_DefaultEntityEvent
byte_60494:
                
                chkFlg  $3B1            ; Set after recruiting Lemon in Yeel
                bne.s   Map5_212_DefaultEntityEvent
                script  cs_6060E
                move.w  ((SPEECH_SFX-$1000000)).w,((SPEECH_SFX_BACKUP-$1000000)).w
                move.w  #$1C,d0
                jsr     GetEntityPortaitAndSpeechSound
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((SPEECH_SFX-$1000000)).w
                jsr     LoadAndDisplayCurrentPortrait
                txt     $D9B            ; "I can't believe it!{N}I want to die, but I can't!{W1}"
                setFlg  $3B1            ; Set after recruiting Lemon in Yeel
Map5_212_DefaultEntityEvent:
                
                rts

    ; End of function Map5_212_EntityEvent4

