
; SCRIPT SECTION mapsetups\map22\s6_20A :
; 

; =============== S U B R O U T I N E =======================================

ms_map22_InitFunction:
										
										trap    #1
										dc.w $308
										bne.s   loc_5963E
										lea     cs_59656(pc), a0
										trap    #6
										trap    #2
										dc.w $308
loc_5963E:
										
										trap    #1
										dc.w $20A
										beq.s   return_59654
										trap    #1
										dc.w $30A
										bne.s   return_59654
										lea     cs_5996E(pc), a0
										trap    #6
										trap    #2
										dc.w $30A
return_59654:
										
										rts

	; End of function ms_map22_InitFunction

cs_59656:           dc.w 4                  ; 0004 SET TEXT INDEX 6D4
										dc.w $6D4
										dc.w $46                ; 0046  0 13
										dc.w 0
										dc.w $13
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
										dc.w $1C                ; 001C STOP ENTITY ANIM 0
										dc.w 0
										dc.w $1C                ; 001C STOP ENTITY ANIM 7
										dc.w 7
										dc.w $1C                ; 001C STOP ENTITY ANIM 1F
										dc.w $1F
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 4 8 3
										dc.b 0
										dc.b 4
										dc.b 8
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 3 7 3
										dc.b 7
										dc.b 3
										dc.b 7
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 5 7 3
										dc.b $1F
										dc.b 5
										dc.b 7
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 99 C 10 3
										dc.b $99
										dc.b $C
										dc.b $10
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 9A B F 3
										dc.b $9A
										dc.b $B
										dc.b $F
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 9B D F 3
										dc.b $9B
										dc.b $D
										dc.b $F
										dc.b 3
										dc.w $30                ; 0030 REMOVE ENTITY SHADOW 0 (null) (null)
										dc.w 0
										dc.w $30                ; 0030 REMOVE ENTITY SHADOW 7 (null) (null)
										dc.w 7
										dc.w $30                ; 0030 REMOVE ENTITY SHADOW 1F (null) (null)
										dc.w $1F
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 10
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b $10
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 10
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b $10
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 3 10
										dc.b $1F
										dc.b 0
										dc.b 3
										dc.b $10
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 99 0 6 8
										dc.b $99
										dc.b 0
										dc.b 6
										dc.b 8
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 9A 0 6 8
										dc.b $9A
										dc.b 0
										dc.b 6
										dc.b 8
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 9B FF 6 8
										dc.b $9B
										dc.b $FF
										dc.b 6
										dc.b 8
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 99
										dc.w $99
										dc.w $2E                ; 002E HIDE ENTITY 9A
										dc.w $9A
										dc.w $2E                ; 002E HIDE ENTITY 9B
										dc.w $9B
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $3
										dc.w 3
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $3
										dc.w 3
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 64
										dc.b $64
										dc.w $1B                ; 001B START ENTITY ANIM 0
										dc.w 0
										dc.w $1B                ; 001B START ENTITY ANIM 7
										dc.w 7
										dc.w $1B                ; 001B START ENTITY ANIM 1F
										dc.w $1F
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
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 7
										dc.w 7
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C01F
										dc.w $C01F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C01F
										dc.w $C01F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 1
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 64
										dc.b $64
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 2
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 82
										dc.b $82
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 0 0 2 1
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT A
										dc.b $A
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
										dc.b $80                ; WAIT 82
										dc.b $82
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45E44
										dc.b 0
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 0
										dc.w 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 7
										dc.w 7
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 46172
										dc.b 0
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 46172
										dc.b 7
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 1
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_DIALOG_BLEEP_6
										dc.w $4A
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_DIALOG_BLEEP_6
										dc.w $4A
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_DIALOG_BLEEP_6
										dc.w $4A
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_DIALOG_BLEEP_6
										dc.w $4A
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_DIALOG_BLEEP_6
										dc.w $4A
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_DIALOG_BLEEP_8
										dc.w $4C
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_DIALOG_BLEEP_8
										dc.w $4C
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_DIALOG_BLEEP_8
										dc.w $4C
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_DIALOG_BLEEP_8
										dc.w $4C
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_DIALOG_BLEEP_8
										dc.w $4C
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 2
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
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
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5994E:           dc.w 4                  ; 0004 SET TEXT INDEX 700
										dc.w $700
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $32                ; 0032 SET CAMERA DEST A 0
										dc.w $A
										dc.w 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 86
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86
										dc.w $86
										dc.w $13                ; 0013 SET STORY FLAG 16
										dc.w $16
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 16000000
										dc.l $16000000
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5996E:           dc.w 4                  ; 0004 SET TEXT INDEX 702
										dc.w $702
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $46                ; 0046  A 0
										dc.w $A
										dc.w 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 19 C 1
										dc.b 0
										dc.b $19
										dc.b $C
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 18 D 1
										dc.b 7
										dc.b $18
										dc.b $D
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 19 D 1
										dc.b $1F
										dc.b $19
										dc.b $D
										dc.b 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86
										dc.w $86
										dc.w $32                ; 0032 SET CAMERA DEST 14 7
										dc.w $14
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 86
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86
										dc.w $86
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_599A4:           dc.w $2D                ; 002D MOVE ENTITY 88 FF 1 1
										dc.b $88
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 88 3
										dc.b $88
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_599B2:           dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
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
										dc.w $29                ; 0029 SET ENTITY DEST 0 23 18
										dc.w 0
										dc.w $23
										dc.w $18
										dc.w $29                ; 0029 SET ENTITY DEST 7 22 18
										dc.w 7
										dc.w $22
										dc.w $18
										dc.w $29                ; 0029 SET ENTITY DEST 1F 21 18
										dc.w $1F
										dc.w $21
										dc.w $18
										dc.w $2D                ; 002D MOVE ENTITY 0 0 E 1
										dc.b 0
										dc.b 0
										dc.b $E
										dc.b 1
										dc.b $B
										dc.b 1
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 0 1
										dc.b 7
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b $E
										dc.b 1
										dc.b 7
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $E
										dc.b 1
										dc.b $B
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 89 24 19 1
										dc.b $89
										dc.b $24
										dc.b $19
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8A 25 18 1
										dc.b $8A
										dc.b $25
										dc.b $18
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8B 23 18 1
										dc.b $8B
										dc.b $23
										dc.b $18
										dc.b 1
										dc.w $1C                ; 001C STOP ENTITY ANIM 0
										dc.w 0
										dc.w $1C                ; 001C STOP ENTITY ANIM 7
										dc.w 7
										dc.w $1C                ; 001C STOP ENTITY ANIM 1F
										dc.w $1F
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 89
										dc.b $89
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8A
										dc.b $8A
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8B
										dc.b $8B
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 6
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 6
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 3 6
										dc.b $1F
										dc.b 0
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 89 0 3 6
										dc.b $89
										dc.b 0
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8A 0 3 6
										dc.b $8A
										dc.b 0
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8B FF 3 6
										dc.b $8B
										dc.b $FF
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 1A1A0803
										dc.l $1A1A0803
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
