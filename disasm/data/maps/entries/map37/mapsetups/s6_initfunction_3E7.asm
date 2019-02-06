
; ASM FILE data\maps\entries\map37\mapsetups\s6_initfunction_3E7.asm :
; 0x5FAA4..0x5FDE4 : 

; =============== S U B R O U T I N E =======================================

ms_map37_flag3E7_InitFunction:
                
                jsr     InitNazcaShipForceMembers
                chkFlg  $100            ; TEMP FLAG #00
                bne.s   return_5FABA
                script  cs_5FABC
                setFlg  $100            ; TEMP FLAG #00
return_5FABA:
                
                rts

	; End of function ms_map37_flag3E7_InitFunction

cs_5FABC:       textCursor $D1F
                reloadMap 6,6
                setPos $0,8,12,UP
                setPos $7,13,12,UP
                setPos $1A,10,10,DOWN
                setPos $80,10,11,UP
                stopEntity $80
                playSound MUSIC_STOP
                fadeInB
                nextText $80,$7         ; "Ouch!  Hey, {NAME;26}!{N}I like your wild driving!{W2}"
                nextSingleText $80,$7   ; "Where's Sir Astral?{W1}"
                setFacing $7,RIGHT
                csWait 20
                setFacing $7,LEFT
                csWait 20
                setFacing $7,RIGHT
                csWait 20
                setFacing $7,LEFT
                csWait 20
                shiver $7
                nextSingleText $80,$7   ; "Oh, there he is!{W1}"
                setActscriptWait $7,eas_Init
                entityActionsWait $7
                 moveLeft 3
                 faceUp 1
                endActions
                nextSingleText $80,$7   ; "Sir Astral!  Are you OK?{W1}"
                setFacing $7,LEFT
                nextSingleText $80,$7   ; "{LEADER}, come on!{W1}"
                csc_end
cs_5FB30:       textCursor $D25
                setActscriptWait $80,eas_Init
                setFacing $80,DOWN
                headshake $80
                nextText $0,$80         ; "Phew!  We've made it to{N}Grans Island!{W1}"
                nextText $0,$80         ; "{LEADER}, Geshp's probably{N}coming for us!{W2}"
                nextText $0,$80         ; "Evacuate the ship!{W1}"
                nextText $0,$80         ; "What are you doing?{N}Get off the ship!{W2}"
                nextSingleText $0,$80   ; "I'll go first.{W1}"
                entityActionsWait $80
                 moveRight 4
                 moveUpRight 1
                 moveRight 3
                endActions
                hide $80
                csc_end
cs_5FB6A:       textCursor $D31
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 1
                setActscriptWait $7,eas_Init
                setActscriptWait $80,eas_Init
                setActscriptWait $1A,eas_Init
                setCamDest 11,6
                setActscriptWait $7,eas_Jump
                setActscriptWait $7,eas_Jump
                nextSingleText $80,$7   ; "Wow, the ship is vibrating!{W1}"
                setFacing $80,UP
                nextSingleText $0,$80   ; "What's going on?{W1}"
                setDest $1A,11,11
                setDest $1A,14,11
                setDest $1A,15,10
                setDest $1A,16,10
                setFacing $1A,DOWN
                nextSingleText $0,$1A   ; "Don't worry. {W1}"
                setActscriptWait $7,eas_Jump
                nextSingleText $80,$7   ; "But...but...{N}Woooooow!{W1}"
                setCamDest 4,6
                setFacing $0,UP
                playSound $FE
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 3
                csWait 20
                setQuake 1
                playSound MUSIC_MITULA_SHRINE
                executeSubroutine csub_5FD3A
                setQuake 0
                entityActions $80
                 moveUp 1
                 moveLeft 1
                 moveDownLeft 1
                 moveLeft 6
                endActions
                entityActionsWait $7
                 moveUp 1
                 moveLeft 2
                 moveDownLeft 1
                 moveLeft 5
                endActions
                setFacing $80,UP
                setFacing $7,UP
                nextSingleText $0,$7    ; "It's floating!  This big{N}ship is floating!{W1}"
                setFacing $1A,LEFT
                setCamDest 11,6
                nextSingleText $80,$1A  ; "We're going higher and{N}higher....{W1}"
                csWait 40
                fadeOutB
                setCameraEntity $FFFF
                mapLoad 75,40,12
                loadMapEntities ce_5FDD4
                setActscriptWait $0,eas_Init
                setBlocks 60,59,4,5,44,15
                fadeInB
                executeSubroutine sub_5FD7C
                csWait 60
                nextSingleText $0,$1F   ; "I've never experienced{N}anything like this in my{N}seventy years of life!{W1}"
                csWait 60
                fadeOutB
                mapLoad 37,4,6
                loadEntitiesFromMapSetup 9,11,RIGHT
                csWait 1
                setActscriptWait $7,eas_Init
                setActscriptWait $80,eas_Init
                setActscriptWait $1A,eas_Init
                setPos $80,9,12,UP
                setPos $7,10,12,UP
                setPos $1A,10,11,LEFT
                fadeInB
                nextSingleText $80,$1A  ; "OK, now we'll head to{N}Grans Island.{W1}"
                setQuake 1
                csWait 10
                setQuake 0
                executeSubroutine sub_5FD4C
                setFacing $80,LEFT
                nextSingleText $0,$80   ; "Oh, we're flying!{W1}"
                nextSingleText $0,$7    ; "The Ancients were greater{N}than we thought!{W1}"
                setFacing $80,UP
                setFacing $1A,DOWN
                nextSingleText $80,$1A  ; "Oh, thank you very much.{W1}"
                csWait 60
                fadeOutB
                mapLoad 75,40,12
                loadMapEntities ce_5FDD4
                setActscriptWait $0,eas_Init
                setBlocks 60,59,4,5,44,15
                customActscriptWait $80
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $80
                 moveLeft 30
                endActions
                executeSubroutine sub_5FD5E
                fadeInB
                csWait 15
                executeSubroutine sub_5FD66
                csWait 120
                warp $3B,$3F,$3F,$0
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

sub_5FD92:
                
                move.b  #1,((byte_FFDFAB-$1000000)).w
                lea     plt_5FDB4(pc), a0
                lea     (PALETTE_4_BIS).l,a1
                moveq   #$20,d7 
                jsr     (CopyBytes).w   
                lea     (PALETTE_1_BIS).l,a0
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
                entity 45,17,RIGHT,253,eas_Init
                dc.w $FFFF
