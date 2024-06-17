
; ASM FILE data\maps\entries\map10\mapsetups\s2_entityevents_722.asm :
; 0x56E9C..0x56F8A : 
ms_map10_flag722_EntityEvents:
                msEntityEvent 128, DOWN, (Map10_EntityEvent0-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 129, DOWN, (Map10_EntityEvent1-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 130, RIGHT, (Map10_EntityEvent2-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 131, RIGHT, (Map10_EntityEvent3-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 132, RIGHT, (Map10_EntityEvent4-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 133, RIGHT, (Map10_EntityEvent5-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 134, RIGHT, (Map10_EntityEvent6-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 135, RIGHT, (Map10_EntityEvent7-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 136, RIGHT, (Map10_EntityEvent8-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 137, DOWN, (Map10_EntityEvent9-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 138, DOWN, (Map10_EntityEvent10-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 139, UP, (Map10_EntityEvent11-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 140, DOWN, (Map10_EntityEvent12-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 141, DOWN, (Map10_EntityEvent13-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 142, DOWN, (Map10_EntityEvent14-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 143, DOWN, (Map10_EntityEvent15-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 144, UP, (Map10_EntityEvent16-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 145, DOWN, (Map10_EntityEvent17-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 146, DOWN, (Map10_EntityEvent18-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 147, DOWN, Map10_2D2_EntityEvent19-ms_map10_flag722_EntityEvents
                msEntityEvent 148, UP, Map10_2D2_EntityEvent20-ms_map10_flag722_EntityEvents
                msEntityEvent 149, DOWN, (Map10_EntityEvent21-ms_map10_flag722_EntityEvents) & $FFFF
                msEntityEvent 150, DOWN, Map10_2D2_EntityEvent22-ms_map10_flag722_EntityEvents
                msEntityEvent 151, DOWN, Map10_2D2_EntityEvent23-ms_map10_flag722_EntityEvents
                msEntityEvent 152, DOWN, Map10_2D2_EntityEvent24-ms_map10_flag722_EntityEvents
                msEntityEvent 153, DOWN, Map10_2D2_EntityEvent25-ms_map10_flag722_EntityEvents
                msEntityEvent ALLY_LUKE, DOWN, Map10_2D2_EntityEvent26-ms_map10_flag722_EntityEvents
                msDefaultEntityEvent (Map10_DefaultEntityEvent-ms_map10_flag722_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================


Map10_2D2_EntityEvent19:
                
                 
                chkFlg  799             ; Set after you agree to kill Zeon in Bedoe (King's yes/no dialog)
                bne.s   byte_56F3A      
                txt     1603            ; "God Volcanon has forsaken{N}the people of the Earth.{W2}"
                txt     1604            ; "Are you going to kill Zeon{N}as he demanded?{W1}"
                jsr     j_YesNoPrompt
                tst.w   d0
                bne.s   byte_56F30      
                script  cs_5797A
                setFlg  799             ; Set after you agree to kill Zeon in Bedoe (King's yes/no dialog)
                bra.s   loc_56F38
byte_56F30:
                
                txt     1605            ; "Then you may stay in Bedoe.{W2}"
                txt     1606            ; "You'll be safe here.{W1}"
loc_56F38:
                
                bra.s   return_56F3E
byte_56F3A:
                
                txt     1614            ; "{LEADER}, good luck!{W1}"
return_56F3E:
                
                rts

    ; End of function Map10_2D2_EntityEvent19


; =============== S U B R O U T I N E =======================================


Map10_2D2_EntityEvent20:
                
                 
                txt     1598            ; "We can't calm down{N}Volcanon.{W2}"
                txt     1599            ; "Without his protection, the{N}people that live on the{N}ground will perish.{W2}"
                txt     1600            ; "Only Tristan and Bedoe{N}will survive.{W1}"
                rts

    ; End of function Map10_2D2_EntityEvent20


; =============== S U B R O U T I N E =======================================


Map10_2D2_EntityEvent22:
                
                 
                txt     1594            ; "Something happened in{N}North Parmecia.{W2}"
                txt     1595            ; "I saw a strange cloud!{W1}"
                rts

    ; End of function Map10_2D2_EntityEvent22


; =============== S U B R O U T I N E =======================================


Map10_2D2_EntityEvent23:
                
                 
                txt     1596            ; "Goddess Mitula lives on the{N}north side of Tristan through{N}the mountains.{W2}"
                txt     1597            ; "The people living in Tristan{N}are kind, but weak.{N}I wonder if they are alright?{W1}"
                rts

    ; End of function Map10_2D2_EntityEvent23


; =============== S U B R O U T I N E =======================================


Map10_2D2_EntityEvent24:
                
                 
                txt     1615            ; "Shhhh!  My hatchling is{N}sleeping.  Quiet!{W1}"
                rts

    ; End of function Map10_2D2_EntityEvent24


; =============== S U B R O U T I N E =======================================


Map10_2D2_EntityEvent25:
                
                 
                chkFlg  723             ; Set after the hatchling in Bedoe shows you he can almost fly
                bne.s   byte_56F7A      
                script  cs_5766C
                setFlg  723             ; Set after the hatchling in Bedoe shows you he can almost fly
                bra.s   return_56F7E
byte_56F7A:
                
                txt     1685            ; "See.  I told you!{N}I can fly...sort of.{W1}"
return_56F7E:
                
                rts

    ; End of function Map10_2D2_EntityEvent25


; =============== S U B R O U T I N E =======================================


Map10_2D2_EntityEvent26:
                
                 
                txt     1601            ; "Volcanon was very angry,{N}wasn't he?{W2}"
                txt     1602            ; "We can no longer depend on{N}him.  We must do it{N}ourselves!{W1}"
                rts

    ; End of function Map10_2D2_EntityEvent26

