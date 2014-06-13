
; SCRIPT SECTION mapsetups\map33\s2_16 :
; 
ms_map33_flag16_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_5A788-ms_map33_flag16_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5A7D2-ms_map33_flag16_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_5A7F0-ms_map33_flag16_EntityEvents
										dc.b $E
										dc.b 1
										dc.w sub_5A842-ms_map33_flag16_EntityEvents
										dc.b $10
										dc.b 1
										dc.w sub_5A864-ms_map33_flag16_EntityEvents
										dc.b $11
										dc.b 1
										dc.w sub_5A886-ms_map33_flag16_EntityEvents
										dc.b $F
										dc.b 1
										dc.w sub_5A8A8-ms_map33_flag16_EntityEvents
										dc.w $FD00
										dc.w nullsub_138-ms_map33_flag16_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_138:
										
										rts

	; End of function nullsub_138


; =============== S U B R O U T I N E =======================================

sub_5A788:
										
										trap    #1
										dc.w $16
										beq.s   loc_5A7A0
										trap    #5
										dc.w $7A0
										trap    #5
										dc.w $7A1
										trap    #5
										dc.w $7A2
										trap    #5
										dc.w $7A3
										bra.s   return_5A7D0
loc_5A7A0:
										
										trap    #1
										dc.w $312
										beq.s   loc_5A7B0
										trap    #5
										dc.w $79E
										trap    #5
										dc.w $79F
										bra.s   return_5A7D0
loc_5A7B0:
										
										trap    #1
										dc.w $310
										beq.s   loc_5A7C0
										trap    #5
										dc.w $771
										trap    #5
										dc.w $772
										bra.s   return_5A7D0
loc_5A7C0:
										
										trap    #1
										dc.w $30F
										beq.s   loc_5A7CC
										trap    #5
										dc.w $770
										bra.s   return_5A7D0
loc_5A7CC:
										
										trap    #5
										dc.w $723
return_5A7D0:
										
										rts

	; End of function sub_5A788


; =============== S U B R O U T I N E =======================================

sub_5A7D2:
										
										trap    #1
										dc.w $312
										beq.s   loc_5A7E2
										trap    #5
										dc.w $79A
										trap    #5
										dc.w $79B
										bra.s   return_5A7EE
loc_5A7E2:
										
										trap    #5
										dc.w $76A
										trap    #5
										dc.w $76B
										trap    #5
										dc.w $76C
return_5A7EE:
										
										rts

	; End of function sub_5A7D2


; =============== S U B R O U T I N E =======================================

sub_5A7F0:
										
										trap    #1
										dc.w $312
										beq.s   loc_5A800
										trap    #5
										dc.w $79C
										trap    #5
										dc.w $79D
										bra.s   return_5A826
loc_5A800:
										
										trap    #1
										dc.w $2F7
										bne.s   loc_5A80C
										trap    #5
										dc.w $77F
										bra.s   loc_5A814
loc_5A80C:
										
										trap    #5
										dc.w $76D
										trap    #5
										dc.w $76E
loc_5A814:
										
										trap    #5
										dc.w $FFFF
										lea     cs_5A828(pc), a0
										trap    #6
										trap    #2
										dc.w $2FA
										trap    #2
										dc.w $311
return_5A826:
										
										rts

	; End of function sub_5A7F0

cs_5A828:           dc.w $34                ; 0034 SET BLOCKS 110D 101 905
										dc.w $110D
										dc.w $101
										dc.w $905
										dc.w 4                  ; 0004 SET TEXT INDEX 76F
										dc.w $76F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $2C                ; 002C FOLLOW ENTITY 82 1F 2
										dc.w $82
										dc.w $1F
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_5A842:
										
										trap    #1
										dc.w $16
										bne.s   loc_5A85C
										trap    #1
										dc.w $313
										bne.s   loc_5A856
										lea     cs_5A8CA(pc), a0
										trap    #6
										dc.w $6004
loc_5A856:
										
										trap    #5
										dc.w $775
										bra.s   return_5A862
loc_5A85C:
										
										lea     cs_5A90E(pc), a0
										trap    #6
return_5A862:
										
										rts

	; End of function sub_5A842


; =============== S U B R O U T I N E =======================================

sub_5A864:
										
										trap    #1
										dc.w $16
										bne.s   loc_5A87E
										trap    #1
										dc.w $313
										bne.s   loc_5A878
										lea     cs_5A93A(pc), a0
										trap    #6
										dc.w $6004
loc_5A878:
										
										trap    #5
										dc.w $778
										bra.s   return_5A884
loc_5A87E:
										
										lea     cs_5A97E(pc), a0
										trap    #6
return_5A884:
										
										rts

	; End of function sub_5A864


; =============== S U B R O U T I N E =======================================

sub_5A886:
										
										trap    #1
										dc.w $16
										bne.s   loc_5A8A0
										trap    #1
										dc.w $313
										bne.s   loc_5A89A
										lea     cs_5A9AA(pc), a0
										trap    #6
										bra.s   loc_5A89E
loc_5A89A:
										
										trap    #5
										dc.w $77B
loc_5A89E:
										
										bra.s   return_5A8A6
loc_5A8A0:
										
										lea     cs_5A9EE(pc), a0
										trap    #6
return_5A8A6:
										
										rts

	; End of function sub_5A886


; =============== S U B R O U T I N E =======================================

sub_5A8A8:
										
										trap    #1
										dc.w $16
										bne.s   loc_5A8C2
										trap    #1
										dc.w $313
										bne.s   loc_5A8BC
										lea     cs_5AA1A(pc), a0
										trap    #6
										bra.s   loc_5A8C0
loc_5A8BC:
										
										trap    #5
										dc.w $77E
loc_5A8C0:
										
										bra.s   return_5A8C8
loc_5A8C2:
										
										lea     cs_5AA5E(pc), a0
										trap    #6
return_5A8C8:
										
										rts

	; End of function sub_5A8A8

cs_5A8CA:           dc.w 4                  ; 0004 SET TEXT INDEX 773
										dc.w $773
										dc.w 2                  ; 0002 DISPLAY TEXT BOX E
										dc.w $E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX E
										dc.w $E
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5A8E6
										dc.w $59
										dc.l cs_5A8E6           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX E
										dc.w $E
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5A8E6:           dc.w 8                  ; 0008 JOIN FORCE E
										dc.w $E
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT 10 0 463AE
										dc.b $10
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 11 0 463AE
										dc.b $11
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT F FF 463AE
										dc.b $F
										dc.b $FF
										dc.l eas_463AE          
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY E
										dc.w $E
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5A90E:           dc.w 4                  ; 0004 SET TEXT INDEX 780
										dc.w $780
										dc.w 2                  ; 0002 DISPLAY TEXT BOX E
										dc.w $E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX E
										dc.w $E
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5A92A
										dc.w $59
										dc.l word_5A92A         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX E
										dc.w $E
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5A92A:         dc.w 8                  ; 0008 JOIN FORCE E
										dc.w $E
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY E
										dc.w $E
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5A93A:           dc.w 4                  ; 0004 SET TEXT INDEX 776
										dc.w $776
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 10
										dc.w $10
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 10
										dc.w $10
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5A956
										dc.w $59
										dc.l word_5A956         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 10
										dc.w $10
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5A956:         dc.w 8                  ; 0008 JOIN FORCE 10
										dc.w $10
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT E 0 463AE
										dc.b $E
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 11 0 463AE
										dc.b $11
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT F FF 463AE
										dc.b $F
										dc.b $FF
										dc.l eas_463AE          
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 10
										dc.w $10
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5A97E:           dc.w 4                  ; 0004 SET TEXT INDEX 783
										dc.w $783
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 10
										dc.w $10
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 10
										dc.w $10
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5A99A
										dc.w $59
										dc.l word_5A99A         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 10
										dc.w $10
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5A99A:         dc.w 8                  ; 0008 JOIN FORCE 10
										dc.w $10
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 10
										dc.w $10
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5A9AA:           dc.w 4                  ; 0004 SET TEXT INDEX 779
										dc.w $779
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 11
										dc.w $11
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 11
										dc.w $11
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5A9C6
										dc.w $59
										dc.l word_5A9C6         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 11
										dc.w $11
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5A9C6:         dc.w 8                  ; 0008 JOIN FORCE 11
										dc.w $11
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT E 0 463AE
										dc.b $E
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 10 0 463AE
										dc.b $10
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT F FF 463AE
										dc.b $F
										dc.b $FF
										dc.l eas_463AE          
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 11
										dc.w $11
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5A9EE:           dc.w 4                  ; 0004 SET TEXT INDEX 786
										dc.w $786
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 11
										dc.w $11
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 11
										dc.w $11
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5AA0A
										dc.w $59
										dc.l word_5AA0A         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 11
										dc.w $11
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5AA0A:         dc.w 8                  ; 0008 JOIN FORCE 11
										dc.w $11
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 11
										dc.w $11
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5AA1A:           dc.w 4                  ; 0004 SET TEXT INDEX 77C
										dc.w $77C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX F
										dc.w $F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX F
										dc.w $F
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5AA36
										dc.w $59
										dc.l word_5AA36         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX F
										dc.w $F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5AA36:         dc.w 8                  ; 0008 JOIN FORCE F
										dc.w $F
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT E 0 463AE
										dc.b $E
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 10 0 463AE
										dc.b $10
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 11 FF 463AE
										dc.b $11
										dc.b $FF
										dc.l eas_463AE          
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY F
										dc.w $F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5AA5E:           dc.w 4                  ; 0004 SET TEXT INDEX 789
										dc.w $789
										dc.w 2                  ; 0002 DISPLAY TEXT BOX F
										dc.w $F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX F
										dc.w $F
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 5AA7A
										dc.w $59
										dc.l word_5AA7A         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX F
										dc.w $F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5AA7A:         dc.w 8                  ; 0008 JOIN FORCE F
										dc.w $F
										dc.w $10                ; 0010 SET FLAG 313 FFFF
										dc.w $313
										dc.w $FFFF
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY F
										dc.w $F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
