
; ASM FILE data\battles\entries\battle32\cs_regiontriggered_1.asm :
; 0x4CD10..0x4CDB4 : Region-activated cutscene for battle 32
rbcs_battle32:  textCursor 2849
                executeSubroutine csub_4CD56
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
                joinForceAI ALLY_JARO,$FFFF ; 0054 JOIN FORCE WITH AI
                setF 386                ; Set during battle 32, after Jaro switches sides
                csc_end

; =============== S U B R O U T I N E =======================================

; Jaro joins the Force


csub_4CD56:
                
                move.w  #$8F,d0 
                jsr     j_GetXPos
                move.w  d1,d7
                jsr     j_GetYPos
                move.w  d1,d6
                clr.w   d1
                jsr     j_SetCurrentHP
                move.w  #$FFFF,d1
                jsr     j_SetXPos
                move.w  #$FFFF,d1
                jsr     j_SetYPos
                moveq   #ALLY_JARO,d0
                move.w  d7,d1
                jsr     j_SetXPos
                move.w  d6,d1
                jsr     j_SetYPos
                moveq   #ALLY_JARO,d0
                jsr     j_JoinForce
                moveq   #ALLY_JARO,d0
                jsr     j_JoinBattleParty
                move.b  (byte_FFB16F).l,(ENTITY_EVENT_INDEX_LIST+$17).l
                rts

    ; End of function csub_4CD56

