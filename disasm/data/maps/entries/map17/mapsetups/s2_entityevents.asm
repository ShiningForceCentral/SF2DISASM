
; ASM FILE data\maps\entries\map17\mapsetups\s2_entityevents.asm :
; 0x5231C..0x523E4 : 
ms_map17_EntityEvents:
                msEntityEvent 128, DOWN, Map17_EntityEvent0-ms_map17_EntityEvents
                msEntityEvent 129, UP, Map17_EntityEvent1-ms_map17_EntityEvents
                msEntityEvent 130, DOWN, Map17_EntityEvent2-ms_map17_EntityEvents
                msEntityEvent 131, UP, Map17_EntityEvent3-ms_map17_EntityEvents
                msEntityEvent 132, DOWN, Map17_EntityEvent4-ms_map17_EntityEvents
                msEntityEvent 133, DOWN, Map17_EntityEvent5-ms_map17_EntityEvents
                msEntityEvent 134, DOWN, Map17_EntityEvent6-ms_map17_EntityEvents
                msEntityEvent ALLY_CHESTER, DOWN, Map17_EntityEvent7-ms_map17_EntityEvents
                msEntityEvent ALLY_JAHA, DOWN, Map17_EntityEvent8-ms_map17_EntityEvents
                msEntityEvent ALLY_SARAH, DOWN, Map17_EntityEvent9-ms_map17_EntityEvents
                msEntityEvent ALLY_KAZIN, DOWN, Map17_EntityEvent10-ms_map17_EntityEvents
                msEntityEvent ALLY_SLADE, RIGHT, Map17_EntityEvent11-ms_map17_EntityEvents
                msDefaultEntityEvent Map17_DefaultEntityEvent-ms_map17_EntityEvents

; =============== S U B R O U T I N E =======================================


Map17_EntityEvent9:
                
                rts

    ; End of function Map17_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map17_EntityEvent7:
                
                 
                chkFlg  661             ; Set after prison scene, ending in Slade unlocking/Sarah accusing
                bne.s   return_5235C
                txt     893             ; "We're talking about{N}Ground Seal.{N}Please, join in.{W1}"
return_5235C:
                
                rts

    ; End of function Map17_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map17_EntityEvent8:
                
                 
                chkFlg  661             ; Set after prison scene, ending in Slade unlocking/Sarah accusing
                bne.s   return_52368
                txt     896             ; "Hey!  Don't interrupt!{N}Sit down next to me!{W1}"
return_52368:
                
                rts

    ; End of function Map17_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map17_EntityEvent10:
                
                 
                chkFlg  661             ; Set after prison scene, ending in Slade unlocking/Sarah accusing
                bne.s   return_52374
                txt     895             ; "Hey, {LEADER}!{N}King Galam also knows about{N}Ground Seal!{W1}"
return_52374:
                
                rts

    ; End of function Map17_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map17_EntityEvent11:
                
                 
                txt     945             ; "I didn't mean to...{W1}"
                rts

    ; End of function Map17_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map17_EntityEvent0:
                
                 
                txt     835             ; "This is the treasure room!{N}You may not pass!{W1}"
                rts

    ; End of function Map17_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map17_EntityEvent1:
                
                 
                txt     836             ; "It's true that the messenger{N}met with an unnatural death.{W2}"
                txt     837             ; "But, that doesn't mean that{N}Granseal did it....{W2}"
                txt     838             ; "I don't understand.{N}Why is King Galam so{N}impatient?{W1}"
                rts

    ; End of function Map17_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map17_EntityEvent2:
                
                 
                txt     839             ; "When the messenger was found{N}dead, the King suffured a{N}great deal of pain.{W2}"
                txt     840             ; "Thank goodness, he{N}recovered quickly.{W2}"
                txt     841             ; "It's Granseals fault!{W2}"
                txt     842             ; "I believe in my King!{W1}"
                rts

    ; End of function Map17_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map17_EntityEvent4:
                
                 
                chkFlg  661             ; Set after prison scene, ending in Slade unlocking/Sarah accusing
                bne.s   byte_523AE      
                txt     894             ; "You got a raw deal, huh?{N}The same thing happened to{N}the rat next door.{W1}"
                bra.s   return_523B2
byte_523AE:
                
                txt     897             ; "There are a lot of Galam{N}soldiers upstairs.{N}You still want to go?{W1}"
return_523B2:
                
                rts

    ; End of function Map17_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map17_EntityEvent5:
                
                 
                txt     898             ; "You're so brave.{N}Good luck!{W1}"
                rts

    ; End of function Map17_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map17_EntityEvent3:
                
                 
                chkFlg  256             ; TEMP FLAG #00
                bne.s   byte_523CC      
                script  cs_52A3C
                setFlg  256             ; TEMP FLAG #00
                bra.s   return_523D0
byte_523CC:
                
                txt     899             ; "Don't tell anybody{N}that I neglected my work.{N}If you do{D1}.{D1}.{D1}.{D1}I'll kill you!{W1}"
return_523D0:
                
                rts

    ; End of function Map17_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map17_EntityEvent6:
                
                 
                txt     900             ; "Oh, I'm so busy!{W1}"
                rts

    ; End of function Map17_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map17_DefaultEntityEvent:
                
                rts

    ; End of function Map17_DefaultEntityEvent


; =============== S U B R O U T I N E =======================================


sub_523DA:
                
                 
                txt     900             ; "Oh, I'm so busy!{W1}"
                txt     900             ; "Oh, I'm so busy!{W1}"
                rts

    ; End of function sub_523DA

