
; ASM FILE data\maps\entries\map08\mapsetups\s6.asm :
; 0x563A2..0x56636 : 

; =============== S U B R O U T I N E =======================================

ms_map8_InitFunction:
		
		trap    #1
		dc.w 8
		beq.s   return_563B0
		moveq   #8,d0
		jsr     MoveEntityOutOfMap
return_563B0:
		
		rts

	; End of function ms_map8_InitFunction

cs_563B2:
		textCursor $50B         
						; Initial text line $50B : "Hmmm?{W1}"
		setActscript $81,$FF,eas_46172
						; 0015 SET ACTSCRIPT 81 FF 46172
		moveEntity $81,$FF,$0,$4
						; 002D MOVE ENTITY 81 FF 0 4
		endMove $8080
		nextSingleText $0,$81   
						; "Hmmm?{W1}"
		customActscript $81,$FF 
						; 0014 SET MANUAL ACTSCRIPT 81
		dc.w $10                
						;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $81,$FF,$2,$2
						; 002D MOVE ENTITY 81 FF 2 2
		endMove $8080
		setEntityDir $81,$3     
						; 0023 SET ENTITY FACING 81 3
		nextSingleText $0,$81   
						; "You're a spy from the new{N}town, aren't you?{W1}"
		moveEntity $81,$FF,$1,$2
						; 002D MOVE ENTITY 81 FF 1 2
		endMove $8080
		nextSingleText $0,$81   
						; "You're back again!{N}Mayor!  Mayor!{W1}"
		setActscript $81,$FF,eas_Init
						; 0015 SET ACTSCRIPT 81 FF 460CE
		customActscript $81,$FF 
						; 0014 SET MANUAL ACTSCRIPT 81
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		setEntityDir $81,$1     
						; 0023 SET ENTITY FACING 81 1
		moveEntity $81,$FF,$1,$8
						; 002D MOVE ENTITY 81 FF 1 8
		endMove $8080
		entityPosDir $81,$F,$7,$3
						; 0019 SET ENTITY POS AND FACING 81 F 7 3
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_56422:
		textCursor $50E         
						; Initial text line $50E : "Who are you?{N}What are you?{W1}"
		setActscript $7,$FF,eas_Init
						; 0015 SET ACTSCRIPT 7 FF 460CE
		setEntityDest $7,$E,$A  
						; 0029 SET ENTITY DEST 7 E A
		setEntityDir $7,$1      
						; 0023 SET ENTITY FACING 7 1
		setActscript $0,$FF,eas_46172
						; 0015 SET ACTSCRIPT 0 FF 46172
		setActscript $7,$FF,eas_46172
						; 0015 SET ACTSCRIPT 7 FF 46172
		customActscript $81,$FF 
						; 0014 SET MANUAL ACTSCRIPT 81
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		csWait $1E              
						; WAIT 1E
		moveEntity $0,$0,$3,$1  
						; 002D MOVE ENTITY 0 0 3 1
		endMove $8080
		setActscript $80,$FF,eas_BumpDown
						; 0015 SET ACTSCRIPT 80 FF 45F34
		moveEntity $80,$FF,$3,$1
						; 002D MOVE ENTITY 80 FF 3 1
		endMove $8080
		csWait $1E              
						; WAIT 1E
		moveEntity $0,$0,$3,$1  
						; 002D MOVE ENTITY 0 0 3 1
		endMove $8080
		moveEntity $7,$0,$3,$1  
						; 002D MOVE ENTITY 7 0 3 1
		endMove $8080
		setActscript $80,$FF,eas_BumpDown
						; 0015 SET ACTSCRIPT 80 FF 45F34
		moveEntity $80,$FF,$3,$1
						; 002D MOVE ENTITY 80 FF 3 1
		endMove $8080
		csWait $1E              
						; WAIT 1E
		moveEntity $0,$0,$3,$1  
						; 002D MOVE ENTITY 0 0 3 1
		endMove $8080
		moveEntity $7,$0,$3,$1  
						; 002D MOVE ENTITY 7 0 3 1
		endMove $8080
		setActscript $80,$FF,eas_BumpDown
						; 0015 SET ACTSCRIPT 80 FF 45F34
		moveEntity $80,$FF,$3,$1
						; 002D MOVE ENTITY 80 FF 3 1
		endMove $8080
		csWait $1E              
						; WAIT 1E
		moveEntity $0,$0,$3,$1  
						; 002D MOVE ENTITY 0 0 3 1
		endMove $8080
		moveEntity $7,$0,$3,$1  
						; 002D MOVE ENTITY 7 0 3 1
		endMove $8080
		setActscript $80,$FF,eas_BumpDown
						; 0015 SET ACTSCRIPT 80 FF 45F34
		moveEntity $80,$FF,$3,$1
						; 002D MOVE ENTITY 80 FF 3 1
		endMove $8080
		csWait $1E              
						; WAIT 1E
		moveEntity $0,$0,$3,$1  
						; 002D MOVE ENTITY 0 0 3 1
		endMove $8080
		moveEntity $7,$0,$3,$1  
						; 002D MOVE ENTITY 7 0 3 1
		endMove $8080
		setActscript $80,$FF,eas_BumpDown
						; 0015 SET ACTSCRIPT 80 FF 45F34
		moveEntity $80,$FF,$3,$1
						; 002D MOVE ENTITY 80 FF 3 1
		endMove $8080
		nextSingleText $0,$80   
						; "Who are you?{N}What are you?{W1}"
		moveEntity $81,$FF,$2,$1
						; 002D MOVE ENTITY 81 FF 2 1
		moreMove $3,$4
		moreMove $0,$1
		moreMove $3,$1
		endMove $8080
		nextText $0,$81         
						; "A group of soldiers were{N}just here.{W2}"
		nextSingleText $0,$81   
						; "Soldiers must be waiting{N}beyond the gate.{N}Be careful!{W1}"
		nextText $0,$80         
						; "You're so persistent.{N}What do you want?!{W2}"
		nextText $0,$80         
						; "You suddenly appear in{N}Parmecia, and build a castle?{W2}"
		nextText $0,$80         
						; "I don't know who you are,{N}but all big cities like war!{W2}"
		nextSingleText $0,$80   
						; "I've never seen such{N}impolite and violent guests!{W1}"
		nextText $0,$81         
						; "He's right!{W2}"
		nextSingleText $0,$81   
						; "You came here to capture{N}Parmecia!{W1}"
		nextSingleText $0,$80   
						; "We'll never obey you!{N}Go away!{W1}"
		setActscript $81,$FF,eas_Init
						; 0015 SET ACTSCRIPT 81 FF 460CE
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $7,$FF,eas_Init
						; 0015 SET ACTSCRIPT 7 FF 460CE
		moveEntity $80,$0,$1,$1 
						; 002D MOVE ENTITY 80 0 1 1
		endMove $8080
		moveEntity $81,$FF,$1,$1
						; 002D MOVE ENTITY 81 FF 1 1
		endMove $8080
		setActscript $7,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 7 FF 45E44
		nextSingleText $0,$7    
						; "You talk too much!{W1}"
		setEntityDir $0,$3      
						; 0023 SET ENTITY FACING 0 3
		nextText $0,$7          
						; "Hey, {LEADER}!{N}Why don't you say something?{W2}"
		nextSingleText $0,$7    
						; "I can't stand this!{W1}"
		moveEntity $7,$FF,$2,$1 
						; 002D MOVE ENTITY 7 FF 2 1
		moreMove $1,$1
		endMove $8080
		setEntityDir $0,$1      
						; 0023 SET ENTITY FACING 0 1
		nextSingleText $0,$7    
						; "Hey, you!  I think I{N}understand how you feel,{N}but listen to me!{W1}"
		setEntityDir $80,$3     
						; 0023 SET ENTITY FACING 80 3
		setEntityDir $81,$3     
						; 0023 SET ENTITY FACING 81 3
		nextSingleText $0,$80   
						; "Why?{W1}"
		moveEntity $7,$FF,$1,$1 
						; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		nextText $0,$7          
						; "I'm not from Granseal.{N}I just visited there....{W2}"
		nextText $0,$7          
						; "You think they came to{N}Parmecia to conquer it?{N}Well, you're wrong.{W2}"
		nextText $0,$7          
						; "They were forced to leave{N}their island due to a{N}disaster.{W2}"
		nextSingleText $0,$7    
						; "They're good people!{N}You don't have to be so{N}paranoid!{W1}"
		nextSingleText $0,$80   
						; "Who are you?{W1}"
		nextSingleText $0,$7    
						; "I'm {NAME;7}!{N}I'm a phoenix that lives in{N}Mt. Volcano.{W1}"
		setActscript $80,$0,eas_Jump
						; 0015 SET ACTSCRIPT 80 0 45E44
		setActscript $81,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 81 FF 45E44
		setActscript $80,$0,eas_Jump
						; 0015 SET ACTSCRIPT 80 0 45E44
		setActscript $81,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 81 FF 45E44
		nextSingleText $0,$80   
						; "A phoenix!{N}The legendary bird?{W1}"
		nextSingleText $0,$7    
						; "I don't know if we're{N}legendary or not....{W1}"
		nextText $0,$80         
						; "I'm very glad to meet{N}you!{W2}"
		nextSingleText $0,$80   
						; "Oh, they're friends of yours.{N}My, my!{W1}"
		nextText $0,$81         
						; "Of course, we of Ribble{N}will become allies of{N}Granseal.{W2}"
		nextSingleText $0,$81   
						; "I promise that we will{N}welcome you when you visit{N}us again!{W1}"
		fadeOutB                
						; 003A FADE OUT TO BLACK
		loadMapEntities ce_55FBE
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		setBlocks $2002,$101,$190C
						; 0034 SET BLOCKS 2002 101 190C
		setBlocks $2002,$101,$1618
						; 0034 SET BLOCKS 2002 101 1618
		setBlocks $2002,$101,$719
						; 0034 SET BLOCKS 2002 101 719
		setBlocks $2003,$201,$60F
						; 0034 SET BLOCKS 2003 201 60F
		setF $2C5               
						; set after the mayor in Ribble scene... this flag unlocks the doors
		executeSubroutine sub_56632
						; 000A EXECUTE SUBROUTINE 56632
		followEntity $7,$0,$2   
						; 002C FOLLOW ENTITY 7 0 2
		csWait $32              
						; WAIT 32
		fadeInB                 
						; 0039 FADE IN FROM BLACK
		csc_end                 
						; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_56632:
		
		jmp     (sub_40F2).w

	; End of function sub_56632

