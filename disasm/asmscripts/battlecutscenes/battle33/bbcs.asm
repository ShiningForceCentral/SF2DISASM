
; SCRIPT SECTION battlecutscenes\battle33\bbcs :
; Cutscene before battle 33
bbcs_33:            dc.w 4                  ; 0004 SET TEXT INDEX B32
										dc.w $B32
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 1F 16 1D
										dc.w $1F
										dc.w $16
										dc.w $1D
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4D048
										dc.l word_4D048
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 1B 26 2
										dc.b 7
										dc.b $1B
										dc.b $26
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 1B 25 2
										dc.b $1F
										dc.b $1B
										dc.b $25
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 16 FF 460CE
										dc.b $16
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 16 1B 24 2
										dc.b $16
										dc.b $1B
										dc.b $24
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 1008 101 2001
										dc.w $1008
										dc.w $101
										dc.w $2001
										dc.w $34                ; 0034 SET BLOCKS 327 101 1008
										dc.w $327
										dc.w $101
										dc.w $1008
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_3
										dc.w $21
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 16 FF 1 1
										dc.b $16
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 16 3
										dc.b $16
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 16
										dc.w $16
										dc.w $2D                ; 002D MOVE ENTITY 16 FF 1 1
										dc.b $16
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w $34                ; 0034 SET BLOCKS 127 202 1A20
										dc.w $127
										dc.w $202
										dc.w $1A20
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 16 0 1 6
										dc.b $16
										dc.b 0
										dc.b 1
										dc.b 6
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 7
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 1 6
										dc.b $1F
										dc.b 0
										dc.b 1
										dc.b 6
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 8
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 8
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $32                ; 0032 SET CAMERA DEST 5 8
										dc.w 5
										dc.w 8
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 16
										dc.w $16
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 16
										dc.w $16
										dc.w $32                ; 0032 SET CAMERA DEST 15 19
										dc.w $15
										dc.w $19
										dc.w $2D                ; 002D MOVE ENTITY 16 FF 3 1
										dc.b $16
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 16
										dc.w $16
										dc.w 8                  ; 0008 JOIN FORCE 16
										dc.w $16
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $51                ; 0051  16
										dc.w $16
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 4D078
										dc.l sub_4D078
										dc.w 4                  ; 0004 SET TEXT INDEX B3B
										dc.w $B3B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $10                ; 0010 SET FLAG 33F FFFF
										dc.w $33F
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 52 0
										dc.w $52
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4D048:         dc.w $1A
										dc.w $25
										dc.w 2
										dc.b $1B
										dc.b $26
										dc.b 2
										dc.b 7
										dc.l eas_Init           
										dc.b $1B
										dc.b $24
										dc.b 2
										dc.b $16
										dc.l eas_Init           
										dc.b $A
										dc.b $A
										dc.b 3
										dc.b $93
										dc.l eas_Init           
										dc.b 9
										dc.b $A
										dc.b 3
										dc.b $57
										dc.l eas_Init           
										dc.b $B
										dc.b $A
										dc.b 3
										dc.b $57
										dc.l eas_Init           
										dc.w $FFFF

; =============== S U B R O U T I N E =======================================

sub_4D078:
										
										cmp.w   #$FFFF,(RAM_Dialogue_NameIdx1).l
										beq.s   return_4D098
										jsr     (hideTextBox).l 
										move.w  #$B3A,d0
										jsr     (DisplayText).l 
										jsr     (hideTextBox).l 
return_4D098:
										
										rts

	; End of function sub_4D078

