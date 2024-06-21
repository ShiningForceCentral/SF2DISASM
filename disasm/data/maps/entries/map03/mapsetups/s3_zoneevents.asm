
; ASM FILE data\maps\entries\map03\mapsetups\s3_zoneevents.asm :
; 0x50D4C..0x50EEA : 
ms_map3_ZoneEvents:
                msZoneEvent 2, 255, Map3_ZoneEvent0-ms_map3_ZoneEvents
                msZoneEvent 27, 5, Map3_ZoneEvent1-ms_map3_ZoneEvents
                msZoneEvent 28, 5, Map3_ZoneEvent1-ms_map3_ZoneEvents
                msZoneEvent 29, 5, Map3_ZoneEvent1-ms_map3_ZoneEvents
                msZoneEvent 30, 5, Map3_ZoneEvent4-ms_map3_ZoneEvents
                msZoneEvent 31, 5, Map3_ZoneEvent4-ms_map3_ZoneEvents
                msZoneEvent 4, 4, Map3_ZoneEvent6-ms_map3_ZoneEvents
                msZoneEvent 58, 13, Map3_ZoneEvent7-ms_map3_ZoneEvents
                msZoneEvent 43, 10, Map3_ZoneEvent8-ms_map3_ZoneEvents
                msDefaultZoneEvent Map3_DefaultZoneEvent-ms_map3_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map3_ZoneEvent0:
                
                 
                script  cs_51444
                chkFlg  257             ; TEMP FLAG #01
                bne.s   byte_50DA6      
                jsr     (WaitForViewScrollEnd).l
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                move.w  #140,d0
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                txt     498             ; "You unruly boy!{N}Where on earth are you{N}going?{W2}"
                txt     499             ; "There is no school outside!{N}Go to school!{W1}"
byte_50DA6:
                
                setFlg  257             ; TEMP FLAG #01
                rts

    ; End of function Map3_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map3_ZoneEvent1:
                
                 
                chkFlg  600             ; Set after agreeing to try getting into the castle
                bne.s   byte_50DE6      
                script  cs_5144C
                chkFlg  258             ; TEMP FLAG #02
                bne.s   byte_50DE0      
                jsr     (WaitForViewScrollEnd).l
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                move.w  #138,d0
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                txt     497             ; "You cannot enter the castle{N}of Granseal.  Go away!{W1}"
byte_50DE0:
                
                setFlg  258             ; TEMP FLAG #02
                bra.s   return_50DF6
byte_50DE6:
                
                chkFlg  604             ; Set after the guards have listened to Sarah and allowed you into the castle
                bne.s   return_50DF6
                script  cs_51652
                setFlg  604             ; Set after the guards have listened to Sarah and allowed you into the castle
return_50DF6:
                
                rts

    ; End of function Map3_ZoneEvent1


; =============== S U B R O U T I N E =======================================


Map3_ZoneEvent4:
                
                 
                chkFlg  600             ; Set after agreeing to try getting into the castle
                bne.s   byte_50E32      
                script  cs_51454
                chkFlg  259             ; TEMP FLAG #03
                bne.s   byte_50E2C      
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                move.w  #139,d0
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                jsr     (WaitForViewScrollEnd).l
                txt     497             ; "You cannot enter the castle{N}of Granseal.  Go away!{W1}"
byte_50E2C:
                
                setFlg  259             ; TEMP FLAG #03
                bra.s   return_50E42
byte_50E32:
                
                chkFlg  604             ; Set after the guards have listened to Sarah and allowed you into the castle
                bne.s   return_50E42
                script  cs_51652
                setFlg  604             ; Set after the guards have listened to Sarah and allowed you into the castle
return_50E42:
                
                rts

    ; End of function Map3_ZoneEvent4


; =============== S U B R O U T I N E =======================================


Map3_ZoneEvent6:
                
                 
                chkFlg  601             ; Set after Bowie is intercepted by his mother going downstairs
                bne.s   return_50E64
                script  cs_5145C
                move.w  #$80,d0 
                moveq   #5,d1
                moveq   #6,d2
                moveq   #1,d3
                jsr     MakeEntityWalk
                setFlg  601             ; Set after Bowie is intercepted by his mother going downstairs
return_50E64:
                
                rts

    ; End of function Map3_ZoneEvent6


; =============== S U B R O U T I N E =======================================


Map3_ZoneEvent7:
                
                 
                chkFlg  603             ; Set after the messenger scene
                bne.s   return_50ED0
                chkFlg  602             ; Set after Astral's second basement line
                bne.s   byte_50E96      
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                move.w  #142,d0
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                jsr     LoadAndDisplayCurrentPortrait
                txt     513             ; "Mmm...aahh...{N}Oh, yeah!  It must be....{N}No, it's not a....{W1}"
                bra.s   return_50ED0
byte_50E96:
                
                chkFlg  260             ; TEMP FLAG #04
                bne.s   return_50ED0
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                move.w  #142,d0
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                jsr     LoadAndDisplayCurrentPortrait
                txt     514             ; "By the way, {LEADER},{N}what did you think of the{N}storm last night?{W2}"
                txt     515             ; "Did you feel something evil,{N}or anything?{W2}"
                txt     516             ; "No, nothing?!{N}Perhaps it was just my{N}imagination.  Sorry.{W1}"
                script  cs_5148C
                setFlg  260             ; TEMP FLAG #04
return_50ED0:
                
                rts

    ; End of function Map3_ZoneEvent7


; =============== S U B R O U T I N E =======================================


Map3_ZoneEvent8:
                
                 
                chkFlg  602             ; Set after Astral's second basement line
                beq.s   Map3_DefaultZoneEvent
                chkFlg  603             ; Set after the messenger scene
                bne.s   Map3_DefaultZoneEvent
                script  cs_5149A
                setFlg  603             ; Set after the messenger scene
Map3_DefaultZoneEvent:
                
                rts

    ; End of function Map3_ZoneEvent8

