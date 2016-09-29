
; SCRIPT SECTION maps\entries\map38\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map38_InitFunction:
										
										trap    #1
										dc.w $399
										beq.s   loc_5DD78
										trap    #TRAP_SETFLAG
										dc.w $38F               ; set after the Petro death scene in Roft
										trap    #1
										dc.w $1A
										bne.s   loc_5DD78
										trap    #1
										dc.w $104
										bne.s   loc_5DD78
										lea     cs_5DD8E(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $104
loc_5DD78:
										
										trap    #1
										dc.w $38E
										bne.s   return_5DD8C
										lea     cs_5DD9C(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $38E               ; set after the initial scene on entering Roft (where the guy thinks you're Galam)
										trap    #TRAP_SETFLAG
										dc.w $102
return_5DD8C:
										
										rts

	; End of function ms_map38_InitFunction

cs_5DD8E:           dc.w $2B                ; 002B  1A B 8 3 FF
										dc.w $1A
										dc.b $B
										dc.b 8
										dc.b 3
										dc.b $FF
										dc.w $23                ; 0023 SET ENTITY FACING 1A 3
										dc.b $1A
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5DD9C:           dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 E 1A 3
										dc.b $80
										dc.b $E
										dc.b $1A
										dc.b 3
										dc.w 4                  ; 0004 SET TEXT INDEX 854 : "Galam soldiers!  Run!{W1}"
										dc.w $854
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 E 1C 1
										dc.b 0
										dc.b $E
										dc.b $1C
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 1D 1
										dc.b 7
										dc.b $D
										dc.b $1D
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F E 1D 1
										dc.b $1F
										dc.b $E
										dc.b $1D
										dc.b 1
										dc.w $C                 ; 000C JUMP IF SET FLAG 4C 5DE22 : Zynk is a follower
										dc.w $4C
										dc.l cs_5DE22           
word_5DDC2:         dc.w 5                  ; 0005 PLAY SOUND MUSIC_TOWN
										dc.w 8
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Galam soldiers!  Run!{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 2
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 2
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "No, wait!  We're not Galam{N}soldiers!{W1}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "No...?{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 2
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 2
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Oops.  My mistake.{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Oh, it's obvious.  I can see{N}it in your eyes.{W1}"
										dc.w $80
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5DE22:           dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A F 1D 1
										dc.b $1A
										dc.b $F
										dc.b $1D
										dc.b 1
										dc.w $B                 ; 000B JUMP 5DDC2
										dc.l word_5DDC2         
cs_5DE2E:           dc.w 4                  ; 0004 SET TEXT INDEX 86A : "Sir Petro, don't leave me{N}alone!{W1}"
										dc.w $86A
										dc.w $1C                ; 001C STOP ENTITY ANIM 8E
										dc.w $8E
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $32                ; 0032 SET CAMERA DEST 8 0
										dc.w 8
										dc.w 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 89
										dc.w $89
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_SAD_THEME_3
										dc.w $F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89 : "Sir Petro, don't leave me{N}alone!{W1}"
										dc.w $89
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8E : "Paseran...I'm sorry.{W1}"
										dc.w $8E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 89
										dc.w $89
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89 : "You promised to fly me in{N}the sky!{W1}"
										dc.w $89
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8E : "I know...with the Nazca{N}Ship...I promised...{W2}"
										dc.w $8E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8E : "I'd fly home...to see my{N}family....{W2}"
										dc.w $8E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8E : "To show them how wonderful{N}the ancients were....{W1}"
										dc.w $8E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 89
										dc.w $89
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89 : "Petro!  No!{W1}"
										dc.w $89
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FB
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5DE76:           dc.w 4                  ; 0004 SET TEXT INDEX 879 : "What's wrong with {NAME;26}?{W1}"
										dc.w $879
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 1A
										dc.w $1A
										dc.w $29                ; 0029 SET ENTITY DEST 0 C 9
										dc.w 0
										dc.w $C
										dc.w 9
										dc.w $29                ; 0029 SET ENTITY DEST 7 C 8
										dc.w 7
										dc.w $C
										dc.w 8
										dc.w $29                ; 0029 SET ENTITY DEST 7 D 8
										dc.w 7
										dc.w $D
										dc.w 8
										dc.w $29                ; 0029 SET ENTITY DEST 1F C 8
										dc.w $1F
										dc.w $C
										dc.w 8
										dc.w $29                ; 0029 SET ENTITY DEST 1F E 8
										dc.w $1F
										dc.w $E
										dc.w 8
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $29                ; 0029 SET ENTITY DEST 1A B 8
										dc.w $1A
										dc.w $B
										dc.w 8
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 2 2
										dc.b $1A
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 2
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 1
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 3 1
										dc.b $1A
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 0 1
										dc.b $1A
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 1 1
										dc.b $1A
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 2 2
										dc.b $1A
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 45E44
										dc.b $1A
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1A 0 45E44
										dc.b $1A
										dc.b 0
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "What's wrong with {NAME;26}?{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "I have no idea, but he's{N}obviously disturbed!{W1}"
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 1 1
										dc.b $1A
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 0 1
										dc.b $1A
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 3 1
										dc.b $1A
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 2 2
										dc.b $1A
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $26                ; 0026 MAKE ENTITY NOD 1A
										dc.w $1A
										dc.w $23                ; 0023 SET ENTITY FACING 1A 0
										dc.b $1A
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A : "{LEADER}, Sir Astral!{N}I am angry!{W2}"
										dc.w $1A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A : "I cannot forgive the{N}devils!{W2}"
										dc.w $1A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A : "I have overridden my{N}restrictions on fighting.{W2}"
										dc.w $1A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A : "I am joining your force as{N}a soldier!{W1}"
										dc.w $1A
										dc.w 8                  ; 0008 JOIN FORCE 1A
										dc.w $1A
										dc.w $10                ; 0010 SET FLAG 4C 0 : Zynk is a follower
										dc.w $4C
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A : "Let us go defeat the Devil{N}Army!{W1}"
										dc.w $1A
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1A 1F 2
										dc.w $1A
										dc.w $1F
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
