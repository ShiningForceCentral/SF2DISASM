
; ASM FILE data\maps\entries\map21\mapsetups\s2_entityevents_1FA.asm :
; 0x53EAA..0x53F06 : 
ms_map21_flag1FA_EntityEvents:
                msDefaultEntityEvent Map21_DefaultEntityEvent-ms_map21_flag1FA_EntityEvents

; =============== S U B R O U T I N E =======================================

Map21_EntityEvent0:
                
                 
                chkFlg  $260            ; Set after agreeing to go to the tower with Astral
                bne.s   byte_53EC8      
                chkFlg  $100            ; TEMP FLAG #00
                bne.s   byte_53EC2      
                txt     $238            ; "This west tower leads to{N}the Ancient Tower.{W2}"
                setFlg  $100            ; TEMP FLAG #00
byte_53EC2:
                
                txt     $239            ; "The Ancient Tower is a{N}sacred place where only the{N}King can go.{W1}"
                bra.s   return_53EDC
byte_53EC8:
                
                txt     $243            ; "Sir Astral is already{N}inside the tower.  Hurry!{W1}"
                chkFlg  $100            ; TEMP FLAG #00
                bne.s   return_53EDC
                script  cs_53EF4
                setFlg  $100            ; TEMP FLAG #00
return_53EDC:
                
                rts

    ; End of function Map21_EntityEvent0


; =============== S U B R O U T I N E =======================================

Map21_1F5_EntityEvent0:
                
                move.w  ((SPEECH_SFX-$1000000)).w,((SPEECH_SFX_BACKUP-$1000000)).w
                clr.w   ((SPEECH_SFX-$1000000)).w
                txt     $244            ; "He's fainted.{W1}"
                rts

    ; End of function Map21_1F5_EntityEvent0


; =============== S U B R O U T I N E =======================================

Map21_261_EntityEvent0:
                
                 
                txt     $245            ; "It was a devil!{N}I don't want to stand{N}here any more!{W2}{N}Hey, you!  Can you stand{N}guard for me here?{W1}"
Map21_DefaultEntityEvent:
                
                rts

    ; End of function Map21_261_EntityEvent0

cs_53EF4:       entityActionsWait 128
                 moveRight 1
                endActions
                setFacing 135,DOWN
                setStoryFlag $1         ; Battle 1 unlocked
                csc_end
