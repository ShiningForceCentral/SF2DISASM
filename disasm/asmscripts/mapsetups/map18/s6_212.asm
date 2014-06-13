
; SCRIPT SECTION mapsetups\map18\s6_212 :
; 

; =============== S U B R O U T I N E =======================================

ms_map18_flag212_InitFunction:
										
										trap    #1
										dc.w $398
										bne.s   loc_612A8
										lea     cs_612BE(pc), a0
										trap    #6
										trap    #2
										dc.w $398
loc_612A8:
										
										move.w  #$80,d0 
										jsr     MoveEntityOutOfMap
										move.w  #$82,d0 
										jsr     MoveEntityOutOfMap
										rts

	; End of function ms_map18_flag212_InitFunction

cs_612BE:           dc.w 4                  ; 0004 SET TEXT INDEX E61
										dc.w $E61
										dc.w $48                ; 0048 LOAD MAP 3B 8 4
										dc.w $3B
										dc.w 8
										dc.w 4
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 3F 3F 3
										dc.b 0
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 3F 3F 3
										dc.b 7
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 3F 3F 3
										dc.b $1F
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3F 3
										dc.b $1A
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $4A                ; 004A FADE IN FROM BLACK HALF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082
										dc.w $8082
word_612E8:         dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8082
										dc.w $8082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082
										dc.w $8082
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $50                ; 0050 SET ENTITY SIZE 80 15 
										dc.w $80
										dc.w $15
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.b $80                ; WAIT 1E
byte_6131D:         dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8082
										dc.w $8082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082
										dc.w $8082
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082
										dc.w $8082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45FF0
										dc.b $80
										dc.b 0
										dc.l eas_RotateRightHighSpeed
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 3F 3F 3
										dc.b $80
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $80                ; WAIT 96
										dc.b $96
										dc.w $53                ; 0053  83 FFFF
										dc.w $83
										dc.w $FFFF
										dc.w $53                ; 0053  81 0
										dc.w $81
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 45FA8
										dc.b $83
										dc.b 0
										dc.l eas_Transparent    
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 D C 3
										dc.b $83
										dc.b $D
										dc.b $C
										dc.b 3
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 D C 1
										dc.b $81
										dc.b $D
										dc.b $C
										dc.b 1
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 7
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2E                ; 002E HIDE ENTITY 83
										dc.w $83
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 2
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082
										dc.w $8082
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8082
										dc.w $8082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8082
										dc.w $8082
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 61426
										dc.l sub_61426
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 12090A03
										dc.l $12090A03
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_61426:
										
										lea     (PALETTE_1).l,a0
										lea     (FFD080_Palette1bis).l,a1
										moveq   #$F,d0
loc_61434:
										
										move.l  (a0)+,(a1)+
										dbf     d0,loc_61434
										rts

	; End of function sub_61426

cs_6143C:           dc.w 4                  ; 0004 SET TEXT INDEX 36F
										dc.w $36F
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $28                ; 0028 MOVE ENTITY NEXT TO PLAYER 1A 0
										dc.w $1A
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A
										dc.w $1A
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 1 4
										dc.b $1A
										dc.b $FF
										dc.b 1
										dc.b 4
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
										dc.w $23                ; 0023 SET ENTITY FACING 1A 3
										dc.b $1A
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $26                ; 0026 MAKE ENTITY NOD 1A
										dc.w $1A
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 1 4
										dc.b $1A
										dc.b $FF
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 1A
										dc.w $1A
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
