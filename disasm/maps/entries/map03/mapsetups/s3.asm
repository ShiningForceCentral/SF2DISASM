
; SCRIPT SECTION maps\entries\map03\mapsetups\s3 :
; 
ms_map3_Section3:   dc.b 2
										dc.b $FF
										dc.w sub_50D74-ms_map3_Section3
										dc.b $1B
										dc.b 5
										dc.w sub_50DAC-ms_map3_Section3
										dc.b $1C
										dc.b 5
										dc.w sub_50DAC-ms_map3_Section3
										dc.b $1D
										dc.b 5
										dc.w sub_50DAC-ms_map3_Section3
										dc.b $1E
										dc.b 5
										dc.w sub_50DF8-ms_map3_Section3
										dc.b $1F
										dc.b 5
										dc.w sub_50DF8-ms_map3_Section3
										dc.b 4
										dc.b 4
										dc.w sub_50E44-ms_map3_Section3
										dc.b $3A
										dc.b $D
										dc.w sub_50E66-ms_map3_Section3
										dc.b $2B
										dc.b $A
										dc.w sub_50ED2-ms_map3_Section3
										dc.w $FD00
										dc.w return_50EE8-ms_map3_Section3

; =============== S U B R O U T I N E =======================================

sub_50D74:
										
										lea     (Map16s0_Blocks+$B0E-ms_map3_Section3)(pc), a0
										trap    #6
										trap    #1
										dc.w $101
										bne.s   loc_50DA6
										jsr     (WaitForCameraToCatchUp).l
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										move.w  #$8C,d0 
										jsr     GetEntityPortraitAndSpeechSound
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #5
										dc.w $1F2
										trap    #5
										dc.w $1F3
loc_50DA6:
										
										trap    #2
										dc.w $101
										rts

	; End of function sub_50D74


; =============== S U B R O U T I N E =======================================

sub_50DAC:
										
										trap    #1
										dc.w $258
										bne.s   loc_50DE6
										lea     cs_5144C(pc), a0
										trap    #6
										trap    #1
										dc.w $102
										bne.s   loc_50DE0
										jsr     (WaitForCameraToCatchUp).l
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										move.w  #$8A,d0 
										jsr     GetEntityPortraitAndSpeechSound
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #5
										dc.w $1F1
loc_50DE0:
										
										trap    #2
										dc.w $102
										bra.s   return_50DF6
loc_50DE6:
										
										trap    #1
										dc.w $25C
										bne.s   return_50DF6
										lea     cs_51652(pc), a0
										trap    #6
										trap    #2
										dc.w $25C
return_50DF6:
										
										rts

	; End of function sub_50DAC


; =============== S U B R O U T I N E =======================================

sub_50DF8:
										
										trap    #1
										dc.w $258
										bne.s   loc_50E32
										lea     cs_51454(pc), a0
										trap    #6
										trap    #1
										dc.w $103
										bne.s   loc_50E2C
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										move.w  #$8B,d0 
										jsr     GetEntityPortraitAndSpeechSound
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     (WaitForCameraToCatchUp).l
										trap    #5
										dc.w $1F1
loc_50E2C:
										
										trap    #2
										dc.w $103
										bra.s   return_50E42
loc_50E32:
										
										trap    #1
										dc.w $25C
										bne.s   return_50E42
										lea     cs_51652(pc), a0
										trap    #6
										trap    #2
										dc.w $25C
return_50E42:
										
										rts

	; End of function sub_50DF8


; =============== S U B R O U T I N E =======================================

sub_50E44:
										
										trap    #1
										dc.w $259
										bne.s   return_50E64
										lea     cs_5145C(pc), a0
										trap    #6
										move.w  #$80,d0 
										moveq   #5,d1
										moveq   #6,d2
										moveq   #1,d3
										jsr     sub_47808
										trap    #2
										dc.w $259
return_50E64:
										
										rts

	; End of function sub_50E44


; =============== S U B R O U T I N E =======================================

sub_50E66:
										
										trap    #1
										dc.w $25B
										bne.s   return_50ED0
										trap    #1
										dc.w $25A
										bne.s   loc_50E96
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										move.w  #$8E,d0 
										jsr     GetEntityPortraitAndSpeechSound
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     LoadAndDisplayCurrentPortrait
										trap    #5
										dc.w $201
										bra.s   return_50ED0
loc_50E96:
										
										trap    #1
										dc.w $104
										bne.s   return_50ED0
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										move.w  #$8E,d0 
										jsr     GetEntityPortraitAndSpeechSound
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     LoadAndDisplayCurrentPortrait
										trap    #5
										dc.w $202
										trap    #5
										dc.w $203
										trap    #5
										dc.w $204
										lea     cs_5148C(pc), a0
										trap    #6
										trap    #2
										dc.w $104
return_50ED0:
										
										rts

	; End of function sub_50E66


; =============== S U B R O U T I N E =======================================

sub_50ED2:
										
										trap    #1
										dc.w $25A
										beq.s   return_50EE8
										trap    #1
										dc.w $25B
										bne.s   return_50EE8
										lea     cs_5149A(pc), a0
										trap    #6
										trap    #2
										dc.w $25B
return_50EE8:
										
										rts

	; End of function sub_50ED2

