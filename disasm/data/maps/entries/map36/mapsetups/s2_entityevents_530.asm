
; ASM FILE data\maps\entries\map36\mapsetups\s2_entityevents_530.asm :
; 0x5D924..0x5D9C0 : 
ms_map36_flag530_EntityEvents:
                msEntityEvent ALLY_FRAYJA, UP, Map36_212_EntityEvent0-ms_map36_flag530_EntityEvents
                msEntityEvent 128, UP, Map36_212_EntityEvent1-ms_map36_flag530_EntityEvents
                msEntityEvent 129, UP, Map36_212_EntityEvent2-ms_map36_flag530_EntityEvents
                msEntityEvent 130, UP, Map36_212_EntityEvent3-ms_map36_flag530_EntityEvents
                msEntityEvent 131, UP, Map36_212_EntityEvent4-ms_map36_flag530_EntityEvents
                msEntityEvent 132, UP, Map36_212_EntityEvent5-ms_map36_flag530_EntityEvents
                msEntityEvent 133, UP, Map36_212_EntityEvent6-ms_map36_flag530_EntityEvents
                msEntityEvent 134, UP, Map36_212_EntityEvent7-ms_map36_flag530_EntityEvents
                msEntityEvent 135, UP, (Map36_EntityEvent6-ms_map36_flag530_EntityEvents) & $FFFF
                msEntityEvent 136, UP, Map36_212_EntityEvent9-ms_map36_flag530_EntityEvents
                msEntityEvent 137, UP, (Map36_EntityEvent12-ms_map36_flag530_EntityEvents) & $FFFF
                msDefaultEntityEvent (Map36_DefaultEntityEvent-ms_map36_flag530_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================


Map36_212_EntityEvent0:
                
                 
                chkFlg  811             ; Set after Frayja asks to go to Moun with you
                bne.s   return_5D968
                script  cs_5DA28
                setFlg  811             ; Set after Frayja asks to go to Moun with you
                setFlg  82              ; Frayja is a follower
return_5D968:
                
                rts

    ; End of function Map36_212_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map36_212_EntityEvent1:
                
                 
                txt     3308            ; "Thanks to the rain, I'm fine.{W1}"
                rts

    ; End of function Map36_212_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map36_212_EntityEvent2:
                
                 
                txt     3309            ; "The devils escaped when they{N}saw our soldiers. {W2}"
                txt     3310            ; "They're such chickens!{W1}"
                rts

    ; End of function Map36_212_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map36_212_EntityEvent3:
                
                 
                txt     3311            ; "Vicar {NAME;22} wants to go{N}to Moun and save the people.{W2}"
                txt     3312            ; "But, the devils will surge{N}into Parmecia as soon as{N}he opens the gate!{W1}"
                rts

    ; End of function Map36_212_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map36_212_EntityEvent4:
                
                 
                txt     3313            ; "I'm no longer thirsty,{N}but I'm not totally healthy{N}yet.{W1}"
                rts

    ; End of function Map36_212_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map36_212_EntityEvent5:
                
                 
                chkFlg  257             ; TEMP FLAG #01
                bne.s   byte_5D998      
                txt     3314            ; "Practice!  Who needs{N}practice?!  Ha!{W2}"
                setFlg  257             ; TEMP FLAG #01
byte_5D998:
                
                txt     3315            ; "Oooh...I can't lift this{N}spear!{W1}"
                rts

    ; End of function Map36_212_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map36_212_EntityEvent6:
                
                 
                txt     3316            ; "I just saw a warrior who{N}came from the south a year{N}ago.{W2}"
                txt     3317            ; "He was shocked to find out{N}that the tunnel was blocked,{N}and went to Moun.{W1}"
                rts

    ; End of function Map36_212_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map36_212_EntityEvent7:
                
                 
                txt     3318            ; "Thank you, strangers!{N}You saved us!{W2}"
                txt     3319            ; "But I didn't think we would{N}be saved by humans!{W1}"
                rts

    ; End of function Map36_212_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map36_212_EntityEvent9:
                
                 
                txt     3320            ; "The King is a little upset.{W2}"
                txt     3321            ; "We've always believed that{N}centaurs were the best{N}warriors.{W2}"
                txt     3322            ; "But we were wrong.{N}I understand now.{W1}"
                rts

    ; End of function Map36_212_EntityEvent9

