
; ASM FILE data\maps\entries\map19\mapsetups\s2_entityevents_609.asm :
; 0x52F90..0x5301C : 
ms_map19_flag609_EntityEvents:
                msEntityEvent 128, DOWN, Map19_261_EntityEvent0-ms_map19_flag609_EntityEvents
                msEntityEvent 129, DOWN, Map19_261_EntityEvent1-ms_map19_flag609_EntityEvents
                msEntityEvent 130, DOWN, Map19_261_EntityEvent2-ms_map19_flag609_EntityEvents
                msEntityEvent 131, DOWN, (Map19_EntityEvent1-ms_map19_flag609_EntityEvents) & $FFFF
                msEntityEvent 133, UP, Map19_261_EntityEvent4-ms_map19_flag609_EntityEvents
                msEntityEvent 132, UP, (Map19_EntityEvent2-ms_map19_flag609_EntityEvents) & $FFFF
                msEntityEvent 134, RIGHT, Map19_261_EntityEvent6-ms_map19_flag609_EntityEvents
                msEntityEvent 135, UP, Map19_261_EntityEvent7-ms_map19_flag609_EntityEvents
                msEntityEvent 136, DOWN, Map19_261_EntityEvent8-ms_map19_flag609_EntityEvents
                msEntityEvent 137, UP, Map19_261_EntityEvent9-ms_map19_flag609_EntityEvents
                msEntityEvent 138, DOWN, Map19_261_EntityEvent10-ms_map19_flag609_EntityEvents
                msEntityEvent 139, UP, Map19_261_EntityEvent11-ms_map19_flag609_EntityEvents
                msEntityEvent 140, UP, Map19_261_EntityEvent12-ms_map19_flag609_EntityEvents
                msDefaultEntityEvent (Map19_DefaultEntityEvent-ms_map19_flag609_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================


Map19_261_EntityEvent0:
                
                 
                txt     609             ; "Very few people know{N}about the sickness, even{N}in the castle.{W2}{N}Know what I mean?{W1}"
                rts

    ; End of function Map19_261_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map19_261_EntityEvent1:
                
                 
                chkFlg  257             ; TEMP FLAG #01
                bne.s   byte_52FDC      
                txt     610             ; "Sir Astral is sleeping in{N}the King's bedroom.{W2}{N}He needs some more rest{N}because he is so old.{W2}"
                setFlg  257             ; TEMP FLAG #01
byte_52FDC:
                
                txt     611             ; "Why don't you see him{N}before you leave?{N}He would be pleased.{W1}"
                rts

    ; End of function Map19_261_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map19_261_EntityEvent6:
                
                 
                txt     612             ; "I have not seen{N}Princess Elis today.{N}Is she OK?{W1}"
                rts

    ; End of function Map19_261_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map19_261_EntityEvent4:
                
                 
                txt     613             ; "Darn!{N}I can't sleep!{N}He keeps snoring!{W1}"
                rts

    ; End of function Map19_261_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map19_261_EntityEvent2:
                
                 
                txt     614             ; "The Galam messenger just{N}went back to his country.{N}He looked so pale.{W2}{N}I hope he gets to Galam{N}safely?{W1}"
                rts

    ; End of function Map19_261_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map19_261_EntityEvent7:
                
                 
                txt     615             ; "Breakfast is over and now{N}I have to make lunch!{N}Busy, busy!{W1}"
                rts

    ; End of function Map19_261_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map19_261_EntityEvent8:
                
                 
                txt     616             ; "The messenger from Galam{N}has left.{W2}{N}He was in such hurry.{W1}"
                rts

    ; End of function Map19_261_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map19_261_EntityEvent9:
                
                 
                txt     617             ; "Yeel?  Yes, it's a small{N}village near the mountains.{N}Travel northwest to get there.{W1}"
                rts

    ; End of function Map19_261_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map19_261_EntityEvent10:
                
                 
                txt     759             ; "You are the pupils of{N}Sir Astral.  We are counting{N}on you.{W2}{N}Good luck.{W1}"
                rts

    ; End of function Map19_261_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map19_261_EntityEvent11:
                
                 
                txt     599             ; "The Ancient Tower was{N}originally called{N}Ground Seal.{W2}{N}Our kingdom seems to have{N}been named after it.{W2}"
                txt     600             ; "Why?  I don't know why.{N}It was already there when{N}our ancestors settled here.{W1}"
                rts

    ; End of function Map19_261_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map19_261_EntityEvent12:
                
                 
                txt     758             ; "Thank you.{N}Depart to fetch Hawel{N}immediately.{W1}"
                rts

    ; End of function Map19_261_EntityEvent12

