
; SCRIPT SECTION mapsetups\map44\s6_1FA :
; 
ms_map44_flag1FA_InitFunction:
										
										rts

	; End of function ms_map44_flag1FB_InitFunction

cs_54570:           dc.w 5                  ; 0005 PLAY SOUND MUSIC_BOSS_ATTACK
										dc.w 6
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_54578:           dc.w 4                  ; 0004 SET TEXT INDEX 3F5
										dc.w $3F5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $26                ; 0026 MAKE ENTITY NOD 8A
										dc.w $8A
										dc.w $23                ; 0023 SET ENTITY FACING 8A 3
										dc.b $8A
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8A
										dc.w $8A
										dc.w $29                ; 0029 SET ENTITY DEST 0 B D
										dc.w 0
										dc.w $B
										dc.w $D
										dc.w $2D                ; 002D MOVE ENTITY 8B 0 0 4
										dc.b $8B
										dc.b 0
										dc.b 0
										dc.b 4
										dc.b 1
										dc.b 9
										dc.b $A
										dc.b 2
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8C 0 8 1E
										dc.b $8C
										dc.b 0
										dc.b 8
										dc.b $1E
										dc.b 1
										dc.b 9
										dc.b 8
										dc.b 2
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 4
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 4
byte_545B6:         dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1E 3
										dc.b $1E
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 9F 3
										dc.b $9F
										dc.b 3
										dc.w $32                ; 0032 SET CAMERA DEST A B
										dc.w $A
										dc.w $B
										dc.w $34                ; 0034 SET BLOCKS F16 301 C16
										dc.w $F16
										dc.w $301
										dc.w $C16
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS F15 301 C15
										dc.w $F15
										dc.w $301
										dc.w $C15
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS F14 301 C14
										dc.w $F14
										dc.w $301
										dc.w $C14
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS F13 301 C13
										dc.w $F13
										dc.w $301
										dc.w $C13
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS F12 301 C12
										dc.w $F12
										dc.w $301
										dc.w $C12
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS F11 301 C11
										dc.w $F11
										dc.w $301
										dc.w $C11
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS F10 301 C10
										dc.w $F10
										dc.w $301
										dc.w $C10
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS F0F 301 C0F
										dc.w $F0F
										dc.w $301
										dc.w $C0F
										dc.b $80                ; WAIT F
										dc.b $F
										dc.w $32                ; 0032 SET CAMERA DEST D C
										dc.w $D
										dc.w $C
										dc.w $23                ; 0023 SET ENTITY FACING 9F 0
										dc.b $9F
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 9F
										dc.w $9F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w $15                ; 0015 SET ACTSCRIPT 9F FF 45E44
										dc.b $9F
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 9F FF 45E44
										dc.b $9F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 9F
										dc.w $9F
										dc.w $23                ; 0023 SET ENTITY FACING 1E 0
										dc.b $1E
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E
										dc.w $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1E 3
										dc.b $1E
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 1 1
										dc.b $1F
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST B C
										dc.w $B
										dc.w $C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w $10                ; 0010 SET FLAG 4A 0
										dc.w $4A
										dc.w 0
										dc.w $32                ; 0032 SET CAMERA DEST B D
										dc.w $B
										dc.w $D
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 54714
										dc.l sub_54714
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 42 1C 1A
										dc.w $42
										dc.w $1C
										dc.w $1A
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 54736
										dc.l word_54736
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $1A                ; 001A SET ENTITY SPRITE 0 D3
										dc.w 0
										dc.w $D3
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$14 Y=$14
										dc.b $14
										dc.b $14
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 0 0 0 1
										dc.b 0
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 5
										dc.w 5
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w $34                ; 0034 SET BLOCKS 31 A0F 1C17
										dc.w $31
										dc.w $A0F
										dc.w $1C17
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.b $80                ; WAIT 5A
										dc.b $5A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 491A0D00
										dc.l $491A0D00
										dc.w $10                ; 0010 SET FLAG 280 0
										dc.w $280
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_54714:
										
										moveq   #$F,d7
loc_54716:
										
										subq.b  #1,((RAM_Map_ForegroundAutoscrollX-$1000000)).w
										moveq   #4,d0
										jsr     (Sleep).w       
										dbf     d7,loc_54716
										moveq   #$17,d7
loc_54726:
										
										addq.b  #1,((RAM_Map_BackgroundAutoscrollX-$1000000)).w
										moveq   #4,d0
										jsr     (Sleep).w       
										dbf     d7,loc_54726
										rts

	; End of function sub_54714

word_54736:         dc.w $22
										dc.w $21
										dc.w 0
										dc.w $FFFF
