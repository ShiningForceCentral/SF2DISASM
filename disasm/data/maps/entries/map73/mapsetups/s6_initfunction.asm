
; ASM FILE data\maps\entries\map73\mapsetups\s6_initfunction.asm :
; 0x50342..0x5096A : 

; =============== S U B R O U T I N E =======================================

ms_map73_InitFunction:
                
                 
                chkFlg  $2BC            ; Set after ship arrives in Parmecia and you regain control of Bowie
                bne.s   byte_50354      
                script  cs_503A6
                setFlg  $2BC            ; Set after ship arrives in Parmecia and you regain control of Bowie
                rts
byte_50354:
                
                chkFlg  $1FC            ; Battle 8 completed
                beq.s   return_5036C
                chkFlg  $2C1            ; Set after you automatically walk into New Granseal after it is built
                bne.s   return_5036C
                script  cs_50806
                setFlg  $2C1            ; Set after you automatically walk into New Granseal after it is built
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
                
                move.w  #$1200,((VIEW_PLANE_B_PIXEL_X-$1000000)).w
                move.w  #$3F60,((VIEW_PLANE_B_PIXEL_Y-$1000000)).w
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

cs_503A6:       textCursor $8BF
                resetForceBattleStats
                reloadMap 0,0
                setCameraEntity $FFFF
                loadMapEntities ce_506DE
                setActscriptWait $0,eas_Init
                setBlocks 0,10,22,10,42,10
                playSound MUSIC_TOWN
                fadeInB
                textCursor $8A5
                nextSingleText $0,$80   ; "We were almost swallowed{N}by that chasm.{W1}"
                nextSingleText $C0,$0   ; "That was close!{W1}"
                nextSingleText $C0,$1   ; "Sir Astral, where should{N}we go now?{W1}"
                nextSingleText $0,$80   ; "I think we should to go{N}to the mainland.{N}Don't you agree, Minister?{W1}"
                nextSingleText $0,$81   ; "We have no choice.{W1}"
                nextSingleText $C0,$3   ; "Then, let's go to the{N}continent of Parmecia!{W1}"
                executeSubroutine sub_5036E
                nextSingleText $FF,$FF  ; "And so the ship heads east{N}for Parmecia.{W1}"
                csWait 120
                nextSingleText $0,$1    ; "I feel...sick...to my...{N}stomach...ohhh....{W1}"
                jumpIfFlagClear $6,cs_50426 ; Kiwi joined
                nextSingleText $C0,$6   ; "{NAME;1}, look!{W1}"
                nextSingleText $0,$1    ; "Sorry, {NAME;6}...I can't{N}do anything right now....{W1}"
                nextSingleText $C0,$6   ; "That's not what...{W1}"
                nextSingleText $0,$1    ; "Sorry...ohhh...!{W1}"
                nextSingleText $C0,$6   ; "Hooray, land ho!{W1}"
                nextSingleText $0,$1    ; "What?  Oh, it's true!{N}Sir Astral, we can see the {N}mainland!{W1}"
                nextSingleText $0,$80   ; "Finally we've arrived.{N}King Granseal, can you see{N}Parmecia?{W1}"
                nextSingleText $0,$82   ; "Oh, that's good...{W1}"
cs_50426:       textCursor $8B5
                nextSingleText $0,$80   ; "Minister, we're approaching{N}Parmecia!{W1}"
                nextSingleText $0,$81   ; "Land the ship, captain.{W1}"
                nextSingleText $C0,$83  ; "Where?{W1}"
                nextSingleText $0,$80   ; "Anywhere.  There!{N}No!  There!{W1}"
                nextSingleText $80,$83  ; "But, the ship will be{N}destroyed!{W1}"
                nextSingleText $0,$80   ; "It doesn't matter.  The ship{N}will be used for lumber after{N}we land, anyway.{W1}"
                nextSingleText $80,$83  ; "Are you serious?  Just{N}don't complain that we{N}don't have a ship later!{W1}"
                executeSubroutine sub_50380
                csWait 240
                csWait 205
                setQuake 1
                executeSubroutine sub_5038E
                csWait 48
                executeSubroutine sub_5039E
                customActscriptWait $84
                 ac_setSpeed 1,1        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $84
                 moveRight 1
                endActions
                nextSingleText $0,$5    ; "Whoa!{W1}"
                nextSingleText $0,$1    ; "The ship has crashed into{N}the shore!  Oh, no!{W1}"
                nextSingleText $0,$83   ; "Ouch!  Ouch!{N}That's what I call good{N}seamanship!{W1}"
                setQuake 0
                waitIdle $84
                csWait 30
                stopEntity $84
                csWait 30
                textCursor $8BF
                nextSingleText $FF,$FF  ; "The people of Granseal have{N}arrived at their new home.{W1}"
                loadMapFadeIn 14,18,25
                loadMapEntities ce_5072E
                setActscriptWait $0,eas_Init
                fadeInB
                csWait 5
                setActscript $81,eas_461B6
                csWait 5
                setActscript $82,eas_461B6
                csWait 5
                setActscript $83,eas_461B6
                csWait 5
                setActscript $84,eas_461B6
                csWait 5
                setActscript $85,eas_461B6
                csWait 5
                setActscript $86,eas_461B6
                csWait 5
                setActscript $87,eas_461B6
                csWait 5
                setActscript $88,eas_461B6
                csWait 5
                setActscript $89,eas_461B6
                csWait 5
                setActscript $8A,eas_461B6
                csWait 5
                setActscript $8B,eas_461B6
                csWait 5
                setActscript $8C,eas_461B6
                setFacing $80,LEFT
                csWait 60
                setFacing $80,RIGHT
                csWait 60
                setFacing $80,LEFT
                csWait 30
                nextSingleText $0,$80   ; "Everybody, listen up!{W1}"
                csWait 20
                setFacing $81,RIGHT
                setFacing $82,RIGHT
                setFacing $83,RIGHT
                setFacing $84,RIGHT
                setFacing $85,RIGHT
                setFacing $86,UP
                setFacing $87,UP
                setFacing $88,LEFT
                setFacing $89,LEFT
                setFacing $8A,LEFT
                csWait 20
                setFacing $8B,DOWN
                setFacing $8C,DOWN
                nextText $0,$80         ; "Let's build a new Granseal{N}here!{W2}"
                nextText $0,$80         ; "The ship will be a good{N}source of timber!{W2}"
                nextSingleText $0,$80   ; "Break the ship apart and{N}bring the timber onto the{N}land!{W1}"
                setActscript $81,eas_Walking
                setActscript $82,eas_Walking
                setActscript $83,eas_Walking
                setActscript $84,eas_Walking
                setActscript $85,eas_Walking
                setActscript $86,eas_Walking
                setActscript $87,eas_Walking
                setActscript $88,eas_Walking
                setActscript $89,eas_Walking
                setActscript $8A,eas_Walking
                setActscript $8B,eas_Walking
                setActscript $8C,eas_Walking
                csWait 80
                loadMapFadeIn 14,45,2
                loadMapEntities ce_5079E
                setActscriptWait $0,eas_Init
                setBlocks 51,7,1,1,63,63
                setBlocks 51,6,1,1,51,7
                stopEntity $83
                stopEntity $84
                stopEntity $85
                jumpIfFlagSet $6,cs_50624 ; Kiwi joined
                hide $6
cs_50624:       fadeInB
                entityActionsWait $3
                 moveDown 1
                endActions
                nextText $0,$3          ; "We're going to break the{N}ship up into pieces and build{N}our new town....{W2}"
                nextText $0,$3          ; "That means, we can't go back{N}to Grans Island!{W2}"
                nextSingleText $0,$3    ; "Hey, listen to me!{W1}"
                setFacing $1,UP
                nextText $C0,$1         ; "Be quiet!  We know that.{W2}"
                nextSingleText $0,$1    ; "Help me remove this plank!{W1}"
                nextSingleText $0,$3    ; "OK, I'm coming.{W1}"
                entityActionsWait $3
                 moveDown 2
                endActions
                setFacing $3,DOWN
                setSprite $3,MAPSPRITE_POSE1
                csWait 60
                nextText $0,$3          ; "Ugh...ugghhh...{N}It's stuck!{W2}"
                nextSingleText $0,$3    ; "Heave!  Heave!{N}Come oooooooooon!{W1}"
                setActscriptWait $3,eas_46172
                customActscriptWait $3
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setBlocks 63,63,1,1,51,7
                playSound SFX_FALLING
                entityActionsWait $3
                 moveUp 4
                endActions
                setQuake 5
                playSound SFX_DOOR_OPEN
                csWait 10
                hide $3
                setBlocks 56,0,1,2,51,3
                setQuake 0
                csWait 30
                nextSingleText $0,$5    ; "Oh, what a klutz!{W1}"
                entityActionsWait $5
                 moveRight 2
                endActions
                setFacing $5,UP
                csWait 60
                nextSingleText $C0,$1   ; "That's OK.  {NAME;3} needed{N}a bath anyway.{W1}"
                csWait 20
                setCamDest 34,4
                nextSingleText $0,$4    ; "{LEADER}, bring that plank{N}above deck.{W1}"
                setPriority $0,$0
                setPriority $84,$FFFF
                csc_end
ce_506DE:       mainEntity 63,63,UP
                entity 63,63,DOWN,MAPSPRITE_ASTRAL,eas_Init
                entity 63,63,DOWN,ALLY_SARAH,eas_Init
                entity 63,63,DOWN,MAPSPRITE_MINISTER,eas_Init
                entity 63,63,DOWN,ALLY_JAHA,eas_Init
                entity 63,63,DOWN,ALLY_KIWI,eas_Init
                entity 63,63,DOWN,MAPSPRITE_GRANSEAL_KING,eas_Init
                entity 63,63,DOWN,MAPSPRITE_SAILOR,eas_Init
                entity 63,63,DOWN,ALLY_SLADE,eas_Init
                entity 5,5,RIGHT,MAPSPRITE_BOAT,eas_Init
                dc.w $FFFF
ce_5072E:       mainEntity 0,0,UP
                entity 23,30,DOWN,MAPSPRITE_MINISTER,eas_Init
                entity 19,29,UP,MAPSPRITE_MAN3,eas_Init
                entity 21,29,LEFT,MAPSPRITE_MAN2,eas_Init
                entity 20,30,DOWN,MAPSPRITE_WOMAN3,eas_Init
                entity 20,31,UP,MAPSPRITE_WOMAN3,eas_Init
                entity 19,32,DOWN,MAPSPRITE_WOMAN2,eas_Init
                entity 23,34,DOWN,MAPSPRITE_BOY,eas_Init
                entity 24,34,DOWN,MAPSPRITE_GIRL,eas_Init
                entity 27,29,DOWN,MAPSPRITE_MAN1,eas_Init
                entity 27,30,LEFT,MAPSPRITE_SAILOR,eas_Init
                entity 26,31,UP,MAPSPRITE_MAN1,eas_Init
                entity 24,26,UP,MAPSPRITE_WOMAN2,eas_Init
                entity 23,27,UP,MAPSPRITE_MAN2,eas_Init
                dc.w $FFFF
ce_5079E:       mainEntity 40,8,LEFT
                entity 51,8,DOWN,ALLY_SARAH,eas_Init
                entity 41,10,DOWN,ALLY_CHESTER,eas_Init
                entity 51,4,DOWN,ALLY_JAHA,eas_Init
                entity 39,8,RIGHT,ALLY_KAZIN,eas_Init
                entity 49,4,UP,ALLY_SLADE,eas_Init
                entity 38,5,DOWN,ALLY_KIWI,eas_Init
                entity 41,4,DOWN,MAPSPRITE_WORKER,eas_Init
                entity 53,10,DOWN,MAPSPRITE_WORKER,eas_Init
                entity 47,5,DOWN,MAPSPRITE_MAN2,eas_Init
                entity 44,6,RIGHT,MAPSPRITE_OBJECT2,eas_Init
                entity 45,6,DOWN,MAPSPRITE_OBJECT2,eas_Init
                entity 46,6,LEFT,MAPSPRITE_OBJECT2,eas_Init
                dc.w $FFFF
cs_50806:       textCursor $8F0
                loadMapEntities ce_5094A
                setActscriptWait $0,eas_Init
                setActscriptWait $80,eas_Init
                setActscriptWait $80,eas_Init
                setActscriptWait $0,eas_Init
                followEntity $81,$0,$2
                followEntity $0,$80,$2
                setBlocks 42,0,11,10,24,48
                setCameraEntity $80
                fadeInB
                entityActionsWait $80
                 moveLeft 4
                 moveUp 1
                 moveLeft 2
                 moveUp 2
                endActions
                entityActionsWait $80
                 moveLeft 1
                 moveUp 1
                 moveUp 1
                 moveLeft 8
                 moveDown 2
                endActions
                entityActionsWait $80
                 moveLeft 8
                 moveDown 2
                 moveLeft 3
                 moveDown 1
                 moveLeft 2
                 moveDown 2
                endActions
                entityActionsWait $80
                 moveLeft 5
                endActions
                setPosFlash $82,0,0,LEFT
                nextSingleText $0,$80   ; "Look at that, {LEADER}!{N}They've finished breaking{N}up the ship.{W1}"
                setFacing $0,DOWN
                setFacing $80,DOWN
                setFacing $81,DOWN
                setCamDest 25,47
                setBlocks 53,0,11,10,24,48
                csWait 15
                setBlocks 42,0,11,10,24,48
                csWait 5
                setBlocks 53,0,11,10,24,48
                csWait 15
                setBlocks 42,10,11,10,24,48
                csWait 5
                setBlocks 53,10,11,10,24,48
                csWait 15
                setBlocks 42,10,11,10,24,48
                csWait 5
                setBlocks 53,10,11,10,24,48
                csWait 30
                nextText $0,$80         ; "Wow, there's our new town!{W2}"
                nextSingleText $0,$80   ; "But, our Granseal was much{N}more beautiful.{N}Cheer up!{W1}"
                setCameraEntity $FFFF
                setActscriptWait $80,eas_Init
                setActscriptWait $81,eas_Init
                setActscriptWait $0,eas_Init
                setDest $80,29,52
                setPos $80,0,0,DOWN
                setDest $81,29,52
                setPos $81,0,0,DOWN
                setDest $0,29,52
                setPos $0,0,0,DOWN
                csWait 60
                nextSingleText $FF,$FF  ; "They worked hard to build{N}their new town.{W1}"
                playSound $FD
                resetForceBattleStats
                warp $7,$B,$A,$1
                csc_end
ce_5094A:       mainEntity 61,48,LEFT
                entity 62,48,LEFT,MAPSPRITE_WORKER,eas_Init
                entity 63,48,LEFT,MAPSPRITE_WORKER,eas_Init
                entity 28,49,RIGHT,MAPSPRITE_BOAT,eas_Init
                dc.w $FFFF
