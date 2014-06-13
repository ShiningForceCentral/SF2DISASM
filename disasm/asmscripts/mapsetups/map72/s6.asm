
; SCRIPT SECTION mapsetups\map72\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map72_InitFunction:
										
										trap    #1
										dc.w $2CC
										beq.s   return_4FF40
										trap    #1
										dc.w $A
										bne.s   return_4FF40
										lea     cs_4FF5A(pc), a0
										trap    #6
return_4FF40:
										
										rts

	; End of function ms_map72_InitFunction

										dc.w $36                ; 0036 RELATED TO LOADING A MAP
										dc.w $46                ; 0046  0 0
										dc.w 0
										dc.w 0
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_SAD_THEME_3
										dc.w $F
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 4                  ; 0004 SET TEXT INDEX F0
										dc.w $F0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_4FF5A:           dc.w 4                  ; 0004 SET TEXT INDEX 614
										dc.w $614
										dc.w $2B                ; 002B  A 2B 2F 3 FF
										dc.w $A
										dc.b $2B
										dc.b $2F
										dc.b 3
										dc.b $FF
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 2D 2F 2
										dc.b 0
										dc.b $2D
										dc.b $2F
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 2C 2F 3
										dc.b 7
										dc.b $2C
										dc.b $2F
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING A 2B 2F 3
										dc.b $A
										dc.b $2B
										dc.b $2F
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 2D 30 2
										dc.b $1F
										dc.b $2D
										dc.b $30
										dc.b 2
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_MAIN_THEME
										dc.w 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.w $15                ; 0015 SET ACTSCRIPT A FF 45E44
										dc.b $A
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT A FF 45E44
										dc.b $A
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING A 0
										dc.b $A
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX A
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.w 8                  ; 0008 JOIN FORCE A
										dc.w $A
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX A
										dc.w $A
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY A FF 3 1
										dc.b $A
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY A
										dc.w $A
										dc.w $13                ; 0013 SET STORY FLAG 10
										dc.w $10
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_4FFDA:           dc.w 4                  ; 0004 SET TEXT INDEX D0D
										dc.w $D0D
										dc.w $2B                ; 002B  B 3F 3F 1 B
										dc.w $B
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $B
										dc.w $2B                ; 002B  80 3F 3F 2 B5
										dc.w $80
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $B5
										dc.w $2B                ; 002B  81 3F 3F 2 B2
										dc.w $81
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $B2
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
										dc.w $32                ; 0032 SET CAMERA DEST 15 21
										dc.w $15
										dc.w $21
										dc.w $29                ; 0029 SET ENTITY DEST 801E 1B 27
										dc.w $801E
										dc.w $1B
										dc.w $27
										dc.w $29                ; 0029 SET ENTITY DEST 801F 1C 25
										dc.w $801F
										dc.w $1C
										dc.w $25
										dc.w $29                ; 0029 SET ENTITY DEST 8007 19 25
										dc.w $8007
										dc.w $19
										dc.w $25
										dc.w $29                ; 0029 SET ENTITY DEST 0 1A 25
										dc.w 0
										dc.w $1A
										dc.w $25
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 1B 24 2
										dc.b $80
										dc.b $1B
										dc.b $24
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B 1B 27 0
										dc.b $B
										dc.b $1B
										dc.b $27
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 4536C
										dc.b $B
										dc.b $FF
										dc.l eas_4536C          
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING B 1
										dc.b $B
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w $2D                ; 002D MOVE ENTITY B FF 1 1
										dc.b $B
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING B 1
										dc.b $B
										dc.b 1
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY B FF 0 1
										dc.b $B
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w $32                ; 0032 SET CAMERA DEST 15 20
										dc.w $15
										dc.w $20
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45F34
										dc.b $80
										dc.b $FF
										dc.l eas_BumpDown       
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 1B 23 2
										dc.b $81
										dc.b $1B
										dc.b $23
										dc.b 2
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 2
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $1A                ; 001A SET ENTITY SPRITE 81 AB
										dc.w $81
										dc.w $AB
										dc.w $1B                ; 001B START ENTITY ANIM 81
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45FB2
										dc.b $81
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $34                ; 0034 SET BLOCKS 0 102 1B21
										dc.w 0
										dc.w $102
										dc.w $1B21
										dc.w $2E                ; 002E HIDE ENTITY 81
										dc.w $81
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 45E44
										dc.b $B
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E6C
										dc.b 7
										dc.b 0
										dc.l eas_JumpLeft       
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E6C
										dc.b 0
										dc.b 0
										dc.l eas_JumpLeft       
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E94
										dc.b $1F
										dc.b $FF
										dc.l eas_JumpRight      
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B 1A 24 0
										dc.b $B
										dc.b $1A
										dc.b $24
										dc.b 0
										dc.b $80                ; WAIT 19
										dc.b $19
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B 1B 25 1
										dc.b $B
										dc.b $1B
										dc.b $25
										dc.b 1
										dc.b $80                ; WAIT 19
										dc.b $19
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B 1C 24 2
										dc.b $B
										dc.b $1C
										dc.b $24
										dc.b 2
										dc.b $80                ; WAIT 19
										dc.b $19
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B 1B 25 1
										dc.b $B
										dc.b $1B
										dc.b $25
										dc.b 1
										dc.b $80                ; WAIT 19
										dc.b $19
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B 1A 24 0
										dc.b $B
										dc.b $1A
										dc.b $24
										dc.b 0
										dc.b $80                ; WAIT 19
										dc.b $19
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B 1B 25 1
										dc.b $B
										dc.b $1B
										dc.b $25
										dc.b 1
										dc.b $80                ; WAIT 19
										dc.b $19
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w $23                ; 0023 SET ENTITY FACING B 2
										dc.b $B
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX B
										dc.w $B
										dc.w 2                  ; 0002 DISPLAY TEXT BOX B
										dc.w $B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w 8                  ; 0008 JOIN FORCE B
										dc.w $B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 2
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY B FF 3 1
										dc.b $B
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY B 0 3 1
										dc.b $B
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT B 0 452BA
										dc.b $B
										dc.b 0
										dc.l eas_452BA          
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 1
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 452BA
										dc.b $80
										dc.b 0
										dc.l eas_452BA          
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $2E                ; 002E HIDE ENTITY B
										dc.w $B
										dc.w $2E                ; 002E HIDE ENTITY 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2C                ; 002C FOLLOW ENTITY 1E 0 2
										dc.w $1E
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 7 1E 1
										dc.w 7
										dc.w $1E
										dc.w 1
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 1E 3
										dc.w $1F
										dc.w $1E
										dc.w 3
										dc.w $13                ; 0013 SET STORY FLAG 19
										dc.w $19
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5023E:           dc.w 4                  ; 0004 SET TEXT INDEX D1D
										dc.w $D1D
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $32                ; 0032 SET CAMERA DEST 15 21
										dc.w $15
										dc.w $21
										dc.w $29                ; 0029 SET ENTITY DEST 801E 1B 27
										dc.w $801E
										dc.w $1B
										dc.w $27
										dc.w $29                ; 0029 SET ENTITY DEST 801F 1C 25
										dc.w $801F
										dc.w $1C
										dc.w $25
										dc.w $29                ; 0029 SET ENTITY DEST 8007 19 25
										dc.w $8007
										dc.w $19
										dc.w $25
										dc.w $29                ; 0029 SET ENTITY DEST 0 1A 25
										dc.w 0
										dc.w $1A
										dc.w $25
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 1E
										dc.w $1E
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 1F
										dc.w $1F
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $1C                ; 001C STOP ENTITY ANIM 0
										dc.w 0
										dc.w $50                ; 0050 SET ENTITY SIZE 0 16 
										dc.w 0
										dc.w $16
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $50                ; 0050 SET ENTITY SIZE 0 14 
										dc.w 0
										dc.w $14
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $50                ; 0050 SET ENTITY SIZE 0 12 
										dc.w 0
										dc.w $12
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 1
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 0
										dc.w 0
										dc.w $2C                ; 002C FOLLOW ENTITY 1E 0 2
										dc.w $1E
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 7 1E 1
										dc.w 7
										dc.w $1E
										dc.w 1
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 1E 3
										dc.w $1F
										dc.w $1E
										dc.w 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
