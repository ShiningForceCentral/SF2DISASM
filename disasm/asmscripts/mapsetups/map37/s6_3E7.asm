
; SCRIPT SECTION mapsetups\map37\s6_3E7 :
; 

; =============== S U B R O U T I N E =======================================

ms_map37_flag3E7_InitFunction:
										
										jsr     sub_47948
										trap    #1
										dc.w $100
										bne.s   return_5FABA
										lea     cs_5FABC(pc), a0
										trap    #6
										trap    #2
										dc.w $100
return_5FABA:
										
										rts

	; End of function ms_map37_flag3E7_InitFunction

cs_5FABC:           dc.w 4                  ; 0004 SET TEXT INDEX D1F
										dc.w $D1F
										dc.w $46                ; 0046  6 6
										dc.w 6
										dc.w 6
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 8 C 1
										dc.b 0
										dc.b 8
										dc.b $C
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D C 1
										dc.b 7
										dc.b $D
										dc.b $C
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A A A 3
										dc.b $1A
										dc.b $A
										dc.b $A
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 A B 1
										dc.b $80
										dc.b $A
										dc.b $B
										dc.b 1
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_STOP
										dc.w $20
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8007
										dc.w $8007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 3
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5FB30:           dc.w 4                  ; 0004 SET TEXT INDEX D25
										dc.w $D25
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 4
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 4
										dc.b 4
										dc.b 1
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 80
										dc.w $80
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5FB6A:           dc.w 4                  ; 0004 SET TEXT INDEX D31
										dc.w $D31
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $32                ; 0032 SET CAMERA DEST B 6
										dc.w $B
										dc.w 6
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
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $29                ; 0029 SET ENTITY DEST 1A B B
										dc.w $1A
										dc.w $B
										dc.w $B
										dc.w $29                ; 0029 SET ENTITY DEST 1A E B
										dc.w $1A
										dc.w $E
										dc.w $B
										dc.w $29                ; 0029 SET ENTITY DEST 1A F A
										dc.w $1A
										dc.w $F
										dc.w $A
										dc.w $29                ; 0029 SET ENTITY DEST 1A 10 A
										dc.w $1A
										dc.w $10
										dc.w $A
										dc.w $23                ; 0023 SET ENTITY FACING 1A 3
										dc.b $1A
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A
										dc.w $1A
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007
										dc.w $8007
										dc.w $32                ; 0032 SET CAMERA DEST 4 6
										dc.w 4
										dc.w 6
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FE
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_MITULA_SHRINE
										dc.w $28
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5FD3A
										dc.l sub_5FD3A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 1
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 1
										dc.b 6
										dc.b 1
										dc.b 2
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 6
										dc.b 1
										dc.b 2
										dc.b 5
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 1A 2
										dc.b $1A
										dc.b 2
										dc.w $32                ; 0032 SET CAMERA DEST B 6
										dc.w $B
										dc.w 6
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801A
										dc.w $801A
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $3A                ; 003A FADE OUT TO BLACK
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $48                ; 0048 LOAD MAP 4B 28 C
										dc.w $4B
										dc.w $28
										dc.w $C
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 5FDD4
										dc.l word_5FDD4
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $34                ; 0034 SET BLOCKS 3C3B 405 2C0F
										dc.w $3C3B
										dc.w $405
										dc.w $2C0F
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5FD7C
										dc.l sub_5FD7C
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $3A                ; 003A FADE OUT TO BLACK
										dc.w $48                ; 0048 LOAD MAP 25 4 6
										dc.w $25
										dc.w 4
										dc.w 6
										dc.w $49                ; 0049  9 B 0
										dc.w 9
										dc.w $B
										dc.w 0
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 9 C 1
										dc.b $80
										dc.b 9
										dc.b $C
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 A C 1
										dc.b 7
										dc.b $A
										dc.b $C
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A A B 2
										dc.b $1A
										dc.b $A
										dc.b $B
										dc.b 2
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801A
										dc.w $801A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5FD4C
										dc.l sub_5FD4C
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1A 3
										dc.b $1A
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801A
										dc.w $801A
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $3A                ; 003A FADE OUT TO BLACK
										dc.w $48                ; 0048 LOAD MAP 4B 28 C
										dc.w $4B
										dc.w $28
										dc.w $C
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 5FDD4
										dc.l word_5FDD4
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $34                ; 0034 SET BLOCKS 3C3B 405 2C0F
										dc.w $3C3B
										dc.w $405
										dc.w $2C0F
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 0 2 1E
										dc.b $80
										dc.b 0
										dc.b 2
										dc.b $1E
										dc.w $8080
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5FD5E
										dc.l sub_5FD5E
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT F
										dc.b $F
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5FD66
										dc.l sub_5FD66
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 3B3F3F00
										dc.l $3B3F3F00
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_5FD3A:
										
										moveq   #7,d7
loc_5FD3C:
										
										subq.b  #1,((RAM_Map_BackgroundAutoscrollY-$1000000)).w
										moveq   #4,d0
										jsr     (Sleep).w       
										dbf     d7,loc_5FD3C
										rts

	; End of function sub_5FD3A


; =============== S U B R O U T I N E =======================================

sub_5FD4C:
										
										moveq   #7,d7
loc_5FD4E:
										
										subq.b  #1,((RAM_Map_BackgroundAutoscrollX-$1000000)).w
										moveq   #4,d0
										jsr     (Sleep).w       
										dbf     d7,loc_5FD4E
										rts

	; End of function sub_5FD4C


; =============== S U B R O U T I N E =======================================

sub_5FD5E:
										
										move.b  #$18,((byte_FFAEEE+5-$1000000)).w
										rts

	; End of function sub_5FD5E


; =============== S U B R O U T I N E =======================================

sub_5FD66:
										
										moveq   #$B,d7
loc_5FD68:
										
										subq.b  #1,((RAM_Map_ForegroundAutoscrollX-$1000000)).w
										subq.b  #1,((RAM_Map_BackgroundAutoscrollX-$1000000)).w
										moveq   #4,d0
										jsr     (Sleep).w       
										dbf     d7,loc_5FD68
										rts

	; End of function sub_5FD66


; =============== S U B R O U T I N E =======================================

sub_5FD7C:
										
										bsr.w   sub_5FD92
										moveq   #$17,d7
loc_5FD82:
										
										addq.b  #1,((byte_FFAEEE+5-$1000000)).w
										moveq   #4,d0
										jsr     (Sleep).w       
										dbf     d7,loc_5FD82
										rts

	; End of function sub_5FD7C


; =============== S U B R O U T I N E =======================================

sub_5FD92:
										
										move.b  #1,((word_FFDFAA+1-$1000000)).w
										lea     plt_5FDB4(pc), a0
										lea     (PALETTE_4).l,a1
										moveq   #$20,d7 
										jsr     (copyBytes).w   
										lea     (FFD080_Palette1bis).l,a0
										jsr     (sub_19C8).w    
										rts

	; End of function sub_5FD92

plt_5FDB4:          dc.w 0
										dc.w 0
										dc.w 0
										dc.w $E60
										dc.w $EA4
										dc.w $CC8
										dc.w 0
										dc.w 0
										dc.w 0
										dc.w 0
										dc.w 0
										dc.w 0
										dc.w 0
										dc.w $ECC
										dc.w 0
										dc.w $EEE
word_5FDD4:         dc.w 0
										dc.w 0
										dc.w 3
										dc.b $2D
										dc.b $11
										dc.b 0
										dc.b $FD
										dc.l eas_Init           
										dc.w $FFFF
