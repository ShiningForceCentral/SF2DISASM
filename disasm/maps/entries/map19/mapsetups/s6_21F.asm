
; SCRIPT SECTION maps\entries\map19\mapsetups\s6_21F :
; 

; =============== S U B R O U T I N E =======================================

ms_map19_flag21F_InitFunction:
										
										trap    #1
										dc.w $19
										bne.s   loc_62CAE
										move.w  #$19,d0
										jsr     MoveEntityOutOfMap
loc_62CAE:
										
										trap    #1
										dc.w 8
										bne.s   loc_62CBE
										move.w  #8,d0
										jsr     MoveEntityOutOfMap
loc_62CBE:
										
										trap    #1
										dc.w $1B
										bne.s   loc_62CCE
										move.w  #$1B,d0
										jsr     MoveEntityOutOfMap
loc_62CCE:
										
										lea     cs_62D06(pc), a0
										trap    #6
										trap    #1
										dc.w $3D5
										beq.s   loc_62CFC
										trap    #1
										dc.w $3D6
										bne.s   loc_62CF2
										lea     cs_62D0E(pc), a0
										trap    #6
										trap    #2
										dc.w $3D6
										move.b  #$FF,((FOLLOWERS_LIST-$1000000)).w
										bra.s   loc_62CFA
loc_62CF2:
										
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_TOWN
										jsr     (FadeInFromBlack).w
loc_62CFA:
										
										bra.s   return_62D04
loc_62CFC:
										
										trap    #TRAP_SOUNDCOM
										dc.w MUSIC_TOWN
										jsr     (FadeInFromBlack).w
return_62D04:
										
										rts

	; End of function ms_map19_flag21F_InitFunction

cs_62D06:           dc.w $1A                ; 001A SET ENTITY SPRITE B AA
										dc.w $B
										dc.w $AA
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_62D0E:           dc.w 4                  ; 0004 SET TEXT INDEX F7F
										dc.w $F7F
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 81
										dc.w $81
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 1A 1D 1
										dc.b $81
										dc.b $1A
										dc.b $1D
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 4 1A 1E 1
										dc.b 4
										dc.b $1A
										dc.b $1E
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1 1A 1E 1
										dc.b 1
										dc.b $1A
										dc.b $1E
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 3 1A 1E 1
										dc.b 3
										dc.b $1A
										dc.b $1E
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 2 1A 1E 1
										dc.b 2
										dc.b $1A
										dc.b $1E
										dc.b 1
										dc.w $2C                ; 002C FOLLOW ENTITY 0 81 2
										dc.w 0
										dc.w $81
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 4 81 5
										dc.w 4
										dc.w $81
										dc.w 5
										dc.w $2C                ; 002C FOLLOW ENTITY 1 81 6
										dc.w 1
										dc.w $81
										dc.w 6
										dc.w $2C                ; 002C FOLLOW ENTITY 3 4 2
										dc.w 3
										dc.w 4
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 2 1 2
										dc.w 2
										dc.w 1
										dc.w 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 4
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 4
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $43                ; 0043 RELATED TO BLOCK COPY 1D 17
										dc.w $1D
										dc.w $17
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 E
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b $E
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1 FF 460CE
										dc.b 1
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 3 FF 460CE
										dc.b 3
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 460CE
										dc.b 2
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 4 FF 460CE
										dc.b 4
										dc.b $FF
										dc.l eas_Init           
										dc.w $32                ; 0032 SET CAMERA DEST 18 5
										dc.w $18
										dc.w 5
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
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 1
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 3 1
										dc.b 3
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 1
										dc.b 2
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 4 1
										dc.b 4
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 5 1
										dc.b 5
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 19 1
										dc.b $19
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 8 1
										dc.b 8
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 13 1
										dc.b $13
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING B 1
										dc.b $B
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1A 1
										dc.b $1A
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1B 1
										dc.b $1B
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1
										dc.w 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2A                ; 002A MAKE ENTITY SHIVER A
										dc.w $A
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 800A
										dc.w $800A
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING A 2
										dc.b $A
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 800A
										dc.w $800A
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 2
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 2
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 2
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 4 0
										dc.b 4
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 19 3
										dc.b $19
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8 3
										dc.b 8
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 13 3
										dc.b $13
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING B 1
										dc.b $B
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $32                ; 0032 SET CAMERA DEST 18 7
										dc.w $18
										dc.w 7
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 3 0 461B6
										dc.b 3
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 64
										dc.b $64
										dc.w $2D                ; 002D MOVE ENTITY 3 FF 3 1
										dc.b 3
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 3 0
										dc.b 3
										dc.b 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 3
										dc.w 3
										dc.w $23                ; 0023 SET ENTITY FACING 1 3
										dc.b 1
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 4 3
										dc.b 4
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 5 0
										dc.b 5
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING A 2
										dc.b $A
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 19 0
										dc.b $19
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 8 0
										dc.b 8
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 13 2
										dc.b $13
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING B 0
										dc.b $B
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1A 0
										dc.b $1A
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1B 2
										dc.b $1B
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 3
										dc.w 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 3
										dc.w 3
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 3 0 461B6
										dc.b 3
										dc.b 0
										dc.l eas_461B6          
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1
										dc.w 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD A
										dc.w $A
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 2
										dc.b $A
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING A 2
										dc.b $A
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 3 0
										dc.b 3
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 3
										dc.w 3
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 0 1
										dc.b 5
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.b 8
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 3 2
										dc.b 3
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 3
										dc.w 3
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 8 62FB0
										dc.w 8
										dc.l word_62FB0         
										dc.w $2D                ; 002D MOVE ENTITY 8 FF 3 1
										dc.b 8
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 8
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8
										dc.w 8
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 3
										dc.w 3
word_62FB0:         dc.w 4                  ; 0004 SET TEXT INDEX F93
										dc.w $F93
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 13 FF 2 1
										dc.b $13
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 3 0
										dc.b 3
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8013
										dc.w $8013
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8013
										dc.w $8013
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 3
										dc.w 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 2
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1
										dc.w 1
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 3 1
										dc.b 3
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 1
										dc.b 2
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 4 1
										dc.b 4
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 13 1
										dc.b $13
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8001
										dc.w $8001
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1
										dc.w 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8001
										dc.w $8001
										dc.w $23                ; 0023 SET ENTITY FACING 1 2
										dc.b 1
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8001
										dc.w $8001
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1
										dc.b 1
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 2
										dc.b 2
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1 0 3 1
										dc.b 1
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 2 FF 2 1
										dc.b 2
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 2 0 45FBC
										dc.b 2
										dc.b 0
										dc.l eas_RotateRight    
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 4 3
										dc.b 4
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 3 3
										dc.b 3
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 13 3
										dc.b $13
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 3 8
										dc.b 1
										dc.b $FF
										dc.b 3
										dc.b 8
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 1
										dc.w 1
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 460CE
										dc.b 2
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 2
										dc.w 2
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 2
										dc.w 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST 18 9
										dc.w $18
										dc.w 9
										dc.w $2D                ; 002D MOVE ENTITY 2 FF 3 2
										dc.b 2
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2
										dc.w 2
										dc.w $15                ; 0015 SET ACTSCRIPT 4 FF 45E44
										dc.b 4
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 4 FF 45E44
										dc.b 4
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 4 FF 3 1
										dc.b 4
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 2
										dc.b $A
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 2 0
										dc.b 2
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8004
										dc.w $8004
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 4 0 3 2
										dc.b 4
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 45E44
										dc.b 2
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 45E44
										dc.b 2
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2
										dc.w 2
										dc.w $23                ; 0023 SET ENTITY FACING 4 1
										dc.b 4
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8004
										dc.w $8004
										dc.w $2D                ; 002D MOVE ENTITY 4 FF 3 5
										dc.b 4
										dc.b $FF
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 4
										dc.w 4
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2
										dc.w 2
										dc.w $2D                ; 002D MOVE ENTITY B FF 0 2
										dc.b $B
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 2
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 800B
										dc.w $800B
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 0 3
										dc.b $1A
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.b 3
										dc.b 1
										dc.b 8
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A
										dc.w $1A
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1A
										dc.w $1A
										dc.w $23                ; 0023 SET ENTITY FACING B 2
										dc.b $B
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 45E44
										dc.b $B
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 45E44
										dc.b $B
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 800B
										dc.w $800B
										dc.w $32                ; 0032 SET CAMERA DEST 18 5
										dc.w $18
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY A FF 1 1
										dc.b $A
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 3 1
										dc.b 3
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 1
										dc.b 2
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING B 1
										dc.b $B
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1A 1
										dc.b $1A
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 13 1
										dc.b $13
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 800A
										dc.w $800A
										dc.w $23                ; 0023 SET ENTITY FACING A 3
										dc.b $A
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 800A
										dc.w $800A
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 800A
										dc.w $800A
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 2
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 1
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
