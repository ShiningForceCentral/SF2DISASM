
; ASM FILE data\maps\entries\map56\mapsetups\s2_entityevents.asm :
; 0x614AA..0x614D6 : 
ms_map56_EntityEvents:
                msEntityEvent 128, UP, Map56_EntityEvent0-ms_map56_EntityEvents
            if (STANDARD_BUILD&CARAVAN_IN_TOWER=1)
                msEntityEvent 129, LEFT, Map56_EntityEvent1-ms_map56_EntityEvents
            endif
                msDefaultEntityEvent Map56_DefaultEntityEvent-ms_map56_EntityEvents

; =============== S U B R O U T I N E =======================================


Map56_EntityEvent0:
                
                 
                chkFlg  903             ; Set after the first time you talk to Creed on path up Ancient Tower
                bne.s   byte_614C2      
                script  cs_6150A
                setFlg  903             ; Set after the first time you talk to Creed on path up Ancient Tower
byte_614C2:
                
                txt     3611            ; "There is no church around{N}here.  Think of me as a{N}priest.{W1}"
                txt     3612            ; "Now, what can I do for you?{W1}"
                clsTxt
                jmp     j_ChurchMenu
Map56_EntityEvent1:
                
            if (STANDARD_BUILD&CARAVAN_IN_TOWER=1)
                jmp     CaravanMenu
            endif
Map56_DefaultEntityEvent:
                
                rts

    ; End of function Map56_EntityEvent1

