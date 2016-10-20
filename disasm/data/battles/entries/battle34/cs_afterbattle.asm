
; ASM FILE data\battles\entries\battle34\cs_afterbattle.asm :
; 0x4D4B6..0x4D6CE : Cutscene after battle 34
abcs_battle34:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR B5F : "{LEADER}, I lost?!{N}Take this.{W1}"
		dc.w $B5F
		dc.w $37                
						; 0037 LOAD MAP AND FADE IN 37 2 7
		dc.w $37
		dc.w 2
		dc.w 7
		dc.w $42                
						; 0042 RELATED TO LOADING MAP ENTITIES 4D69E
		dc.l word_4D69E
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 460CE
		dc.b 0
		dc.b $FF
		dc.l eas_Init           
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 FF 460CE
		dc.b 7
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 7 9 B 1
		dc.b 7
		dc.b 9
		dc.b $B
		dc.b 1
		dc.w $15                
						; 0015 SET ACTSCRIPT 1F FF 460CE
		dc.b $1F
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1F 5 B 1
		dc.b $1F
		dc.b 5
		dc.b $B
		dc.b 1
		dc.w $D                 
						; 000D JUMP IF CLEAR FLAG 4C 4D502 : Zynk is a follower
		dc.w $4C
		dc.l word_4D502         
		dc.w $15                
						; 0015 SET ACTSCRIPT 1A FF 460CE
		dc.b $1A
		dc.b $FF
		dc.l eas_Init           
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 1A 8 C 1
		dc.b $1A
		dc.b 8
		dc.b $C
		dc.b 1
word_4D502:
		dc.w $1C                
						; 001C STOP ENTITY ANIM 80
		dc.w $80
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 80
		dc.b $80
		dc.b $FF
		dc.w $14                
						;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                
						;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 
						;   000A UPDATE SPRITE
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $1C                
						; 001C STOP ENTITY ANIM 83
		dc.w $83
		dc.w $15                
						; 0015 SET ACTSCRIPT 83 FF 46172
		dc.b $83
		dc.b $FF
		dc.l eas_46172          
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.w $2A                
						; 002A MAKE ENTITY SHIVER 80
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "{LEADER}, I lost?!{N}Take this.{W1}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Cameela reveals the Sky Orb.{W1}"
		dc.w $FFFF
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 83 7 A 2
		dc.b $83
		dc.b 7
		dc.b $A
		dc.b 2
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 80 : "This is the Sky Orb.  With{N}it, you can drive the Nazca{N}Ship.{W2}"
		dc.w $80
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 80 : "Listen.  You have to be very{N}careful from now on.{W2}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Geshp has Prism Flowers.{N}He will...{W1}"
		dc.w $80
		dc.w $3D                
						; 003D TINT MAP
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C081 : "Your life is over,{N}Cameela!{W1}"
		dc.w $C081
		dc.w $41                
						; 0041 FLASH SCREEN WHITE 2
		dc.w 2
		dc.w $3D                
						; 003D TINT MAP
		dc.w $15                
						; 0015 SET ACTSCRIPT 80 FF 460CE
		dc.b $80
		dc.b $FF
		dc.l eas_Init           
		dc.w $23                
						; 0023 SET ENTITY FACING 80 2
		dc.b $80
		dc.b 2
		dc.w $1A                
						; 001A SET ENTITY SPRITE 80 B4
		dc.w $80
		dc.w $B4
		dc.w $1B                
						; 001B START ENTITY ANIM 80
		dc.w $80
		dc.w $15                
						; 0015 SET ACTSCRIPT 80 0 45FB2
		dc.b $80
		dc.b 0
		dc.l eas_AnimSpeedx2    
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 0 45E44
		dc.b 0
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 0 45E44
		dc.b 7
		dc.b 0
		dc.l eas_Jump           
		dc.w $D                 
						; 000D JUMP IF CLEAR FLAG 4C 4D592 : Zynk is a follower
		dc.w $4C
		dc.l word_4D592         
		dc.w $15                
						; 0015 SET ACTSCRIPT 1A 0 45E44
		dc.b $1A
		dc.b 0
		dc.l eas_Jump           
word_4D592:
		dc.w $15                
						; 0015 SET ACTSCRIPT 1F FF 45E44
		dc.b $1F
		dc.b $FF
		dc.l eas_Jump           
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Geshp!{W1}"
		dc.w $80
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C081 : "Ha, ha, ha!  You acted just{N}as I planned!{W1}"
		dc.w $C081
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 80 : "Ouuuuu...Ges...{W1}"
		dc.w $80
		dc.w $1A                
						; 001A SET ENTITY SPRITE 80 9C
		dc.w $80
		dc.w $9C
		dc.w $15                
						; 0015 SET ACTSCRIPT 80 FF 46024
		dc.b $80
		dc.b $FF
		dc.l eas_Die            
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "How horrible!{W1}"
		dc.w $1F
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C081 : "It's the law.  Traitors{N}die by fire.{W2}"
		dc.w $C081
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX C081 : "Congratulations!{N}You have a ship now!{N}Come to Grans!{W2}"
		dc.w $C081
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX C081 : "I have to go now and{N}prepare your welcoming{N}party!{W1}"
		dc.w $C081
		dc.w $3E                
						; 003E FLICKER ONCE
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $23                
						; 0023 SET ENTITY FACING 7 2
		dc.b 7
		dc.b 2
		dc.w 2                  
						; 0002 DISPLAY TEXT BOX 7 : "I really hate him!{W2}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "Prism Flowers?{N}What are they?{W1}"
		dc.w 7
		dc.w $23                
						; 0023 SET ENTITY FACING 1F 0
		dc.b $1F
		dc.b 0
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "I have no idea, but it's{N}probably a trap.{W1}"
		dc.w $1F
		dc.w $D                 
						; 000D JUMP IF CLEAR FLAG 4C 4D620 : Zynk is a follower
		dc.w $4C
		dc.l word_4D620         
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 1A
		dc.b $1A
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$18 Y=$18
		dc.b $18
		dc.b $18
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF MANUAL ACTSCRIPT
		dc.w $2D                
						; 002D MOVE ENTITY 1A FF 1 1
		dc.b $1A
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1A : "Ancient flower.{W1}"
		dc.w $1A
		dc.w $2D                
						; 002D MOVE ENTITY 1F FF 0 1
		dc.b $1F
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "Excuse me?{W1}"
		dc.w $1F
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1A : "Ancient countries had those{N}flowers along their borders.{W1}"
		dc.w $1A
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "What kind of flowers are{N}they?{W1}"
		dc.w $1F
		dc.w $23                
						; 0023 SET ENTITY FACING 1A 1
		dc.b $1A
		dc.b 1
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1A : "I cannot explain....{W1}"
		dc.w $1A
word_4D620:
		dc.w 4                  
						; 0004 INIT TEXT CURSOR B74 : "We will see them when we{N}arrive at Grans.{W1}"
		dc.w $B74
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 2 1
		dc.b 7
		dc.b $FF
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 7 : "We will see them when we{N}arrive at Grans.{W1}"
		dc.w 7
		dc.w 0                  
						; 0000 DISPLAY SINGLE TEXTBOX 1F : "{LEADER}, grab the Sky{N}Orb.{N}Let's go.{W1}"
		dc.w $1F
		dc.w $2D                
						; 002D MOVE ENTITY 7 FF 1 1
		dc.b 7
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 7 2
		dc.b 7
		dc.b 2
		dc.w $D                 
						; 000D JUMP IF CLEAR FLAG 4C 4D654 : Zynk is a follower
		dc.w $4C
		dc.l word_4D654         
		dc.w $2D                
						; 002D MOVE ENTITY 1A FF 0 1
		dc.b $1A
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 1A 2
		dc.b $1A
		dc.b 2
word_4D654:
		dc.w $26                
						; 0026 MAKE ENTITY NOD 0
		dc.w 0
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 1 1
		dc.b 0
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $2E                
						; 002E HIDE ENTITY 83
		dc.w $83
		dc.w $A                 
						; 000A EXECUTE SUBROUTINE 4D694
		dc.l sub_4D694
		dc.w $2C                
						; 002C FOLLOW ENTITY 82 0 2
		dc.w $82
		dc.w 0
		dc.w 2
		dc.w $2C                
						; 002C FOLLOW ENTITY 7 82 1
		dc.w 7
		dc.w $82
		dc.w 1
		dc.w $2C                
						; 002C FOLLOW ENTITY 1F 82 3
		dc.w $1F
		dc.w $82
		dc.w 3
		dc.w $D                 
						; 000D JUMP IF CLEAR FLAG 4C 4D692 : Zynk is a follower
		dc.w $4C
		dc.l word_4D692         
		dc.w $2C                
						; 002C FOLLOW ENTITY 1A 82 2
		dc.w $1A
		dc.w $82
		dc.w 2
word_4D692:
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_4D694:
		
		moveq   #$71,d0 
		moveq   #1,d1
		jmp     sub_4F48A

	; End of function sub_4D694

word_4D69E:
		dc.w 7
		dc.w $C
		dc.w 1
		dc.b 9
		dc.b $B
		dc.b 1
		dc.b 7
		dc.l eas_Init           
		dc.b 7
		dc.b 9
		dc.b 3
		dc.b $9C
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $9F
		dc.l eas_Init           
		dc.b 6
		dc.b $C
		dc.b 1
		dc.b $3E
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 2
		dc.b $AC
		dc.l eas_Init           
		dc.w $FFFF
