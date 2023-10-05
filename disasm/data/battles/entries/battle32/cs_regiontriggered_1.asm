
; ASM FILE data\battles\entries\battle32\cs_regiontriggered_1.asm :
; 0x4CD10..0x4CDB4 : Region-activated cutscene for battle 32
rbcs_battle32:  textCursor 2849
                executeSubroutine csub_JaroJoinForce
                cameraSpeed $38
                setCameraEntity ALLY_JARO
                csWait 60
                nextSingleText $0,ALLY_JARO ; "I'm tired of this.  I can no{N}longer fight for devils.{W1}"
                setCameraEntity 128
                csWait 60
                nextSingleText $0,128   ; "{NAME;23}, what?{W1}"
                setCameraEntity ALLY_JARO
                csWait 60
                setFacing ALLY_JARO,UP
                nextSingleText $0,ALLY_JARO ; "Didn't you hear me?{W1}"
                setFacing ALLY_JARO,DOWN
                nextSingleText $0,ALLY_JARO ; "Hey, Granseal guys!{N}I'm on your side from now{N}on! OK?{W1}"
            if (STANDARD_BUILD&NO_AI_JARO=1)
                join ALLY_JARO
            else
                joinForceAI ALLY_JARO,$FFFF ; 0054 JOIN FORCE WITH AI
            endif
                setF 386                ; Set during battle 32, after Jaro switches sides
                csc_end

; =============== S U B R O U T I N E =======================================

; Jaro joins the Force


csub_JaroJoinForce:
                
                move.w  #COMBATANT_ENEMY_INDEX_15,d0
                jsr     j_GetCombatantX
                move.w  d1,d7
                jsr     j_GetCombatantY
                move.w  d1,d6
                clr.w   d1
                jsr     j_SetCurrentHp
                move.w  #-1,d1
                jsr     j_SetCombatantX
                move.w  #-1,d1
                jsr     j_SetCombatantY
                moveq   #ALLY_JARO,d0
                move.w  d7,d1
                jsr     j_SetCombatantX
                move.w  d6,d1
                jsr     j_SetCombatantY
                moveq   #ALLY_JARO,d0
                jsr     j_JoinForce
                moveq   #ALLY_JARO,d0
                jsr     j_JoinBattleParty
                move.b  (ENTITY_EVENT_ENEMY_JAR).l,(ENTITY_EVENT_ALLY_JARO).l
                rts

    ; End of function csub_JaroJoinForce

