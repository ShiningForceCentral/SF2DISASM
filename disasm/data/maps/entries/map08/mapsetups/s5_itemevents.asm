
; ASM FILE data\maps\entries\map08\mapsetups\s5_itemevents.asm :
; 0x562E0..0x563A2 : 
ms_map8_Section5:
                msItemEvent 15, 19, UP, ITEM_WOODEN_PANEL, Map8_ItemEvent0-ms_map8_Section5
                msItemEvent 16, 19, UP, ITEM_WOODEN_PANEL, Map8_ItemEvent0-ms_map8_Section5
                msDefaultItemEvent Map8_DefaultItemEvent2-ms_map8_Section5

; =============== S U B R O U T I N E =======================================


Map8_ItemEvent0:
                
                 
                chkFlg  731             ; Set after you open the tree in Ribble with the wooden plank
                beq.s   byte_562FC
                moveq   #0,d6
                bra.s   Map8_DefaultItemEvent2
byte_562FC:
                
                script  cs_56314
                setFlg  731             ; Set after you open the tree in Ribble with the wooden plank
                moveq   #ITEM_WOODEN_PANEL,d0
                jsr     RemoveItemFromInventory
                move.w  #-1,d6
Map8_DefaultItemEvent2:
                
                rts

    ; End of function Map8_ItemEvent0

cs_56314:       hideText
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setQuake 2
                csWait 60
                setActscript ALLY_BOWIE,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                entityActions ALLY_BOWIE
                 moveDown 2
                endActions
                entityActionsWait ALLY_PETER
                 moveDown 2
                endActions
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                playSound SFX_BATTLEFIELD_DEATH
                setBlocks 32,17,2,2,15,19
                csWait 30
                setQuake 0
                csWait 30
                setQuake 2
                playSound SFX_BATTLEFIELD_DEATH
                setBlocks 34,17,2,2,15,19
                csWait 30
                setQuake 0
                csWait 30
                setQuake 2
                playSound SFX_BATTLEFIELD_DEATH
                setBlocks 32,14,2,2,15,19
                csWait 30
                setQuake 0
                csWait 30
                followEntity ALLY_PETER,ALLY_BOWIE,2
                csc_end
