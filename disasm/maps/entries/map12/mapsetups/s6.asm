
; SCRIPT SECTION maps\entries\map12\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map12_InitFunction:
										
										trap    #1
										dc.w $2D5
										bne.s   loc_57D10
										lea     cs_57D22(pc), a0
										trap    #6
loc_57D10:
										
										trap    #1
										dc.w $206
										beq.s   return_57D20
										move.w  #$80,d0 
										jsr     MoveEntityOutOfMap
return_57D20:
										
										rts

	; End of function ms_map12_InitFunction

cs_57D22:           dc.w 4                  ; 0004 SET TEXT INDEX C7D : "Stop!{W1}"
										dc.w $C7D
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
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 C 1F 1
										dc.b 0
										dc.b $C
										dc.b $1F
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 1F 1
										dc.b 7
										dc.b $D
										dc.b $1F
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F B 1F 1
										dc.b $1F
										dc.b $B
										dc.b $1F
										dc.b 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 5
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 5
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 5
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Stop!{W1}"
										dc.w $80
										dc.b $80                ; WAIT A
										dc.b $A
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
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Who said that?{W1}"
										dc.w $8007
										dc.w $32                ; 0032 SET CAMERA DEST 7 5
										dc.w 7
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Wow, what a huge guy!{W1}"
										dc.w $8007
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Leave here!{N}I'll attack you if you don't!{W1}"
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 7 15
										dc.w 7
										dc.w $15
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8007 : "Attack us?!  {LEADER},{N}let's get out of here!{W2}"
										dc.w $8007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "We don't want to fight him!{W1}"
										dc.w $8007
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "OK, hurry!{W1}"
										dc.w $8007
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 5
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 5
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 5
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 44372C03
										dc.l $44372C03
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
