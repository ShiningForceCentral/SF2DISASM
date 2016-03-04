
; SCRIPT SECTION maps\entries\map43\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map43_InitFunction:
										
										lea     cs_540C0(pc), a0
										trap    #6
										trap    #2
										dc.w $264
										trap    #2
										dc.w $28A
										trap    #3
										dc.w $48
										move.b  #$2B,((RAM_EgressMapIdx-$1000000)).w 
return_540BE:
										
										rts

	; End of function ms_map43_InitFunction

cs_540C0:           dc.w 4                  ; 0004 SET TEXT INDEX 32B
										dc.w $32B
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 4 FF 460CE
										dc.b 4
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 7 4 3
										dc.b $80
										dc.b 7
										dc.b 4
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 6 B 1
										dc.b 0
										dc.b 6
										dc.b $B
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 4 5 B 1
										dc.b 4
										dc.b 5
										dc.b $B
										dc.b 1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $46                ; 0046  0 4
										dc.w 0
										dc.w 4
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 4 0
										dc.b 4
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w $2D                ; 002D MOVE ENTITY 4 FF 2 1
										dc.b 4
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b $C
										dc.b $14
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.b $80                ; WAIT 46
										dc.b $46
										dc.w $23                ; 0023 SET ENTITY FACING 4 0
										dc.b 4
										dc.b 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 2 2
										dc.b 0
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $43                ; 0043 RELATED TO BLOCK COPY 4 9
										dc.w 4
										dc.w 9
										dc.w $47                ; 0047  4 9
										dc.w 4
										dc.w 9
										dc.w $47                ; 0047  B 9
										dc.w $B
										dc.w 9
										dc.w $2D                ; 002D MOVE ENTITY 4 0 1 3
										dc.b 4
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 3
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 4
										dc.b 4
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 4 FF 0 1
										dc.b 4
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 4 1
										dc.b 4
										dc.b 1
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FE
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_ENEMY_ATTACK
										dc.w 5
										dc.w $32                ; 0032 SET CAMERA DEST 2 0
										dc.w 2
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 4 FF 1 1
										dc.b 4
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45E44
										dc.b $81
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 45E44
										dc.b $82
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45E44
										dc.b $81
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 45E44
										dc.b $82
										dc.b $FF
										dc.l eas_Jump           
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 4 FF 460CE
										dc.b 4
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 82 0 3 2
										dc.b $82
										dc.b 0
										dc.b 3
										dc.b 2
										dc.b 0
										dc.b 4
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 0 1
										dc.b $81
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 2
										dc.b 0
										dc.b 4
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 4 FF C 14
										dc.b 4
										dc.b $FF
										dc.b $C
										dc.b $14
										dc.b 8
										dc.b $14
										dc.b $D
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLO
										dc.w $64
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 4
										dc.b 4
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2E                ; 002E HIDE ENTITY 81
										dc.w $81
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $15                ; 0015 SET ACTSCRIPT 4 FF 460CE
										dc.b 4
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 4 FF 0 1
										dc.b 4
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 4 FF 2 1
										dc.b 4
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 4 1
										dc.b 4
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_SAD_THEME_1
										dc.w $10
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 4 FF 2 1
										dc.b 4
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 2
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 4 2
										dc.b 4
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 4 1
										dc.b 4
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $17                ; 0017 SET ENTITY POS AND FACING WITH FLASH 80 3F 3F 3
										dc.b $80
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 4 FF 1 1
										dc.b 4
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w $1C                ; 001C STOP ENTITY ANIM 4
										dc.w 4
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 1
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $1B                ; 001B START ENTITY ANIM 4
										dc.w 4
										dc.w $23                ; 0023 SET ENTITY FACING 4 3
										dc.b 4
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 4
										dc.w 4
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w 8                  ; 0008 JOIN FORCE 8004
										dc.w $8004
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w $2C                ; 002C FOLLOW ENTITY 4 0 2
										dc.w 4
										dc.w 0
										dc.w 2
										dc.w $10                ; 0010 SET FLAG 48 0
										dc.w $48
										dc.w 0
										dc.w $13                ; 0013 SET STORY FLAG 4
										dc.w 4
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
