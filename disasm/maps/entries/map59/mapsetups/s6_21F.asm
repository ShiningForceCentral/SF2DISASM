
; SCRIPT SECTION maps\entries\map59\mapsetups\s6_21F :
; 

; =============== S U B R O U T I N E =======================================

ms_map59_flag21F_InitFunction:
										
										trap    #CHECK_FLAG
										dc.w $21F
										beq.s   return_615E4
										lea     cs_615E6(pc), a0
										trap    #6
return_615E4:
										
										rts

	; End of function ms_map59_flag21F_InitFunction

cs_615E6:           dc.w 4                  ; 0004 INIT TEXT CURSOR EB0 : "Where am I?{N}What's going on?{W2}"
										dc.w $EB0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $46                ; 0046  9 6
										dc.w 9
										dc.w 6
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 C B 1
										dc.b 0
										dc.b $C
										dc.b $B
										dc.b 1
										dc.w $53                ; 0053  0 0
										dc.w 0
										dc.w 0
										dc.w $53                ; 0053  80 FFFF
										dc.w $80
										dc.w $FFFF
										dc.w $34                ; 0034 SET BLOCKS C27 704 A03
										dc.w $C27
										dc.w $704
										dc.w $A03
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 46172
										dc.b $83
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45FA8
										dc.b $81
										dc.b 0
										dc.l eas_Transparent    
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $3
										dc.w 3
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 46172
										dc.b $86
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 86 0 3 1
										dc.b $86
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 461AA
										dc.b $86
										dc.b $FF
										dc.l eas_461AA          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8086 : "Where am I?{N}What's going on?{W2}"
										dc.w $8086
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "I...can't...sit up.{W1}"
										dc.w $8086
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 86
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "{NAME;28}, is that you?{N}{NAME;28}, what happened?{W1}"
										dc.w $8086
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "King...King Galam...{W1}"
										dc.w $1C
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 1
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 8
										dc.b $28
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w $1A                ; 001A SET ENTITY SPRITE 1C BA
										dc.w $1C
										dc.w $BA
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "I don't know what to say.{W1}"
										dc.w $1C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8086 : "I can't see very well.{N}Am I dying?{W2}"
										dc.w $8086
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "I don't want to die!{N}{NAME;28}, tell me why.{W1}"
										dc.w $8086
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 86
										dc.w $86
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1C
										dc.w $1C
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 84 FF 0 2
										dc.b $84
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 84 : "Poor King Galam.{N}You were possessed by a{N}devil.{W1}"
										dc.w $84
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 86
										dc.w $86
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8086 : "A devil?  I don't understand.{W2}"
										dc.w $8086
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "Are you...Elis, Princess{N}of Granseal?{W1}"
										dc.w $8086
										dc.w $26                ; 0026 MAKE ENTITY NOD 84
										dc.w $84
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 84 : "Yes.{W1}"
										dc.w $84
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "I have not seen you for a{N}while.  Let me see your face.{W2}"
										dc.w $8086
										dc.w $26                ; 0026 MAKE ENTITY NOD 84
										dc.w $84
										dc.w $2D                ; 002D MOVE ENTITY 84 FF 1 1
										dc.b $84
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b $A
										dc.b $A
										dc.w $8080
										dc.w $1C                ; 001C STOP ENTITY ANIM 84
										dc.w $84
										dc.w $1A                ; 001A SET ENTITY SPRITE 84 B1
										dc.w $84
										dc.w $B1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8084 : "Can you see me now?{N}King Galam?{W1}"
										dc.w $8084
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 86
										dc.w $86
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 460CE
										dc.b $86
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 45E44
										dc.b $86
										dc.b $FF
										dc.l eas_Jump           
										dc.w $1B                ; 001B START ENTITY ANIM 86
										dc.w $86
										dc.w $1B                ; 001B START ENTITY ANIM 84
										dc.w $84
										dc.w $1A                ; 001A SET ENTITY SPRITE 84 CC
										dc.w $84
										dc.w $CC
										dc.w $23                ; 0023 SET ENTITY FACING 84 3
										dc.b $84
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 86 3
										dc.b $86
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 46172
										dc.b $86
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 86 0 0 1
										dc.b $86
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 461AA
										dc.b $86
										dc.b $FF
										dc.l eas_461AA          
										dc.w $2D                ; 002D MOVE ENTITY 86 0 1 1
										dc.b $86
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 461AA
										dc.b $86
										dc.b $FF
										dc.l eas_461AA          
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "King Galam grabbed Elis'{N}arms!{W1}"
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 46172
										dc.b $84
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 84
										dc.b $84
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $1A                ; 001A SET ENTITY SPRITE 1C 1C
										dc.w $1C
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 1C 0
										dc.b $1C
										dc.b 0
										dc.w $32                ; 0032 SET CAMERA DEST 7 5
										dc.w 7
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 84 0 1 1
										dc.b $84
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 1 1
										dc.b $86
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E44
										dc.b $85
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 45E44
										dc.b $1C
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
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E44
										dc.b $85
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 45E44
										dc.b $1C
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 1
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 8
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1C : "What are you doing?{W2}"
										dc.w $1C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "King Galam!{N}You're standing?!{W1}"
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 86 2
										dc.b $86
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "Ha, ha, ha!{N}Galam?{W1}"
										dc.w $8086
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 460CE
										dc.b $86
										dc.b $FF
										dc.l eas_Init           
										dc.w $1A                ; 001A SET ENTITY SPRITE 86 A3
										dc.w $86
										dc.w $A3
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 86
										dc.w $86
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_ZEON_ATTACK
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "I'm not Galam, you fools!{W1}"
										dc.w $8086
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45E44
										dc.b $84
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E44
										dc.b $85
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 45E44
										dc.b $1C
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45E44
										dc.b $84
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E44
										dc.b $85
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 45E44
										dc.b $1C
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 46172
										dc.b $84
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45FB2
										dc.b $84
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Zeon!{W1}"
										dc.w $8007
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 46172
										dc.b $1C
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1C
										dc.b $1C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 2 1
										dc.b $1C
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "How?!{N}You died!{W1}"
										dc.w $1C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8086 : "Never!{N}You don't know anything{N}about me!{W2}"
										dc.w $8086
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8086 : "I can't be killed by the{N}sword.{W2}"
										dc.w $8086
										dc.w $23                ; 0023 SET ENTITY FACING 86 3
										dc.b $86
										dc.b 3
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 86
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "All you can do is weaken me.{W1}"
										dc.w $8086
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 85
										dc.w $85
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8085 : "Yes, Mitula told us to{N}weaken him!{W2}"
										dc.w $8085
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8085 : "I should have remembered{N}that before Elis was{N}captured!{W1}"
										dc.w $8085
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "Y...you fiend!{W1}"
										dc.w $1C
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1C
										dc.b $1C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 0 1
										dc.b $1C
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 86 2
										dc.b $86
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "Stop!  Do you want me to kill{N}Elis?!{W1}"
										dc.w $8086
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1C
										dc.w $1C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "Scoundrel!{N}We have to save her!{W1}"
										dc.w $1C
										dc.w $32                ; 0032 SET CAMERA DEST 8 5
										dc.w 8
										dc.w 5
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 86 3
										dc.b $86
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86 : "{LEADER}!  Phoenix!{N}Come here!{W1}"
										dc.w $86
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Well, {LEADER}.{N}What should we do?{W1}"
										dc.w $8007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 86 : "Quickly!  My time is short,{N}but I can still choke her!{W2}"
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86 : "Get over here, NOW!{W1}"
										dc.w $86
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "We have no choice....{W1}"
										dc.w $8007
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER} nods hopelessly.{W1}"
										dc.w $FFFF
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
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
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 86 : "That's far enough.{N}Now, phoenix.{W2}"
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86 : "Take the Jewel of Evil{N}from {LEADER}!{W1}"
										dc.w $86
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "But, we can't remove it.{W1}"
										dc.w $8007
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 45E44
										dc.b $86
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 45E44
										dc.b $86
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86 : "Shut up!  Do it!{W1}"
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "But...{W1}"
										dc.w $8007
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 1
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 7 0 2 1
										dc.b 7
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT F
										dc.b $F
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 461AA
										dc.b 7
										dc.b $FF
										dc.l eas_461AA          
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{NAME;7} tugs at the{N}jewel.{W1}"
										dc.w $FFFF
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Nope.  Let me try this.{W1}"
										dc.w $8007
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{NAME;7} removed the{N}jewel from {LEADER}'s neck.{W1}"
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 46172
										dc.b 7
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 7 0 0 1
										dc.b 7
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT F
										dc.b $F
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 461AA
										dc.b 7
										dc.b $FF
										dc.l eas_461AA          
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Oh, my!{W1}"
										dc.w $8007
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "What should I do with it?{W1}"
										dc.w $8007
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 86 0
										dc.b $86
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86 : "Put it in front of me.{W1}"
										dc.w $86
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $26                ; 0026 MAKE ENTITY NOD 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "OK....{W1}"
										dc.w $8007
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 2
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b $A
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 86 0
										dc.b $86
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $26                ; 0026 MAKE ENTITY NOD 7
										dc.w 7
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{NAME;7} put the jewel on{N}the ground.{W1}"
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 2
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86 : "Excellent!{N}Finally, I have it back!{W1}"
										dc.w $86
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 46172
										dc.b $86
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 86 0 0 1
										dc.b $86
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 84 FF 0 1
										dc.b $84
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 86 3
										dc.b $86
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $26                ; 0026 MAKE ENTITY NOD 86
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Zeon picks up the jewel.{W1}"
										dc.w $FFFF
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 5                  ; 0005 PLAY SOUND SFX_SPELL_CAST
										dc.w $4D
										dc.w $18                ; 0018 FLASH ENTITY WHITE 86 14
										dc.w $86
										dc.w $14
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_SPELL_CAST
										dc.w $4D
										dc.w $18                ; 0018 FLASH ENTITY WHITE 86 14
										dc.w $86
										dc.w $14
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_SPELL_CAST
										dc.w $4D
										dc.w $18                ; 0018 FLASH ENTITY WHITE 86 14
										dc.w $86
										dc.w $14
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86 : "Oh...oh...I feel my powers{N}returning!{W1}"
										dc.w $86
										dc.w $23                ; 0023 SET ENTITY FACING 85 1
										dc.b $85
										dc.b 1
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 85
										dc.w $85
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8085 : "Zeon is reviving.{N}We have to stop him!{W2}"
										dc.w $8085
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8085 : "How?  Mitula!  Volcanon!{N}Tell me!{W1}"
										dc.w $8085
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86 : "Ha, ha!  Astral!{N}I'll have revived fully in a{N}few minutes.{W1}"
										dc.w $86
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86 : "You did a good job, Elis.{N}You may take a rest now.{W1}"
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8084 : "A rest?  Wha...{W1}"
										dc.w $8084
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "A black cloud envelopes{N}Elis.{W1}"
										dc.w $FFFF
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 E 8 2
										dc.b $83
										dc.b $E
										dc.b 8
										dc.b 2
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8084 : "Ohhh....{W1}"
										dc.w $8084
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $1C                ; 001C STOP ENTITY ANIM 84
										dc.w $84
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 83 0 3 1
										dc.b $83
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 84 FF 3 1
										dc.b $84
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 84 1
										dc.b $84
										dc.b 1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 84
										dc.b $84
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $2
										dc.w 2
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2E                ; 002E HIDE ENTITY 83
										dc.w $83
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 0 1
										dc.b $1C
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "Princess!{W1}"
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 86 2
										dc.b $86
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86 : "And you too {NAME;28}.{N}So long!{W1}"
										dc.w $86
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 C 8 2
										dc.b $82
										dc.b $C
										dc.b 8
										dc.b 2
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 82
										dc.w $82
										dc.w 5
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "Aauugghhh!{N}I'm burning!{W1}"
										dc.w $1C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1C
										dc.b $1C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 82 0 3 2
										dc.b $82
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 3 2
										dc.b $1C
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1C
										dc.b $1C
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $2
										dc.w 2
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 85 2
										dc.b $85
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86 : "That is special fire.{N}It burns even vampires!{W1}"
										dc.w $86
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 86
										dc.w $86
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 85 1
										dc.b $85
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "NO!{W1}"
										dc.w $8007
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 460CE
										dc.b $85
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 7 0 2 1
										dc.b 7
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 1 1
										dc.b $85
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 85 2
										dc.b $85
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 86 0
										dc.b $86
										dc.b 0
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 46172
										dc.b 7
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 46172
										dc.b $85
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 86 0 45EBC
										dc.b $86
										dc.b 0
										dc.l eas_BumpRight      
										dc.w $18                ; 0018 FLASH ENTITY WHITE 86 28
										dc.w $86
										dc.w $28
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 7 0 0 4
										dc.b 7
										dc.b 0
										dc.b 0
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 0 7 4
										dc.b $85
										dc.b 0
										dc.b 7
										dc.b 4
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_FALLING
										dc.w $58
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 85
										dc.w $85
										dc.w 5                  ; 0005 PLAY SOUND SFX_LIGHTNING_2
										dc.w $52
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4
										dc.w 4
										dc.w $29                ; 0029 SET ENTITY DEST 86 D 8
										dc.w $86
										dc.w $D
										dc.w 8
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
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
										dc.w $23                ; 0023 SET ENTITY FACING 85 1
										dc.b $85
										dc.b 1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $2
										dc.w 2
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45F0C
										dc.b 0
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER} slapped the jewel{N}out of Zeon's hand.{W1}"
										dc.w $FFFF
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 E 8 3
										dc.b $81
										dc.b $E
										dc.b 8
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 81 0 0 2
										dc.b $81
										dc.b 0
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 86 3
										dc.b $86
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 86
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86 : "Ouch, darn you {LEADER}!{W1}"
										dc.w $86
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 46172
										dc.b 0
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 86 0 45F34
										dc.b $86
										dc.b 0
										dc.l eas_BumpDown       
										dc.w $18                ; 0018 FLASH ENTITY WHITE 86 A
										dc.w $86
										dc.w $A
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 5
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_FALLING
										dc.w $58
										dc.w $18                ; 0018 FLASH ENTITY WHITE 86 28
										dc.w $86
										dc.w $28
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 0
										dc.w 0
										dc.w 5                  ; 0005 PLAY SOUND SFX_LIGHTNING_2
										dc.w $52
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4
										dc.w 4
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $2
										dc.w 2
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0 : "Ohhh....{W1}"
										dc.w 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER} is stunned.{W1}"
										dc.w $FFFF
										dc.w $32                ; 0032 SET CAMERA DEST A 4
										dc.w $A
										dc.w 4
										dc.w $23                ; 0023 SET ENTITY FACING 86 3
										dc.b $86
										dc.b 3
										dc.w $1C                ; 001C STOP ENTITY ANIM 86
										dc.w $86
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 86 0 461B6
										dc.b $86
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $1B                ; 001B START ENTITY ANIM 86
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "That's what you get!{W1}"
										dc.w $8086
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 86 0
										dc.b $86
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 0 1
										dc.b $86
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST A 6
										dc.w $A
										dc.w 6
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 D E 3
										dc.b $80
										dc.b $D
										dc.b $E
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 3
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.b 5
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 5                  ; 0005 PLAY SOUND SFX_PRISM_LASER_FIRING
										dc.w $6C
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3F 3F 2
										dc.b $82
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_FINAL_BATTLE
										dc.w $24
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1C
										dc.w $1C
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1C
										dc.w $1C
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 1C
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "Groovy!{W1}"
										dc.w $1C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1C
										dc.b $1C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 1
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8085 : "{NAME;28}...{W1}"
										dc.w $8085
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 1
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 8
										dc.b 1
										dc.w $8080
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 86
										dc.w $86
										dc.w $32                ; 0032 SET CAMERA DEST 8 3
										dc.w 8
										dc.w 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "What?  How?{W1}"
										dc.w $8086
										dc.w $23                ; 0023 SET ENTITY FACING 86 2
										dc.b $86
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "{NAME;28}...leave, now!{W1}"
										dc.w $8086
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1C : "King Galam...{W2}"
										dc.w $1C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "Please stop!{W1}"
										dc.w $1C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "Get away!{W1}"
										dc.w $8086
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "I'll go, but I'll take you{N}with me to another dimension.{W1}"
										dc.w $1C
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 0 1
										dc.b $1C
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "Die!{W1}"
										dc.w $8086
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 46172
										dc.b $1C
										dc.b $FF
										dc.l eas_46172          
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 1C 0 2 3
										dc.b $1C
										dc.b 0
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 1C
										dc.w $1C
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 A 8 2
										dc.b $82
										dc.b $A
										dc.b 8
										dc.b 2
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 82
										dc.w $82
										dc.w 5
										dc.w $32                ; 0032 SET CAMERA DEST 8 6
										dc.w 8
										dc.w 6
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 D E 3
										dc.b $80
										dc.b $D
										dc.b $E
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 3
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.b 5
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 5                  ; 0005 PLAY SOUND SFX_PRISM_LASER_FIRING
										dc.w $6C
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3F 3F 2
										dc.b $82
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $32                ; 0032 SET CAMERA DEST 8 3
										dc.w 8
										dc.w 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "King...Galam...{W1}"
										dc.w $1C
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 0 1
										dc.b $1C
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 2 1
										dc.b $1C
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 0 2
										dc.b $1C
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 86
										dc.w $86
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8086 : "How?  It's not possible!{W2}"
										dc.w $8086
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8086 : "You can't still be alive!{W2}"
										dc.w $8086
										dc.w $23                ; 0023 SET ENTITY FACING 86 3
										dc.b $86
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 86
										dc.w $86
										dc.w $23                ; 0023 SET ENTITY FACING 86 0
										dc.b $86
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "Oh, my powers are fading.{N}Where's the jewel?!{W1}"
										dc.w $8086
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 86
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C : "My King...come with me....{W1}"
										dc.w $1C
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 0 1
										dc.b $1C
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C 0 0 1
										dc.b $1C
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 19
										dc.b $19
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 461AA
										dc.b $1C
										dc.b $FF
										dc.l eas_461AA          
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "No, I'll never go back to{N}such a terrible...{W1}"
										dc.w $8086
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 86
										dc.w $86
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 46172
										dc.b $86
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$5 Y=$5
										dc.b 5
										dc.b 5
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1C
										dc.b $1C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$5 Y=$5
										dc.b 5
										dc.b 5
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 86 0 2 1
										dc.b $86
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C 0 2 1
										dc.b $1C
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 86
										dc.w $86
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 86
										dc.w $86
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 86
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "I shall return!{N}Remember!{W1}"
										dc.w $8086
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 46172
										dc.b $1C
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 46172
										dc.b $86
										dc.b $FF
										dc.l eas_46172          
										dc.w $23                ; 0023 SET ENTITY FACING 86 3
										dc.b $86
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w $53                ; 0053  86 FFFF
										dc.w $86
										dc.w $FFFF
										dc.w $53                ; 0053  1C 0
										dc.w $1C
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 1C 0 4 1
										dc.b $1C
										dc.b 0
										dc.b 4
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 461AA
										dc.b $1C
										dc.b $FF
										dc.l eas_461AA          
										dc.w $2D                ; 002D MOVE ENTITY 86 0 1 3
										dc.b $86
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C 0 1 3
										dc.b $1C
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 86
										dc.w $86
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 86
										dc.w $86
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 86
										dc.w $86
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 86
										dc.w $86
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 86
										dc.w $86
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 86
										dc.w $86
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 86
										dc.w $86
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 86
										dc.w $86
										dc.w 5                  ; 0005 PLAY SOUND SFX_FALLING
										dc.w $58
										dc.w $15                ; 0015 SET ACTSCRIPT 86 0 463AE
										dc.b $86
										dc.b 0
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 463AE
										dc.b $1C
										dc.b $FF
										dc.l eas_463AE          
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8086 : "Noooooooooo!{W1}"
										dc.w $8086
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $34                ; 0034 SET BLOCKS 1427 704 A03
										dc.w $1427
										dc.w $704
										dc.w $A03
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 7
										dc.w 7
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 7
										dc.w 7
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "{NAME;28} has taken Zeon{N}away.{W1}"
										dc.w $8007
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_SAD_THEME_3
										dc.w $F
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 85
										dc.w $85
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 460CE
										dc.b $85
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 85
										dc.w $85
										dc.w $23                ; 0023 SET ENTITY FACING 85 3
										dc.b $85
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 85
										dc.w $85
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 0 1
										dc.b $85
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8085 : "It's over.{W2}"
										dc.w $8085
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8085 : "But, what a tragic ending.{W1}"
										dc.w $8085
										dc.w $26                ; 0026 MAKE ENTITY NOD 7
										dc.w 7
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "{LEADER}?  Is he OK?{W1}"
										dc.w $8007
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 0 3 4
										dc.b $85
										dc.b 0
										dc.b 3
										dc.b 4
										dc.b 2
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 5
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 5
										dc.b 2
										dc.b 6
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 85 1
										dc.b $85
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 0
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "{LEADER},  Zeon was{N}taken away by {NAME;28}.{W1}"
										dc.w $8007
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER} nods.{W1}"
										dc.w $FFFF
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8085 : "Oh, is she...is Princess{N}Elis OK?{W1}"
										dc.w $8085
										dc.w $2D                ; 002D MOVE ENTITY 85 0 1 2
										dc.b $85
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 8 5
										dc.w 8
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 5
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 5
										dc.b 8
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 0 1 5
										dc.b $85
										dc.b 0
										dc.b 1
										dc.b 5
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b $A
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 6
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 6
										dc.b 0
										dc.b 1
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $53                ; 0053  7 FFFF
										dc.w 7
										dc.w $FFFF
										dc.w $53                ; 0053  84 0
										dc.w $84
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45F0C
										dc.b 7
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45F0C
										dc.b 7
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Princess!{W1}"
										dc.w $8007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{NAME;7} shakes her{N}wildly.{W1}"
										dc.w $FFFF
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $1D                ; 001D SHOW PORTRAIT 8084
										dc.w $8084
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 6269C
										dc.l sub_6269C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8084 : "Elis does not respond.{W1}"
										dc.w $8084
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "She's so cold, and looks so{N}pale.{W2}"
										dc.w $8007
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 9
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Sir Astral, is she dead?{W1}"
										dc.w $8007
										dc.w $23                ; 0023 SET ENTITY FACING 85 3
										dc.b $85
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8085 : "I don't think so.{N}Let me see her.{W1}"
										dc.w $8085
										dc.w $23                ; 0023 SET ENTITY FACING 85 2
										dc.b $85
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 46172
										dc.b $85
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 85 0 2 1
										dc.b $85
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 10
										dc.b $10
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 461AA
										dc.b $85
										dc.b $FF
										dc.l eas_461AA          
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Astral examines Elis.{W1}"
										dc.w $FFFF
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 85 0 0 1
										dc.b $85
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 10
										dc.b $10
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 461AA
										dc.b $85
										dc.b $FF
										dc.l eas_461AA          
										dc.w $23                ; 0023 SET ENTITY FACING 85 3
										dc.b $85
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8085 : "No. She's cold, but she's{N}breathing.{W2}"
										dc.w $8085
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8085 : "I don't understand....{W1}"
										dc.w $8085
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "She's in a coma.{W1}"
										dc.w $87
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 461B6
										dc.b $85
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461E4
										dc.b 7
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 85 1
										dc.b $85
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_MITULA
										dc.w $E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 D 7 3
										dc.b $87
										dc.b $D
										dc.b 7
										dc.b 3
										dc.w 5                  ; 0005 PLAY SOUND SFX_PRISM_LASER_FIRING
										dc.w $6C
										dc.w $18                ; 0018 FLASH ENTITY WHITE 87 46
										dc.w $87
										dc.w $46
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E44
										dc.b $85
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E44
										dc.b $85
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 1 1
										dc.b $85
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 85 2
										dc.b $85
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8085 : "Goddess Mitula...?{W1}"
										dc.w $8085
										dc.w $32                ; 0032 SET CAMERA DEST 8 4
										dc.w 8
										dc.w 4
										dc.w $26                ; 0026 MAKE ENTITY NOD 87
										dc.w $87
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "Hello, Astral.{N}{LEADER} and {NAME;7},{N}you did very well.{W1}"
										dc.w $87
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Mitula!  I knew you would{N}come.{W1}"
										dc.w 7
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 87
										dc.w $87
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "We've been watching.{W1}"
										dc.w $87
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "We?  I don't see anybody{N}else?{W1}"
										dc.w $8007
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 50
										dc.b $50
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "C'mon, {NAME;7}.{N}You know what I mean.{W1}"
										dc.w $87
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "Volcanon?{W1}"
										dc.w $8007
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 46172
										dc.b 7
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 7
										dc.w 7
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "Yes.  He helped you many{N}times.{W1}"
										dc.w $87
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 3
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.b 1
										dc.b 3
										dc.b 8
										dc.b 1
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST 8 3
										dc.w 8
										dc.w 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8007 : "When?{W1}"
										dc.w $8007
										dc.w $23                ; 0023 SET ENTITY FACING 87 2
										dc.b $87
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8087 : "You doubt me?{W2}"
										dc.w $8087
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8087 : "How about {NAME;28}?{N}God Volcanon protected him{N}from the fire.{W1}"
										dc.w $8087
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Really?  But he said, he{N}would forsake the people{N}of the earth.{W1}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8087 : "He said that to deceive the{N}devils.{W2}"
										dc.w $8087
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8087 : "If he had joined you at{N}that time, Zeon would've{N}come to Parmecia.{W2}"
										dc.w $8087
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8087 : "The entire continent might{N}have been destroyed.{W2}"
										dc.w $8087
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8087 : "And if Volcanon had joined{N}you, you would've leaned{N}on him, wouldn't you have?{W1}"
										dc.w $8087
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8085 : "The Jewel of Light was made{N}by him, wasn't it?{W2}"
										dc.w $8085
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 87 0
										dc.b $87
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 460CE
										dc.b $85
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 2 1
										dc.b $85
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b $A
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8085 : "It protected {NAME;28}, right?{W1}"
										dc.w $8085
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 87 3
										dc.b $87
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 87
										dc.w $87
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "You're very smart, Astral.{W1}"
										dc.w $87
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.b $80                ; WAIT 5A
										dc.b $5A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 87 : "I have to go now.{W2}"
										dc.w $87
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "I need the Jewel of Light.{W1}"
										dc.w $87
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 3 1
										dc.b $87
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 85 3
										dc.b $85
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 87 FF 46172
										dc.b $87
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 87
										dc.b $87
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$A Y=$A
										dc.b $A
										dc.b $A
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 87 0 3 1
										dc.b $87
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 10
										dc.b $10
										dc.w $15                ; 0015 SET ACTSCRIPT 87 FF 461AA
										dc.b $87
										dc.b $FF
										dc.l eas_461AA          
										dc.w $18                ; 0018 FLASH ENTITY WHITE 87 28
										dc.w $87
										dc.w $28
										dc.w $2D                ; 002D MOVE ENTITY 87 0 1 1
										dc.b $87
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 10
										dc.b $10
										dc.w $15                ; 0015 SET ACTSCRIPT 87 FF 461AA
										dc.b $87
										dc.b $FF
										dc.l eas_461AA          
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Mitula took the Jewel of{N}Light from {LEADER}.{W1}"
										dc.w $FFFF
										dc.w $26                ; 0026 MAKE ENTITY NOD 87
										dc.w $87
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "And I need the Jewel of Evil.{W1}"
										dc.w $87
										dc.w $15                ; 0015 SET ACTSCRIPT 87 FF 46102
										dc.b $87
										dc.b $FF
										dc.l eas_Init2          
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 0 3
										dc.b $87
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 85 0
										dc.b $85
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $26                ; 0026 MAKE ENTITY NOD 87
										dc.w $87
										dc.w $2E                ; 002E HIDE ENTITY 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Mitula took the Jewel{N}of Evil.{W1}"
										dc.w $FFFF
										dc.w $23                ; 0023 SET ENTITY FACING 87 2
										dc.b $87
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8087 : "I have to seal Zeon before{N}he regains his power.{W2}"
										dc.w $8087
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8087 : "You had better leave now.{N}Arc Valley will be destroyed.{W1}"
										dc.w $8087
										dc.w $23                ; 0023 SET ENTITY FACING 87 1
										dc.b $87
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $18                ; 0018 FLASH ENTITY WHITE 87 3C
										dc.w $87
										dc.w $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85 : "One more thing!{W1}"
										dc.w $85
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 87 2
										dc.b $87
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8087 : "Yes?{W1}"
										dc.w $8087
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 3 1
										dc.b $85
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 8
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85 : "How do we wake Elis up?{W1}"
										dc.w $85
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8087 : "She has been poisoned.{W2}"
										dc.w $8087
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8087 : "When the poison leaves her{N}body, her face will turn pink.{W1}"
										dc.w $8087
										dc.w $23                ; 0023 SET ENTITY FACING 85 3
										dc.b $85
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $26                ; 0026 MAKE ENTITY NOD 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85 : "Then she will awaken?{W1}"
										dc.w $85
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 85 0
										dc.b $85
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8087 : "If she's still sleeping, she{N}will need a kiss from her{N}true love.{W2}"
										dc.w $8087
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8087 : "This kiss will awaken her.{W1}"
										dc.w $8087
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 85
										dc.w $85
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 0 1
										dc.b $85
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85 : "When will the poison leave?{W1}"
										dc.w $85
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 87
										dc.w $87
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8087 : "I have no idea.  It depends{N}on her physical strength.{W2}"
										dc.w $8087
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8087 : "It may take a few months...{N}or a few years.{W2}"
										dc.w $8087
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8087 : "Now, I must go.{N}Good luck.{W1}"
										dc.w $8087
										dc.w $23                ; 0023 SET ENTITY FACING 87 1
										dc.b $87
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $18                ; 0018 FLASH ENTITY WHITE 87 64
										dc.w $87
										dc.w $64
										dc.w $2E                ; 002E HIDE ENTITY 87
										dc.w $87
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "She's gone.{W1}"
										dc.w 7
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 2 1
										dc.b $85
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b $B
										dc.b $A
										dc.w $8080
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8085 : "A few years....{W1}"
										dc.w $8085
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $B
										dc.b 1
										dc.b $D
										dc.b 1
										dc.b $D
										dc.b $A
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "Sir Astral, c'mon!{W2}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 85 1
										dc.b $85
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Mitula told us to leave.{W1}"
										dc.w 7
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8085 : "Oh, yeah...let's get out of{N}here!{W1}"
										dc.w $8085
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 460CE
										dc.b $85
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 2 1
										dc.b $85
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b $B
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8085 : "{LEADER}, you carry{N}Princess Elis!{W1}"
										dc.w $8085
										dc.w $53                ; 0053  0 0
										dc.w 0
										dc.w 0
										dc.w $53                ; 0053  84 FFFF
										dc.w $84
										dc.w $FFFF
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 1
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 461AA
										dc.b 0
										dc.b $FF
										dc.l eas_461AA          
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 1
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b $B
										dc.b $14
										dc.w $8080
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2E                ; 002E HIDE ENTITY 84
										dc.w $84
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $1A                ; 001A SET ENTITY SPRITE 0 AE
										dc.w 0
										dc.w $AE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 461E4
										dc.b $85
										dc.b 0
										dc.l eas_461E4          
										dc.w $33                ; 0033 SET QUAKE AMOUNT 8003
										dc.w $8003
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BOSS_ATTACK
										dc.w 6
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85 : "Oops!  She's sealing the{N}tower!{W1}"
										dc.w $85
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 1
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 461AA
										dc.b 0
										dc.b $FF
										dc.l eas_461AA          
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Hurry!{W1}"
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 3 1
										dc.b $85
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 8
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85 : "{LEADER}, run!{W1}"
										dc.w $85
										dc.w $53                ; 0053  0 FFFF
										dc.w 0
										dc.w $FFFF
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 85 7 2
										dc.w $85
										dc.w 7
										dc.w 2
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 46172
										dc.b 0
										dc.b $FF
										dc.l eas_46172          
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 1
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b $A
										dc.w $8080
										dc.b $80                ; WAIT 3C
										dc.b $3C
cs_62658:           dc.w $33                ; 0033 SET QUAKE AMOUNT 5
										dc.w 5
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $3A                ; 003A FADE OUT TO BLACK
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $48                ; 0048 LOAD MAP 3 0 0
										dc.w 3
										dc.w 0
										dc.w 0
										dc.w $36                ; 0036 RELATED TO LOADING A MAP
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $46                ; 0046  0 0
										dc.w 0
										dc.w 0
										dc.w 4                  ; 0004 INIT TEXT CURSOR F44 : "Two years have passed{N}since Mitula resealed Zeon.{W1}"
										dc.w $F44
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Two years have passed{N}since Mitula resealed Zeon.{W1}"
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88 : "Wow, is it true?{N}Did Elis' face turn pink?{W1}"
										dc.w $88
										dc.w $10                ; 0010 SET FLAG 180 0 : set after Bowie obtains the jewel of light/evil... whichever it is
										dc.w $180
										dc.w 0
										dc.w $10                ; 0010 SET FLAG 181 0 : set after Bowie obtains King Galam's jewel
										dc.w $181
										dc.w 0
										dc.w $55                ; 0055 RESET FORCE BATTLE STATS
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 3380303
										dc.l $3380303
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_6269C:
										
										moveq   #1,d0
										jsr     sub_100B8
										rts

	; End of function sub_6269C

