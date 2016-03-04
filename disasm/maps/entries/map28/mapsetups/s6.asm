
; SCRIPT SECTION maps\entries\map28\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map28_InitFunction:
										
										rts

	; End of function ms_map28_InitFunction

cs_5F3A2:           dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45E44
										dc.b 0
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_FALLING
										dc.w $58
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 7 1
										dc.b 0
										dc.b $FF
										dc.b 7
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5F3C4:           dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45E44
										dc.b 0
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_FALLING
										dc.w $58
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 6 1
										dc.b 0
										dc.b $FF
										dc.b 6
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
