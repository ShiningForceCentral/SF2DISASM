
; SCRIPT SECTION battles\entries\battle13\cs_afterbattle :
; Cutscene after battle 13
abcs_battle13:      dc.w 4                  ; 0004 SET TEXT INDEX 9BF : "{NAME;10}, are you OK?  {NAME;10}!{W1}"
										dc.w $9BF
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $37                ; 0037 LOAD MAP AND FADE IN D B 8
										dc.w $D
										dc.w $B
										dc.w 8
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4AD96
										dc.l word_4AD96
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 F D 0
										dc.b 7
										dc.b $F
										dc.b $D
										dc.b 0
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT A
										dc.b $A
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_TOWN
										dc.w 8
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "{NAME;10}, are you OK?  {NAME;10}!{W1}"
										dc.w 7
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $15                ; 0015 SET ACTSCRIPT A FF 460CE
										dc.b $A
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT A FF 45E44
										dc.b $A
										dc.b $FF
										dc.l eas_Jump           
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD A
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C00A : "Squawk!  They knocked me{N}senseless.{W1}"
										dc.w $C00A
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT A 0 461B6
										dc.b $A
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C00A : "Where are the devils?{N}{LEADER}, did you defeat{N}them?{W2}"
										dc.w $C00A
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C00A : "Nobody in Bedoe can fight{N}like that.  Thank you.{W1}"
										dc.w $C00A
										dc.w $23                ; 0023 SET ENTITY FACING A 2
										dc.b $A
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "He's a great fighter.{N}Volcanon doesn't know how{N}good he is!{W1}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C00A : "He'll learn.{W2}"
										dc.w $C00A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C00A : "Let's go see the mayor and{N}get a raft!{W1}"
										dc.w $C00A
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{CLEAR}{LEADER} decides to take{N}{NAME;10} the BDMN with him.{W1}{CLEAR}"
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 4B FFFF
										dc.w $4B
										dc.w $FFFF
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT D100C03
										dc.l $D100C03
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4AD96:         dc.w $10
										dc.w $C
										dc.w 3
										dc.b $10
										dc.b $D
										dc.b 3
										dc.b $A
										dc.l eas_Init           
										dc.w $FFFF
