
; ASM FILE data\maps\entries\map20\mapsetups\s3_zoneevents_543.asm :
; 0x6329A..0x63364 : 
ms_map20_flag543_ZoneEvents:
                msZoneEvent 19, 52, Map20_21F_ZoneEvent0-ms_map20_flag543_ZoneEvents
                msZoneEvent 26, 255, Map20_21F_ZoneEvent1-ms_map20_flag543_ZoneEvents
                msZoneEvent 27, 52, Map20_21F_ZoneEvent2-ms_map20_flag543_ZoneEvents
                msDefaultZoneEvent Map20_21F_DefaultZoneEvent-ms_map20_flag543_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map20_21F_DefaultZoneEvent:
                
                rts

    ; End of function Map20_21F_DefaultZoneEvent


; =============== S U B R O U T I N E =======================================


Map20_21F_ZoneEvent0:
                
                 
                sndCom  SOUND_COMMAND_FADE_OUT
                script  cs_632EA
                clr.w   ((CURRENT_SPEECH_SFX-$1000000)).w
                txt     4014            ; "The Princess is asleep.{N}Will you kiss her?"
                jsr     j_YesNoPrompt
                tst.w   d0
                bne.s   byte_632E0
                script  cs_EndingKiss
                jsr     PlayEndingCredits
                moveq   #-1,d0
                jsr     PlayIntroOrEndCutscene
                jmp     (WitchEnd).w
byte_632E0:
                
                sndCom  SOUND_COMMAND_INIT_DRIVER
                sndCom  MUSIC_TOWN
                rts

    ; End of function Map20_21F_ZoneEvent0

cs_632EA:       setActscriptWait ALLY_BOWIE,eas_Init
                csWait 1
                shiver ALLY_BOWIE
                csc_end

; =============== S U B R O U T I N E =======================================


Map20_21F_ZoneEvent1:
                
                 
                chkFlg  982
                beq.s   return_6332E
                chkFlg  983
                bne.s   return_6332E
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                move.w  #128,d0
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                txt     4009            ; "Oh, {LEADER}!{N}I really respect you.{W2}"
                txt     4010            ; "You shouldered quite a{N}burden for the kingdom.{W2}"
                txt     4011            ; "I'll be happy if you rule{N}this kingdom with Princess{N}Elis!{W1}"
                setFlg  983
return_6332E:
                
                rts

    ; End of function Map20_21F_ZoneEvent1


; =============== S U B R O U T I N E =======================================


Map20_21F_ZoneEvent2:
                
                 
                chkFlg  984
                bne.s   return_6335C
                script  cs_6335E
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                move.w  #128,d0
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                txt     4012            ; "{LEADER}, please kiss{N}her.{W1}"
                setFlg  984
return_6335C:
                
                rts

    ; End of function Map20_21F_ZoneEvent2

cs_6335E:       setFacing 128,DOWN
                csc_end
