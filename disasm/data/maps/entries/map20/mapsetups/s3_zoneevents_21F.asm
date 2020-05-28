
; ASM FILE data\maps\entries\map20\mapsetups\s3_zoneevents_21F.asm :
; 0x6329A..0x63364 : 
ms_map20_flag21F_ZoneEvents:
                msZoneEvent 19, 52, Map20_21F_ZoneEvent0-ms_map20_flag21F_ZoneEvents
                msZoneEvent 26, 255, Map20_21F_ZoneEvent1-ms_map20_flag21F_ZoneEvents
                msZoneEvent 27, 52, Map20_21F_ZoneEvent2-ms_map20_flag21F_ZoneEvents
                msDefaultZoneEvent Map20_21F_DefaultZoneEvent-ms_map20_flag21F_ZoneEvents

; =============== S U B R O U T I N E =======================================

Map20_21F_DefaultZoneEvent:
                
                rts

    ; End of function Map20_21F_DefaultZoneEvent


; =============== S U B R O U T I N E =======================================

Map20_21F_ZoneEvent0:
                
                 
                sndCom  SOUND_COMMAND_FADE_OUT
                script  cs_632EA
                clr.w   ((SPEECH_SFX-$1000000)).w
                txt     $FAE            ; "The Princess is asleep.{N}Will you kiss her?"
                jsr     j_YesNoPrompt
                tst.w   d0
                bne.s   byte_632E0
                script  cs_EndKiss
                jsr     PlayEndCredits
                moveq   #$FFFFFFFF,d0
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
                
                 
                chkFlg  $3D6
                beq.s   return_6332E
                chkFlg  $3D7
                bne.s   return_6332E
                move.w  ((SPEECH_SFX-$1000000)).w,((SPEECH_SFX_BACKUP-$1000000)).w
                move.w  #$80,d0 
                jsr     GetEntityPortaitAndSpeechSound
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((SPEECH_SFX-$1000000)).w
                txt     $FA9            ; "Oh, {LEADER}!{N}I really respect you.{W2}"
                txt     $FAA            ; "You shouldered quite a{N}burden for the kingdom.{W2}"
                txt     $FAB            ; "I'll be happy if you rule{N}this kingdom with Princess{N}Elis!{W1}"
                setFlg  $3D7
return_6332E:
                
                rts

    ; End of function Map20_21F_ZoneEvent1


; =============== S U B R O U T I N E =======================================

Map20_21F_ZoneEvent2:
                
                 
                chkFlg  $3D8
                bne.s   return_6335C
                script  cs_6335E
                move.w  ((SPEECH_SFX-$1000000)).w,((SPEECH_SFX_BACKUP-$1000000)).w
                move.w  #$80,d0 
                jsr     GetEntityPortaitAndSpeechSound
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((SPEECH_SFX-$1000000)).w
                txt     $FAC            ; "{LEADER}, please kiss{N}her.{W1}"
                setFlg  $3D8
return_6335C:
                
                rts

    ; End of function Map20_21F_ZoneEvent2

cs_6335E:       setFacing 128,DOWN
                csc_end
