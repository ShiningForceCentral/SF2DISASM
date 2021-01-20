
; ASM FILE data\scripting\map\debugscripts.asm :
; 0x4931C..0x494BC : Debugging scripts
dms_01:         faceEntity 134,ALLY_BOWIE
                addNewFollower ALLY_SLADE
                addNewFollower ALLY_JAHA
                addNewFollower ALLY_ZYNK
                followEntity ALLY_PETER,ALLY_BOWIE,2
                moveEntityAboveAnother ALLY_BOWIE,ALLY_BOWIE
                csc_end
                setCameraEntity ALLY_BOWIE
                setActscript ALLY_BOWIE,eas_ControlledCharacter
cs_4934A:       entityFlashWhite ALLY_BOWIE,$B4
                jump cs_4934A
                csc_end
                textCursor 322
                csc15 ALLY_SARAH,$1,eas_ControlledCharacter
                showPortrait $0,ALLY_BOWIE
                setQuake 32770
                setQuake 16386
                loadMapFadeIn MAP_OUTSIDE_MITULA,13,13
                flashScreenWhite $3C
                csc_end
                flashScreenWhite $3C
                csc_end
                stopEntity ALLY_KAZIN
                csc15 ALLY_SARAH,$1,eas_493A2
                waitIdle ALLY_SARAH
                showPortrait $0,ALLY_BOWIE
                csWait 60
                startEntity ALLY_KAZIN
                hidePortrait
                csc_end
eas_493A2:       ac_entityObstructable ON
                 ac_mapUncollidable ON
                 ac_entityUncollidable ON
                 ac_setSpeed 32,32
                 ac_accelFactors 0,0
                 ac_acceleration -2,ON
                 ac_deceleration -2,ON
                 ac_checkMapBlockCopy
                 ac_controlCharacter
                 ac_waitDest
                 ac_checkMapBlockCopy
                 ac_wait 1
word_493CA:      ac_branch
                dc.w (eas_ControlledCharacter-word_493CA) & $FFFF
                dc.w 4                  ; 0004 SET TEXT INDEX 142
                dc.w $142
                dc.w $1E                ; 001E HIDE PORTRAIT
                dc.w $A                 ; 000A EXECUTE SUBROUTINE 493EC
                dc.l sub_493EC
                dc.w 1                  ; 0001 DISPLAY SINGLE TEXT BOX WITH VARS 0 4
                dc.w 0
                dc.w 4
                dc.w $14                ; 0014 SET ACTSCRIPT MANUAL 0
                dc.b 0
                dc.b 0
                dc.w 0                  ; 0000 WAIT value $1D
                dc.w $1D
                dc.w 0                  ; 0000 WAIT value $FFFF
                dc.w $FFFF

; =============== S U B R O U T I N E =======================================


sub_493EC:
                
                move.w  #$18A,d0        ; 018A={NAME} found{N}the {ITEM}.{D1}
                jsr     (DisplayText).l 
                moveq   #$78,d0 
                rts

    ; End of function sub_493EC

                updateDefeatedAllies
                allyDefeated ALLY_PETER
                allyDefeated ALLY_SARAH
                allyDefeated ALLY_CHESTER
                allyDefeated ALLY_KIWI
                reviveAlly 128
                reviveAlly 150
                allyDefeated ALLY_JAHA
                showPortrait $0,ALLY_BOWIE
                csc_end
                setCameraEntity 65535
                entityFlashWhite ALLY_BOWIE,$28
                hide ALLY_BOWIE
                setPos ALLY_KIWI,13,23,DOWN
                entityFlashWhite ALLY_KIWI,$28
                animEntityFX ALLY_KIWI,7
                playSound MUSIC_PROMOTED_ATTACK_LOOP
                csc_end
DebuggingScript:incbin "data/scripting/map/debuggingscript.bin" ; Unused cutscene with parsing mistake here and below, letting it unformatted.
