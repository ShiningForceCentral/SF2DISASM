
; ASM FILE data\maps\entries\map37\mapsetups\scripts.asm :
; 0x5FB30..0x5FDE4 : 
cs_5FB30:       textCursor 3365
                setActscriptWait 128,eas_Init
                setFacing 128,DOWN
                headshake 128
                nextText $0,128         ; "Phew!  We've made it to{N}Grans Island!{W1}"
                nextText $0,128         ; "{LEADER}, Geshp's probably{N}coming for us!{W2}"
                nextText $0,128         ; "Evacuate the ship!{W1}"
                nextText $0,128         ; "What are you doing?{N}Get off the ship!{W2}"
                nextSingleText $0,128   ; "I'll go first.{W1}"
                entityActionsWait 128
                 moveRight 4
                 moveUpRight 1
                 moveRight 3
                endActions
                hide 128
                csc_end
cs_5FB6A:       textCursor 3377
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 1
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait 128,eas_Init
                setActscriptWait ALLY_ZYNK,eas_Init
                setCamDest 11,6
                setActscriptWait ALLY_PETER,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                nextSingleText $80,ALLY_PETER ; "Wow, the ship is vibrating!{W1}"
                setFacing 128,UP
                nextSingleText $0,128   ; "What's going on?{W1}"
                setDest ALLY_ZYNK,11,11
                setDest ALLY_ZYNK,14,11
                setDest ALLY_ZYNK,15,10
                setDest ALLY_ZYNK,16,10
                setFacing ALLY_ZYNK,DOWN
                nextSingleText $0,ALLY_ZYNK ; "Don't worry. {W1}"
                setActscriptWait ALLY_PETER,eas_Jump
                nextSingleText $80,ALLY_PETER ; "But...but...{N}Woooooow!{W1}"
                setCamDest 4,6
                setFacing ALLY_BOWIE,UP
                playSound $FE
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 3
                csWait 20
                setQuake 1
                playSound MUSIC_MITULA_SHRINE
                executeSubroutine csub_5FD3A
                setQuake 0
                entityActions 128
                 moveUp 1
                 moveLeft 1
                 moveDownLeft 1
                 moveLeft 6
                endActions
                entityActionsWait ALLY_PETER
                 moveUp 1
                 moveLeft 2
                 moveDownLeft 1
                 moveLeft 5
                endActions
                setFacing 128,UP
                setFacing ALLY_PETER,UP
                nextSingleText $0,ALLY_PETER ; "It's floating!  This big{N}ship is floating!{W1}"
                setFacing ALLY_ZYNK,LEFT
                setCamDest 11,6
                nextSingleText $80,ALLY_ZYNK ; "We're going higher and{N}higher....{W1}"
                csWait 40
                fadeOutB
                setCameraEntity 65535
                mapLoad MAP_OVERWORLD_GRANS_NORTH_SHORE,40,12
                loadMapEntities ce_5FDD4
                setActscriptWait ALLY_BOWIE,eas_Init
                setBlocks 60,59,4,5,44,15
                fadeInB
                executeSubroutine sub_5FD7C
                csWait 60
                nextSingleText $0,FOLLOWER_B ; "I've never experienced{N}anything like this in my{N}seventy years of life!{W1}"
                csWait 60
                fadeOutB
                mapLoad MAP_NAZCA_SHIP_INTERIOR,4,6
                loadEntitiesFromMapSetup 9,11,RIGHT
                csWait 1
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait 128,eas_Init
                setActscriptWait ALLY_ZYNK,eas_Init
                setPos 128,9,12,UP
                setPos ALLY_PETER,10,12,UP
                setPos ALLY_ZYNK,10,11,LEFT
                fadeInB
                nextSingleText $80,ALLY_ZYNK ; "OK, now we'll head to{N}Grans Island.{W1}"
                setQuake 1
                csWait 10
                setQuake 0
                executeSubroutine sub_5FD4C
                setFacing 128,LEFT
                nextSingleText $0,128   ; "Oh, we're flying!{W1}"
                nextSingleText $0,ALLY_PETER ; "The Ancients were greater{N}than we thought!{W1}"
                setFacing 128,UP
                setFacing ALLY_ZYNK,DOWN
                nextSingleText $80,ALLY_ZYNK ; "Oh, thank you very much.{W1}"
                csWait 60
                fadeOutB
                mapLoad MAP_OVERWORLD_GRANS_NORTH_SHORE,40,12
                loadMapEntities ce_5FDD4
                setActscriptWait ALLY_BOWIE,eas_Init
                setBlocks 60,59,4,5,44,15
                customActscriptWait 128
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 128
                 moveLeft 30
                endActions
                executeSubroutine sub_5FD5E
                fadeInB
                csWait 15
                executeSubroutine sub_5FD66
                csWait 120
                warp MAP_ZEON_ARENA,63,63,RIGHT
                csc_end

; =============== S U B R O U T I N E =======================================


csub_5FD3A:
                
                moveq   #7,d7
loc_5FD3C:
                
                subq.b  #1,((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
                moveq   #4,d0
                jsr     (Sleep).w       
                dbf     d7,loc_5FD3C
                rts

    ; End of function csub_5FD3A


; =============== S U B R O U T I N E =======================================


sub_5FD4C:
                
                moveq   #7,d7
loc_5FD4E:
                
                subq.b  #1,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
                moveq   #4,d0
                jsr     (Sleep).w       
                dbf     d7,loc_5FD4E
                rts

    ; End of function sub_5FD4C


; =============== S U B R O U T I N E =======================================


sub_5FD5E:
                
                move.b  #$18,((byte_FFAEEE+5-$1000000)).w
                rts

    ; End of function sub_5FD5E


; =============== S U B R O U T I N E =======================================


sub_5FD66:
                
                moveq   #$B,d7
loc_5FD68:
                
                subq.b  #1,((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
                subq.b  #1,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
                moveq   #4,d0
                jsr     (Sleep).w       
                dbf     d7,loc_5FD68
                rts

    ; End of function sub_5FD66


; =============== S U B R O U T I N E =======================================

; unused


sub_5FD7C:
                
                bsr.w   sub_5FD92       
                moveq   #$17,d7
loc_5FD82:
                
                addq.b  #1,((byte_FFAEEE+5-$1000000)).w
                moveq   #4,d0
                jsr     (Sleep).w       
                dbf     d7,loc_5FD82
                rts

    ; End of function sub_5FD7C


; =============== S U B R O U T I N E =======================================

; unused


sub_5FD92:
                
                move.b  #1,((FADING_TIMER_BYTE-$1000000)).w
                lea     plt_5FDB4(pc), a0
                lea     (PALETTE_4_BASE).l,a1
                moveq   #$20,d7 
                jsr     (CopyBytes).w   
                lea     (PALETTE_1_BASE).l,a0
                jsr     (sub_19C8).w    
                rts

    ; End of function sub_5FD92

plt_5FDB4:      dc.w 0
                dc.w 0
                dc.w 0
                dc.w $E60
                dc.w $EA4
                dc.w $CC8
                dc.w 0
                dc.w 0
                dc.w 0
                dc.w 0
                dc.w 0
                dc.w 0
                dc.w 0
                dc.w $ECC
                dc.w 0
                dc.w $EEE
ce_5FDD4:       mainEntity 0,0,DOWN
                entity 45,17,RIGHT,MAPSPRITE_NAZCA_SHIP,eas_Init
                dc.w $FFFF
