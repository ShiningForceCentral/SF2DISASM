
; ASM FILE data\maps\entries\map37\mapsetups\s2_entityevents.asm :
; 0x5F86C..0x5F9D2 : 
ms_map37_EntityEvents:
                msEntityEvent ALLY_SARAH, DOWN, Map37_EntityEvent0-ms_map37_EntityEvents
                msEntityEvent ALLY_CHESTER, DOWN, Map37_EntityEvent1-ms_map37_EntityEvents
                msEntityEvent ALLY_JAHA, DOWN, Map37_EntityEvent2-ms_map37_EntityEvents
                msEntityEvent ALLY_KAZIN, DOWN, Map37_EntityEvent3-ms_map37_EntityEvents
                msEntityEvent ALLY_SLADE, DOWN, Map37_EntityEvent4-ms_map37_EntityEvents
                msEntityEvent ALLY_KIWI, DOWN, Map37_EntityEvent5-ms_map37_EntityEvents
                msEntityEvent ALLY_PETER, DOWN, Map37_EntityEvent6-ms_map37_EntityEvents
                msEntityEvent ALLY_MAY, DOWN, Map37_EntityEvent7-ms_map37_EntityEvents
                msEntityEvent ALLY_GERHALT, DOWN, Map37_EntityEvent8-ms_map37_EntityEvents
                msEntityEvent ALLY_LUKE, DOWN, Map37_EntityEvent9-ms_map37_EntityEvents
                msEntityEvent ALLY_ROHDE, DOWN, Map37_EntityEvent10-ms_map37_EntityEvents
                msEntityEvent ALLY_RICK, DOWN, Map37_EntityEvent11-ms_map37_EntityEvents
                msEntityEvent ALLY_ELRIC, DOWN, Map37_EntityEvent12-ms_map37_EntityEvents
                msEntityEvent ALLY_ERIC, DOWN, Map37_EntityEvent13-ms_map37_EntityEvents
                msEntityEvent ALLY_KARNA, DOWN, Map37_EntityEvent14-ms_map37_EntityEvents
                msEntityEvent ALLY_RANDOLF, DOWN, Map37_EntityEvent15-ms_map37_EntityEvents
                msEntityEvent ALLY_TYRIN, DOWN, Map37_EntityEvent16-ms_map37_EntityEvents
                msEntityEvent ALLY_JANET, DOWN, Map37_EntityEvent17-ms_map37_EntityEvents
                msEntityEvent ALLY_HIGINS, DOWN, Map37_EntityEvent18-ms_map37_EntityEvents
                msEntityEvent ALLY_SKREECH, DOWN, Map37_EntityEvent19-ms_map37_EntityEvents
                msEntityEvent ALLY_TAYA, DOWN, Map37_EntityEvent20-ms_map37_EntityEvents
                msEntityEvent ALLY_FRAYJA, DOWN, Map37_EntityEvent21-ms_map37_EntityEvents
                msEntityEvent ALLY_JARO, DOWN, Map37_EntityEvent22-ms_map37_EntityEvents
                msEntityEvent ALLY_GYAN, DOWN, Map37_EntityEvent23-ms_map37_EntityEvents
                msEntityEvent ALLY_ZYNK, UP, Map37_EntityEvent24-ms_map37_EntityEvents
                msEntityEvent ALLY_CLAUDE, DOWN, Map37_EntityEvent25-ms_map37_EntityEvents
                msEntityEvent 128, DOWN, Map37_EntityEvent26-ms_map37_EntityEvents
                msEntityEvent 129, RIGHT, Map37_EntityEvent27-ms_map37_EntityEvents
                msDefaultEntityEvent Map37_DefaultEntityEvent-ms_map37_EntityEvents

; =============== S U B R O U T I N E =======================================


Map37_EntityEvent0:
                
                moveq   #ALLY_SARAH,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent1:
                
                moveq   #ALLY_CHESTER,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent2:
                
                moveq   #ALLY_JAHA,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent3:
                
                moveq   #ALLY_KAZIN,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent4:
                
                moveq   #ALLY_SLADE,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent5:
                
                moveq   #ALLY_KIWI,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent6:
                
                moveq   #ALLY_PETER,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent7:
                
                moveq   #ALLY_MAY,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent8:
                
                moveq   #ALLY_GERHALT,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent9:
                
                moveq   #ALLY_LUKE,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent10:
                
                moveq   #ALLY_ROHDE,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent11:
                
                moveq   #ALLY_RICK,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent12:
                
                moveq   #ALLY_ELRIC,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent12


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent13:
                
                moveq   #ALLY_ERIC,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent13


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent14:
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                jmp     SoundTest
            else
                moveq   #ALLY_KARNA,d0
                jmp     DisplayTacticalBaseQuote
            endif

    ; End of function Map37_EntityEvent14


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent15:
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                move.w  ((TEST_BUILD_CURRENT_MESSAGE-$1000000)).w,d0
                cmpi.w  #MESSAGES_MAX_INDEX,d0
                bhi.s   @Continue
                move.w  #MESSAGES_MAX_INDEX,d0
@Continue:      moveq   #0,d1
                move.w  #MESSAGES_MAX_INDEX,d2
                jsr     NumberPrompt
                bmi.s   @Return
                move.w  d0,((TEST_BUILD_CURRENT_MESSAGE-$1000000)).w
                jsr     (DisplayText).w
@Return:        rts
            else
                moveq   #ALLY_RANDOLF,d0
                jmp     DisplayTacticalBaseQuote
            endif

    ; End of function Map37_EntityEvent15


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent16:
                
                moveq   #ALLY_TYRIN,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent16


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent17:
                
                moveq   #ALLY_JANET,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent17


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent18:
                
                moveq   #ALLY_HIGINS,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent18


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent19:
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                jmp     RenameAllAllies
            else
                moveq   #ALLY_SKREECH,d0
                jmp     DisplayTacticalBaseQuote
            endif

    ; End of function Map37_EntityEvent19


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent20:
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                jmp     StartMapTest
            else
                moveq   #ALLY_TAYA,d0
                jmp     DisplayTacticalBaseQuote
            endif

    ; End of function Map37_EntityEvent20


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent21:
                
                moveq   #ALLY_FRAYJA,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent21


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent22:
                
                moveq   #ALLY_JARO,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent22


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent23:
                
                moveq   #ALLY_GYAN,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent23


; =============== S U B R O U T I N E =======================================


sub_5F9A0:
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                jmp     StartBattleTest
            else
                moveq   #ALLY_SHEELA,d0
                jmp     DisplayTacticalBaseQuote
            endif

    ; End of function sub_5F9A0


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent24:
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                jmp     StartConfiguration
            else
                txt     3376            ; "You can start the ship by{N}placing the Sky Orb into{N}the cockpit.{W1}"
                rts
            endif

    ; End of function Map37_EntityEvent24


; =============== S U B R O U T I N E =======================================


sub_5F9AE:
                
                moveq   #ALLY_CHAZ,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function sub_5F9AE


; =============== S U B R O U T I N E =======================================


sub_5F9B6:
                
                moveq   #ALLY_LEMON,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function sub_5F9B6


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent25:
                
                moveq   #ALLY_CLAUDE,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map37_EntityEvent25


; =============== S U B R O U T I N E =======================================


sub_5F9C6:
                
                 
                txt     11              ; "{LEADER}, take it easy!{W1}"
                rts

    ; End of function sub_5F9C6


; =============== S U B R O U T I N E =======================================


Map37_EntityEvent26:
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                jsr     CaravanMenu
                txt     460             ; "Shop number?{D1}"
                moveq   #SHOP_DEBUG,d0
                moveq   #0,d1
                moveq   #SHOPS_MAX_INDEX,d2
                jsr     NumberPrompt
                bmi.s   @Skip
                move.b  d0,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     ShopMenu
@Skip:          jmp     ChurchMenu
            else
                txt     11              ; "{LEADER}, take it easy!{W1}"
            endif
Map37_EntityEvent27:
                
                rts

    ; End of function Map37_EntityEvent26

