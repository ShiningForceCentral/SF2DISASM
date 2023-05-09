
; ASM FILE data\battles\entries\battle33\cs_beforebattle.asm :
; 0x4CF0C..0x4D09A : Cutscene before battle 33
bbcs_33:        textCursor 2866
                loadMapFadeIn MAP_MOUN,22,29
                loadMapEntities ce_4D048
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,27,38,LEFT
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,27,37,LEFT
                setActscriptWait ALLY_FRAYJA,eas_Init
                setPos ALLY_FRAYJA,27,36,LEFT
                setBlocks 16,8,1,1,32,1
                setBlocks 3,39,1,1,16,8
                playSound MUSIC_BATTLE_THEME_3
                fadeInB
                csWait 30
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                setFacing FOLLOWER_B,UP
                entityActionsWait ALLY_FRAYJA
                 moveUp 1
                endActions
                setFacing ALLY_FRAYJA,DOWN
                nextSingleText $0,ALLY_FRAYJA ; "I'm opening the gate of Moun.{N}Devils are waiting inside.{N}Be careful!{W1}"
                entityActionsWait ALLY_FRAYJA
                 moveUp 1
                endActions
                nextSingleText $FF,255  ; "Vicar {NAME;22} uses{N}the gate key.{W1}"
                csWait 30
                setQuake 2
                setBlocks 1,39,2,2,26,32
                csWait 20
                setQuake 0
                setCameraEntity ALLY_BOWIE
                csWait 50
                entityActionsWait ALLY_BOWIE
                 moveUp 1
                endActions
                entityActions ALLY_FRAYJA
                 moveUp 6
                 moveLeft 1
                 moveUp 1
                endActions
                entityActions ALLY_BOWIE
                 moveUp 7
                endActions
                entityActions FOLLOWER_B
                 moveUp 6
                 moveLeft 2
                 moveUp 1
                endActions
                entityActionsWait ALLY_PETER
                 moveUp 8
                endActions
                csWait 30
                cameraSpeed $30
                setCamDest 5,8
                entityActionsWait 128
                 moveDown 1
                endActions
                nextText $0,128         ; "Welcome, losers!{W2}"
                nextSingleText $0,128   ; "Will you follow the example{N}of the people of Moun and die{N}without resistance?{W1}"
                nextText $0,ALLY_FRAYJA ; "No!  I'm too late.{N}I killed a lot of people.{W2}"
                nextSingleText $0,ALLY_FRAYJA ; "I can never forgive myself!{W1}"
                setCamDest 21,25
                entityActionsWait ALLY_FRAYJA
                 moveDown 1
                endActions
                nextSingleText $0,ALLY_FRAYJA ; "{LEADER}, please let me{N}fight with you.  They must{N}die!{W1}"
                join ALLY_FRAYJA
                entityActionsWait FOLLOWER_B
                 moveUp 1
                endActions
                setFacing FOLLOWER_B,RIGHT
                setFacing ALLY_BOWIE,LEFT
                nextSingleText $0,FOLLOWER_B ; "{LEADER}, {NAME;22} will be{N}a great asset.{W1}"
                joinBatParty ALLY_FRAYJA
                executeSubroutine sub_4D078
                textCursor 2875
                nextSingleText $0,FOLLOWER_B ; "{LEADER}, {NAME;22} is{N}right.  They must die!{W1}"
                setF 831                ; Set after Frayja forces his way into the party just before the battle in Moun
                clearF 82               ; Frayja is a follower
                csc_end
ce_4D048:       mainEntity 26,37,LEFT
                entity 27,38,LEFT,ALLY_PETER,eas_Init
                entity 27,36,LEFT,ALLY_FRAYJA,eas_Init
                entity 10,10,DOWN,MAPSPRITE_SHAMAN,eas_Init
                entity 9,10,DOWN,MAPSPRITE_DEVIL_SOLDIER,eas_Init
                entity 11,10,DOWN,MAPSPRITE_DEVIL_SOLDIER,eas_Init
                dc.w $FFFF

; =============== S U B R O U T I N E =======================================


sub_4D078:
                
                cmpi.w  #$FFFF,(TEXT_NAME_INDEX_1).l
                beq.s   return_4D098
                jsr     (HideTextBox).l
                move.w  #$B3A,d0
                jsr     (DisplayText).l 
                jsr     (HideTextBox).l
return_4D098:
                
                rts

    ; End of function sub_4D078

