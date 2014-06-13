
; SCRIPT SECTION mapsetups\map45\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map45_InitFunction:
										
										trap    #1
										dc.w $19
										beq.s   loc_600AA
										move.w  #$19,d0
										jsr     MoveEntityOutOfMap
										bra.s   return_600B0
loc_600AA:
										
										lea     cs_600B2(pc), a0
										trap    #6
return_600B0:
										
										rts

	; End of function ms_map45_InitFunction

cs_600B2:           dc.w $15                ; 0015 SET ACTSCRIPT 19 FF 45F9C
										dc.b $19
										dc.b $FF
										dc.l eas_45F9C          
										dc.w $1A                ; 001A SET ENTITY SPRITE 19 D9
										dc.w $19
										dc.w $D9
										dc.w $15                ; 0015 SET ACTSCRIPT 19 FF 46136
										dc.b $19
										dc.b $FF
										dc.l eas_Init3          
										dc.w $23                ; 0023 SET ENTITY FACING 19 1
										dc.b $19
										dc.b 1
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_600CE:           dc.w 4                  ; 0004 SET TEXT INDEX 823
										dc.w $823
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w $32                ; 0032 SET CAMERA DEST 1 1
										dc.w 1
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 8 C 2
										dc.b $1A
										dc.b 8
										dc.b $C
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 6 B 1
										dc.b $1F
										dc.b 6
										dc.b $B
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 6 D 1
										dc.b 0
										dc.b 6
										dc.b $D
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 6 E 1
										dc.b 7
										dc.b 6
										dc.b $E
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 1 9
										dc.w 1
										dc.w 9
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 46172
										dc.b 0
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 46172
										dc.b 7
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
										dc.b 4
										dc.b 4
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
										dc.b 4
										dc.b 4
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
										dc.b 4
										dc.b 4
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 3 3
										dc.b $1F
										dc.b 0
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 0 C 14
										dc.b 0
										dc.b 0
										dc.b $C
										dc.b $14
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 C 28
										dc.b 7
										dc.b 0
										dc.b $C
										dc.b $28
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 0
										dc.w 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 19
										dc.w $19
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 4
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 4
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 4
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 4
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 4
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST 1 5
										dc.w 1
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 19
										dc.w $19
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 19
										dc.w $19
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 19
										dc.w $19
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 6 8 1
										dc.b $86
										dc.b 6
										dc.b 8
										dc.b 1
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 19
										dc.w $19
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w $15                ; 0015 SET ACTSCRIPT 19 FF 46172
										dc.b $19
										dc.b $FF
										dc.l eas_46172          
										dc.w $23                ; 0023 SET ENTITY FACING 19 2
										dc.b $19
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 19 FF 1 2
										dc.b $19
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 19 3
										dc.b $19
										dc.b 3
										dc.w $1B                ; 001B START ENTITY ANIM 19
										dc.w $19
										dc.w $15                ; 0015 SET ACTSCRIPT 19 0 45FA8
										dc.b $19
										dc.b 0
										dc.l eas_Transparent    
										dc.w $2D                ; 002D MOVE ENTITY 19 FF 3 4
										dc.b $19
										dc.b $FF
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 86
										dc.w $86
										dc.w $15                ; 0015 SET ACTSCRIPT 19 FF 460CE
										dc.b $19
										dc.b $FF
										dc.l eas_Init           
										dc.w $1A                ; 001A SET ENTITY SPRITE 19 19
										dc.w $19
										dc.w $19
										dc.w $2D                ; 002D MOVE ENTITY 19 FF 3 2
										dc.b $19
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w $1B                ; 001B START ENTITY ANIM 19
										dc.w $19
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 19 FF 460CE
										dc.b $19
										dc.b $FF
										dc.l eas_Init           
										dc.w $32                ; 0032 SET CAMERA DEST 1 5
										dc.w 1
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w 8                  ; 0008 JOIN FORCE 19
										dc.w $19
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 19 2
										dc.b $19
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 19
										dc.w $19
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1A 1F 2
										dc.w $1A
										dc.w $1F
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 19 0 5
										dc.w $19
										dc.w 0
										dc.w 5
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
