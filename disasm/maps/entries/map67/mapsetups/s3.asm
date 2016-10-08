
; SCRIPT SECTION maps\entries\map67\mapsetups\s3 :
; 
ms_map67_ZoneEvents:dc.b $39
										dc.b $19
										dc.w sub_4FB32-ms_map67_ZoneEvents
										dc.b $38
										dc.b $1A
										dc.w sub_4FB24-ms_map67_ZoneEvents
										dc.b $39
										dc.b $1A
										dc.w sub_4FB24-ms_map67_ZoneEvents
										dc.b $3A
										dc.b $18
										dc.w sub_4FB24-ms_map67_ZoneEvents
										dc.b $3A
										dc.b $19
										dc.w sub_4FB24-ms_map67_ZoneEvents
										dc.w $FD00
										dc.w sub_4FB58-ms_map67_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_4FB24:
										
										trap    #CHECK_FLAG
										dc.w $208               ; Battle 20 completed
										bne.s   return_4FB30
										lea     cs_4FB64(pc), a0
										trap    #MAPSCRIPT
return_4FB30:
										
										rts

	; End of function sub_4FB24


; =============== S U B R O U T I N E =======================================

sub_4FB32:
										
										trap    #CHECK_FLAG
										dc.w $2EF               ; set after Elric opens the passage to Devil's Tail
										bne.s   return_4FB56
										trap    #CHECK_FLAG
										dc.w $D                 ; Elric joined
										beq.s   return_4FB56
										move.w  #$D,d0
										jsr     j_GetCurrentHP
										tst.w   d1
										beq.s   return_4FB56
										lea     cs_4FC32(pc), a0
										trap    #MAPSCRIPT
										trap    #SET_FLAG
										dc.w $2EF               ; set after Elric opens the passage to Devil's Tail
return_4FB56:
										
										rts

	; End of function sub_4FB32


; =============== S U B R O U T I N E =======================================

sub_4FB58:
										
										move.w  #$15,d0
										jsr     sub_47856
										rts

	; End of function sub_4FB58

cs_4FB64:           dc.w 4                  ; 0004 INIT TEXT CURSOR 9EF : "Wait!{W1}"
										dc.w $9EF
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Wait!{W1}"
										dc.w $1F
										dc.w $29                ; 0029 SET ENTITY DEST 1F 3C 1B
										dc.w $1F
										dc.w $3C
										dc.w $1B
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $32                ; 0032 SET CAMERA DEST 35 18
										dc.w $35
										dc.w $18
										dc.w $29                ; 0029 SET ENTITY DEST 7 3B 1B
										dc.w 7
										dc.w $3B
										dc.w $1B
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007 : "What's wrong, Oddler?{W1}"
										dc.w $C007
										dc.w $29                ; 0029 SET ENTITY DEST 0 3C 1A
										dc.w 0
										dc.w $3C
										dc.w $1A
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "{LEADER}...{NAME;7}...can{N}you hear that?{W1}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007 : "Hear what?{W1}"
										dc.w $C007
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007 : "I don't hear anything.{W1}"
										dc.w $C007
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "Somebody is crying for help...{W2}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "from...over here.{W1}"
										dc.w $1F
										dc.w $29                ; 0029 SET ENTITY DEST 1F 39 19
										dc.w $1F
										dc.w $39
										dc.w $19
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 3F 3F 3
										dc.b $1F
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $29                ; 0029 SET ENTITY DEST 7 39 19
										dc.w 7
										dc.w $39
										dc.w $19
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 3F 3F 3
										dc.b 7
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $29                ; 0029 SET ENTITY DEST 0 39 19
										dc.w 0
										dc.w $39
										dc.w $19
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 3F 3F 3
										dc.b 0
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 330B1601
										dc.l $330B1601
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_4FC32:           dc.w 4                  ; 0004 INIT TEXT CURSOR A21 : "Fairy said, move this rock{N}in this manner, and...{W1}"
										dc.w $A21
										dc.w $2B                ; 002B  D 39 19 1 FF
										dc.w $D
										dc.b $39
										dc.b $19
										dc.b 1
										dc.b $FF
										dc.w $15                ; 0015 SET ACTSCRIPT D FF 460CE
										dc.b $D
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY D FF 1 1
										dc.b $D
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX D : "Fairy said, move this rock{N}in this manner, and...{W1}"
										dc.w $D
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 5                  ; 0005 PLAY SOUND SFX_SECRET_PATH_ROCK
										dc.w $60
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING D 3
										dc.b $D
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT D FF 45E44
										dc.b $D
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT D FF 45E44
										dc.b $D
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX D : "Got it!  Thanks, fairy!{W1}"
										dc.w $D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING D 1
										dc.b $D
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_DESOUL_HOVERING
										dc.w $6E
										dc.w $34                ; 0034 SET BLOCKS 0 302 3816
										dc.w 0
										dc.w $302
										dc.w $3816
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING D 3
										dc.b $D
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX D : "{LEADER}, come on.{W1}"
										dc.w $D
										dc.w $2D                ; 002D MOVE ENTITY D FF 1 1
										dc.b $D
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY D
										dc.w $D
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 1
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 201D0302
										dc.l $201D0302
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
