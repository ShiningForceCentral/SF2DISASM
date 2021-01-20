
; ASM FILE data\maps\entries\map20\mapsetups\s2_entityevents.asm :
; 0x537AC..0x53830 : 
ms_map20_EntityEvents:
                msEntityEvent 128, RIGHT, Map20_EntityEvent0-ms_map20_EntityEvents
                msEntityEvent 129, RIGHT, Map20_EntityEvent1-ms_map20_EntityEvents
                msEntityEvent 131, DOWN, Map20_EntityEvent2-ms_map20_EntityEvents
                msEntityEvent 132, DOWN, Map20_EntityEvent3-ms_map20_EntityEvents
                msEntityEvent 133, DOWN, Map20_EntityEvent4-ms_map20_EntityEvents
                msEntityEvent 134, DOWN, Map20_EntityEvent5-ms_map20_EntityEvents
                msEntityEvent 135, DOWN, Map20_EntityEvent6-ms_map20_EntityEvents
                msDefaultEntityEvent Map20_DefaultEntityEvent-ms_map20_EntityEvents

; =============== S U B R O U T I N E =======================================


Map20_EntityEvent2:
                
                 
                chkFlg  256             ; TEMP FLAG #00
                bne.s   byte_537DA      
                txt     570             ; "Legend regarding the{N}tower?  Mmmm, do I have{N}"
                setFlg  256             ; TEMP FLAG #00
byte_537DA:
                
                txt     571             ; "to go to school again?{W1}"
                rts

    ; End of function Map20_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map20_EntityEvent1:
                
                 
                txt     572             ; "Oh, father...are you{N}alright?{W1}"
                rts

    ; End of function Map20_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map20_EntityEvent0:
                
                 
                txt     573             ; "Mmmmm....{N}Hmmmmmm....{W1}"
                rts

    ; End of function Map20_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map20_EntityEvent3:
                
                 
                txt     567             ; "How fine the view is!{N}I can see the eastern{N}continent from here.{W1}"
                rts

    ; End of function Map20_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map20_EntityEvent4:
                
                 
                txt     566             ; "This east tower was built{N}in order to watch for{N}invaders.{W1}"
                rts

    ; End of function Map20_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map20_EntityEvent5:
                
                 
                txt     563             ; "It has been very{N}warm lately.{W1}"
                rts

    ; End of function Map20_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map20_EntityEvent6:
                
                 
                chkFlg  257             ; TEMP FLAG #01
                bne.s   byte_53810      
                script  cs_53816
                setFlg  257             ; TEMP FLAG #01
                bra.s   Map20_DefaultEntityEvent
byte_53810:
                
                txt     565             ; "Boys are not allowed{N}to come into our dressing{N}room!!{W1}"
Map20_DefaultEntityEvent:
                
                rts

    ; End of function Map20_EntityEvent6

cs_53816:       textCursor 564
                setActscriptWait 135,eas_Jump
                setFacing 135,LEFT
                nextText $0,135         ; "(Scream!)...who are you?!{N}Get out of here!{W2}"
                nextText $0,135         ; "Boys are not allowed{N}to come into our dressing{N}room!!{W1}"
                csc_end
