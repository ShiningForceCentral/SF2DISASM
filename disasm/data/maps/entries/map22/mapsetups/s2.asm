
; ASM FILE data\maps\entries\map22\mapsetups\s2.asm :
; 0x59474..0x595DE : 
ms_map22_EntityEvents:
		msEntityEvent 14, UP, sub_5950A-ms_map22_EntityEvents
		msEntityEvent 15, UP, sub_59514-ms_map22_EntityEvents
		msEntityEvent 128, RIGHT, sub_594E4-ms_map22_EntityEvents
		msEntityEvent 129, DOWN, sub_594EC-ms_map22_EntityEvents
		msEntityEvent 130, DOWN, sub_594F6-ms_map22_EntityEvents
		msEntityEvent 131, UP, sub_59500-ms_map22_EntityEvents
		msEntityEvent 132, UP, sub_59522-ms_map22_EntityEvents
		msEntityEvent 133, UP, sub_5952A-ms_map22_EntityEvents
		msEntityEvent 134, DOWN, sub_59554-ms_map22_EntityEvents
		msEntityEvent 135, DOWN, sub_5957C-ms_map22_EntityEvents
		msEntityEvent 136, DOWN, sub_59592-ms_map22_EntityEvents
		msEntityEvent 137, RIGHT, sub_595D2-ms_map22_EntityEvents
		msEntityEvent 138, RIGHT, sub_595CC-ms_map22_EntityEvents
		msEntityEvent 139, RIGHT, sub_595C6-ms_map22_EntityEvents
		msEntityEvent 140, RIGHT, sub_595C6-ms_map22_EntityEvents
		msEntityEvent 141, RIGHT, sub_595C0-ms_map22_EntityEvents
		msEntityEvent 142, RIGHT, sub_595C0-ms_map22_EntityEvents
		msEntityEvent 143, RIGHT, sub_595B4-ms_map22_EntityEvents
		msEntityEvent 144, RIGHT, sub_595B4-ms_map22_EntityEvents
		msEntityEvent 145, RIGHT, sub_595CC-ms_map22_EntityEvents
		msEntityEvent 146, RIGHT, sub_595CC-ms_map22_EntityEvents
		msEntityEvent 147, RIGHT, sub_595BA-ms_map22_EntityEvents
		msEntityEvent 148, RIGHT, sub_595BA-ms_map22_EntityEvents
		msEntityEvent 149, RIGHT, sub_595BA-ms_map22_EntityEvents
		msEntityEvent 150, RIGHT, sub_595BA-ms_map22_EntityEvents
		msEntityEvent 151, RIGHT, sub_595BA-ms_map22_EntityEvents
		msEntityEvent 152, RIGHT, sub_595BA-ms_map22_EntityEvents
		msDefaultEntityEvent 0, nullsub_128-ms_map22_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_594E4:
		jsr     j_CaravanActions
		rts

	; End of function sub_594E4


; =============== S U B R O U T I N E =======================================

sub_594EC:
		 
		txt $6E6                ; "Creed is a fine gentleman.{W2}"
		txt $6E7                ; "His magic saved us a long time{N}ago during a natural disaster.{W1}"
		rts

	; End of function sub_594EC


; =============== S U B R O U T I N E =======================================

sub_594F6:
		 
		txt $6E8                ; "Devils cannot use their magic{N}to affect human lives.{W2}"
		txt $6E9                ; "Supposedly, it's one of their{N}rules.{W1}"
		rts

	; End of function sub_594F6


; =============== S U B R O U T I N E =======================================

sub_59500:
		 
		txt $6EA                ; "This Kingdom was made by{N}Creed.  There's no concept{N}of TIME here.{W2}"
		txt $6EB                ; "We never get old.{N}We never die.{N}What is the meaning of life?{W1}"
		rts

	; End of function sub_59500


; =============== S U B R O U T I N E =======================================

sub_5950A:
		 
		txt $6EC                ; "I was there during the{N}disaster.{W2}"
		txt $6ED                ; "I was looking for the{N}legendary sword.{N}I hate it here!{W1}"
		rts

	; End of function sub_5950A


; =============== S U B R O U T I N E =======================================

sub_59514:
		 
		txt $6EE                ; "Are you from the outside?{N}Why did you come here?{W2}"
		txt $6EF                ; "Ah, a mistake.  I see.{W2}"
		txt $6F0                ; "I suggest you see King{N}Ponpei.{N}He's a good man.{W1}"
		rts

	; End of function sub_59514


; =============== S U B R O U T I N E =======================================

sub_59522:
		jsr     j_ChurchActions
		rts

	; End of function sub_59522


; =============== S U B R O U T I N E =======================================

sub_5952A:
		 
		chkFlg $20A             ; Battle 22 completed
		bne.s   byte_59536      
		txt $6F1                ; "I'm sure King Ponpei will{N}help you.{W1}"
		bra.s   return_59552
byte_59536:
		chkFlg $100             ; Temporary map setup flag 00
		bne.s   byte_5954A      
		txt $706                ; "He's just kidding, but to{N}tell the truth, the Cotton{W2}"
		txt $707                ; "Balloon is a very special{N}treasure.{W1}"
		setFlg $100             ; Temporary map setup flag 00
		bra.s   return_59552
byte_5954A:
		txt $708                ; "Some adventurers live in the{N}north-east part of Floor{W2}"
		txt $709                ; "World.  Please visit them?{W1}"
return_59552:
		rts

	; End of function sub_5952A


; =============== S U B R O U T I N E =======================================

sub_59554:
		 
		chkFlg $20A             ; Battle 22 completed
		bne.s   byte_59576      
		chkFlg $309             ; set after the Desktop King tells you to fight on the chessboard
		bne.s   byte_5956C      
		txt $6F2                ; "So, you were not able to see{N}Creed?{W2}"
		txt $6F3                ; "Somewhere in Floor World,{N}there's a tunnel that leads{N}to Creed.{W2}"
		txt $6F4                ; "OK, I'll let you go if you{N}win a game against my army.{W2}"
byte_5956C:
		txt $6F5                ; "You may go to the chessboard{N}now.{W1}"
		setFlg $309             ; set after the Desktop King tells you to fight on the chessboard
		bra.s   return_5957A
byte_59576:
		txt $705                ; "Bravo!  I'd give you an army{N}if you'd stay here.{W1}"
return_5957A:
		rts

	; End of function sub_59554


; =============== S U B R O U T I N E =======================================

sub_5957C:
		 
		chkFlg $309             ; set after the Desktop King tells you to fight on the chessboard
		bne.s   byte_5958C      
		txt $6F7                ; "The Chess Army is very{N}strong.{W2}"
		txt $6F8                ; "It will be good training for{N}you.{W1}"
		bra.s   return_59590
byte_5958C:
		txt $6F6                ; "The army won't attack until{N}you reach the center of the{N}board.{W1}"
return_59590:
		rts

	; End of function sub_5957C


; =============== S U B R O U T I N E =======================================

sub_59592:
		 
		chkFlg $D4              ; Cotton Balloon (chest on chessboard, Desktop Kingdom)
		bne.s   byte_5959E      
		txt $70A                ; "Halt!  I can't let you{N}pass without the King's{N}permission.{W1}"
		bra.s   return_595B2
byte_5959E:
		txt $70B                ; "Floor World is very{N}dangerous.  Take care!{W1}"
		chkFlg $102             ; Temporary map setup flag 02
		bne.s   return_595B2
		lea     cs_599A4(pc), a0
		trap    #6
		setFlg $102             ; Temporary map setup flag 02
return_595B2:
		rts

	; End of function sub_59592


; =============== S U B R O U T I N E =======================================

sub_595B4:
		 
		txt $6F9                ; "Mr. Creed gave me this solid,{N}armored body!{W1}"
		rts

	; End of function sub_595B4


; =============== S U B R O U T I N E =======================================

sub_595BA:
		 
		txt $6FA                ; "My attack power is the best{N}in the army!{W1}"
		rts

	; End of function sub_595BA


; =============== S U B R O U T I N E =======================================

sub_595C0:
		 
		txt $6FB                ; "We knights are always ready{N}to fight!{W1}"
		rts

	; End of function sub_595C0


; =============== S U B R O U T I N E =======================================

sub_595C6:
		 
		txt $6FC                ; "Is healing is my only ability?{N}Ha, ha!  You have a lot to{N}learn!{W1}"
		rts

	; End of function sub_595C6


; =============== S U B R O U T I N E =======================================

sub_595CC:
		 
		txt $6FD                ; "I lead the army with the King.{W1}"
		rts

	; End of function sub_595CC


; =============== S U B R O U T I N E =======================================

sub_595D2:
		 
		txt $6FE                ; "The Chess Army of Desktop{N}Kingdom is a well balanced{N}force!{W2}"
		txt $6FF                ; "If it is King Ponpei's wish,{N}we will accept your{N}challenge!{W1}"
		rts

	; End of function sub_595D2


; =============== S U B R O U T I N E =======================================

nullsub_128:
		rts

	; End of function nullsub_128

