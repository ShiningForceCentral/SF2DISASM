
; SCRIPT SECTION maps\entries\map08\mapsetups\s5 :
; 
ms_map8_Section5:   dc.b $F
										dc.b $13
										dc.b 1
										dc.b $70
										dc.w sub_562F2-ms_map8_Section5
										dc.b $10
										dc.b $13
										dc.b 1
										dc.b $70
										dc.w sub_562F2-ms_map8_Section5
										dc.b $FD
										dc.b 0
										dc.b 0
										dc.b 0
										dc.w return_56312-ms_map8_Section5

; =============== S U B R O U T I N E =======================================

sub_562F2:
										
										trap    #1
										dc.w $2DB
										beq.s   loc_562FC
										moveq   #0,d6
										bra.s   return_56312
loc_562FC:
										
										lea     cs_56314(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $2DB               ; set after you open the tree in Ribble with the wooden plank
										moveq   #$70,d0 
										jsr     sub_4F542
										move.w  #$FFFF,d6
return_56312:
										
										rts

	; End of function sub_562F2

cs_56314:           dc.w 9                  ; 0009 HIDE TEXTBOX AND PORTRAIT
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 2
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 2
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $34                ; 0034 SET BLOCKS 2011 202 F13
										dc.w $2011
										dc.w $202
										dc.w $F13
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $34                ; 0034 SET BLOCKS 2211 202 F13
										dc.w $2211
										dc.w $202
										dc.w $F13
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $34                ; 0034 SET BLOCKS 200E 202 F13
										dc.w $200E
										dc.w $202
										dc.w $F13
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
