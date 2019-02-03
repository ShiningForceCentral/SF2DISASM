
; ASM FILE data\battles\entries\battle41\cs_beforebattle.asm :
; 0x4ED0E..0x4ED8E : Cutscene before battle 41
bbcs_41:        textCursor $C0B
                loadMapFadeIn 56,12,21
                loadMapEntities ce_4ED76
                setActscriptWait $0,eas_Init
                setPos $7,16,24,RIGHT
                setPos $1F,15,24,RIGHT
                setPos $1C,14,24,RIGHT
                jumpIfFlagClear $4C,cs_4ED48; Zynk is a follower
                setPos $1A,13,24,RIGHT
cs_4ED48:       playSound MUSIC_BATTLE_THEME_3
                fadeInB
                nextSingleText $0,$80   ; "Who are you?!{N}Oh, are you from Granseal?{W1}"
                setFacing $0,UP
                setCamDest 12,4
                nextSingleText $0,$80   ; "But, Odd Eye went to...{W2}"
                entityActionsWait $80
                 moveDown 2
                endActions
                nextText $0,$80         ; "Impossible!{N}He was defeated?{W2}"
                nextText $0,$80         ; "Inconceivable!  But...{N}OK, I'll stop you here.{W2}"
                nextSingleText $0,$80   ; "You shall die now!{W1}"
                csc_end
ce_4ED76:       mainEntity 17,24,RIGHT
                entity 16,24,RIGHT,7,eas_Init
                entity 16,6,DOWN,99,eas_Init
                dc.w $FFFF
