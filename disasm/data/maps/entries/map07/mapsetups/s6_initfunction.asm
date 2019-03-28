
; ASM FILE data\maps\entries\map07\mapsetups\s6_initfunction.asm :
; 0x55816..0x55A36 : 

; =============== S U B R O U T I N E =======================================

ms_map7_InitFunction:
                
                 
                chkFlg  $2C3            ; Set after the "one year has passed" text, after New Granseal is built
                bne.s   return_55830
                move.b  #6,((EGRESS_MAP_INDEX-$1000000)).w
                script  cs_55832
                setFlg  $2C3            ; Set after the "one year has passed" text, after New Granseal is built
                setFlg  $19B            ; Battle 11 unlocked
return_55830:
                
                rts

	; End of function ms_map7_InitFunction

cs_55832:       textCursor $50A
                mapLoad 7,6,2
                loadMapEntities ce_559AE
                setActscriptWait $0,eas_Init
                resetMap
                slowFadeInB
                reloadMap 6,2
                nextText $FF,$FF        ; "One year has passed.{W1}"
                textCursor $470
                stopEntity $81
                loadMapFadeIn 7,6,2
                playSound MUSIC_CASTLE
                fadeInB
                csWait 40
                entityActionsWait $80
                 moveLeft 1
                endActions
                setFacing $80,DOWN
                nod $80
                nextText $0,$80         ; "(Cough)...our town is being{N}rebuilt, as you can see.{W2}"
                nextText $0,$80         ; "But, we will be better off{N}if there are no accidents.{W2}"
                nextText $0,$80         ; "You're too young to spend{N}your time guarding our new{N}home.{W2}"
                nextText $0,$80         ; "You are the soldiers of{N}Granseal!{W2}"
                nextSingleText $0,$80   ; "Do your best to improve our{N}new home!{W1}"
                csWait 30
                setFacing $80,UP
                nextSingleText $0,$80   ; "King Granseal!{W1}"
                csWait 60
                nextSingleText $0,$80   ; "(Cough)...(cough)...{N}King Granseal!{W1}"
                csWait 20
                startEntity $81
                nextText $0,$80         ; "All the people of Granseal{N}have been working hard for{N}an entire year.{W2}"
                nextSingleText $0,$80   ; "Please thank them for their{N}hard work.{W1}"
                nextSingleText $0,$81   ; "Ah...I have nothing to say.{W1}"
                stopEntity $81
                nextText $0,$80         ; "N...nothing?{W2}"
                nextSingleText $0,$80   ; "Mmmm...alright.{W1}"
                setFacing $80,LEFT
                setFacing $8B,RIGHT
                nextSingleText $0,$80   ; "Sir Astral, please speak in{N}place of our King.{W1}"
                nod $8B
                nextSingleText $0,$8B   ; "Ummmm...OK, I got it.{W1}"
                csWait 20
                entityActionsWait $80
                 moveRight 1
                endActions
                setFacing $80,LEFT
                csWait 25
                entityActionsWait $8B
                 moveRight 1
                endActions
                setFacing $8B,DOWN
                setFacing $80,DOWN
                csWait 40
                nextText $0,$8B         ; "One year has passed since{N}we came here.{W2}"
                nextText $0,$8B         ; "The castle, the town...{N}everything is coming along{N}nicely.{W2}"
                nextText $0,$8B         ; "But we lack something.{N}What is it?  It's trading!{W2}"
                nod $80
                nextSingleText $0,$8B   ; "We need to make alliances{N}with other towns.{W1}"
                setFacing $8B,RIGHT
                setFacing $80,LEFT
                nextSingleText $0,$80   ; "Indeed, indeed.{N}Thank you, sir!{W1}"
                csWait 20
                setFacing $8B,DOWN
                setFacing $80,DOWN
                nextSingleText $0,$80   ; "That's all for today.{N}You may go now.{W1}"
                entityActions $82
                 moveDown 1
                 moveLeft 5
                endActions
                entityActions $83
                 moveLeft 5
                endActions
                entityActions $84
                 moveDown 1
                 moveLeft 2
                endActions
                entityActions $85
                 moveDown 4
                endActions
                entityActions $86
                 moveRight 5
                endActions
                entityActions $87
                 moveDown 1
                 moveRight 2
                endActions
                entityActionsWait $88
                 moveDown 4
                endActions
                entityActions $8B
                 moveLeft 1
                endActions
                entityActionsWait $3
                 moveDown 1
                endActions
                entityActions $3
                 moveRight 6
                endActions
                entityActions $1
                 moveRight 6
                endActions
                entityActions $4
                 moveUp 1
                 moveRight 6
                endActions
                entityActionsWait $2
                 moveUp 2
                 moveRight 6
                endActions
                setFacing $8B,DOWN
                setFacing $84,DOWN
                setFacing $87,DOWN
                reloadEntities ms_map7_Entities
                csc_end
ce_559AE:       mainEntity 11,7,UP
                entity 12,5,DOWN,MAPSPRITE_MINISTER,eas_Init
                entity 11,4,DOWN,MAPSPRITE_GRANSEAL_KING,eas_Init
                entity 10,7,UP,MAPSPRITE_SOLDIER1,eas_Init
                entity 10,8,UP,MAPSPRITE_SOLDIER1,eas_Init
                entity 10,9,UP,MAPSPRITE_SOLDIER1,eas_Init
                entity 10,10,UP,MAPSPRITE_SOLDIER2,eas_Init
                entity 12,8,UP,MAPSPRITE_SOLDIER2,eas_Init
                entity 12,9,UP,MAPSPRITE_SOLDIER2,eas_Init
                entity 12,10,UP,MAPSPRITE_SOLDIER2,eas_Init
                entity 8,7,RIGHT,MAPSPRITE_MAID,eas_Init
                entity 14,7,LEFT,MAPSPRITE_MAID,eas_Init
                entity 10,5,DOWN,MAPSPRITE_ASTRAL,eas_Init
                entity 12,7,UP,MAPSPRITE_SARAH_PROMO,eas_Init
                entity 11,8,UP,MAPSPRITE_BOWIE_PROMO,eas_Init
                entity 11,9,UP,MAPSPRITE_SARAH_SPECIAL,eas_Init
                entity 11,10,UP,MAPSPRITE_SARAH_BASE,eas_Init
                dc.w $FFFF
