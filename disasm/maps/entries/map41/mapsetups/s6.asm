
; SCRIPT SECTION maps\entries\map41\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map41_InitFunction:
										
										trap    #CHECK_FLAG
										dc.w $3A2
										beq.s   return_5F4AC
										lea     cs_5F4AE(pc), a0
										trap    #6
return_5F4AC:
										
										rts

	; End of function ms_map41_InitFunction

cs_5F4AE:           dc.w $34                ; 0034 SET BLOCKS D00 305 504
										dc.w $D00
										dc.w $305
										dc.w $504
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5F4B8:           dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
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
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
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
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $34                ; 0034 SET BLOCKS D06 305 504
										dc.w $D06
										dc.w $305
										dc.w $504
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $34                ; 0034 SET BLOCKS D00 305 504
										dc.w $D00
										dc.w $305
										dc.w $504
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4003
										dc.w $4003
										dc.b $80                ; WAIT 28
										dc.b $28
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
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5F594:           dc.w $2B                ; 002B  1C 6 F 1 FF
										dc.w $1C
										dc.b 6
										dc.b $F
										dc.b 1
										dc.b $FF
										dc.w 4                  ; 0004 INIT TEXT CURSOR DB9 : "Sir Astral!  {LEADER}!{W1}"
										dc.w $DB9
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "Sir Astral!  {LEADER}!{W1}"
										dc.w $1C
										dc.w $29                ; 0029 SET ENTITY DEST 1F 6 A
										dc.w $1F
										dc.w 6
										dc.w $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $32                ; 0032 SET CAMERA DEST 1 6
										dc.w 1
										dc.w 6
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "{LEADER}, wait!{W1}"
										dc.w $1C
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 4
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "May I join your force?{W1}"
										dc.w $1C
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "Well...{W1}"
										dc.w $801F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1C : "You can trust me.{N}I'm a born fighter.{W2}"
										dc.w $1C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1C : "As you know, I want to die.{W2}"
										dc.w $1C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "I will die fighting for your{N}cause, if you let me.{W1}"
										dc.w $1C
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 801F : "He's a hero in Galam.{N}I think he should join us.{W1}"
										dc.w $801F
										dc.w $26                ; 0026 MAKE ENTITY NOD 7
										dc.w 7
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "{NAME;28}, please come{N}with us.  You'll be a great{N}help.{W1}"
										dc.w $1F
										dc.w 8                  ; 0008 JOIN FORCE 1C
										dc.w $1C
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 45E44
										dc.b $1C
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 45E44
										dc.b $1C
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "Oh, thank you!  I know I can{N}take the King of the Devils!{W1}"
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $2C                ; 002C FOLLOW ENTITY 1C 1F 2
										dc.w $1C
										dc.w $1F
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
