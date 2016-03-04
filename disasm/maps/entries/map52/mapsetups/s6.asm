
; SCRIPT SECTION maps\entries\map52\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map52_InitFunction:
										
										trap    #1
										dc.w $2CA
										beq.s   return_5C4EC

	; End of function ms_map52_InitFunction


; =============== S U B R O U T I N E =======================================

sub_5C4DC:
										
										trap    #1
										dc.w $2C8
										bne.s   return_5C4EC
										lea     word_5C622(pc), a0
										trap    #6
										trap    #2
										dc.w $2C8
return_5C4EC:
										
										rts

	; End of function sub_5C4DC

word_5C4EE:         dc.w 4                  ; 0004 SET TEXT INDEX 575
										dc.w $575
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $29                ; 0029 SET ENTITY DEST 0 5 17
										dc.w 0
										dc.w 5
										dc.w $17
										dc.w $29                ; 0029 SET ENTITY DEST 7 4 16
										dc.w 7
										dc.w 4
										dc.w $16
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $32                ; 0032 SET CAMERA DEST 10 4
										dc.w $10
										dc.w 4
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 461B6
										dc.b $82
										dc.b 0
										dc.l eas_461B6          
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 461B6
										dc.b $82
										dc.b 0
										dc.l eas_461B6          
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 1 6
										dc.b $83
										dc.b $FF
										dc.b 1
										dc.b 6
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 2
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461E4
										dc.b $81
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 3 1
										dc.b $83
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.b $80                ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 3 2
										dc.b $83
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $23                ; 0023 SET ENTITY FACING 83 3
										dc.b $83
										dc.b 3
										dc.w $32                ; 0032 SET CAMERA DEST 0 11
										dc.w 0
										dc.w $11
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $32                ; 0032 SET CAMERA DEST 10 7
										dc.w $10
										dc.w 7
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 460CE
										dc.b $83
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 46172
										dc.b $83
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 1 1
										dc.b $83
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 2
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 2
										dc.b 3
										dc.b 1
										dc.b $80
										dc.b $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 83 1
										dc.b $83
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $13                ; 0013 SET STORY FLAG C
										dc.w $C
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 34000000
										dc.l $34000000
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
word_5C622:         dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 16 8 0
										dc.b 7
										dc.b $16
										dc.b 8
										dc.b 0
										dc.w 4                  ; 0004 SET TEXT INDEX 9BD
										dc.w $9BD
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
