
; SCRIPT SECTION maps\entries\map05\mapsetups\s6_212 :
; 

; =============== S U B R O U T I N E =======================================

ms_map5_flag212_InitFunction:
										
										trap    #1
										dc.w $3B0
										bne.s   loc_60630
										lea     cs_607DE(pc), a0
										trap    #6
										trap    #2
										dc.w $3B0
										bra.s   loc_60636
loc_60630:
										
										lea     cs_6060E(pc), a0
										trap    #6
loc_60636:
										
										trap    #1
										dc.w $3AE
										bne.s   loc_6067C
										cmpi.l  #$6005580,((RAM_Entity_StructOffset_XAndStart-$1000000)).w
										bne.s   loc_6067C
										trap    #1
										dc.w $1C                ; if character 1C joined the Force : Lemon ?
										beq.s   loc_6065E
										lea     cs_60656(pc), a0
										trap    #6
										bra.w   loc_6065E
cs_60656:
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C 1B 37 1
										dc.b $1C
										dc.b $1B
										dc.b $37
										dc.b 1
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
loc_6065E:
										
										lea     cs_60C42(pc), a0
										trap    #6
										trap    #1
										dc.w $3A2
										beq.s   loc_60672
										lea     cs_60EB2(pc), a0
										trap    #6
										bra.s   loc_60678
loc_60672:
										
										lea     cs_60CA4(pc), a0
										trap    #6
loc_60678:
										
										trap    #2
										dc.w $3AE
loc_6067C:
										
										trap    #1
										dc.w $1B
										beq.s   loc_6068C
										move.w  #$1B,d0
										jsr     MoveEntityOutOfMap
loc_6068C:
										
										trap    #1
										dc.w $3B0
										bne.s   loc_6069C
										move.w  #$82,d0 
										jsr     MoveEntityOutOfMap
loc_6069C:
										
										trap    #1
										dc.w $3AD
										beq.s   loc_606B4
										lea     cs_606AC(pc), a0
										trap    #6
										bra.w   loc_606B4
cs_606AC:
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 1A 32 3
										dc.b $80
										dc.b $1A
										dc.b $32
										dc.b 3
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
loc_606B4:
										
										trap    #1
										dc.w $1C
										beq.s   loc_606BE
										trap    #2
										dc.w $3B1
loc_606BE:
										
										trap    #1
										dc.w $3AC
										beq.s   return_606E8
										trap    #1
										dc.w $3AD
										bne.s   return_606E8
										lea     cs_606EA(pc), a0
										trap    #6
										trap    #1
										dc.w $1C
										beq.s   return_606E8
										lea     cs_606E0(pc), a0
										trap    #6
										bra.w   return_606E8
cs_606E0:
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C B A 1
										dc.b $1C
										dc.b $B
										dc.b $A
										dc.b 1
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
return_606E8:
										
										rts

	; End of function ms_map5_flag212_InitFunction

cs_606EA:           dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 B A 1
										dc.b 0
										dc.b $B
										dc.b $A
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 B A 1
										dc.b 7
										dc.b $B
										dc.b $A
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F B A 1
										dc.b $1F
										dc.b $B
										dc.b $A
										dc.b 1
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $46                ; 0046  5 4
										dc.w 5
										dc.w 4
										dc.b $80                ; WAIT A
										dc.b $A
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60708:           dc.w 4                  ; 0004 SET TEXT INDEX DB9
										dc.w $DB9
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C 15 21 3
										dc.b $1C
										dc.b $15
										dc.b $21
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801C
										dc.w $801C
										dc.w $32                ; 0032 SET CAMERA DEST 10 1C
										dc.w $10
										dc.w $1C
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 15 27 1
										dc.b 0
										dc.b $15
										dc.b $27
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 16 27 1
										dc.b 7
										dc.b $16
										dc.b $27
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 14 27 1
										dc.b $1F
										dc.b $14
										dc.b $27
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801C
										dc.w $801C
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 3 2
										dc.b $1C
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b $80
										dc.b $80
										dc.w $32                ; 0032 SET CAMERA DEST 10 21
										dc.w $10
										dc.w $21
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801C
										dc.w $801C
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801C
										dc.w $801C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801C
										dc.w $801C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801C
										dc.w $801C
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 7
										dc.w 7
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 3
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 4
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 4
										dc.b $A
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 4
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 4
										dc.b 8
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 8                  ; 0008 JOIN FORCE 1C
										dc.w $1C
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 45E44
										dc.b $1C
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 45E44
										dc.b $1C
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801C
										dc.w $801C
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1C 1F 2
										dc.w $1C
										dc.w $1F
										dc.w 2
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_607DE:           dc.w 4                  ; 0004 SET TEXT INDEX D3C
										dc.w $D3C
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3F 3F 3
										dc.b $82
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 15 27 1
										dc.b 0
										dc.b $15
										dc.b $27
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 16 28 1
										dc.b 7
										dc.b $16
										dc.b $28
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 14 28 1
										dc.b $1F
										dc.b $14
										dc.b $28
										dc.b 1
										dc.w $46                ; 0046  10 22
										dc.w $10
										dc.w $22
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461E4
										dc.b 7
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 50
										dc.b $50
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 2
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $32                ; 0032 SET CAMERA DEST D 1C
										dc.w $D
										dc.w $1C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1C
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1C
										dc.w $1C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 46172
										dc.b $1C
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1C
										dc.b $1C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $26                ; 0026 MAKE ENTITY NOD 1C
										dc.w $1C
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 5
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 5
										dc.b 0
										dc.b 3
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1C
										dc.b $1C
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $2
										dc.w 2
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 46172
										dc.b $1C
										dc.b $FF
										dc.l eas_46172          
										dc.w 5                  ; 0005 PLAY SOUND SFX_FALLING
										dc.w $58
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 3 6
										dc.b $1C
										dc.b $FF
										dc.b 3
										dc.b 6
										dc.b $80
										dc.b $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C 3F 3F 3
										dc.b $1C
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 13 21 3
										dc.b $82
										dc.b $13
										dc.b $21
										dc.b 3
										dc.w $33                ; 0033 SET QUAKE AMOUNT 5
										dc.w 5
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $32                ; 0032 SET CAMERA DEST 10 22
										dc.w $10
										dc.w $22
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 2
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 7
										dc.w 7
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 1C
										dc.w $1C
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_6093A:           dc.w 4                  ; 0004 SET TEXT INDEX D44
										dc.w $D44
										dc.w $53                ; 0053  1B 0
										dc.w $1B
										dc.w 0
										dc.w $53                ; 0053  80 FFFF
										dc.w $80
										dc.w $FFFF
										dc.w $32                ; 0032 SET CAMERA DEST 6 2
										dc.w 6
										dc.w 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 1C 1
										dc.b $1C
										dc.b 1
										dc.w $29                ; 0029 SET ENTITY DEST 0 B 7
										dc.w 0
										dc.w $B
										dc.w 7
										dc.w $29                ; 0029 SET ENTITY DEST 7 B 7
										dc.w 7
										dc.w $B
										dc.w 7
										dc.w $29                ; 0029 SET ENTITY DEST 1F B 7
										dc.w $1F
										dc.w $B
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 9
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 1
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 9
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $53                ; 0053  83 FFFF
										dc.w $83
										dc.w $FFFF
										dc.w $53                ; 0053  80 0
										dc.w $80
										dc.w 0
										dc.w 5                  ; 0005 PLAY SOUND SFX_LANDSTALKER_ITEM
										dc.w $65
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 B 4 3
										dc.b $83
										dc.b $B
										dc.b 4
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 83 0 3 1
										dc.b $83
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2E                ; 002E HIDE ENTITY 83
										dc.w $83
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $53                ; 0053  1B 0
										dc.w $1B
										dc.w 0
										dc.w $53                ; 0053  80 FFFF
										dc.w $80
										dc.w $FFFF
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1B B 4 3
										dc.b $1B
										dc.b $B
										dc.b 4
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w $53                ; 0053  80 0
										dc.w $80
										dc.w 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 9
										dc.b 1
										dc.b $D
										dc.b 1
										dc.b $D
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 8
										dc.b 1
										dc.b $80
										dc.b $80
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $2D                ; 002D MOVE ENTITY 1B FF 3 1
										dc.b $1B
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 45E44
										dc.b $1B
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 45E44
										dc.b $1B
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
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
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b $A
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1B 0
										dc.b $1B
										dc.b 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F
										dc.w $801F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60B10:           dc.w 4                  ; 0004 SET TEXT INDEX D62
										dc.w $D62
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $26                ; 0026 MAKE ENTITY NOD 1B
										dc.w $1B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
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
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 9
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1B 3
										dc.b $1B
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $A
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 1B 0 1 1
										dc.b $1B
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1B 3F 3F 3
										dc.b $1B
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 3F 3F 3
										dc.b $80
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60BA6:           dc.w 4                  ; 0004 SET TEXT INDEX D6A
										dc.w $D6A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 9
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1B 3
										dc.b $1B
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461E4
										dc.b $80
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $A
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 1B 0 1 1
										dc.b $1B
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1B 3F 3F 3
										dc.b $1B
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 3F 3F 3
										dc.b $80
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1C 1F 2
										dc.w $1C
										dc.w $1F
										dc.w 2
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60C42:           dc.w 4                  ; 0004 SET TEXT INDEX D72
										dc.w $D72
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 1C 36 2
										dc.b 0
										dc.b $1C
										dc.b $36
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 1C 37 2
										dc.b 7
										dc.b $1C
										dc.b $37
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 1B 35 2
										dc.b $1F
										dc.b $1B
										dc.b $35
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 1A 32 3
										dc.b $80
										dc.b $1A
										dc.b $32
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1B 19 35 0
										dc.b $1B
										dc.b $19
										dc.b $35
										dc.b 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $46                ; 0046  13 30
										dc.w $13
										dc.w $30
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1B
										dc.w $1B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60CA4:           dc.w 4                  ; 0004 SET TEXT INDEX D76
										dc.w $D76
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1B
										dc.w $1B
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $23                ; 0023 SET ENTITY FACING 1B 2
										dc.b $1B
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $23                ; 0023 SET ENTITY FACING 1B 0
										dc.b $1B
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $23                ; 0023 SET ENTITY FACING 1B 2
										dc.b $1B
										dc.b 2
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1B
										dc.b $1B
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$14 Y=$14
										dc.b $14
										dc.b $14
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1B FF 2 2
										dc.b $1B
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b $A
										dc.b $14
										dc.b 8
										dc.b $14
										dc.b 0
										dc.b 2
										dc.b $C
										dc.b $14
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1B 2
										dc.b $1B
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 1B FF 2 2
										dc.b $1B
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b $A
										dc.b $14
										dc.b 8
										dc.b $14
										dc.b 0
										dc.b 2
										dc.b $C
										dc.b $14
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1B 3
										dc.b $1B
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $26                ; 0026 MAKE ENTITY NOD 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1B
										dc.b $1B
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1B FF 2 2
										dc.b $1B
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 2
										dc.b $80
										dc.b $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1B
										dc.b $1B
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1B FF 3 2
										dc.b $1B
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b $C
										dc.b $50
										dc.b $80
										dc.b $80
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 460CE
										dc.b $1B
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 45E44
										dc.b $1B
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 45E44
										dc.b $1B
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1B
										dc.b $1B
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1B FF 1 2
										dc.b $1B
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b $80
										dc.b $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 45E44
										dc.b $1B
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 45E44
										dc.b $1B
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $23                ; 0023 SET ENTITY FACING 1B 0
										dc.b $1B
										dc.b 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $15                ; 0015 SET ACTSCRIPT 1B FF 460CE
										dc.b $1B
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 1B FF 3 1
										dc.b $1B
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 8
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E94
										dc.b $1F
										dc.b $FF
										dc.l eas_JumpRight      
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 2
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b $80
										dc.b $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F
										dc.w $801F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 4
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 4
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1B 3
										dc.b $1B
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8007
										dc.w $8007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F
										dc.w $801F
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 4
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 4
										dc.b $B
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 801F
										dc.w $801F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1B 0
										dc.b $1B
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $B
										dc.b 1
										dc.b $80
										dc.b $80
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60EB2:           dc.w 4                  ; 0004 SET TEXT INDEX D8C
										dc.w $D8C
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1C 1
										dc.b $1C
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1B 0
										dc.b $1B
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1C 1F 2
										dc.w $1C
										dc.w $1F
										dc.w 2
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $B
										dc.b 1
										dc.b $80
										dc.b $80
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60F18:           dc.w 4                  ; 0004 SET TEXT INDEX D8F
										dc.w $D8F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES 1F 1B
										dc.w $1F
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES 7 1B
										dc.w 7
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $26                ; 0026 MAKE ENTITY NOD 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F
										dc.w $801F
										dc.w 8                  ; 0008 JOIN FORCE 1B
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1B
										dc.w $1B
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1B
										dc.w $1B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $2C                ; 002C FOLLOW ENTITY 1B 0 5
										dc.w $1B
										dc.w 0
										dc.w 5
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
cs_60F64:           dc.w 4                  ; 0004 SET TEXT INDEX D98
										dc.w $D98
										dc.w 2                  ; 0002 DISPLAY TEXT BOX FFFF
										dc.w $FFFF
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 59 60FA4
										dc.w $59
										dc.l word_60FA4         
										dc.w 4                  ; 0004 SET TEXT INDEX D99
										dc.w $D99
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_PIANO_THEME
										dc.w $11
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.b $80                ; WAIT 5A
										dc.b $5A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $34                ; 0034 SET BLOCKS 202D 101 B04
										dc.w $202D
										dc.w $101
										dc.w $B04
										dc.w $10                ; 0010 SET FLAG 3AC FFFF
										dc.w $3AC
										dc.w $FFFF
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
word_60FA4:         dc.w 4                  ; 0004 SET TEXT INDEX D9A
										dc.w $D9A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
