
; SCRIPT SECTION maps\entries\map42\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map42_InitFunction:
										
										rts

	; End of function ms_map42_InitFunction

cs_5FE9A:           dc.w 4                  ; 0004 SET TEXT INDEX D09
										dc.w $D09
										dc.w 2                  ; 0002 DISPLAY TEXT BOX FFFF
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 1
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w 9                  ; 0009 HIDE TEXTBOX AND PORTRAIT
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w $34                ; 0034 SET BLOCKS 2101 101 1A12
										dc.w $2101
										dc.w $101
										dc.w $1A12
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5FF06:           dc.w 4                  ; 0004 SET TEXT INDEX D07
										dc.w $D07
										dc.w 9                  ; 0009 HIDE TEXTBOX AND PORTRAIT
										dc.w $18                ; 0018 FLASH ENTITY WHITE 0 3C
										dc.w 0
										dc.w $3C
										dc.w $34                ; 0034 SET BLOCKS 2102 101 2702
										dc.w $2102
										dc.w $101
										dc.w $2702
										dc.w $2B                ; 002B  80 27 2 3 B4
										dc.w $80
										dc.b $27
										dc.b 2
										dc.b 3
										dc.b $B4
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45FB2
										dc.b $80
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5FF56
										dc.l sub_5FF56
										dc.w $2E                ; 002E HIDE ENTITY 80
										dc.w $80
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w $34                ; 0034 SET BLOCKS 20 706 0
										dc.w $20
										dc.w $706
										dc.w 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_5FF56:
										
										move.w  #$43,d0 
										moveq   #1,d1
										jmp     sub_4F48A

	; End of function sub_5FF56

