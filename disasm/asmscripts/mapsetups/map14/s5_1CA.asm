
; SCRIPT SECTION mapsetups\map14\s5_1CA :
; 
ms_map14_flag1CA_Section5:
										dc.b $FD
										dc.b 0
										dc.b 0
										dc.b 0
										dc.w nullsub_178-ms_map14_flag1CA_Section5

; =============== S U B R O U T I N E =======================================

nullsub_178:
										
										rts

	; End of function nullsub_178

cs_58FA4:           dc.w 4                  ; 0004 SET TEXT INDEX 8D6
										dc.w $8D6
										dc.w $46                ; 0046  8 7
										dc.w 8
										dc.w 7
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 59270
										dc.l word_59270
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $53                ; 0053  0 0
										dc.w 0
										dc.w 0
										dc.w $53                ; 0053  82 0
										dc.w $82
										dc.w 0
										dc.w $53                ; 0053  85 FFFF
										dc.w $85
										dc.w $FFFF
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b 0
										dc.w 0                  ;   0000 WAIT value $4B0
										dc.w $4B0
										dc.w 4                  ;   0004 MOVE TO RELATIVE DEST X=X+$1 Y=Y+$0
										dc.w 1
										dc.w 0
										dc.w 1                  ;   0001 WAIT UNTIL DESTINATION
										dc.w 4                  ;   0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$1
										dc.w 0
										dc.w 1
										dc.w 1                  ;   0001 WAIT UNTIL DESTINATION
										dc.w 0                  ;   0000 WAIT value $258
										dc.w $258
										dc.w 4                  ;   0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$FFF9
										dc.w 0
										dc.w $FFF9
										dc.w 1                  ;   0001 WAIT UNTIL DESTINATION
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 2 2
										dc.b $82
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 0 2 2
										dc.b $80
										dc.b 0
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 1
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 2 1
										dc.b $82
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 84 0 3 1
										dc.b $84
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 0 3 1
										dc.b $85
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 3 1
										dc.b $86
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $2D                ; 002D MOVE ENTITY 82 0 3 7
										dc.b $82
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 84 0 3 7
										dc.b $84
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 0 3 7
										dc.b $85
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 3 7
										dc.b $86
										dc.b $FF
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w $2E                ; 002E HIDE ENTITY 84
										dc.w $84
										dc.w $2E                ; 002E HIDE ENTITY 85
										dc.w $85
										dc.w $2E                ; 002E HIDE ENTITY 86
										dc.w $86
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 2
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 1 6
										dc.b $83
										dc.b $FF
										dc.b 1
										dc.b 6
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 460CE
										dc.b $83
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $26                ; 0026 MAKE ENTITY NOD 83
										dc.w $83
										dc.w $26                ; 0026 MAKE ENTITY NOD 83
										dc.w $83
										dc.w $1C                ; 001C STOP ENTITY ANIM 83
										dc.w $83
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $1B                ; 001B START ENTITY ANIM 83
										dc.w $83
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
word_59122:         dc.w 4                  ; 0004 SET TEXT INDEX 8E3
										dc.w $8E3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 59142
										dc.w $59
										dc.l word_59142         
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w $B                 ; 000B JUMP 59122
										dc.l word_59122         
word_59142:         dc.w 4                  ; 0004 SET TEXT INDEX 8E6
										dc.w $8E6
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 4                  ; 0004 SET TEXT INDEX 8E8
										dc.w $8E8
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 1 2
										dc.b $83
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 83 0 3 4
										dc.b $83
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 4
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 3 FF 1 5
										dc.b 3
										dc.b $FF
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 3 0
										dc.b 3
										dc.b 0
										dc.w $32                ; 0032 SET CAMERA DEST 8 A
										dc.w 8
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 3
										dc.w 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 4 D A 3
										dc.b 4
										dc.b $D
										dc.b $A
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 2 D 9 3
										dc.b 2
										dc.b $D
										dc.b 9
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 5 D 8 3
										dc.b 5
										dc.b $D
										dc.b 8
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1 D 7 3
										dc.b 1
										dc.b $D
										dc.b 7
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 6 D 6 3
										dc.b 6
										dc.b $D
										dc.b 6
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 4 0 3 4
										dc.b 4
										dc.b 0
										dc.b 3
										dc.b 4
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 2 0 3 5
										dc.b 2
										dc.b 0
										dc.b 3
										dc.b 5
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 5 0 3 6
										dc.b 5
										dc.b 0
										dc.b 3
										dc.b 6
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1 0 3 7
										dc.b 1
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 6 FF 3 7
										dc.b 6
										dc.b $FF
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1 3
										dc.b 1
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 6 3
										dc.b 6
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 4 2
										dc.b 4
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 83 1
										dc.b $83
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY 83 0 3 7
										dc.b $83
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 7
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1 0 3 7
										dc.b 1
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 2 0 3 7
										dc.b 2
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 3 0 3 7
										dc.b 3
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 4 0 3 7
										dc.b 4
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 5 0 3 7
										dc.b 5
										dc.b 0
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 6 FF 3 7
										dc.b 6
										dc.b $FF
										dc.b 3
										dc.b 7
										dc.w $8080
										dc.w $13                ; 0013 SET STORY FLAG 8
										dc.w 8
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 48010103
										dc.l $48010103
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_59270:         dc.w $D
										dc.w $B
										dc.w 3
										dc.b $C
										dc.b $14
										dc.b 1
										dc.b 3
										dc.l eas_Init           
										dc.b $E
										dc.b $14
										dc.b 1
										dc.b 5
										dc.l eas_Init           
										dc.b $E
										dc.b $15
										dc.b 1
										dc.b 1
										dc.l eas_Init           
										dc.b $E
										dc.b $16
										dc.b 1
										dc.b 6
										dc.l eas_Init           
										dc.b $E
										dc.b $17
										dc.b 1
										dc.b 2
										dc.l eas_Init           
										dc.b $E
										dc.b $18
										dc.b 1
										dc.b 4
										dc.l eas_Init           
										dc.b $D
										dc.b $D
										dc.b 1
										dc.b $C1
										dc.l eas_Init           
										dc.b 9
										dc.b $D
										dc.b 2
										dc.b $C4
										dc.l eas_Init           
										dc.b $10
										dc.b $D
										dc.b 0
										dc.b $C2
										dc.l eas_Init           
										dc.b $D
										dc.b $14
										dc.b 1
										dc.b $CA
										dc.l eas_Init           
										dc.b $C
										dc.b $B
										dc.b 0
										dc.b $B3
										dc.l eas_Init3          
										dc.b $D
										dc.b $B
										dc.b 3
										dc.b $B3
										dc.l eas_Init3          
										dc.b $E
										dc.b $B
										dc.b 2
										dc.b $B3
										dc.l eas_Init3          
										dc.w $FFFF
