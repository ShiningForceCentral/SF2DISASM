
; ASM FILE data\maps\entries\map46\mapsetups\s2_entityevents.asm :
; 0x5C0F8..0x5C264 : 
ms_map46_EntityEvents:
                msEntityEvent ALLY_SARAH, UP, Map46_EntityEvent0-ms_map46_EntityEvents
                msEntityEvent ALLY_CHESTER, UP, Map46_EntityEvent1-ms_map46_EntityEvents
                msEntityEvent ALLY_JAHA, UP, Map46_EntityEvent2-ms_map46_EntityEvents
                msEntityEvent ALLY_KAZIN, UP, Map46_EntityEvent3-ms_map46_EntityEvents
                msEntityEvent ALLY_SLADE, UP, Map46_EntityEvent4-ms_map46_EntityEvents
                msEntityEvent ALLY_KIWI, UP, Map46_EntityEvent5-ms_map46_EntityEvents
                msEntityEvent ALLY_PETER, UP, Map46_EntityEvent6-ms_map46_EntityEvents
                msEntityEvent ALLY_MAY, UP, Map46_EntityEvent7-ms_map46_EntityEvents
                msEntityEvent ALLY_GERHALT, UP, Map46_EntityEvent8-ms_map46_EntityEvents
                msEntityEvent ALLY_LUKE, UP, Map46_EntityEvent9-ms_map46_EntityEvents
                msEntityEvent ALLY_ROHDE, UP, Map46_EntityEvent10-ms_map46_EntityEvents
                msEntityEvent ALLY_RICK, UP, Map46_EntityEvent11-ms_map46_EntityEvents
                msEntityEvent ALLY_ELRIC, UP, Map46_EntityEvent12-ms_map46_EntityEvents
                msEntityEvent ALLY_ERIC, UP, Map46_EntityEvent13-ms_map46_EntityEvents
                msEntityEvent ALLY_KARNA, UP, Map46_EntityEvent14-ms_map46_EntityEvents
                msEntityEvent ALLY_RANDOLF, UP, Map46_EntityEvent15-ms_map46_EntityEvents
                msEntityEvent ALLY_TYRIN, UP, Map46_EntityEvent16-ms_map46_EntityEvents
                msEntityEvent ALLY_JANET, UP, Map46_EntityEvent17-ms_map46_EntityEvents
                msEntityEvent ALLY_HIGINS, UP, Map46_EntityEvent18-ms_map46_EntityEvents
                msEntityEvent ALLY_SKREECH, UP, Map46_EntityEvent19-ms_map46_EntityEvents
                msEntityEvent ALLY_TAYA, UP, Map46_EntityEvent20-ms_map46_EntityEvents
                msEntityEvent ALLY_FRAYJA, UP, Map46_EntityEvent21-ms_map46_EntityEvents
                msEntityEvent ALLY_JARO, UP, Map46_EntityEvent22-ms_map46_EntityEvents
                msEntityEvent ALLY_GYAN, UP, Map46_EntityEvent23-ms_map46_EntityEvents
                msEntityEvent ALLY_SHEELA, UP, Map46_EntityEvent24-ms_map46_EntityEvents
                msEntityEvent ALLY_ZYNK, UP, Map46_EntityEvent25-ms_map46_EntityEvents
                msEntityEvent ALLY_CHAZ, UP, Map46_EntityEvent26-ms_map46_EntityEvents
                msEntityEvent ALLY_LEMON, UP, Map46_EntityEvent27-ms_map46_EntityEvents
                msEntityEvent ALLY_CLAUDE, UP, Map46_EntityEvent28-ms_map46_EntityEvents
                msEntityEvent 128, UP, Map46_EntityEvent29-ms_map46_EntityEvents
                msDefaultEntityEvent Map46_DefaultEntityEvent-ms_map46_EntityEvents

; =============== S U B R O U T I N E =======================================


Map46_EntityEvent0:
                
                moveq   #ALLY_SARAH,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent1:
                
                moveq   #ALLY_CHESTER,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent2:
                
                moveq   #ALLY_JAHA,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent3:
                
                moveq   #ALLY_KAZIN,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent3


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent4:
                
                moveq   #ALLY_SLADE,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent5:
                
                moveq   #ALLY_KIWI,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent6:
                
                moveq   #ALLY_PETER,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent6


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent7:
                
                moveq   #ALLY_MAY,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent7


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent8:
                
                moveq   #ALLY_GERHALT,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent8


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent9:
                
                moveq   #ALLY_LUKE,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent9


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent10:
                
                moveq   #ALLY_ROHDE,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent10


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent11:
                
                moveq   #ALLY_RICK,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent11


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent12:
                
                moveq   #ALLY_ELRIC,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent12


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent13:
                
                moveq   #ALLY_ERIC,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent13


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent14:
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                jmp     SoundTest
            else
                moveq   #ALLY_KARNA,d0
                jmp     DisplayTacticalBaseQuote
            endif

    ; End of function Map46_EntityEvent14


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent15:
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                move.w  ((TEST_BUILD_CURRENT_MESSAGE-$1000000)).w,d0
                cmpi.w  #MESSAGES_MAX_INDEX,d0
                bls.s   @Continue
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

    ; End of function Map46_EntityEvent15


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent16:
                
                moveq   #ALLY_TYRIN,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent16


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent17:
                
                moveq   #ALLY_JANET,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent17


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent18:
                
                moveq   #ALLY_HIGINS,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent18


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent19:
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                jmp     RenameAllAllies
            else
                moveq   #ALLY_SKREECH,d0
                jmp     DisplayTacticalBaseQuote
            endif

    ; End of function Map46_EntityEvent19


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent20:
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                jmp     StartMapTest
            else
                moveq   #ALLY_TAYA,d0
                jmp     DisplayTacticalBaseQuote
            endif

    ; End of function Map46_EntityEvent20


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent21:
                
                moveq   #ALLY_FRAYJA,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent21


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent22:
                
                moveq   #ALLY_JARO,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent22


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent23:
                
                moveq   #ALLY_GYAN,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent23


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent24:
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                jmp     StartBattleTest
            else
                moveq   #ALLY_SHEELA,d0
                jmp     DisplayTacticalBaseQuote
            endif

    ; End of function Map46_EntityEvent24


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent25:
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                jmp     StartConfiguration
            else
                moveq   #ALLY_ZYNK,d0
                jmp     DisplayTacticalBaseQuote
            endif

    ; End of function Map46_EntityEvent25


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent26:
                
                moveq   #ALLY_CHAZ,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent26


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent27:
                
                moveq   #ALLY_LEMON,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent27


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent28:
                
                moveq   #ALLY_CLAUDE,d0
                jmp     DisplayTacticalBaseQuote

    ; End of function Map46_EntityEvent28


; =============== S U B R O U T I N E =======================================


Map46_EntityEvent29:
                
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
                rts
            endif

    ; End of function Map46_EntityEvent29


; =============== S U B R O U T I N E =======================================


Map46_DefaultEntityEvent:
                
                rts

    ; End of function Map46_DefaultEntityEvent

