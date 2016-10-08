
; SCRIPT SECTION maps\entries\map63\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map63_InitFunction:
										
										trap    #CHECK_FLAG
										dc.w $1D
										bne.s   return_5CA5C
										lea     cs_5CA5E(pc), a0
										trap    #6
return_5CA5C:
										
										rts

	; End of function ms_map63_InitFunction

cs_5CA5E:           dc.w $1A                ; 001A SET ENTITY SPRITE 1D B0
										dc.w $1D
										dc.w $B0
										dc.w $23                ; 0023 SET ENTITY FACING 1D 3
										dc.b $1D
										dc.b 3
										dc.w $1C                ; 001C STOP ENTITY ANIM 1D
										dc.w $1D
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5CA6E:           dc.w $34                ; 0034 SET BLOCKS 1036 101 D2B
										dc.w $1036
										dc.w $101
										dc.w $D2B
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $34                ; 0034 SET BLOCKS 1036 101 D2C
										dc.w $1036
										dc.w $101
										dc.w $D2C
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT 12
										dc.b $12
										dc.w $34                ; 0034 SET BLOCKS 1036 101 D2D
										dc.w $1036
										dc.w $101
										dc.w $D2D
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT 10
										dc.b $10
										dc.w $34                ; 0034 SET BLOCKS 1036 101 D2E
										dc.w $1036
										dc.w $101
										dc.w $D2E
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT E
										dc.b $E
										dc.w $34                ; 0034 SET BLOCKS 1036 101 D2F
										dc.w $1036
										dc.w $101
										dc.w $D2F
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT C
										dc.b $C
										dc.w $34                ; 0034 SET BLOCKS 1036 101 D30
										dc.w $1036
										dc.w $101
										dc.w $D30
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $34                ; 0034 SET BLOCKS 1036 101 E30
										dc.w $1036
										dc.w $101
										dc.w $E30
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $34                ; 0034 SET BLOCKS 1036 101 F30
										dc.w $1036
										dc.w $101
										dc.w $F30
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT 6
										dc.b 6
										dc.w $34                ; 0034 SET BLOCKS 1036 101 F31
										dc.w $1036
										dc.w $101
										dc.w $F31
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS 1036 101 F32
										dc.w $1036
										dc.w $101
										dc.w $F32
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS 1036 101 F33
										dc.w $1036
										dc.w $101
										dc.w $F33
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 1036 101 F34
										dc.w $1036
										dc.w $101
										dc.w $F34
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 1036 101 F35
										dc.w $1036
										dc.w $101
										dc.w $F35
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 1036 101 F36
										dc.w $1036
										dc.w $101
										dc.w $F36
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5CB34:           dc.w $35                ; 0035 SIMILAR TO SET BLOCKS 1035 101 F36
										dc.w $1035
										dc.w $101
										dc.w $F36
										dc.w $34                ; 0034 SET BLOCKS C2B 101 D2B
										dc.w $C2B
										dc.w $101
										dc.w $D2B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $35                ; 0035 SIMILAR TO SET BLOCKS 1035 101 F35
										dc.w $1035
										dc.w $101
										dc.w $F35
										dc.w $34                ; 0034 SET BLOCKS 1035 101 D2C
										dc.w $1035
										dc.w $101
										dc.w $D2C
										dc.b $80                ; WAIT 19
										dc.b $19
										dc.w $35                ; 0035 SIMILAR TO SET BLOCKS 1035 101 F34
										dc.w $1035
										dc.w $101
										dc.w $F34
										dc.w $34                ; 0034 SET BLOCKS 1035 101 D2D
										dc.w $1035
										dc.w $101
										dc.w $D2D
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $35                ; 0035 SIMILAR TO SET BLOCKS 1035 101 F33
										dc.w $1035
										dc.w $101
										dc.w $F33
										dc.w $34                ; 0034 SET BLOCKS 1035 101 D2E
										dc.w $1035
										dc.w $101
										dc.w $D2E
										dc.b $80                ; WAIT F
										dc.b $F
										dc.w $35                ; 0035 SIMILAR TO SET BLOCKS 1035 101 F32
										dc.w $1035
										dc.w $101
										dc.w $F32
										dc.w $34                ; 0034 SET BLOCKS 1035 101 D2F
										dc.w $1035
										dc.w $101
										dc.w $D2F
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $35                ; 0035 SIMILAR TO SET BLOCKS 1035 101 F31
										dc.w $1035
										dc.w $101
										dc.w $F31
										dc.w $34                ; 0034 SET BLOCKS 1035 101 D30
										dc.w $1035
										dc.w $101
										dc.w $D30
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $35                ; 0035 SIMILAR TO SET BLOCKS 1035 101 F30
										dc.w $1035
										dc.w $101
										dc.w $F30
										dc.w $34                ; 0034 SET BLOCKS 1035 101 E30
										dc.w $1035
										dc.w $101
										dc.w $E30
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5CBB4:           dc.w 4                  ; 0004 INIT TEXT CURSOR 1053 : "{LEADER} put the Arm of{N}Golem on the golem.{W1}"
										dc.w $1053
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER} put the Arm of{N}Golem on the golem.{W1}"
										dc.w $FFFF
										dc.w $1A                ; 001A SET ENTITY SPRITE 1D 1D
										dc.w $1D
										dc.w $1D
										dc.w $1B                ; 001B START ENTITY ANIM 1D
										dc.w $1D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1D : "O...ooo...wow!{W1}"
										dc.w $1D
										dc.w $15                ; 0015 SET ACTSCRIPT 1D FF 45E44
										dc.b $1D
										dc.b $FF
										dc.l eas_Jump           
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 1D 2
										dc.b $1D
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 1D 1
										dc.b $1D
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 1D 0
										dc.b $1D
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 1D 3
										dc.b $1D
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1D FF 45E44
										dc.b $1D
										dc.b $FF
										dc.l eas_Jump           
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN_HIGH_PITCH
										dc.w $4E
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1D : "That feels good....{N}My power is back!{W1}"
										dc.w $1D
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1D : "Thank you.{N}I can move again!{N}How can I express...{W1}"
										dc.w $1D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1D : "Oh, yes!  I'll join you!{N}I'll protect you!{W1}"
										dc.w $1D
										dc.w 8                  ; 0008 JOIN FORCE 1D
										dc.w $1D
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 1D
										dc.w $1D
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5CC26:           dc.w $18                ; 0018 FLASH ENTITY WHITE 0 32
										dc.w 0
										dc.w $32
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45FF0
										dc.b 0
										dc.b 0
										dc.l eas_RotateRightHighSpeed
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $A                 ; 000A EXECUTE SUBROUTINE CF4
										dc.l FadeOutToWhite
										dc.w $48                ; 0048 LOAD MAP 40 0 0
										dc.w $40
										dc.w 0
										dc.w 0
										dc.w $49                ; 0049  5 4 1
										dc.w 5
										dc.w 4
										dc.w 1
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDDC
										dc.l sub_5CDDC
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45FF0
										dc.b 0
										dc.b 0
										dc.l eas_RotateRightHighSpeed
										dc.w $A                 ; 000A EXECUTE SUBROUTINE CEA
										dc.l FadeInFromWhite
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDEC
										dc.l sub_5CDEC
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDEC
										dc.l sub_5CDEC
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDEC
										dc.l sub_5CDEC
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDEC
										dc.l sub_5CDEC
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDEC
										dc.l sub_5CDEC
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDEC
										dc.l sub_5CDEC
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDEC
										dc.l sub_5CDEC
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDEC
										dc.l sub_5CDEC
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDEC
										dc.l sub_5CDEC
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDEC
										dc.l sub_5CDEC
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $A                 ; 000A EXECUTE SUBROUTINE CF4
										dc.l FadeOutToWhite
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDF8
										dc.l sub_5CDF8
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $48                ; 0048 LOAD MAP 3F 3 3
										dc.w $3F
										dc.w 3
										dc.w 3
										dc.w $49                ; 0049  8 7 1
										dc.w 8
										dc.w 7
										dc.w 1
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45FF0
										dc.b 0
										dc.b 0
										dc.l eas_RotateRightHighSpeed
										dc.w $A                 ; 000A EXECUTE SUBROUTINE CEA
										dc.l FadeInFromWhite
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $18                ; 0018 FLASH ENTITY WHITE 0 32
										dc.w 0
										dc.w $32
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 0
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5CCF6:           dc.w $18                ; 0018 FLASH ENTITY WHITE 0 32
										dc.w 0
										dc.w $32
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45FF0
										dc.b 0
										dc.b 0
										dc.l eas_RotateRightHighSpeed
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $A                 ; 000A EXECUTE SUBROUTINE CF4
										dc.l FadeOutToWhite
										dc.w $48                ; 0048 LOAD MAP 40 0 0
										dc.w $40
										dc.w 0
										dc.w 0
										dc.w $49                ; 0049  5 4 1
										dc.w 5
										dc.w 4
										dc.w 1
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDE4
										dc.l sub_5CDE4
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45FF0
										dc.b 0
										dc.b 0
										dc.l eas_RotateRightHighSpeed
										dc.w $A                 ; 000A EXECUTE SUBROUTINE CEA
										dc.l FadeInFromWhite
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDF2
										dc.l sub_5CDF2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDF2
										dc.l sub_5CDF2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDF2
										dc.l sub_5CDF2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDF2
										dc.l sub_5CDF2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDF2
										dc.l sub_5CDF2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDF2
										dc.l sub_5CDF2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDF2
										dc.l sub_5CDF2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDF2
										dc.l sub_5CDF2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDF2
										dc.l sub_5CDF2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDF2
										dc.l sub_5CDF2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $A                 ; 000A EXECUTE SUBROUTINE CF4
										dc.l FadeOutToWhite
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5CDF8
										dc.l sub_5CDF8
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $48                ; 0048 LOAD MAP 3F 5 11
										dc.w $3F
										dc.w 5
										dc.w $11
										dc.w $49                ; 0049  A 15 1
										dc.w $A
										dc.w $15
										dc.w 1
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45FF0
										dc.b 0
										dc.b 0
										dc.l eas_RotateRightHighSpeed
										dc.w $A                 ; 000A EXECUTE SUBROUTINE CEA
										dc.l FadeInFromWhite
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $18                ; 0018 FLASH ENTITY WHITE 0 32
										dc.w 0
										dc.w $32
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 0
										dc.w 0
										dc.w $C                 ; 000C JUMP IF SET FLAG 1D 5CDDA : Claude joined
										dc.w $1D
										dc.l word_5CDDA         
										dc.w $1A                ; 001A SET ENTITY SPRITE 1D B0
										dc.w $1D
										dc.w $B0
										dc.w $23                ; 0023 SET ENTITY FACING 1D 3
										dc.b $1D
										dc.b 3
										dc.w $1C                ; 001C STOP ENTITY ANIM 1D
										dc.w $1D
word_5CDDA:         dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_5CDDC:
										
										move.b  #$A9,((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
										rts

	; End of function sub_5CDDC


; =============== S U B R O U T I N E =======================================

sub_5CDE4:
										
										move.b  #$57,((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w 
										rts

	; End of function sub_5CDE4


; =============== S U B R O U T I N E =======================================

sub_5CDEC:
										
										subq.b  #4,((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
										rts

	; End of function sub_5CDEC


; =============== S U B R O U T I N E =======================================

sub_5CDF2:
										
										addq.b  #4,((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
										rts

	; End of function sub_5CDF2


; =============== S U B R O U T I N E =======================================

sub_5CDF8:
										
										clr.b   ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
										rts

	; End of function sub_5CDF8

