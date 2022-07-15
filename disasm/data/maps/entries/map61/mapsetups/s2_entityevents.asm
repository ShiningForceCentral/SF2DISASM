
; ASM FILE data\maps\entries\map61\mapsetups\s2_entityevents.asm :
; 0x5C672..0x5C696 : 
ms_map61_EntityEvents:
                msEntityEvent 128, DOWN, Map61_EntityEvent0-ms_map61_EntityEvents
                msDefaultEntityEvent Map61_DefaultEntityEvent-ms_map61_EntityEvents

; =============== S U B R O U T I N E =======================================


Map61_EntityEvent0:
                
                 
                chkFlg  256             ; TEMP FLAG #00
                bne.s   byte_5C684      
                txt     3645            ; "I'm Paseran of Ribble.{N}I'm studying the ancient{N}petroglyphs.{W2}"
byte_5C684:
                
                txt     3646            ; "{NAME;11} told me about{N}a family who has an ancient{N}tomb in Parmecia.{W2}"
                txt     3647            ; "According to my studies,{N}his house should be around{N}here somewhere.{W2}"
                txt     3648            ; "Or, maybe it's to the east.{W1}"
                setFlg  256             ; TEMP FLAG #00
Map61_DefaultEntityEvent:
                
                rts

    ; End of function Map61_EntityEvent0

