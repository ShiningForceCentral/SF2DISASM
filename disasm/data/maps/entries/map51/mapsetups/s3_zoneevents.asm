
; ASM FILE data\maps\entries\map51\mapsetups\s3_zoneevents.asm :
; 0x5C2D6..0x5C3C0 : 
ms_map51_ZoneEvents:
                msZoneEvent 9, 6, Map51_ZoneEvent0-ms_map51_ZoneEvents
                msZoneEvent 9, 7, Map51_ZoneEvent0-ms_map51_ZoneEvents
                msZoneEvent 9, 8, Map51_ZoneEvent0-ms_map51_ZoneEvents
                msZoneEvent 9, 9, Map51_ZoneEvent0-ms_map51_ZoneEvents
                msZoneEvent 9, 24, Map51_ZoneEvent4-ms_map51_ZoneEvents
                msZoneEvent 10, 24, Map51_ZoneEvent4-ms_map51_ZoneEvents
                msDefaultZoneEvent Map51_DefaultZoneEvent-ms_map51_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map51_ZoneEvent0:
                
                 
                chkFlg  470             ; Set after you approach the pond to rescue Elric at the Harpy Pond
                bne.s   return_5C302
                script  cs_5C312
                setFlg  470             ; Set after you approach the pond to rescue Elric at the Harpy Pond
return_5C302:
                
                rts

    ; End of function Map51_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map51_ZoneEvent4:
                
                 
                chkFlg  470             ; Set after you approach the pond to rescue Elric at the Harpy Pond
                bne.s   Map51_DefaultZoneEvent
                script  cs_5C3AA
Map51_DefaultZoneEvent:
                
                rts

    ; End of function Map51_ZoneEvent4

cs_5C312:       textCursor 2555
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setPos 128,7,16,UP
                setPos 129,6,17,UP
                setPos 130,8,17,UP
                nextText $0,ALLY_ELRIC  ; "Did you come to help me?{N}Oh, thank you!{W2}"
                nextSingleText $0,ALLY_ELRIC ; "I might have been eaten by{N}monsters if you hadn't come.{W1}"
                nextSingleText $C0,128  ; "My dinner is escaping!{W1}"
                setActscript FOLLOWER_B,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                csWait 120
                nextSingleText $0,ALLY_PETER ; "Who said that?{W1}"
                setCamDest 3,12
                nextText $C0,128        ; "That pond catches my food.{N}Hey elf boy, good trap, huh?{W2}"
                nextSingleText $C0,128  ; "Those who get stuck in the{N}pond are mine.  It's my{N}rule.{W1}"
                nextSingleText $0,ALLY_ELRIC ; "Then, all the missing people{N}were eaten by you?{W1}"
                nextSingleText $C0,128  ; "They were in my pond.{W1}"
                entityActionsWait 128
                 moveUp 2
                endActions
                nextSingleText $C0,128  ; "And this elf is my dinner{N}for tonight.  Got it?{W1}"
                setFacing 128,DOWN
                nextSingleText $C0,128  ; "Did you guys bring the{N}ketchup? No? Oh, well.{W1}"
                setActscript 129,eas_Jump
                setActscriptWait 130,eas_Jump
                setStoryFlag 20         ; Battle 20 unlocked - BATTLE_HARPIES_POND              
                warp MAP_HARPY_POOL,0,0,RIGHT
                csc_end
cs_5C3AA:       textCursor 2565
                nextSingleText $0,ALLY_PETER ; "{LEADER}, we have to{N}save him!{W1}"
                nod ALLY_BOWIE
                entityActionsWait ALLY_BOWIE
                 moveUp 1
                endActions
                csc_end
