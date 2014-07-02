
; SCRIPT SECTION mapsetups\map17\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map17_InitFunction:
										
										trap    #1
										dc.w $294
										bne.s   loc_52460
										lea     cs_5249E(pc), a0
										trap    #6
										trap    #2
										dc.w $294
loc_52460:
										
										trap    #1
										dc.w $297
										beq.s   loc_52476
										move.w  #$83,d0 
										jsr     MoveEntityOutOfMap
										lea     cs_5247C(pc), a0
										trap    #6
loc_52476:
										
										trap    #2
										dc.w $263
										rts

	; End of function ms_map17_InitFunction

cs_5247C:           dc.w $34                ; 0034 SET BLOCKS 3007 101 3008
										dc.w $3007
										dc.w $101
										dc.w $3008
										dc.w $34                ; 0034 SET BLOCKS 3E14 102 3014
										dc.w $3E14
										dc.w $102
										dc.w $3014
										dc.w $34                ; 0034 SET BLOCKS 3907 101 3908
										dc.w $3907
										dc.w $101
										dc.w $3908
										dc.w $34                ; 0034 SET BLOCKS 3E14 102 3914
										dc.w $3E14
										dc.w $102
										dc.w $3914
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5249E:           dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $55                ; 0055 RESET FORCE BATTLE STATS
										dc.w $36                ; 0036 RELATED TO LOADING A MAP
										dc.w $49                ; 0049  0 0 0
										dc.w 0
										dc.w 0
										dc.w 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 4                  ; 0004 SET TEXT INDEX 370
										dc.w $370
										dc.w $46                ; 0046  34 1
										dc.w $34
										dc.w 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 3B 4 1
										dc.b 0
										dc.b $3B
										dc.b 4
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C084
										dc.w $C084
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C085
										dc.w $C085
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C085
										dc.w $C085
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C085
										dc.w $C085
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 4
										dc.w 4
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C084
										dc.w $C084
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2
										dc.w 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C084
										dc.w $C084
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C084
										dc.w $C084
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 11 34 1
										dc.w $11
										dc.w $34
										dc.w 1
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_CASTLE
										dc.w $26
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $29                ; 0029 SET ENTITY DEST 0 3B 5
										dc.w 0
										dc.w $3B
										dc.w 5
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 2 0
										dc.b 2
										dc.b 0
										dc.w 4                  ; 0004 SET TEXT INDEX 37C
										dc.w $37C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 2
										dc.w 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2
										dc.w 2
										dc.w $23                ; 0023 SET ENTITY FACING 2 2
										dc.b 2
										dc.b 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_52530:           dc.w 4                  ; 0004 SET TEXT INDEX 385
										dc.w $385
										dc.w $32                ; 0032 SET CAMERA DEST 30 0
										dc.w $30
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C084
										dc.w $C084
										dc.w $2D                ; 002D MOVE ENTITY 2 FF 2 1
										dc.b 2
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C002
										dc.w $C002
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w $32                ; 0032 SET CAMERA DEST 2B 0
										dc.w $2B
										dc.w 0
										dc.w $1B                ; 001B START ENTITY ANIM 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 2 1
										dc.b $85
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 2 2
										dc.b 2
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 3 2
										dc.b 3
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1 2
										dc.b 1
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 4 2
										dc.b 4
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 84 2
										dc.b $84
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 85 2
										dc.b $85
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 0 1
										dc.b 5
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 5 0 461B6
										dc.b 5
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C084
										dc.w $C084
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C084
										dc.w $C084
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 5
										dc.w 5
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $23                ; 0023 SET ENTITY FACING 85 1
										dc.b $85
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 5
										dc.b 5
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$E Y=$E
										dc.b $E
										dc.b $E
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 3 1
										dc.b 5
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b $C
										dc.b $28
										dc.b 2
										dc.b 1
										dc.b $C
										dc.b $28
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 5 1
										dc.b 5
										dc.b 1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 5
										dc.b 5
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $2
										dc.w 2
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $1C                ; 001C STOP ENTITY ANIM 5
										dc.w 5
										dc.w $23                ; 0023 SET ENTITY FACING 85 2
										dc.b $85
										dc.b 2
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 2 1
										dc.b $85
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 0 2
										dc.b $85
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST 2F 0
										dc.w $2F
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 1 0
										dc.b 1
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 85 0
										dc.b $85
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 3 3
										dc.b 3
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 4 3
										dc.b 4
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 84 3
										dc.b $84
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C084
										dc.w $C084
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C084
										dc.w $C084
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 5
										dc.b 5
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $0
										dc.w 0
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $1A                ; 001A SET ENTITY SPRITE 5 3B
										dc.w 5
										dc.w $3B
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 5
										dc.w 5
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 3
										dc.w 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 5
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 2 1
										dc.b $85
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 5
										dc.w 5
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 4
										dc.w 4
										dc.w $23                ; 0023 SET ENTITY FACING 1 0
										dc.b 1
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 0 1
										dc.b $85
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w $32                ; 0032 SET CAMERA DEST 2B 0
										dc.w $2B
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 460CE
										dc.b 5
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 5
										dc.w 5
										dc.w $1A                ; 001A SET ENTITY SPRITE 5 5
										dc.w 5
										dc.w 5
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 0 1
										dc.b 5
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 5
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 2 1
										dc.b $85
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1 3
										dc.b 1
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 2 1
										dc.b 5
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w 5                  ; 0005 PLAY SOUND SFX_SECRET_PATH_ROCK
										dc.w $60
										dc.w $34                ; 0034 SET BLOCKS 3007 101 3008
										dc.w $3007
										dc.w $101
										dc.w $3008
										dc.w $34                ; 0034 SET BLOCKS 3E14 102 3014
										dc.w $3E14
										dc.w $102
										dc.w $3014
										dc.w 4                  ; 0004 SET TEXT INDEX 3A3
										dc.w $3A3
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 3 2
										dc.b 5
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b 0
										dc.b 9
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 5 1
										dc.b 5
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w 5                  ; 0005 PLAY SOUND SFX_SECRET_PATH_ROCK
										dc.w $60
										dc.w $34                ; 0034 SET BLOCKS 3907 101 3908
										dc.w $3907
										dc.w $101
										dc.w $3908
										dc.w $34                ; 0034 SET BLOCKS 3E14 102 3914
										dc.w $3E14
										dc.w $102
										dc.w $3914
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 1 2
										dc.b 5
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C005
										dc.w $C005
										dc.w $2D                ; 002D MOVE ENTITY 2 FF 0 1
										dc.b 2
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 2
										dc.w 2
										dc.w $23                ; 0023 SET ENTITY FACING 2 2
										dc.b 2
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2
										dc.w 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 3 0 45E44
										dc.b 3
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 4 FF 45E44
										dc.b 4
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 3 0 45E44
										dc.b 3
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 4 FF 45E44
										dc.b 4
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 5
										dc.w 5
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 5 0 461B6
										dc.b 5
										dc.b 0
										dc.l eas_461B6          
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C005
										dc.w $C005
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 5 1
										dc.b 5
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 46172
										dc.b 5
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 5
										dc.b 5
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 5 0 3 2
										dc.b 5
										dc.b 0
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 2 3
										dc.b 1
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.b 3
										dc.b 4
										dc.b 0
										dc.b 4
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 5 2
										dc.b 5
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C005
										dc.w $C005
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 0 3
										dc.b 1
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1 0 45EBC
										dc.b 1
										dc.b 0
										dc.l eas_BumpRight      
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 0 1
										dc.b 5
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1
										dc.b 1
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 0 1
										dc.b 1
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 1 0 45EBC
										dc.b 1
										dc.b 0
										dc.l eas_BumpRight      
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 5
										dc.b 5
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$E Y=$E
										dc.b $E
										dc.b $E
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 0 1
										dc.b 5
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 5
										dc.b 5
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 0 1
										dc.b 5
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $1C                ; 001C STOP ENTITY ANIM 5
										dc.w 5
										dc.w $23                ; 0023 SET ENTITY FACING 5 1
										dc.b 5
										dc.b 1
										dc.w $1A                ; 001A SET ENTITY SPRITE 5 3B
										dc.w 5
										dc.w $3B
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1
										dc.w 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C005
										dc.w $C005
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 0 1
										dc.b 1
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 4
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w $2C                ; 002C FOLLOW ENTITY 3 0 2
										dc.w 3
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 4 3 2
										dc.w 4
										dc.w 3
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 2 4 2
										dc.w 2
										dc.w 4
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1 2 2
										dc.w 1
										dc.w 2
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_528CA:           dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 1
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_528D4:           dc.w 4                  ; 0004 SET TEXT INDEX 3B3
										dc.w $3B3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $32                ; 0032 SET CAMERA DEST 32 3
										dc.w $32
										dc.w 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 460CE
										dc.b 5
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 5
										dc.w 5
										dc.w $1A                ; 001A SET ENTITY SPRITE 5 5
										dc.w 5
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 2 2
										dc.b 5
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 1 4
										dc.b 5
										dc.b $FF
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN
										dc.w $5C
										dc.w $34                ; 0034 SET BLOCKS 3F02 101 3904
										dc.w $3F02
										dc.w $101
										dc.w $3904
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 0 1
										dc.b 5
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_52938:           dc.w 4                  ; 0004 SET TEXT INDEX 3B8
										dc.w $3B8
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 3 1
										dc.b 5
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 5 2
										dc.b 5
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 5 0 45E44
										dc.b 5
										dc.b 0
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $3A                ; 003A FADE OUT TO BLACK
										dc.w $46                ; 0046  18 E
										dc.w $18
										dc.w $E
										dc.w $15                ; 0015 SET ACTSCRIPT 1 FF 460CE
										dc.b 1
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 460CE
										dc.b 2
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 3 FF 460CE
										dc.b 3
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 4 FF 460CE
										dc.b 4
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 460CE
										dc.b 5
										dc.b $FF
										dc.l eas_Init           
										dc.w $2E                ; 002E HIDE ENTITY 1
										dc.w 1
										dc.w $2E                ; 002E HIDE ENTITY 2
										dc.w 2
										dc.w $2E                ; 002E HIDE ENTITY 3
										dc.w 3
										dc.w $2E                ; 002E HIDE ENTITY 4
										dc.w 4
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 1D C 3
										dc.b 0
										dc.b $1D
										dc.b $C
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 5 1D B 3
										dc.b 5
										dc.b $1D
										dc.b $B
										dc.b 3
										dc.w $1C                ; 001C STOP ENTITY ANIM 0
										dc.w 0
										dc.w $1C                ; 001C STOP ENTITY ANIM 5
										dc.w 5
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 5
										dc.b 5
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45FBC
										dc.b 0
										dc.b 0
										dc.l eas_RotateRight    
										dc.w $15                ; 0015 SET ACTSCRIPT 5 0 45FBC
										dc.b 5
										dc.b 0
										dc.l eas_RotateRight    
										dc.w $29                ; 0029 SET ENTITY DEST 8000 1D 12
										dc.w $8000
										dc.w $1D
										dc.w $12
										dc.w $29                ; 0029 SET ENTITY DEST 5 1D 11
										dc.w 5
										dc.w $1D
										dc.w $11
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w $1B                ; 001B START ENTITY ANIM 0
										dc.w 0
										dc.w $1B                ; 001B START ENTITY ANIM 5
										dc.w 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 460CE
										dc.b 5
										dc.b $FF
										dc.l eas_Init           
										dc.w $2C                ; 002C FOLLOW ENTITY 5 0 2
										dc.w 5
										dc.w 0
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_52A3C:           dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 83 2
										dc.b $83
										dc.b 2
										dc.w 4                  ; 0004 SET TEXT INDEX 3BE
										dc.w $3BE
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 83 0
										dc.b $83
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 1
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 0 1
										dc.b $83
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
