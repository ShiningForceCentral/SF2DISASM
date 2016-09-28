
; SCRIPT SECTION battles\entries\battle37\cs_beforebattle :
; Cutscene before battle 37
bbcs_37:            dc.w 4                  ; 0004 SET TEXT INDEX B8C : "Now you shall pay for killing{N}my precious Prism Flowers.{W1}"
										dc.w $B8C
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 4D 32 21
										dc.w $4D
										dc.w $32
										dc.w $21
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4DB74
										dc.l word_4DB74
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 38 25 2
										dc.b 7
										dc.b $38
										dc.b $25
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 38 23 2
										dc.b $1F
										dc.b $38
										dc.b $23
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E 38 24 2
										dc.b $1E
										dc.b $38
										dc.b $24
										dc.b 2
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4DAB8
										dc.w $4C
										dc.l word_4DAB8         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4DAB8:         dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Now you shall pay for killing{N}my precious Prism Flowers.{W1}"
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F : "Geshp again.{W1}"
										dc.w $C01F
										dc.w $32                ; 0032 SET CAMERA DEST 28 2C
										dc.w $28
										dc.w $2C
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 2D 2F 1
										dc.b $80
										dc.b $2D
										dc.b $2F
										dc.b 1
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Hee, hee, hee.{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007 : "Do you have another cunning{N}trap for us?{W1}"
										dc.w $C007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "Would I do that?{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "I just want to introduce you{N}to my friend.{W1}"
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Red Baron, say hello!{W1}"
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 1E 36
										dc.w $1E
										dc.w $36
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Grruuooouu!{W1}"
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "He's waiting for you just{N}outside the Galam gate.{W2}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "You have to defeat him if you{N}want to advance.{W2}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "See his red armor?{N}It's smeared with blood.{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "He has killed many people.{W1}"
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 28 2C
										dc.w $28
										dc.w $2C
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "Now, it's your turn.{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "This will be your undoing.{W1}"
										dc.w $80
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $32                ; 0032 SET CAMERA DEST 32 21
										dc.w $32
										dc.w $21
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007 : "Galam is just over there,{N}but...{W1}"
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F : "We have to advance.{N}{LEADER}, are you ready?{W1}"
										dc.w $C01F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4DB74:         dc.w $37
										dc.w $24
										dc.w 2
										dc.b $38
										dc.b $25
										dc.b 2
										dc.b 7
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $9F
										dc.l eas_Init           
										dc.b $23
										dc.b $3C
										dc.b 1
										dc.b $9E
										dc.l eas_Init           
										dc.w $FFFF
