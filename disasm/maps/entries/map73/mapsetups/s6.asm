
; SCRIPT SECTION maps\entries\map73\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map73_InitFunction:
										
										trap    #CHECK_FLAG
										dc.w $2BC               ; set after ship arrives in Parmecia and you regain control of Bowie
										bne.s   loc_50354
										lea     cs_503A6(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $2BC               ; set after ship arrives in Parmecia and you regain control of Bowie
										rts
loc_50354:
										
										trap    #CHECK_FLAG
										dc.w $1FC               ; Battle 8 completed
										beq.s   return_5036C
										trap    #CHECK_FLAG
										dc.w $2C1               ; set after you automatically walk into New Granseal after it is built
										bne.s   return_5036C
										lea     cs_50806(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $2C1               ; set after you automatically walk into New Granseal after it is built
										rts
return_5036C:
										
										rts

	; End of function ms_map73_InitFunction


; =============== S U B R O U T I N E =======================================

sub_5036E:
										
										moveq   #$A,d7
loc_50370:
										
										addq.b  #1,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
										moveq   #4,d0
										jsr     (Sleep).w       
										dbf     d7,loc_50370
										rts

	; End of function sub_5036E


; =============== S U B R O U T I N E =======================================

sub_50380:
										
										move.w  #$1200,((word_FFA814-$1000000)).w
										move.w  #$3F60,((word_FFA816-$1000000)).w
										rts

	; End of function sub_50380


; =============== S U B R O U T I N E =======================================

sub_5038E:
										
										moveq   #$A,d7
loc_50390:
										
										subq.b  #1,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
										jsr     (WaitForVInt).w 
										dbf     d7,loc_50390
										rts

	; End of function sub_5038E


; =============== S U B R O U T I N E =======================================

sub_5039E:
										
										move.b  #0,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
										rts

	; End of function sub_5039E

cs_503A6:           dc.w 4                  ; 0004 INIT TEXT CURSOR 8BF : "The people of Granseal have{N}arrived at their new home.{W1}"
										dc.w $8BF
										dc.w $55                ; 0055 RESET FORCE BATTLE STATS
										dc.w $46                ; 0046  0 0
										dc.w 0
										dc.w 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 506DE
										dc.l word_506DE
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $34                ; 0034 SET BLOCKS A 160A 2A0A
										dc.w $A
										dc.w $160A
										dc.w $2A0A
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_TOWN
										dc.w 8
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 4                  ; 0004 INIT TEXT CURSOR 8A5 : "We were almost swallowed{N}by that chasm.{W1}"
										dc.w $8A5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "We were almost swallowed{N}by that chasm.{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C000 : "That was close!{W1}"
										dc.w $C000
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C001 : "Sir Astral, where should{N}we go now?{W1}"
										dc.w $C001
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "I think we should to go{N}to the mainland.{N}Don't you agree, Minister?{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "We have no choice.{W1}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C003 : "Then, let's go to the{N}continent of Parmecia!{W1}"
										dc.w $C003
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5036E
										dc.l sub_5036E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "And so the ship heads east{N}for Parmecia.{W1}"
										dc.w $FFFF
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1 : "I feel...sick...to my...{N}stomach...ohhh....{W1}"
										dc.w 1
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 6 50426 : Kiwi joined
										dc.w 6
										dc.l word_50426         
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C006 : "{NAME;1}, look!{W1}"
										dc.w $C006
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1 : "Sorry, {NAME;6}...I can't{N}do anything right now....{W1}"
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C006 : "That's not what...{W1}"
										dc.w $C006
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1 : "Sorry...ohhh...!{W1}"
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C006 : "Hooray, land ho!{W1}"
										dc.w $C006
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1 : "What?  Oh, it's true!{N}Sir Astral, we can see the {N}mainland!{W1}"
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Finally we've arrived.{N}King Granseal, can you see{N}Parmecia?{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "Oh, that's good...{W1}"
										dc.w $82
word_50426:         dc.w 4                  ; 0004 INIT TEXT CURSOR 8B5 : "Minister, we're approaching{N}Parmecia!{W1}"
										dc.w $8B5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Minister, we're approaching{N}Parmecia!{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Land the ship, captain.{W1}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C083 : "Where?{W1}"
										dc.w $C083
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Anywhere.  There!{N}No!  There!{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8083 : "But, the ship will be{N}destroyed!{W1}"
										dc.w $8083
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "It doesn't matter.  The ship{N}will be used for lumber after{N}we land, anyway.{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8083 : "Are you serious?  Just{N}don't complain that we{N}don't have a ship later!{W1}"
										dc.w $8083
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 50380
										dc.l sub_50380
										dc.b $80                ; WAIT F0
										dc.b $F0
										dc.b $80                ; WAIT CD
										dc.b $CD
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5038E
										dc.l sub_5038E
										dc.b $80                ; WAIT 30
										dc.b $30
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5039E
										dc.l sub_5039E
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 84
										dc.b $84
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$1 Y=$1
										dc.b 1
										dc.b 1
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 84 0 0 1
										dc.b $84
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5 : "Whoa!{W1}"
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1 : "The ship has crashed into{N}the shore!  Oh, no!{W1}"
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83 : "Ouch!  Ouch!{N}That's what I call good{N}seamanship!{W1}"
										dc.w $83
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 84
										dc.w $84
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $1C                ; 001C STOP ENTITY ANIM 84
										dc.w $84
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 4                  ; 0004 INIT TEXT CURSOR 8BF : "The people of Granseal have{N}arrived at their new home.{W1}"
										dc.w $8BF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "The people of Granseal have{N}arrived at their new home.{W1}"
										dc.w $FFFF
										dc.w $37                ; 0037 LOAD MAP AND FADE IN E 12 19
										dc.w $E
										dc.w $12
										dc.w $19
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 5072E
										dc.l word_5072E
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 461B6
										dc.b $82
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 461B6
										dc.b $83
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 461B6
										dc.b $84
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
										dc.w $15                ; 0015 SET ACTSCRIPT 86 0 461B6
										dc.b $86
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 87 0 461B6
										dc.b $87
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 88 0 461B6
										dc.b $88
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 89 0 461B6
										dc.b $89
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 8A 0 461B6
										dc.b $8A
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 8B 0 461B6
										dc.b $8B
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 8C 0 461B6
										dc.b $8C
										dc.b 0
										dc.l eas_461B6          
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Everybody, listen up!{W1}"
										dc.w $80
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 82 0
										dc.b $82
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 83 0
										dc.b $83
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 84 0
										dc.b $84
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 85 0
										dc.b $85
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 86 1
										dc.b $86
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 87 1
										dc.b $87
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 88 2
										dc.b $88
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 89 2
										dc.b $89
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 8A 2
										dc.b $8A
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 8B 3
										dc.b $8B
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 8C 3
										dc.b $8C
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "Let's build a new Granseal{N}here!{W2}"
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "The ship will be a good{N}source of timber!{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Break the ship apart and{N}bring the timber onto the{N}land!{W1}"
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45054
										dc.b $81
										dc.b 0
										dc.l eas_Walking        
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45054
										dc.b $82
										dc.b 0
										dc.l eas_Walking        
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 45054
										dc.b $83
										dc.b 0
										dc.l eas_Walking        
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45054
										dc.b $84
										dc.b 0
										dc.l eas_Walking        
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45054
										dc.b $85
										dc.b 0
										dc.l eas_Walking        
										dc.w $15                ; 0015 SET ACTSCRIPT 86 0 45054
										dc.b $86
										dc.b 0
										dc.l eas_Walking        
										dc.w $15                ; 0015 SET ACTSCRIPT 87 0 45054
										dc.b $87
										dc.b 0
										dc.l eas_Walking        
										dc.w $15                ; 0015 SET ACTSCRIPT 88 0 45054
										dc.b $88
										dc.b 0
										dc.l eas_Walking        
										dc.w $15                ; 0015 SET ACTSCRIPT 89 0 45054
										dc.b $89
										dc.b 0
										dc.l eas_Walking        
										dc.w $15                ; 0015 SET ACTSCRIPT 8A 0 45054
										dc.b $8A
										dc.b 0
										dc.l eas_Walking        
										dc.w $15                ; 0015 SET ACTSCRIPT 8B 0 45054
										dc.b $8B
										dc.b 0
										dc.l eas_Walking        
										dc.w $15                ; 0015 SET ACTSCRIPT 8C 0 45054
										dc.b $8C
										dc.b 0
										dc.l eas_Walking        
										dc.b $80                ; WAIT 50
										dc.b $50
										dc.w $37                ; 0037 LOAD MAP AND FADE IN E 2D 2
										dc.w $E
										dc.w $2D
										dc.w 2
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 5079E
										dc.l word_5079E
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $34                ; 0034 SET BLOCKS 3307 101 3F3F
										dc.w $3307
										dc.w $101
										dc.w $3F3F
										dc.w $34                ; 0034 SET BLOCKS 3306 101 3307
										dc.w $3306
										dc.w $101
										dc.w $3307
										dc.w $1C                ; 001C STOP ENTITY ANIM 83
										dc.w $83
										dc.w $1C                ; 001C STOP ENTITY ANIM 84
										dc.w $84
										dc.w $1C                ; 001C STOP ENTITY ANIM 85
										dc.w $85
										dc.w $C                 ; 000C JUMP IF SET FLAG 6 50624 : Kiwi joined
										dc.w 6
										dc.l word_50624         
										dc.w $2E                ; 002E HIDE ENTITY 6
										dc.w 6
word_50624:         dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2D                ; 002D MOVE ENTITY 3 FF 3 1
										dc.b 3
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 3 : "We're going to break the{N}ship up into pieces and build{N}our new town....{W2}"
										dc.w 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 3 : "That means, we can't go back{N}to Grans Island!{W2}"
										dc.w 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 3 : "Hey, listen to me!{W1}"
										dc.w 3
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C001 : "Be quiet!  We know that.{W2}"
										dc.w $C001
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1 : "Help me remove this plank!{W1}"
										dc.w 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 3 : "OK, I'm coming.{W1}"
										dc.w 3
										dc.w $2D                ; 002D MOVE ENTITY 3 FF 3 2
										dc.b 3
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 3 3
										dc.b 3
										dc.b 3
										dc.w $1A                ; 001A SET ENTITY SPRITE 3 3B
										dc.w 3
										dc.w $3B
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 3 : "Ugh...ugghhh...{N}It's stuck!{W2}"
										dc.w 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 3 : "Heave!  Heave!{N}Come oooooooooon!{W1}"
										dc.w 3
										dc.w $15                ; 0015 SET ACTSCRIPT 3 FF 46172
										dc.b 3
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 3
										dc.b 3
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $34                ; 0034 SET BLOCKS 3F3F 101 3307
										dc.w $3F3F
										dc.w $101
										dc.w $3307
										dc.w 5                  ; 0005 PLAY SOUND SFX_FALLING
										dc.w $58
										dc.w $2D                ; 002D MOVE ENTITY 3 FF 1 4
										dc.b 3
										dc.b $FF
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w $33                ; 0033 SET QUAKE AMOUNT 5
										dc.w 5
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN
										dc.w $5C
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $2E                ; 002E HIDE ENTITY 3
										dc.w 3
										dc.w $34                ; 0034 SET BLOCKS 3800 102 3303
										dc.w $3800
										dc.w $102
										dc.w $3303
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5 : "Oh, what a klutz!{W1}"
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 0 2
										dc.b 5
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 5 1
										dc.b 5
										dc.b 1
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C001 : "That's OK.  {NAME;3} needed{N}a bath anyway.{W1}"
										dc.w $C001
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $32                ; 0032 SET CAMERA DEST 22 4
										dc.w $22
										dc.w 4
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4 : "{LEADER}, bring that plank{N}above deck.{W1}"
										dc.w 4
										dc.w $53                ; 0053  0 0
										dc.w 0
										dc.w 0
										dc.w $53                ; 0053  84 FFFF
										dc.w $84
										dc.w $FFFF
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_506DE:         dc.w $3F
										dc.w $3F
										dc.w 1
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $D1
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b 1
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $CD
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b 3
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b 6
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $CB
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $C1
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b 5
										dc.l eas_Init           
										dc.b 5
										dc.b 5
										dc.b 0
										dc.b $D3
										dc.l eas_Init           
										dc.w $FFFF
word_5072E:         dc.w 0
										dc.w 0
										dc.w 1
										dc.b $17
										dc.b $1E
										dc.b 3
										dc.b $CD
										dc.l eas_Init           
										dc.b $13
										dc.b $1D
										dc.b 1
										dc.b $C6
										dc.l eas_Init           
										dc.b $15
										dc.b $1D
										dc.b 2
										dc.b $C4
										dc.l eas_Init           
										dc.b $14
										dc.b $1E
										dc.b 3
										dc.b $C7
										dc.l eas_Init           
										dc.b $14
										dc.b $1F
										dc.b 1
										dc.b $C7
										dc.l eas_Init           
										dc.b $13
										dc.b $20
										dc.b 3
										dc.b $C5
										dc.l eas_Init           
										dc.b $17
										dc.b $22
										dc.b 3
										dc.b $C8
										dc.l eas_Init           
										dc.b $18
										dc.b $22
										dc.b 3
										dc.b $C9
										dc.l eas_Init           
										dc.b $1B
										dc.b $1D
										dc.b 3
										dc.b $C2
										dc.l eas_Init           
										dc.b $1B
										dc.b $1E
										dc.b 2
										dc.b $C1
										dc.l eas_Init           
										dc.b $1A
										dc.b $1F
										dc.b 1
										dc.b $C2
										dc.l eas_Init           
										dc.b $18
										dc.b $1A
										dc.b 1
										dc.b $C5
										dc.l eas_Init           
										dc.b $17
										dc.b $1B
										dc.b 1
										dc.b $C4
										dc.l eas_Init           
										dc.w $FFFF
word_5079E:         dc.w $28
										dc.w 8
										dc.w 2
										dc.b $33
										dc.b 8
										dc.b 3
										dc.b 1
										dc.l eas_Init           
										dc.b $29
										dc.b $A
										dc.b 3
										dc.b 2
										dc.l eas_Init           
										dc.b $33
										dc.b 4
										dc.b 3
										dc.b 3
										dc.l eas_Init           
										dc.b $27
										dc.b 8
										dc.b 0
										dc.b 4
										dc.l eas_Init           
										dc.b $31
										dc.b 4
										dc.b 1
										dc.b 5
										dc.l eas_Init           
										dc.b $26
										dc.b 5
										dc.b 3
										dc.b 6
										dc.l eas_Init           
										dc.b $29
										dc.b 4
										dc.b 3
										dc.b $CA
										dc.l eas_Init           
										dc.b $35
										dc.b $A
										dc.b 3
										dc.b $CA
										dc.l eas_Init           
										dc.b $2F
										dc.b 5
										dc.b 3
										dc.b $C4
										dc.l eas_Init           
										dc.b $2C
										dc.b 6
										dc.b 0
										dc.b $B3
										dc.l eas_Init           
										dc.b $2D
										dc.b 6
										dc.b 3
										dc.b $B3
										dc.l eas_Init           
										dc.b $2E
										dc.b 6
										dc.b 2
										dc.b $B3
										dc.l eas_Init           
										dc.w $FFFF
cs_50806:           dc.w 4                  ; 0004 INIT TEXT CURSOR 8F0 : "Look at that, {LEADER}!{N}They've finished breaking{N}up the ship.{W1}"
										dc.w $8F0
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 5094A
										dc.l word_5094A
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $2C                ; 002C FOLLOW ENTITY 81 0 2
										dc.w $81
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 0 80 2
										dc.w 0
										dc.w $80
										dc.w 2
										dc.w $34                ; 0034 SET BLOCKS 2A00 B0A 1830
										dc.w $2A00
										dc.w $B0A
										dc.w $1830
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 4
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 4
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 8
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 8
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 8
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 3
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 5
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 5
										dc.w $8080
										dc.w $17                ; 0017 SET ENTITY POS AND FACING WITH FLASH 82 0 0 2
										dc.b $82
										dc.b 0
										dc.b 0
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Look at that, {LEADER}!{N}They've finished breaking{N}up the ship.{W1}"
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $32                ; 0032 SET CAMERA DEST 19 2F
										dc.w $19
										dc.w $2F
										dc.w $34                ; 0034 SET BLOCKS 3500 B0A 1830
										dc.w $3500
										dc.w $B0A
										dc.w $1830
										dc.b $80                ; WAIT F
										dc.b $F
										dc.w $34                ; 0034 SET BLOCKS 2A00 B0A 1830
										dc.w $2A00
										dc.w $B0A
										dc.w $1830
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS 3500 B0A 1830
										dc.w $3500
										dc.w $B0A
										dc.w $1830
										dc.b $80                ; WAIT F
										dc.b $F
										dc.w $34                ; 0034 SET BLOCKS 2A0A B0A 1830
										dc.w $2A0A
										dc.w $B0A
										dc.w $1830
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS 350A B0A 1830
										dc.w $350A
										dc.w $B0A
										dc.w $1830
										dc.b $80                ; WAIT F
										dc.b $F
										dc.w $34                ; 0034 SET BLOCKS 2A0A B0A 1830
										dc.w $2A0A
										dc.w $B0A
										dc.w $1830
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS 350A B0A 1830
										dc.w $350A
										dc.w $B0A
										dc.w $1830
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "Wow, there's our new town!{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "But, our Granseal was much{N}more beautiful.{N}Cheer up!{W1}"
										dc.w $80
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $29                ; 0029 SET ENTITY DEST 80 1D 34
										dc.w $80
										dc.w $1D
										dc.w $34
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 0 0 3
										dc.b $80
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $29                ; 0029 SET ENTITY DEST 81 1D 34
										dc.w $81
										dc.w $1D
										dc.w $34
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 0 0 3
										dc.b $81
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $29                ; 0029 SET ENTITY DEST 0 1D 34
										dc.w 0
										dc.w $1D
										dc.w $34
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 0 0 3
										dc.b 0
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "They worked hard to build{N}their new town.{W1}"
										dc.w $FFFF
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $55                ; 0055 RESET FORCE BATTLE STATS
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 70B0A01
										dc.l $70B0A01
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_5094A:         dc.w $3D
										dc.w $30
										dc.w 2
										dc.b $3E
										dc.b $30
										dc.b 2
										dc.b $CA
										dc.l eas_Init           
										dc.b $3F
										dc.b $30
										dc.b 2
										dc.b $CA
										dc.l eas_Init           
										dc.b $1C
										dc.b $31
										dc.b 0
										dc.b $D3
										dc.l eas_Init           
										dc.w $FFFF
