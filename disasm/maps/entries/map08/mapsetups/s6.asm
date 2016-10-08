
; SCRIPT SECTION maps\entries\map08\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map8_InitFunction:
										
										trap    #CHECK_FLAG
										dc.w 8                  ; May joined
										beq.s   return_563B0
										moveq   #8,d0
										jsr     MoveEntityOutOfMap
return_563B0:
										
										rts

	; End of function ms_map8_InitFunction

cs_563B2:           dc.w 4                  ; 0004 INIT TEXT CURSOR 50B : "Hmmm?{W1}"
										dc.w $50B
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 4
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 4
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Hmmm?{W1}"
										dc.w $81
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 2
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "You're a spy from the new{N}town, aren't you?{W1}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 2
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "You're back again!{N}Mayor!  Mayor!{W1}"
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 8
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 8
										dc.w $8080
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 F 7 3
										dc.b $81
										dc.b $F
										dc.b 7
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_56422:           dc.w 4                  ; 0004 INIT TEXT CURSOR 50E : "Who are you?{N}What are you?{W1}"
										dc.w $50E
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $29                ; 0029 SET ENTITY DEST 7 E A
										dc.w 7
										dc.w $E
										dc.w $A
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 46172
										dc.b 0
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 46172
										dc.b 7
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 1
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45F34
										dc.b $80
										dc.b $FF
										dc.l eas_BumpDown       
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 1
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 1
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45F34
										dc.b $80
										dc.b $FF
										dc.l eas_BumpDown       
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 1
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 1
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45F34
										dc.b $80
										dc.b $FF
										dc.l eas_BumpDown       
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 1
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 1
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45F34
										dc.b $80
										dc.b $FF
										dc.l eas_BumpDown       
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 1
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 1
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45F34
										dc.b $80
										dc.b $FF
										dc.l eas_BumpDown       
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Who are you?{N}What are you?{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 1
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 4
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "A group of soldiers were{N}just here.{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Soldiers must be waiting{N}beyond the gate.{N}Be careful!{W1}"
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "You're so persistent.{N}What do you want?!{W2}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "You suddenly appear in{N}Parmecia, and build a castle?{W2}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "I don't know who you are,{N}but all big cities like war!{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "I've never seen such{N}impolite and violent guests!{W1}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "He's right!{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "You came here to capture{N}Parmecia!{W1}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "We'll never obey you!{N}Go away!{W1}"
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 1
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "You talk too much!{W1}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "Hey, {LEADER}!{N}Why don't you say something?{W2}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "I can't stand this!{W1}"
										dc.w 7
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
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Hey, you!  I think I{N}understand how you feel,{N}but listen to me!{W1}"
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Why?{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "I'm not from Granseal.{N}I just visited there....{W2}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "You think they came to{N}Parmecia to conquer it?{N}Well, you're wrong.{W2}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "They were forced to leave{N}their island due to a{N}disaster.{W2}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "They're good people!{N}You don't have to be so{N}paranoid!{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Who are you?{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "I'm {NAME;7}!{N}I'm a phoenix that lives in{N}Mt. Volcano.{W1}"
										dc.w 7
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "A phoenix!{N}The legendary bird?{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "I don't know if we're{N}legendary or not....{W1}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "I'm very glad to meet{N}you!{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Oh, they're friends of yours.{N}My, my!{W1}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "Of course, we of Ribble{N}will become allies of{N}Granseal.{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "I promise that we will{N}welcome you when you visit{N}us again!{W1}"
										dc.w $81
										dc.w $3A                ; 003A FADE OUT TO BLACK
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 55FBE
										dc.l word_55FBE
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $34                ; 0034 SET BLOCKS 2002 101 190C
										dc.w $2002
										dc.w $101
										dc.w $190C
										dc.w $34                ; 0034 SET BLOCKS 2002 101 1618
										dc.w $2002
										dc.w $101
										dc.w $1618
										dc.w $34                ; 0034 SET BLOCKS 2002 101 719
										dc.w $2002
										dc.w $101
										dc.w $719
										dc.w $34                ; 0034 SET BLOCKS 2003 201 60F
										dc.w $2003
										dc.w $201
										dc.w $60F
										dc.w $10                ; 0010 SET FLAG 2C5 FFFF : set after the mayor in Ribble scene... this flag unlocks the doors
										dc.w $2C5
										dc.w $FFFF
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 56632
										dc.l sub_56632
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_56632:
										
										jmp     (sub_40F2).w

	; End of function sub_56632

