
; SCRIPT SECTION battles\entries\battle16\cs_beforebattle :
; Cutscene before battle 16
bbcs_16:            dc.w 4                  ; 0004 INIT TEXT CURSOR 9D1 : "Huh?  The raft stopped!{W1}"
										dc.w $9D1
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 31 9 A
										dc.w $31
										dc.w 9
										dc.w $A
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 4B1CA
										dc.l sub_4B1CA
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4B15C
										dc.l word_4B15C
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $34                ; 0034 SET BLOCKS D04 303 0
										dc.w $D04
										dc.w $303
										dc.w 0
										dc.w $34                ; 0034 SET BLOCKS 1F04 303 D04
										dc.w $1F04
										dc.w $303
										dc.w $D04
										dc.w $25                ; 0025 CLONE ENTITY 81 82
										dc.w $81
										dc.w $82
										dc.w $25                ; 0025 CLONE ENTITY 83 84
										dc.w $83
										dc.w $84
										dc.w $25                ; 0025 CLONE ENTITY 83 85
										dc.w $83
										dc.w $85
										dc.w $25                ; 0025 CLONE ENTITY 83 86
										dc.w $83
										dc.w $86
										dc.w $25                ; 0025 CLONE ENTITY 83 87
										dc.w $83
										dc.w $87
										dc.w $25                ; 0025 CLONE ENTITY 83 88
										dc.w $83
										dc.w $88
										dc.w $25                ; 0025 CLONE ENTITY 83 89
										dc.w $83
										dc.w $89
										dc.w $25                ; 0025 CLONE ENTITY 83 8A
										dc.w $83
										dc.w $8A
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 F F 2
										dc.b 7
										dc.b $F
										dc.b $F
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F D E 3
										dc.b $1F
										dc.b $D
										dc.b $E
										dc.b 3
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007 : "Huh?  The raft stopped!{W1}"
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Did the water stop flowing?{N}What's happening?{W1}"
										dc.w $1F
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007 : "Wow!{D1}  What's that?{W1}"
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 2
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007 : "{LEADER}, look there!{W1}"
										dc.w $C007
										dc.w $32                ; 0032 SET CAMERA DEST 9 0
										dc.w 9
										dc.w 0
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 8002
										dc.w $8002
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 E 5 3
										dc.b $80
										dc.b $E
										dc.b 5
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 2
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $34                ; 0034 SET BLOCKS 0 303 D04
										dc.w 0
										dc.w $303
										dc.w $D04
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 C 4 3
										dc.b $81
										dc.b $C
										dc.b 4
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 10 4 3
										dc.b $82
										dc.b $10
										dc.b 4
										dc.b 3
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 5
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 D 2 3
										dc.b $83
										dc.b $D
										dc.b 2
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 F 2 3
										dc.b $84
										dc.b $F
										dc.b 2
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 11 3 3
										dc.b $85
										dc.b $11
										dc.b 3
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 B 4 3
										dc.b $86
										dc.b $B
										dc.b 4
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 C 5 3
										dc.b $87
										dc.b $C
										dc.b 5
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 88 D 5 3
										dc.b $88
										dc.b $D
										dc.b 5
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 89 10 5 3
										dc.b $89
										dc.b $10
										dc.b 5
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8A E 6 3
										dc.b $8A
										dc.b $E
										dc.b 6
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 83
										dc.w $83
										dc.w 5
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4002
										dc.w $4002
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007 : "M...{D1}monster!{N}It appeared from the river!{W1}"
										dc.w $C007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "It must be the monster they{N}mentioned in Polca.{W2}"
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Watch out!{W1}"
										dc.w $1F
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4B15C:         dc.w $F
										dc.w $E
										dc.w 0
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $FE
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $7B
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $7B
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.w $FFFF
