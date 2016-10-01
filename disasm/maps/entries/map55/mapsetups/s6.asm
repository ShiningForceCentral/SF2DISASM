
; SCRIPT SECTION maps\entries\map55\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map55_InitFunction:
										
										trap    #TRAP_CHECKFLAG
										dc.w $3E7
										beq.s   (Map66s0_Blocks+$6E8-ms_map55_EntityEvents)
										lea     word_5E320(pc), a0
										trap    #6
										lea     (Map66s0_Blocks+$7B4-ms_map55_EntityEvents)(pc), a0
										trap    #6
										rts

	; End of function ms_map55_InitFunction

word_5E27C:         dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 5E2C4
										dc.b 0
										dc.b $FF
										dc.l eas_5E2C4          
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 5E2C4
										dc.b 7
										dc.b $FF
										dc.l eas_5E2C4          
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 5E2C4
										dc.b $1F
										dc.b $FF
										dc.l eas_5E2C4          
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 5E2BC : Zynk is a follower
										dc.w $4C
										dc.l cs_5E2BC           
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 5E2C4
										dc.b $1A
										dc.b $FF
										dc.l eas_5E2C4          
cs_5E2BC:           dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 251D0802
										dc.l $251D0802
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
eas_5E2C4:          dc.w $1A                ; 001A SET 1C BIT 5 $0
										dc.w 0
										dc.w 5                  ; 0005 MOVE TO ABSOLUTE DEST X=$7 Y=$7
										dc.w 7
										dc.w 7
										dc.w 0                  ; 0000 WAIT value $6
										dc.w 6
										dc.w $1F                ; 001F SET 1D BIT 3 $FFFF
										dc.w $FFFF
										dc.w $B                 ; 000B SET SPRITE SIZE $16
										dc.w $16
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $14
										dc.w $14
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $12
										dc.w $12
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $10
										dc.w $10
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $E
										dc.w $E
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $B                 ; 000B SET SPRITE SIZE $C
										dc.w $C
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
										dc.w $17                ; 0017 SET ENTITY SPRITE $3C
										dc.w $3C
										dc.w $A                 ; 000A UPDATE SPRITE
										dc.w 0                  ; 0000 WAIT value $1
										dc.w 1
										dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
word_5E320:         dc.w $48                ; 0048 LOAD MAP 4B 8 E
										dc.w $4B
										dc.w 8
										dc.w $E
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 5E33E
										dc.l byte_5E33E
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_MAIN_THEME
										dc.w 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
byte_5E33E:         dc.b 0
										dc.b $C
										dc.w $13
										dc.b 0
										dc.b 3
										dc.w $FFFF
cs_5E346:           dc.w 4                  ; 0004 SET TEXT INDEX D2B : "What a terrible waste.{N}We've lost an ancient{N}treasure.{W2}"
										dc.w $D2B
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 2 1
										dc.b 0
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 2
										dc.b 1
										dc.b $80
										dc.b $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1A 0
										dc.b $1A
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F : "What a terrible waste.{N}We've lost an ancient{N}treasure.{W2}"
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "Anyway, we have to go to{N}Arc Valley.{N}{LEADER}, let's go.{W1}"
										dc.w $1F
										dc.b $FF                ; END OF CUTSCENE SCRIPT
										dc.b $FF
