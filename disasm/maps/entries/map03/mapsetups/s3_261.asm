
; SCRIPT SECTION maps\entries\map03\mapsetups\s3_261 :
; 
ms_map3_flag261_ZoneEvents:
										dc.b 2
										dc.b $17
										dc.w return_50F0A-ms_map3_flag261_ZoneEvents
										dc.b 2
										dc.b $FF
										dc.w sub_50EF6-ms_map3_flag261_ZoneEvents
										dc.w $FD00
										dc.w return_50EE8+$10000-ms_map3_flag261_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_50EF6:
										
										trap    #CHECK_FLAG
										dc.w 3                  ; Jaha joined
										bne.s   return_50F0A
										lea     cs_516A8(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $192               ; Battle 2 unlocked
										trap    #CLEAR_FLAG
										dc.w $42                ; Sarah + Chester are followers
return_50F0A:
										
										rts

	; End of function sub_50EF6

