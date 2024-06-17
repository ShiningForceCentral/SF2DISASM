
; ASM FILE data\maps\entries\map36\mapsetups\s2_entityevents.asm :
; 0x5D84A..0x5D924 : 
ms_map36_EntityEvents:
                msEntityEvent ALLY_FRAYJA, UP, Map36_EntityEvent0-ms_map36_EntityEvents
                msEntityEvent 128, UP, Map36_EntityEvent1-ms_map36_EntityEvents
                msEntityEvent 129, UP, Map36_EntityEvent2-ms_map36_EntityEvents
                msEntityEvent 130, UP, Map36_EntityEvent3-ms_map36_EntityEvents
                msEntityEvent 131, UP, Map36_EntityEvent4-ms_map36_EntityEvents
                msEntityEvent 132, UP, Map36_EntityEvent5-ms_map36_EntityEvents
                msEntityEvent 133, UP, Map36_EntityEvent6-ms_map36_EntityEvents
                msEntityEvent 134, UP, Map36_EntityEvent7-ms_map36_EntityEvents
                msEntityEvent 135, UP, Map36_EntityEvent8-ms_map36_EntityEvents
                msEntityEvent 136, UP, Map36_EntityEvent9-ms_map36_EntityEvents
                msEntityEvent 137, UP, Map36_EntityEvent10-ms_map36_EntityEvents
                msEntityEvent 138, UP, Map36_EntityEvent11-ms_map36_EntityEvents
                msEntityEvent 139, UP, Map36_EntityEvent12-ms_map36_EntityEvents
                msDefaultEntityEvent Map36_DefaultEntityEvent-ms_map36_EntityEvents

; =============== S U B R O U T I N E =======================================


Map36_DefaultEntityEvent:
                
                rts

    ; End of function Map36_DefaultEntityEvent


; =============== S U B R O U T I N E =======================================


Map36_EntityEvent1:
                
                 
                txt     3281            ; "Are you from South Parmecia?{N}Oh, great!{W1}"
                rts

    ; End of function Map36_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map36_EntityEvent2:
                
                 
                txt     3282            ; "It's been dry here since the{N}devils appeared.{W2}"
                txt     3283            ; "They must have done something{N}to Goddess Mitula!{W1}"
                rts

    ; End of function Map36_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map36_EntityEvent3:
                
                 
                txt     3284            ; "Brave Pacalons?{W2}"
                txt     3285            ; "None at all.  There are no{N}soldiers who can fight{N}against the devils.{W1}"
                rts

    ; End of function Map36_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map36_EntityEvent4:
                
                 
                chkFlg  810             ; Set after speaking to a centaur at Pacalon castle (the one who moves and shivers)
                bne.s   byte_5D8B6      
                txt     3286            ; "Devils are coming to town?{N}OK, I'll beat them up!{W1}"
                clsTxt
                script  cs_5DA7A
                setFlg  810             ; Set after speaking to a centaur at Pacalon castle (the one who moves and shivers)
byte_5D8B6:
                
                txt     3287            ; "Oh, I can't.  I'm too hungry!{W1}"
                rts

    ; End of function Map36_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map36_EntityEvent5:
                
                 
                txt     3288            ; "They came from Nazca, which{N}is west of Moun.{W2}"
                txt     3289            ; "We locked the gate of Moun{N}to stop their progress.{W2}"
                txt     3290            ; "Vicar {NAME;22} has the{N}key to open the gate.{W1}"
                rts

    ; End of function Map36_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map36_EntityEvent6:
                
                 
                txt     3291            ; "Devils came to Pacalon{N}through Moun.{W2}"
                txt     3292            ; "We blocked the invaders{N}by locking the gate of Moun.{W2}"
                txt     3293            ; "That means, we abandoned{N}the people living there.{W1}"
                rts

    ; End of function Map36_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map36_EntityEvent7:
                
                 
                txt     3294            ; "We don't have enough food{N}because of the long drought.{W2}"
                txt     3295            ; "Just one rainfall would make{N}us happy.{W1}"
                rts

    ; End of function Map36_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map36_EntityEvent8:
                
                 
                txt     3296            ; "{NAME;19} asked you to drop{N}by here?  Thank you!{W2}"
                txt     3297            ; "May I ask you a favor?{N}Please save Mitula.{N}She's in Tristan.{W2}"
                txt     3298            ; "We will be ruined by the{N}drought long before the{N}devils destroy us.{W1}"
                rts

    ; End of function Map36_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map36_EntityEvent9:
                
                 
                txt     3299            ; "You'll see a route through{N}the mountains when you go{N}north from here.{W2}"
                txt     3300            ; "You can get to Tristan by{N}traveling along that route.{W1}"
                rts

    ; End of function Map36_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map36_EntityEvent0:
                
                 
                txt     3301            ; "I committed a sin....{W2}"
                txt     3302            ; "I abandoned the people of{N}Moun to protect the{N}Parmecia continent.{W1}"
                rts

    ; End of function Map36_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map36_EntityEvent10:
                
                 
                txt     3303            ; "What happened to the{N}soldiers who went into{N}Mitula's Shrine?{W2}"
                txt     3304            ; "Were they all killed?{W1}"
                rts

    ; End of function Map36_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map36_EntityEvent11:
                
                 
                txt     3305            ; "I saw it!{W2}"
                txt     3306            ; "The Princess ate food in the{N}kitchen one night.{W2}"
                txt     3307            ; "I didn't wish to see such{N}an uncouth princess.{W1}"
                rts

    ; End of function Map36_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map36_EntityEvent12:
                
                jsr     j_ChurchMenu
                rts

    ; End of function Map36_EntityEvent12

