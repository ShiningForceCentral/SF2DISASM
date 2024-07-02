
; ASM FILE code\gameflow\special\battletest-standard.asm :
; Battle test functions

; =============== S U B R O U T I N E =======================================


DebugModeBattleTest:
                
                module
                st      ((DEBUG_MODE_TOGGLE-$1000000)).w
                st      ((SPECIAL_TURBO_TOGGLE-$1000000)).w
                
                ; All characters join the Force
                moveq   #1,d0
@JoinForce_Loop:jsr     JoinForce
                addq.w  #1,d0
                cmpi.w  #COMBATANT_ALLIES_NUMBER,d0
                bhs.s   @JoinForce_Loop
                
                moveq   #0,d0
                move.w  #200,d1 
                jsr     SetBaseAgi
                jsr     SetBaseAtt
                jsr     SetBaseDef
                jsr     SetMaxHp
                jsr     SetCurrentAgi
                jsr     SetCurrentAtt
                jsr     SetCurrentDef
                jsr     SetCurrentHp
                sndCom  MUSIC_BATTLE_THEME_3
                jsr     (EnableDisplayAndInterrupts).w
                jsr     (InitializeDisplay).w
                jsr     (EnableDisplayAndInterrupts).w
                jsr     (FadeInFromBlack).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateWindows
                jsr     (InitializeWindowProperties).w
                move.w  #COMBATANT_ALLIES_NUMBER,(GENERIC_LIST_LENGTH).l
                lea     (GENERIC_LIST).l,a0
                move.l  #$10203,(a0)+
                move.l  #$4050607,(a0)+
                move.l  #$8090A0B,(a0)+
                move.l  #$C0D0E0F,(a0)+
                move.l  #$10111213,(a0)+
                move.l  #$14151617,(a0)+
                move.l  #$18191A1B,(a0)+
                move.l  #$1C1D1E1F,(a0)+
                bsr.w   CheatModeConfiguration
                
StartBattleTest:
@Start:         txt     456             ; "Battle number?{D1}"
                clr.w   d0
                clr.w   d1
                move.w  #BATTLES_DEBUG_NUMBER,d2
                jsr     NumberPrompt
                clsTxt
                tst.w   d0
                blt.w   @DebugLevelUp
                
                movem.w d0-d2,-(sp)
                clr.w   d0
                clr.w   d1
                move.w  #1,d2
                jsr     NumberPrompt
                tst.w   d0
                movem.w (sp)+,d0-d2
                
                beq.s   @DebugSetFlags
                move.w  d0,d1
                addi.w  #BATTLE_INTRO_CUTSCENE_FLAGS_START,d1
                jsr     SetFlag
                
@DebugSetFlags: movem.w d0-d4,-(sp)
                move.w  #70,d0 
                jsr     DebugSetFlag
                movem.w (sp)+,d0-d4
                
                clr.w   d1
                move.b  d0,d1
                mulu.w  #BATTLEMAPCOORDINATES_ENTRY_SIZE_FULL,d0
                getPointer p_table_BattleMapCoordinates, a0
                adda.w  d0,a0
                move.b  (a0)+,d0
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                move.b  (a0)+,(BATTLE_AREA_X).l
                move.b  (a0)+,(BATTLE_AREA_Y).l
                move.b  (a0)+,(BATTLE_AREA_WIDTH).l
                move.b  (a0)+,(BATTLE_AREA_HEIGHT).l
            else
                move.b  (a0)+,((BATTLE_AREA_X-$1000000)).w
                move.b  (a0)+,((BATTLE_AREA_Y-$1000000)).w
                move.b  (a0)+,((BATTLE_AREA_WIDTH-$1000000)).w
                move.b  (a0)+,((BATTLE_AREA_HEIGHT-$1000000)).w
            endif
            if (TEST_BUILD=1)
                move.b  #SHOP_DEBUG,((CURRENT_SHOP_INDEX-$1000000)).w
                pea     @Start(pc)
                pea     FieldMenu
                pea     ChurchMenu
                pea     ShopMenu
                pea     CaravanMenu
                jmp     BattleLoop
            else
                jsr     BattleLoop
                jsr     ChurchMenu
                txt     460             ; "Shop number?{D1}"
                move.w  #0,d0
                move.w  #0,d1
                move.w  #SHOP_DEBUG,d2 
                jsr     NumberPrompt
                clsTxt
                move.b  d0,((CURRENT_SHOP_INDEX-$1000000)).w
                jsr     ShopMenu
                jsr     FieldMenu
                jsr     CaravanMenu
                bra.w   @Start
            endif
@DebugLevelUp:  
            if (TEST_BUILD=1)
                rts
            else
                jsr     ExecuteMembersListScreenOnMainSummaryPage
                tst.b   d0
                bne.w   @Start
                
                bpl.s   @LevelUpWholeForce
                
                movem.l d0-a6,-(sp)
                jsr     ChurchMenu
                movem.l (sp)+,d0-a6
                
                bra.s   @DebugLevelUp
@LevelUpWholeForce:
                
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                clr.w   d0
                
@LevelUp_Loop:  jsr     LevelUp
                addq.w  #1,d0
                dbf     d7,@LevelUp_Loop
                
                bra.s   @DebugLevelUp
            endif
    ; End of function DebugModeBattleTest

                modend
