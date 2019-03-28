
; ASM FILE data\battles\entries\battle33\cs_beforebattle.asm :
; 0x4CF0C..0x4D09A : Cutscene before battle 33
bbcs_33:        textCursor $B32
                loadMapFadeIn 31,22,29
                loadMapEntities ce_4D048
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setPos $7,27,38,LEFT
                setActscriptWait $1F,eas_Init
                setPos $1F,27,37,LEFT
                setActscriptWait $16,eas_Init
                setPos $16,27,36,LEFT
                setBlocks 16,8,1,1,32,1
                setBlocks 3,39,1,1,16,8
                playSound MUSIC_BATTLE_THEME_3
                fadeInB
                csWait 30
                setFacing $0,UP
                setFacing $7,UP
                setFacing $1F,UP
                entityActionsWait $16
                 moveUp 1
                endActions
                setFacing $16,DOWN
                nextSingleText $0,$16   ; "I'm opening the gate of Moun.{N}Devils are waiting inside.{N}Be careful!{W1}"
                entityActionsWait $16
                 moveUp 1
                endActions
                nextSingleText $FF,$FF  ; "Vicar {NAME;22} uses{N}the gate key.{W1}"
                csWait 30
                setQuake 2
                setBlocks 1,39,2,2,26,32
                csWait 20
                setQuake 0
                setCameraEntity $0
                csWait 50
                entityActionsWait $0
                 moveUp 1
                endActions
                entityActions $16
                 moveUp 6
                 moveLeft 1
                 moveUp 1
                endActions
                entityActions $0
                 moveUp 7
                endActions
                entityActions $1F
                 moveUp 6
                 moveLeft 2
                 moveUp 1
                endActions
                entityActionsWait $7
                 moveUp 8
                endActions
                csWait 30
                cameraSpeed $30
                setCamDest 5,8
                entityActionsWait $80
                 moveDown 1
                endActions
                nextText $0,$80         ; "Welcome, losers!{W2}"
                nextSingleText $0,$80   ; "Will you follow the example{N}of the people of Moun and die{N}without resistance?{W1}"
                nextText $0,$16         ; "No!  I'm too late.{N}I killed a lot of people.{W2}"
                nextSingleText $0,$16   ; "I can never forgive myself!{W1}"
                setCamDest 21,25
                entityActionsWait $16
                 moveDown 1
                endActions
                nextSingleText $0,$16   ; "{LEADER}, please let me{N}fight with you.  They must{N}die!{W1}"
                join $16
                entityActionsWait $1F
                 moveUp 1
                endActions
                setFacing $1F,RIGHT
                setFacing $0,LEFT
                nextSingleText $0,$1F   ; "{LEADER}, {NAME;22} will be{N}a great asset.{W1}"
                joinBatParty $16
                executeSubroutine sub_4D078
                textCursor $B3B
                nextSingleText $0,$1F   ; "{LEADER}, {NAME;22} is{N}right.  They must die!{W1}"
                setF $33F               ; Set after Frayja forces his way into the party just before the battle in Moun
                clearF $52              ; Frayja is a follower
                csc_end
ce_4D048:       mainEntity 26,37,LEFT
                entity 27,38,LEFT,MAPSPRITE_CHESTER_SPECIAL,eas_Init
                entity 27,36,LEFT,MAPSPRITE_GERHALT_BASE,eas_Init
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

