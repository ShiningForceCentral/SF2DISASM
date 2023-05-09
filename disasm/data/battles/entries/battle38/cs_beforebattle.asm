
; ASM FILE data\battles\entries\battle38\cs_beforebattle.asm :
; 0x4DDA4..0x4DE8C : Cutscene before battle 38
bbcs_38:        textCursor 3003
                loadMapFadeIn MAP_OVERWORLD_GRANS_GRANSEAL,9,6
                loadMapEntities ce_4DE74
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,13,8,DOWN
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,15,8,DOWN
                setActscriptWait FOLLOWER_A,eas_Init
                setPos FOLLOWER_A,14,8,DOWN
                jumpIfFlagClear 76,cs_4DDFE ; Zynk is a follower
                setActscriptWait ALLY_ZYNK,eas_Init
                setPos ALLY_ZYNK,63,63,DOWN
cs_4DDFE:       playSound MUSIC_BATTLE_THEME_1
                fadeInB
                cameraSpeed $30
                entityActions ALLY_BOWIE
                 moveDown 2
                endActions
                entityActions ALLY_PETER
                 moveDown 2
                endActions
                entityActions FOLLOWER_A
                 moveDown 2
                endActions
                entityActionsWait FOLLOWER_B
                 moveDown 2
                endActions
                nextSingleText $0,128   ; "Stop!{W1}"
                setCamDest 9,19
                nextText $0,128         ; "Finally, you've arrived.{W2}"
                nextSingleText $0,128   ; "It was a mistake to{N}underestimate you.{W2}"
                entityActionsWait 128
                 moveUp 2
                endActions
                nextSingleText $0,128   ; "But, the game is not over.{N}At the risk of my life,{N}you'll proceed no further!{W1}"
                nextText $C0,FOLLOWER_B ; "Geshp is serious.{N}He finally considers us{N}worthy opponents.{W2}"
                nextSingleText $C0,FOLLOWER_B ; "{LEADER}, be careful.{N}We mustn't underrate his{N}power.{W1}"
                nextText $0,128         ; "You're right, Astral!{W2}"
                nextText $0,128         ; "Zeon doesn't trust me,{N}thanks to you!{W2}"
                nextSingleText $0,128   ; "This is my last chance.{N}I can't see him again 'til I{N}bring him your head.{W1}"
                setQuake 4
                playSound SFX_BOLT_SPELL
                flashScreenWhite $1E
                playSound SFX_BATTLEFIELD_DEATH
                flashScreenWhite $32
                setQuake 0
                csc_end
ce_4DE74:       mainEntity 14,9,DOWN
                entity 13,8,DOWN,ALLY_PETER,eas_Init
                entity 13,23,UP,MAPSPRITE_GESHP,eas_Init
                dc.w $FFFF
