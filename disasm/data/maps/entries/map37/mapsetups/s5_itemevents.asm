
; ASM FILE data\maps\entries\map37\mapsetups\s5_itemevents.asm :
; 0x5FA2A..0x5FA88 : 
ms_map37_Section5:
                msItemEvent 8, 11, LEFT, ITEM_SKY_ORB, Map37_ItemEvent0-ms_map37_Section5
                msDefaultItemEvent Map37_DefaultItemEvent1-ms_map37_Section5

; =============== S U B R O U T I N E =======================================


Map37_DefaultItemEvent1:
                
                rts

    ; End of function Map37_DefaultItemEvent1


; =============== S U B R O U T I N E =======================================


Map37_ItemEvent0:
                
                 
                chkFlg  999             ; Set after the Nazca ship shootdown scene
                bne.s   return_5FA86
                move.w  #ITEM_SKY_ORB,((DIALOGUE_NAME_INDEX_1-$1000000)).w
                chkFlg  836             ; Set after the scene where Zynk stops you as you leave the Moun underground
                bne.s   byte_5FA76      
                txt     3373            ; "{LEADER} tries to use{N}the {ITEM}.{W2}{N}But, he doesn't know how.{W1}"
                clsTxt
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                move.w  #128,d0
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                jsr     LoadAndDisplayCurrentPortrait
                txt     3374            ; "Well, {LEADER}.  Let's go{N}back to look for someone{N}who knows about this ship.{W1}"
                bra.s   loc_5FA84
byte_5FA76:
                
                txt     3375            ; "{LEADER} fit the {ITEM}{N}into the cockpit.{W1}"
                clsTxt
                script  cs_5FB6A
loc_5FA84:
                
                moveq   #-1,d6
return_5FA86:
                
                rts

    ; End of function Map37_ItemEvent0

