
; ASM FILE data\maps\entries\map73\mapsetups\s6_initfunction.asm :
; 0x50342..0x5096A : 

; =============== S U B R O U T I N E =======================================


ms_map73_InitFunction:
                
                 
                chkFlg  700             ; Set after ship arrives in Parmecia and you regain control of Bowie
                bne.s   byte_50354      
                script  cs_503A6
                setFlg  700             ; Set after ship arrives in Parmecia and you regain control of Bowie
                rts
byte_50354:
                
                chkFlg  508             ; Battle 8 completed - BATTLE_NORTH_CLIFF                  
                beq.s   return_5036C
                chkFlg  705             ; Set after you automatically walk into New Granseal after it is built
                bne.s   return_5036C
                script  cs_50806
                setFlg  705             ; Set after you automatically walk into New Granseal after it is built
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

cs_503A6:       textCursor 2239
                resetForceBattleStats
                reloadMap 0,0
                setCameraEntity 65535
                loadMapEntities ce_506DE
                setActscriptWait ALLY_BOWIE,eas_Init
                setBlocks 0,10,22,10,42,10
                playSound MUSIC_TOWN
                fadeInB
                textCursor 2213
                nextSingleText $0,128   ; "We were almost swallowed{N}by that chasm.{W1}"
                nextSingleText $C0,ALLY_BOWIE ; "That was close!{W1}"
                nextSingleText $C0,ALLY_SARAH ; "Sir Astral, where should{N}we go now?{W1}"
                nextSingleText $0,128   ; "I think we should to go{N}to the mainland.{N}Don't you agree, Minister?{W1}"
                nextSingleText $0,129   ; "We have no choice.{W1}"
                nextSingleText $C0,ALLY_JAHA ; "Then, let's go to the{N}continent of Parmecia!{W1}"
                executeSubroutine sub_5036E
                nextSingleText $FF,255  ; "And so the ship heads east{N}for Parmecia.{W1}"
                csWait 120
                nextSingleText $0,ALLY_SARAH ; "I feel...sick...to my...{N}stomach...ohhh....{W1}"
                jumpIfFlagClear 6,cs_50426 ; Kiwi joined
                nextSingleText $C0,ALLY_KIWI ; "{NAME;1}, look!{W1}"
                nextSingleText $0,ALLY_SARAH ; "Sorry, {NAME;6}...I can't{N}do anything right now....{W1}"
                nextSingleText $C0,ALLY_KIWI ; "That's not what...{W1}"
                nextSingleText $0,ALLY_SARAH ; "Sorry...ohhh...!{W1}"
                nextSingleText $C0,ALLY_KIWI ; "Hooray, land ho!{W1}"
                nextSingleText $0,ALLY_SARAH ; "What?  Oh, it's true!{N}Sir Astral, we can see the {N}mainland!{W1}"
                nextSingleText $0,128   ; "Finally we've arrived.{N}King Granseal, can you see{N}Parmecia?{W1}"
                nextSingleText $0,130   ; "Oh, that's good...{W1}"
cs_50426:       textCursor 2229
                nextSingleText $0,128   ; "Minister, we're approaching{N}Parmecia!{W1}"
                nextSingleText $0,129   ; "Land the ship, captain.{W1}"
                nextSingleText $C0,131  ; "Where?{W1}"
                nextSingleText $0,128   ; "Anywhere.  There!{N}No!  There!{W1}"
                nextSingleText $80,131  ; "But, the ship will be{N}destroyed!{W1}"
                nextSingleText $0,128   ; "It doesn't matter.  The ship{N}will be used for lumber after{N}we land, anyway.{W1}"
                nextSingleText $80,131  ; "Are you serious?  Just{N}don't complain that we{N}don't have a ship later!{W1}"
                executeSubroutine sub_50380
                csWait 240
                csWait 205
                setQuake 1
                executeSubroutine sub_5038E
                csWait 48
                executeSubroutine sub_5039E
                customActscriptWait 132
                 ac_setSpeed 1,1        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 132
                 moveRight 1
                endActions
                nextSingleText $0,ALLY_SLADE ; "Whoa!{W1}"
                nextSingleText $0,ALLY_SARAH ; "The ship has crashed into{N}the shore!  Oh, no!{W1}"
                nextSingleText $0,131   ; "Ouch!  Ouch!{N}That's what I call good{N}seamanship!{W1}"
                setQuake 0
                waitIdle 132
                csWait 30
                stopEntity 132
                csWait 30
                textCursor 2239
                nextSingleText $FF,255  ; "The people of Granseal have{N}arrived at their new home.{W1}"
                loadMapFadeIn MAP_SHIP_DAMAGED,18,25
                loadMapEntities ce_5072E
                setActscriptWait ALLY_BOWIE,eas_Init
                fadeInB
                csWait 5
                setActscript 129,eas_2xRightLeft
                csWait 5
                setActscript 130,eas_2xRightLeft
                csWait 5
                setActscript 131,eas_2xRightLeft
                csWait 5
                setActscript 132,eas_2xRightLeft
                csWait 5
                setActscript 133,eas_2xRightLeft
                csWait 5
                setActscript 134,eas_2xRightLeft
                csWait 5
                setActscript 135,eas_2xRightLeft
                csWait 5
                setActscript 136,eas_2xRightLeft
                csWait 5
                setActscript 137,eas_2xRightLeft
                csWait 5
                setActscript 138,eas_2xRightLeft
                csWait 5
                setActscript 139,eas_2xRightLeft
                csWait 5
                setActscript 140,eas_2xRightLeft
                setFacing 128,LEFT
                csWait 60
                setFacing 128,RIGHT
                csWait 60
                setFacing 128,LEFT
                csWait 30
                nextSingleText $0,128   ; "Everybody, listen up!{W1}"
                csWait 20
                setFacing 129,RIGHT
                setFacing 130,RIGHT
                setFacing 131,RIGHT
                setFacing 132,RIGHT
                setFacing 133,RIGHT
                setFacing 134,UP
                setFacing 135,UP
                setFacing 136,LEFT
                setFacing 137,LEFT
                setFacing 138,LEFT
                csWait 20
                setFacing 139,DOWN
                setFacing 140,DOWN
                nextText $0,128         ; "Let's build a new Granseal{N}here!{W2}"
                nextText $0,128         ; "The ship will be a good{N}source of timber!{W2}"
                nextSingleText $0,128   ; "Break the ship apart and{N}bring the timber onto the{N}land!{W1}"
                setActscript 129,eas_Walking
                setActscript 130,eas_Walking
                setActscript 131,eas_Walking
                setActscript 132,eas_Walking
                setActscript 133,eas_Walking
                setActscript 134,eas_Walking
                setActscript 135,eas_Walking
                setActscript 136,eas_Walking
                setActscript 137,eas_Walking
                setActscript 138,eas_Walking
                setActscript 139,eas_Walking
                setActscript 140,eas_Walking
                csWait 80
                loadMapFadeIn MAP_SHIP_DAMAGED,45,2
                loadMapEntities ce_5079E
                setActscriptWait ALLY_BOWIE,eas_Init
                setBlocks 51,7,1,1,63,63
                setBlocks 51,6,1,1,51,7
                stopEntity 131
                stopEntity 132
                stopEntity 133
                jumpIfFlagSet 6,cs_50624 ; Kiwi joined
                hide ALLY_KIWI
cs_50624:       fadeInB
                entityActionsWait ALLY_JAHA
                 moveDown 1
                endActions
                nextText $0,ALLY_JAHA   ; "We're going to break the{N}ship up into pieces and build{N}our new town....{W2}"
                nextText $0,ALLY_JAHA   ; "That means, we can't go back{N}to Grans Island!{W2}"
                nextSingleText $0,ALLY_JAHA ; "Hey, listen to me!{W1}"
                setFacing ALLY_SARAH,UP
                nextText $C0,ALLY_SARAH ; "Be quiet!  We know that.{W2}"
                nextSingleText $0,ALLY_SARAH ; "Help me remove this plank!{W1}"
                nextSingleText $0,ALLY_JAHA ; "OK, I'm coming.{W1}"
                entityActionsWait ALLY_JAHA
                 moveDown 2
                endActions
                setFacing ALLY_JAHA,DOWN
                setSprite ALLY_JAHA,MAPSPRITE_POSE1
                csWait 60
                nextText $0,ALLY_JAHA   ; "Ugh...ugghhh...{N}It's stuck!{W2}"
                nextSingleText $0,ALLY_JAHA ; "Heave!  Heave!{N}Come oooooooooon!{W1}"
                setActscriptWait ALLY_JAHA,eas_DeactivateAutoFacing
                customActscriptWait ALLY_JAHA
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setBlocks 63,63,1,1,51,7
                playSound SFX_FALLING
                entityActionsWait ALLY_JAHA
                 moveUp 4
                endActions
                setQuake 5
                playSound SFX_DOOR_OPEN
                csWait 10
                hide ALLY_JAHA
                setBlocks 56,0,1,2,51,3
                setQuake 0
                csWait 30
                nextSingleText $0,ALLY_SLADE ; "Oh, what a klutz!{W1}"
                entityActionsWait ALLY_SLADE
                 moveRight 2
                endActions
                setFacing ALLY_SLADE,UP
                csWait 60
                nextSingleText $C0,ALLY_SARAH ; "That's OK.  {NAME;3} needed{N}a bath anyway.{W1}"
                csWait 20
                setCamDest 34,4
                nextSingleText $0,ALLY_KAZIN ; "{LEADER}, bring that plank{N}above deck.{W1}"
                setPriority ALLY_BOWIE,$0
                setPriority 132,$FFFF
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
cs_50806:       textCursor 2288
                loadMapEntities ce_5094A
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait 128,eas_Init
                setActscriptWait 128,eas_Init
                setActscriptWait ALLY_BOWIE,eas_Init
                followEntity 129,ALLY_BOWIE,2
                followEntity ALLY_BOWIE,128,2
                setBlocks 42,0,11,10,24,48
                setCameraEntity 128
                fadeInB
                entityActionsWait 128
                 moveLeft 4
                 moveUp 1
                 moveLeft 2
                 moveUp 2
                endActions
                entityActionsWait 128
                 moveLeft 1
                 moveUp 1
                 moveUp 1
                 moveLeft 8
                 moveDown 2
                endActions
                entityActionsWait 128
                 moveLeft 8
                 moveDown 2
                 moveLeft 3
                 moveDown 1
                 moveLeft 2
                 moveDown 2
                endActions
                entityActionsWait 128
                 moveLeft 5
                endActions
                setPosFlash 130,0,0,LEFT
                nextSingleText $0,128   ; "Look at that, {LEADER}!{N}They've finished breaking{N}up the ship.{W1}"
                setFacing ALLY_BOWIE,DOWN
                setFacing 128,DOWN
                setFacing 129,DOWN
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
                nextText $0,128         ; "Wow, there's our new town!{W2}"
                nextSingleText $0,128   ; "But, our Granseal was much{N}more beautiful.{N}Cheer up!{W1}"
                setCameraEntity 65535
                setActscriptWait 128,eas_Init
                setActscriptWait 129,eas_Init
                setActscriptWait ALLY_BOWIE,eas_Init
                setDest 128,29,52
                setPos 128,0,0,DOWN
                setDest 129,29,52
                setPos 129,0,0,DOWN
                setDest ALLY_BOWIE,29,52
                setPos ALLY_BOWIE,0,0,DOWN
                csWait 60
                nextSingleText $FF,255  ; "They worked hard to build{N}their new town.{W1}"
                playSound $FD
                resetForceBattleStats
                warp MAP_NEW_GRANSEAL_CASTLE,11,10,UP
                csc_end
ce_5094A:       mainEntity 61,48,LEFT
                entity 62,48,LEFT,MAPSPRITE_WORKER,eas_Init
                entity 63,48,LEFT,MAPSPRITE_WORKER,eas_Init
                entity 28,49,RIGHT,MAPSPRITE_BOAT,eas_Init
                dc.w $FFFF
