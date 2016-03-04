
; SCRIPT SECTION maps\entries\map09\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map9_InitFunction:
										
										trap    #1
										dc.w $206
										bne.s   loc_568D4
										move.w  #$89,d0 
										jsr     MoveEntityOutOfMap
loc_568D4:
										
										trap    #1
										dc.w $41
										beq.s   loc_568E4
										move.w  #$B,d0
										jsr     MoveEntityOutOfMap
loc_568E4:
										
										trap    #1
										dc.w $C
										beq.s   return_568F4
										move.w  #$C,d0
										jsr     MoveEntityOutOfMap
return_568F4:
										
										rts

	; End of function ms_map9_InitFunction

cs_568F6:           dc.w 4                  ; 0004 SET TEXT INDEX 55C
										dc.w $55C
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 2 1
										dc.b $82
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $29                ; 0029 SET ENTITY DEST 7 4 3A
										dc.w 7
										dc.w 4
										dc.w $3A
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 2 1
										dc.b $82
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46102
										dc.b $82
										dc.b $FF
										dc.l eas_Init2          
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 82 0 0 1
										dc.b $82
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 1
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C082
										dc.w $C082
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C082
										dc.w $C082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C082
										dc.w $C082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_569BC:           dc.w 4                  ; 0004 SET TEXT INDEX 566
										dc.w $566
										dc.w $29                ; 0029 SET ENTITY DEST 7 F 39
										dc.w 7
										dc.w $F
										dc.w $39
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C00B
										dc.w $C00B
										dc.w $23                ; 0023 SET ENTITY FACING B 1
										dc.b $B
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C00B
										dc.w $C00B
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT B
										dc.b $B
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 46172
										dc.b 0
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY B 0 1 1
										dc.b $B
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C00B
										dc.w $C00B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C00B
										dc.w $C00B
										dc.w $29                ; 0029 SET ENTITY DEST 7 F 3A
										dc.w 7
										dc.w $F
										dc.w $3A
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING B 2
										dc.b $B
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C00B
										dc.w $C00B
										dc.w $23                ; 0023 SET ENTITY FACING B 1
										dc.b $B
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C00B
										dc.w $C00B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C00B
										dc.w $C00B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C00B
										dc.w $C00B
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 56A82
										dc.w $59
										dc.l word_56A82         
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT B
										dc.b $B
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 46172
										dc.b $B
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY B FF 3 1
										dc.b $B
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
word_56A70:         dc.w 4                  ; 0004 SET TEXT INDEX 56F
										dc.w $56F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C00B
										dc.w $C00B
										dc.w $23                ; 0023 SET ENTITY FACING B 3
										dc.b $B
										dc.b 3
										dc.w $B                 ; 000B JUMP 56AD4
										dc.l word_56AD4         
word_56A82:         dc.w 4                  ; 0004 SET TEXT INDEX 572
										dc.w $572
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C00B
										dc.w $C00B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 460CE
										dc.b $B
										dc.b $FF
										dc.l eas_Init           
										dc.w $53                ; 0053  B FFFF
										dc.w $B
										dc.w $FFFF
										dc.w $53                ; 0053  0 0
										dc.w 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 45E44
										dc.b $B
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT B 0 45E44
										dc.b $B
										dc.b 0
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C00B
										dc.w $C00B
										dc.w $53                ; 0053  0 FFFF
										dc.w 0
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 2D5 FFFF
										dc.w $2D5
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 54 FFFF
										dc.w $54
										dc.w $FFFF
										dc.w $13                ; 0013 SET STORY FLAG 12
										dc.w $12
										dc.w $2C                ; 002C FOLLOW ENTITY B 1F 2
										dc.w $B
										dc.w $1F
										dc.w 2
word_56AD4:         dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_56AE6:           dc.w 4                  ; 0004 SET TEXT INDEX 570
										dc.w $570
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C00B
										dc.w $C00B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C00B
										dc.w $C00B
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 56A82
										dc.w $59
										dc.l word_56A82         
										dc.w $B                 ; 000B JUMP 56A70
										dc.l word_56A70         
cs_56B02:           dc.w 4                  ; 0004 SET TEXT INDEX 583
										dc.w $583
										dc.w $53                ; 0053  C FFFF
										dc.w $C
										dc.w $FFFF
										dc.w $53                ; 0053  0 0
										dc.w 0
										dc.w 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C
										dc.w $C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C
										dc.w $C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C
										dc.w $C
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING C 1
										dc.b $C
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT C FF 45E44
										dc.b $C
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES C 0
										dc.w $C
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C
										dc.w $C
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES 7 C
										dc.w 7
										dc.w $C
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES C 7
										dc.w $C
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES C 0
										dc.w $C
										dc.w 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C
										dc.w $C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C
										dc.w $C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C
										dc.w $C
										dc.w 8                  ; 0008 JOIN FORCE C
										dc.w $C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C
										dc.w $C
										dc.w $15                ; 0015 SET ACTSCRIPT C FF 45E44
										dc.b $C
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT C FF 45E44
										dc.b $C
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $53                ; 0053  0 FFFF
										dc.w 0
										dc.w $FFFF
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY C
										dc.w $C
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
