
; SCRIPT SECTION maps\entries\map31\mapsetups\s6_33E :
; 

; =============== S U B R O U T I N E =======================================

ms_map31_flag33E_InitFunction:
										
										trap    #1
										dc.w $340
										beq.s   loc_5D62A
										lea     cs_5D63C(pc), a0
										trap    #6
loc_5D62A:
										
										trap    #1
										dc.w $342
										beq.s   return_5D63A
										trap    #1
										dc.w $343
										bne.s   return_5D63A
										trap    #3
										dc.w $342
return_5D63A:
										
										rts

	; End of function ms_map31_flag33E_InitFunction

cs_5D63C:           dc.w $19                ; 0019 SET ENTITY POS AND FACING 88 1E 6 2
										dc.b $88
										dc.b $1E
										dc.b 6
										dc.b 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5D644:           dc.w $19                ; 0019 SET ENTITY POS AND FACING 89 8 3 2
										dc.b $89
										dc.b 8
										dc.b 3
										dc.b 2
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 89
										dc.w $89
										dc.w 5
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5D652:           dc.w 4                  ; 0004 SET TEXT INDEX 7E8
										dc.w $7E8
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 88
										dc.w $88
word_5D65E:         dc.w 4                  ; 0004 SET TEXT INDEX 7EB
										dc.w $7EB
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 59 5D712
										dc.w $59
										dc.l word_5D712         
										dc.w 9                  ; 0009 HIDE TEXTBOX AND PORTRAIT
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $29                ; 0029 SET ENTITY DEST 0 1C 3
										dc.w 0
										dc.w $1C
										dc.w 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $29                ; 0029 SET ENTITY DEST 7 1B 4
										dc.w 7
										dc.w $1B
										dc.w 4
										dc.w $29                ; 0029 SET ENTITY DEST 1F 1B 5
										dc.w $1F
										dc.w $1B
										dc.w 5
										dc.w $23                ; 0023 SET ENTITY FACING 88 1
										dc.b $88
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 46172
										dc.b $88
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 2 1
										dc.b $88
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 0 1
										dc.b $88
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 2 1
										dc.b $88
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 0 1
										dc.b $88
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 2 1
										dc.b $88
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 0 1
										dc.b $88
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 46102
										dc.b $88
										dc.b $FF
										dc.l eas_Init2          
										dc.w $23                ; 0023 SET ENTITY FACING 88 1
										dc.b $88
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 0 1
										dc.b $88
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 88 2
										dc.b $88
										dc.b 2
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5D712:         dc.w 4                  ; 0004 SET TEXT INDEX 7EA
										dc.w $7EA
										dc.w 9                  ; 0009 HIDE TEXTBOX AND PORTRAIT
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 88
										dc.w $88
										dc.w $B                 ; 000B JUMP 5D65E
										dc.l word_5D65E         
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5D724:         dc.w 4                  ; 0004 SET TEXT INDEX 7EE
										dc.w $7EE
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 88
										dc.w $88
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5D732:           dc.w $A                 ; 000A EXECUTE SUBROUTINE 5D73E
										dc.l sub_5D73E
										dc.b $80                ; WAIT B4
										dc.b $B4
										dc.w 9                  ; 0009 HIDE TEXTBOX AND PORTRAIT
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_5D73E:
										
										movem.l d0-d2/a0,-(sp)
										move.w  #$34,d0 
										moveq   #$FFFFFFFF,d1
										clr.w   d2
										jsr     j_InitPortraitWindow
										movem.l (sp)+,d0-d2/a0
										rts

	; End of function sub_5D73E

