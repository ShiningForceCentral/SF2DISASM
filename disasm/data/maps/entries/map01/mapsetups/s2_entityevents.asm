
; ASM FILE data\maps\entries\map01\mapsetups\s2_entityevents.asm :
; 0x5E694..0x5E720 : 
ms_map1_EntityEvents:
                msEntityEvent 128, UP, Map1_EntityEvent0-ms_map1_EntityEvents
                msEntityEvent 129, UP, Map1_EntityEvent1-ms_map1_EntityEvents
                msEntityEvent 130, UP, Map1_EntityEvent2-ms_map1_EntityEvents
                msEntityEvent 131, UP, Map1_EntityEvent3-ms_map1_EntityEvents
                msEntityEvent 132, UP, Map1_EntityEvent4-ms_map1_EntityEvents
                msEntityEvent 133, UP, Map1_EntityEvent5-ms_map1_EntityEvents
                msEntityEvent 134, UP, Map1_EntityEvent6-ms_map1_EntityEvents
                msEntityEvent 135, UP, Map1_EntityEvent7-ms_map1_EntityEvents
                msEntityEvent 136, UP, Map1_EntityEvent8-ms_map1_EntityEvents
                msDefaultEntityEvent Map1_DefaultEntityEvent-ms_map1_EntityEvents

; =============== S U B R O U T I N E =======================================


Map1_DefaultEntityEvent:
                
                rts

    ; End of function Map1_DefaultEntityEvent


; =============== S U B R O U T I N E =======================================


Map1_EntityEvent0:
                
                 
                txt     3665            ; "Arc Valley is a dark place{N}where evil gathers.{W2}"
                txt     3666            ; "He who rules Arc Valley is{N}the King of the Devils.{W1}"
                rts

    ; End of function Map1_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map1_EntityEvent1:
                
                 
                txt     3667            ; "Dark Sol, Dark Dragon and{N}Zeon fought desperately to{N}obtain Arc Valley.{W2}"
                txt     3668            ; "The fighting of the devil{N}kings created a mighty storm.{W1}"
                rts

    ; End of function Map1_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map1_EntityEvent2:
                
                 
                txt     3669            ; "Zeon won.  And every devil{N}named him the King of the{N}Devils.{W2}"
                txt     3670            ; "The other two kings envied{N}Zeon.  They sealed his powers{N}inside the Jewel of Evil.{W1}"
                rts

    ; End of function Map1_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map1_EntityEvent3:
                
                 
                txt     3671            ; "When Zeon lost his powers,{N}he fell to Earth, and created{N}a giant crater when he hit.{W2}"
                txt     3672            ; "His moan destroyed the{N}mountains and the crater{N}was buried by the debris.{W1}"
                rts

    ; End of function Map1_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map1_EntityEvent4:
                
                 
                txt     3673            ; "Grieving over the fight, the{N}God of Wisdom created the{N}Jewel of Light.{W2}"
                txt     3674            ; "The Jewel of Light chose a{N}brave man and gave him a{N}Holy Sword.{W1}"
                rts

    ; End of function Map1_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map1_EntityEvent5:
                
                 
                txt     3675            ; "With the Holy Sword in{N}hand, the brave man fought{N}against the two devil kings.{W2}"
                txt     3676            ; "The Holy Sword contained{N}holy power.  Thus, the two{N}devil kings were defeated.{W1}"
                rts

    ; End of function Map1_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map1_EntityEvent6:
                
                 
                txt     3677            ; "Evil Arc Valley was sealed{N}beneath the Ancient Tower.{W2}"
                txt     3678            ; "Never open the door to the{N}tower.  A great evil sleeps{N}inside.{W1}"
                rts

    ; End of function Map1_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map1_EntityEvent7:
                
                 
                txt     3679            ; "In the event of Zeon{N}awakening, the power of light{N}will choose another.{W2}"
                txt     3680            ; "Believe us.  We lie not.{N}Attack the devil at his mouth{N}with the Holy Sword.{W1}"
                rts

    ; End of function Map1_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map1_EntityEvent8:
                
                 
                chkFlg  841             ; Set after the Taya join scene has played inside the Mitula Shrine
                bne.s   return_5E71E
                script  cs_5E772
                setFlg  841             ; Set after the Taya join scene has played inside the Mitula Shrine
return_5E71E:
                
                rts

    ; End of function Map1_EntityEvent8

