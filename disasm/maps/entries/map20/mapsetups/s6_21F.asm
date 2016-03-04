
; SCRIPT SECTION maps\entries\map20\mapsetups\s6_21F :
; 

; =============== S U B R O U T I N E =======================================

ms_map20_flag21F_InitFunction:
										
										trap    #1
										dc.w $3D6
										beq.s   loc_633BA
										lea     cs_633B2(pc), a0
										trap    #6
										bra.w   loc_633BA

	; End of function ms_map20_flag21F_InitFunction

cs_633B2:           dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 1B 32 2
										dc.b $80
										dc.b $1B
										dc.b $32
										dc.b 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; START OF FUNCTION CHUNK FOR ms_map20_flag21F_InitFunction

loc_633BA:
										
										trap    #TRAP_SOUNDCOM

; END OF FUNCTION CHUNK FOR ms_map20_flag21F_InitFunction

										dc.w MUSIC_TOWN
										jsr     (FadeInFromBlack).w
										rts
cs_633C4:           dc.w 9                  ; 0009 HIDE TEXTBOX AND PORTRAIT
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_ENDING
										dc.w $29
										dc.w $2D                ; 002D MOVE ENTITY 0 0 4 1
										dc.b 0
										dc.b 0
										dc.b 4
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 461AA
										dc.b 0
										dc.b $FF
										dc.l eas_461AA          
										dc.b $80                ; WAIT 50
										dc.b $50
										dc.w $2D                ; 002D MOVE ENTITY 0 0 0 1
										dc.b 0
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 461AA
										dc.b 0
										dc.b $FF
										dc.l eas_461AA          
										dc.w $1C                ; 001C STOP ENTITY ANIM 0
										dc.w 0
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
										dc.b 4
										dc.b 4
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 0 0 0 1
										dc.b 0
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 10
										dc.b $10
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 461AA
										dc.b 0
										dc.b $FF
										dc.l eas_461AA          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 100B4
										dc.l j_EndKiss          
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
