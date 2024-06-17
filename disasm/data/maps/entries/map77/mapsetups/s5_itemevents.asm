
; ASM FILE data\maps\entries\map77\mapsetups\s5_itemevents.asm :
; 0x50A8C..0x50AE6 : 
ms_map77_Section5:
                msItemEvent 43, 42, LEFT, ITEM_DRY_STONE, Map77_ItemEvent0-ms_map77_Section5
                msDefaultItemEvent Map77_DefaultItemEvent1-ms_map77_Section5

; =============== S U B R O U T I N E =======================================


Map77_DefaultItemEvent1:
                
                rts

    ; End of function Map77_DefaultItemEvent1


; =============== S U B R O U T I N E =======================================


Map77_ItemEvent0:
                
                move.w  #ITEM_DRY_STONE,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     421             ; "{LEADER} uses the {ITEM}.{D3}"
                chkFlg  900             ; Set after using the Dry Stone to open the way to the Dwarven Village
                bne.s   byte_50AB6      
                setFlg  900             ; Set after using the Dry Stone to open the way to the Dwarven Village
                script  cs_50ABE
                bra.s   loc_50ABA
byte_50AB6:
                
                txt     422             ; "But nothing happened.{D1}"
loc_50ABA:
                
                moveq   #-1,d6
                rts

    ; End of function Map77_ItemEvent0

cs_50ABE:       playSound SFX_BIG_DOOR_RUMBLE
                setQuake 1
                csWait 60
                playSound SFX_BOOST
                flashScreenWhite $14
                setBlocks 1,1,1,1,42,42
                flashScreenWhite $14
                csWait 60
                setQuake 0
                csWait 60
                csc_end
