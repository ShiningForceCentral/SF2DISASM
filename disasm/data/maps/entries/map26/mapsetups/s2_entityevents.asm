
; ASM FILE data\maps\entries\map26\mapsetups\s2_entityevents.asm :
; 0x59D6A..0x59DB6 : 
ms_map26_EntityEvents:
                msEntityEvent ALLY_RANDOLF, UP, Map26_EntityEvent0-ms_map26_EntityEvents
                msEntityEvent ALLY_TYRIN, UP, Map26_EntityEvent1-ms_map26_EntityEvents
                msEntityEvent 128, UP, Map26_EntityEvent2-ms_map26_EntityEvents
                msEntityEvent 129, UP, Map26_EntityEvent3-ms_map26_EntityEvents
                msEntityEvent 133, DOWN, Map26_EntityEvent4-ms_map26_EntityEvents
                msEntityEvent 134, RIGHT, Map26_EntityEvent5-ms_map26_EntityEvents
            if (STANDARD_BUILD&MINIATURES_SHOP=1)
                msEntityEvent 135, RIGHT, Map26_EntityEvent6-ms_map26_EntityEvents
            endif
                msDefaultEntityEvent Map26_EntityEvent3-ms_map26_EntityEvents

; =============== S U B R O U T I N E =======================================


Map26_EntityEvent0:
                
                 
                txt     1742            ; "You want to see Creed?{N}Are you serious?!{W2}"
                txt     1743            ; "A hole in the wall leads{N}to Creed, but don't use it!{W1}"
                rts

    ; End of function Map26_EntityEvent0


; =============== S U B R O U T I N E =======================================


Map26_EntityEvent1:
                
                 
                txt     1744            ; "We came down here to{N}escape, but devils live in{N}the tunnel....{W2}"
                txt     1745            ; "They're too ferocious!{N}I'm gonna stay in Floor{N}World.{W1}"
                rts

    ; End of function Map26_EntityEvent1


; =============== S U B R O U T I N E =======================================


Map26_EntityEvent2:
                
                 
                txt     1746            ; "We left Desktop Kingdom long{N}ago.{W2}"
                txt     1747            ; "{NAME;16} is a brave leader.{N}We trust him!{W1}"
                rts

    ; End of function Map26_EntityEvent2


; =============== S U B R O U T I N E =======================================


Map26_EntityEvent4:
                
                jsr     j_ChurchMenu
                rts

    ; End of function Map26_EntityEvent4


; =============== S U B R O U T I N E =======================================


Map26_EntityEvent5:
                
                jsr     j_CaravanMenu
                rts

    ; End of function Map26_EntityEvent5


; =============== S U B R O U T I N E =======================================


Map26_EntityEvent6:
                
            if (STANDARD_BUILD&MINIATURES_SHOP=1)
                move.b  #SHOP_MINATURES_ROOM,((CURRENT_SHOP_INDEX-$1000000)).w
                jmp     ShopMenu
            endif
                
Map26_EntityEvent3:
                
                rts

    ; End of function Map26_EntityEvent3

