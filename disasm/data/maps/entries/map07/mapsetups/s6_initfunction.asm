
; ASM FILE data\maps\entries\map07\mapsetups\s6_initfunction.asm :
; 0x55816..0x55A36 : 

; =============== S U B R O U T I N E =======================================


ms_map7_InitFunction:
                
                 
                chkFlg  707             ; Set after the "one year has passed" text, after New Granseal is built
                bne.s   return_55830
                move.b  #6,((EGRESS_MAP_INDEX-$1000000)).w
                script  cs_55832
                setFlg  707             ; Set after the "one year has passed" text, after New Granseal is built
                setFlg  411             ; Battle 11 unlocked - BATTLE_CAVE_OF_DARKNESS          
return_55830:
                
                rts

    ; End of function ms_map7_InitFunction

cs_55832:       textCursor 1290
                mapLoad MAP_NEW_GRANSEAL_CASTLE,6,2
                loadMapEntities ce_559AE
                setActscriptWait ALLY_BOWIE,eas_Init
                resetMap
                slowFadeInB
                reloadMap 6,2
                nextText $FF,255        ; "One year has passed.{W1}"
                textCursor 1136
                stopEntity 129
                loadMapFadeIn MAP_NEW_GRANSEAL_CASTLE,6,2
                playSound MUSIC_CASTLE
                fadeInB
                csWait 40
                entityActionsWait 128
                 moveLeft 1
                endActions
                setFacing 128,DOWN
                nod 128
                nextText $0,128         ; "(Cough)...our town is being{N}rebuilt, as you can see.{W2}"
                nextText $0,128         ; "But, we will be better off{N}if there are no accidents.{W2}"
                nextText $0,128         ; "You're too young to spend{N}your time guarding our new{N}home.{W2}"
                nextText $0,128         ; "You are the soldiers of{N}Granseal!{W2}"
                nextSingleText $0,128   ; "Do your best to improve our{N}new home!{W1}"
                csWait 30
                setFacing 128,UP
                nextSingleText $0,128   ; "King Granseal!{W1}"
                csWait 60
                nextSingleText $0,128   ; "(Cough)...(cough)...{N}King Granseal!{W1}"
                csWait 20
                startEntity 129
                nextText $0,128         ; "All the people of Granseal{N}have been working hard for{N}an entire year.{W2}"
                nextSingleText $0,128   ; "Please thank them for their{N}hard work.{W1}"
                nextSingleText $0,129   ; "Ah...I have nothing to say.{W1}"
                stopEntity 129
                nextText $0,128         ; "N...nothing?{W2}"
                nextSingleText $0,128   ; "Mmmm...alright.{W1}"
                setFacing 128,LEFT
                setFacing 139,RIGHT
                nextSingleText $0,128   ; "Sir Astral, please speak in{N}place of our King.{W1}"
                nod 139
                nextSingleText $0,139   ; "Ummmm...OK, I got it.{W1}"
                csWait 20
                entityActionsWait 128
                 moveRight 1
                endActions
                setFacing 128,LEFT
                csWait 25
                entityActionsWait 139
                 moveRight 1
                endActions
                setFacing 139,DOWN
                setFacing 128,DOWN
                csWait 40
                nextText $0,139         ; "One year has passed since{N}we came here.{W2}"
                nextText $0,139         ; "The castle, the town...{N}everything is coming along{N}nicely.{W2}"
                nextText $0,139         ; "But we lack something.{N}What is it?  It's trading!{W2}"
                nod 128
                nextSingleText $0,139   ; "We need to make alliances{N}with other towns.{W1}"
                setFacing 139,RIGHT
                setFacing 128,LEFT
                nextSingleText $0,128   ; "Indeed, indeed.{N}Thank you, sir!{W1}"
                csWait 20
                setFacing 139,DOWN
                setFacing 128,DOWN
                nextSingleText $0,128   ; "That's all for today.{N}You may go now.{W1}"
                entityActions 130
                 moveDown 1
                 moveLeft 5
                endActions
                entityActions 131
                 moveLeft 5
                endActions
                entityActions 132
                 moveDown 1
                 moveLeft 2
                endActions
                entityActions 133
                 moveDown 4
                endActions
                entityActions 134
                 moveRight 5
                endActions
                entityActions 135
                 moveDown 1
                 moveRight 2
                endActions
                entityActionsWait 136
                 moveDown 4
                endActions
                entityActions 139
                 moveLeft 1
                endActions
                entityActionsWait ALLY_JAHA
                 moveDown 1
                endActions
                entityActions ALLY_JAHA
                 moveRight 6
                endActions
                entityActions ALLY_SARAH
                 moveRight 6
                endActions
                entityActions ALLY_KAZIN
                 moveUp 1
                 moveRight 6
                endActions
                entityActionsWait ALLY_CHESTER
                 moveUp 2
                 moveRight 6
                endActions
                setFacing 139,DOWN
                setFacing 132,DOWN
                setFacing 135,DOWN
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
                entity 12,7,UP,ALLY_JAHA,eas_Init
                entity 11,8,UP,ALLY_SARAH,eas_Init
                entity 11,9,UP,ALLY_KAZIN,eas_Init
                entity 11,10,UP,ALLY_CHESTER,eas_Init
                dc.w $FFFF
