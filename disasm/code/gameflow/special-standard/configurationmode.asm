
; ASM FILE code\gameflow\special-standard\configurationmode.asm :
;
; Extends and regroups debug/test functionalities under a port of the Final Conflict menu system.


; enum Configuration
CONFIGURATION_DEFAULT_INITIAL_INDEX:            equ CONFIGURATION_MAP_SELECT
CONFIGURATION_MAX_INDEX:                        equ ((configurationAction_End-rjt_ConfigurationActions)/2)-1
CONFIGURATION_MAP_SELECT_MAX_INDEX:             equ MAPS_DEBUG_MAX_INDEX
CONFIGURATION_BATTLE_TEST_MAX_INDEX:            equ BATTLES_DEBUG_MAX_INDEX
CONFIGURATION_MENU_SELECT_MAX_INDEX:            equ 3   ; 0 = field, 1 = church, 2 = shop, 3 = caravan
CONFIGURATION_SHOP_SELECT_MAX_INDEX:            equ SHOPS_DEBUG_MAX_INDEX
CONFIGURATION_DIFFICULTY_MAX_LEVEL:             equ 3   ; 0 = normal, 1 = hard, 2 = super, 3 = ouch
CONFIGURATION_ALLY_MAX_INDEX:                   equ COMBATANT_ALLIES_NUMBER-1
CONFIGURATION_ENEMY_MAX_INDEX:                  equ COMBATANT_ENEMIES_NUMBER-1
CONFIGURATION_ACTION_TYPE_MAX_INDEX:            equ 2
CONFIGURATION_ALLYBATTLEANIMATION_MAX_INDEX:    equ 86
CONFIGURATION_ENEMYBATTLEANIMATION_MAX_INDEX:   equ 120
CONFIGURATION_SPELLANIMATION_MAX_INDEX:         equ 31
CONFIGURATION_GIVE_MONEY_AMOUNT:                equ 500000
CONFIGURATION_NUMBER_PROMPT_SIZE:               equ $703
CONFIGURATION_NUMBER_PROMPT_ORIGIN:             equ $2001
CONFIGURATION_NUMBER_PROMPT_DESTINATION:        equ $1801
CONFIGURATION_NUMBER_PROMPT_ANIMATION_LENGTH:   equ 4
CONFIGURATION_NUMBER_PROMPT_DIGITS_OFFSET:      equ 16
CONFIGURATION_NUMBER_PROMPT_DIGITS_NUMBER:      equ 5


; enum ConfigurationMessages
                rsreset
CONFIGURATION_MESSAGE_END:                  rs.b 1
CONFIGURATION_MESSAGE_MAP_SELECT:           rs.b 1
CONFIGURATION_MESSAGE_BATTLE_TEST_1:        rs.b 1
CONFIGURATION_MESSAGE_BATTLE_TEST_2:        rs.b 1
CONFIGURATION_MESSAGE_MENU_SELECT:          rs.b 1
CONFIGURATION_MESSAGE_SHOP_SELECT:          rs.b 1
CONFIGURATION_MESSAGE_PARTY_SELECT_1:       rs.b 1
CONFIGURATION_MESSAGE_PARTY_SELECT_2:       rs.b 1
CONFIGURATION_MESSAGE_PARTY_SELECT_3:       rs.b 1
CONFIGURATION_MESSAGE_PARTY_SELECT_4:       rs.b 1
CONFIGURATION_MESSAGE_PARTY_SELECT_5:       rs.b 1
CONFIGURATION_MESSAGE_LEVEL_UP_1:           rs.b 1
CONFIGURATION_MESSAGE_LEVEL_UP_2:           rs.b 1
CONFIGURATION_MESSAGE_LEVEL_UP_3:           rs.b 1
CONFIGURATION_MESSAGE_NAME_CHARACTER:       rs.b 1
CONFIGURATION_MESSAGE_CONTROL_ENEMIES:      rs.b 1
CONFIGURATION_MESSAGE_AUTO_BATTLE:          rs.b 1
CONFIGURATION_MESSAGE_DIFFICULTY_SELECT:    rs.b 1
CONFIGURATION_MESSAGE_ACTION_TEST_1:        rs.b 1
CONFIGURATION_MESSAGE_ACTION_TEST_2:        rs.b 1
CONFIGURATION_MESSAGE_ACTION_TEST_3:        rs.b 1
CONFIGURATION_MESSAGE_ACTION_TEST_4:        rs.b 1
CONFIGURATION_MESSAGE_ACTION_TEST_5:        rs.b 1
CONFIGURATION_MESSAGE_ACTION_TEST_6:        rs.b 1
CONFIGURATION_MESSAGE_ACTION_TEST_7:        rs.b 1
CONFIGURATION_MESSAGE_ACTION_TEST_8:        rs.b 1
CONFIGURATION_MESSAGE_MESSAGE_TEST:         rs.b 1
CONFIGURATION_MESSAGE_SOUND_TEST:           rs.b 1
CONFIGURATION_MESSAGE_RESET:                rs.b 1
CONFIGURATION_MESSAGE_SAVE:                 rs.b 1
CONFIGURATION_MESSAGE_LOAD:                 rs.b 1
CONFIGURATION_MESSAGE_DONE:                 rs.b 1


; =============== S U B R O U T I N E =======================================

ConfigurationScreenBattleTest:
                pea     ConfigurationScreen(pc)
                
InitializeDebugModeConfigurationSettings:
                
                ; Initial TEST_BUILD configuration settings
                move.b  #TEST_BUILD_INITIAL_SPECIAL_TURBO,((SPECIAL_TURBO_TOGGLE-$1000000)).w
                move.b  #TEST_BUILD_INITIAL_DEBUG_MODE,((DEBUG_MODE_TOGGLE-$1000000)).w
                move.b  #TEST_BUILD_INITIAL_CONTROL_OPPONENT,((CONTROL_OPPONENT_TOGGLE-$1000000)).w
                move.b  #TEST_BUILD_INITIAL_AUTO_BATTLE,((AUTO_BATTLE_TOGGLE-$1000000)).w
                move.b  #TEST_BUILD_INITIAL_CONFIGURATION_MODE,((CONFIGURATION_MODE_TOGGLE-$1000000)).w
                setSavedByte #TEST_BUILD_INITIAL_MESSAGE_SPEED, MESSAGE_SPEED
                setSavedByte #TEST_BUILD_INITIAL_NO_BATTLE_MESSAGES, NO_BATTLE_MESSAGES_TOGGLE
            if (TEST_BUILD_INITIAL_GAME_COMPLETED=1)
                bset    #7,(SAVE_FLAGS).l
            else
                bclr    #7,(SAVE_FLAGS).l
            endif
                rts

    ; End of function InitializeDebugModeConfiguration


; =============== S U B R O U T I N E =======================================


InitializeConfigurationSettings:
                
                ; Initial configuration settings
                move.b  #INITIAL_SPECIAL_TURBO,((SPECIAL_TURBO_TOGGLE-$1000000)).w
                move.b  #INITIAL_DEBUG_MODE,((DEBUG_MODE_TOGGLE-$1000000)).w
                move.b  #INITIAL_CONTROL_OPPONENT,((CONTROL_OPPONENT_TOGGLE-$1000000)).w
                move.b  #INITIAL_AUTO_BATTLE,((AUTO_BATTLE_TOGGLE-$1000000)).w
                move.b  #INITIAL_CONFIGURATION_MODE,((CONFIGURATION_MODE_TOGGLE-$1000000)).w
                setSavedByte #INITIAL_MESSAGE_SPEED, MESSAGE_SPEED
                setSavedByte #INITIAL_NO_BATTLE_MESSAGES, NO_BATTLE_MESSAGES_TOGGLE
            if (INITIAL_GAME_COMPLETED=1)
                bset    #7,(SAVE_FLAGS).l
            else
                bclr    #7,(SAVE_FLAGS).l
            endif
                rts

    ; End of function InitializeConfiguration


; =============== S U B R O U T I N E =======================================


CheatModeConfiguration:
                
                module
                
            if (TEST_BUILD=1)
                bsr.s   InitializeDebugModeConfigurationSettings
            else
                bsr.s   InitializeConfigurationSettings
            endif
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                beq.w   @return
                
                ; Start sound test if pressing Up and game completed flag is set
                btst    #INPUT_BIT_UP,((PLAYER_1_INPUT-$1000000)).w
            if (UNLOCK_SOUND_TEST=1)
                ; Skip checking the game completed flag
            else
                beq.s   @IsConfigurationModeOn
                btst    #7,(SAVE_FLAGS).l
            endif
                bne.w   SoundTest
@IsConfigurationModeOn:
                
            if (AUTO_CONFIGURATION_MODE=1)
                ; Skip checking toggle
            else
                tst.b   ((CONFIGURATION_MODE_TOGGLE-$1000000)).w
                beq.s   @return
            endif
                
            if (CONFIGURATION_SCREEN=1)
                ; Start configuration screen on special turbo selection
                moveq   #CONFIGURATION_SPECIAL_TURBO,d0
            else
                ; Start classic configuration sequence and return
                txt     448             ; "Configuration....{D3}"
                txt     450             ; "{CLEAR}Special Turbo"
                jsr     alt_YesNoPrompt
                tst.w   d0
                bne.s   @opponent
                
                move.b  #-1,((SPECIAL_TURBO_TOGGLE-$1000000)).w
@opponent       txt     451             ; "{CLEAR}Control Opponent"
                jsr     alt_YesNoPrompt
                tst.w   d0
                bne.s   @auto
                
                move.b  #-1,((CONTROL_OPPONENT_TOGGLE-$1000000)).w
@auto           txt     452             ; "{CLEAR}Auto Battle"
                jsr     alt_YesNoPrompt
                tst.w   d0
                bne.s   @completed
                
                move.b  #-1,((AUTO_BATTLE_TOGGLE-$1000000)).w
@completed      txt     455             ; "{CLEAR}Game Completed"
                jsr     alt_YesNoPrompt
                tst.w   d0
                bne.s   @clear
                
                bset    #7,(SAVE_FLAGS).l
                bra.s   @done
                
@clear          bclr    #7,(SAVE_FLAGS).l
@done           txt     461             ; "Configuration is done.{N}Go ahead!{W1}"
                rts
            endif
                


    ; End of function CheatModeConfiguration


; =============== S U B R O U T I N E =======================================

; In: d0.w = initial configuration menu index (-1 to use default)

battleBackground = -34
effectLevel = -32
effect = -30
action = -28
side = -26
actionType = -24
enemy = -22
ally = -20
lastEntry = -18
entryNamesAddress = -16
numberMax = -12
numberMin = -10
numberEntry = -8
windowSlot = -6
windowLayoutEndAddress = -4

ConfigurationScreen:
                
                movem.l d3-a3,-(sp)
                link    a2,#-34
                
                ; Initialize battlescene related variables
                moveq   #0,d1
                move.w  d1,ally(a2)
                move.w  d1,enemy(a2)
                move.w  d1,actionType(a2)
                move.w  d1,side(a2)
                move.w  d1,action(a2)
                move.w  d1,effect(a2)
                move.w  d1,battleBackground(a2)
                moveq   #1,d1
                move.w  d1,effectLevel(a2)
                
                txt     448             ; "Configuration....{D3}"
                tst.w   d0
                bpl.s   @continue
                
                moveq   #CONFIGURATION_DEFAULT_INITIAL_INDEX,d0
                bra.s   @continue
                
@start          move.w  lastEntry(a2),d0
@continue       moveq   #0,d1
                moveq   #CONFIGURATION_MAX_INDEX,d2
                moveq   #-1,d3          ; set update textbox content toggle
                getPointer p_table_ConfigurationNames, a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.s   @end            ; skip action if player pressed B
                
                ; Run action
                move.w  d0,lastEntry(a2)
                add.w   d0,d0
                move.w  rjt_ConfigurationActions(pc,d0.w),d0
                jsr     rjt_ConfigurationActions(pc,d0.w)
                bcc.s   @start          ; loop back to start unless End action
                
                ; End
@end            moveq   #CONFIGURATION_MESSAGE_END,d1 ; "Setup complete."
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                moveq   #0,d2           ; set return switch : Return
ConfigurationScreenEnd:
                
                clsTxt
                unlk    a2
                movem.l (sp)+,d3-a3
                
                tst.w   d2
                beq.s   @return
                
                addq.l  #4,sp                   ; drop current return address
                bmi.s   @battleTest
                
                ; Warp to selected map
                pea     (MainLoop).w            ; push new return address : Main loop
                jmp     ExplorationLoop
                
                ; Start test battle
@battleTest     pea     (alt_MainLoopEntry).w   ; push new return address : Main loop (from battle)
            if (FIX_AI_JARO_NOT_LEAVING_THE_FORCE=1)
                pea     ResetAiJaro
            endif
                jmp     BattleLoop
                
@return         rts

    ; End of function Configuration

                modend

; ---------------------------------------------------------------------------
rjt_ConfigurationActions:
                dc.w configurationAction_End-rjt_ConfigurationActions
                dc.w configurationAction_GameFlags-rjt_ConfigurationActions
                dc.w configurationAction_MapSelect-rjt_ConfigurationActions
                dc.w configurationAction_BattleTest-rjt_ConfigurationActions
                dc.w configurationAction_MenuSelect-rjt_ConfigurationActions
                dc.w configurationAction_PartySelect-rjt_ConfigurationActions
                dc.w configurationAction_LevelUp-rjt_ConfigurationActions
                dc.w configurationAction_NameCharacter-rjt_ConfigurationActions
                dc.w configurationAction_SpecialTurbo-rjt_ConfigurationActions
                dc.w configurationAction_DebugMode-rjt_ConfigurationActions
                dc.w configurationAction_ControlToggles-rjt_ConfigurationActions
                dc.w configurationAction_DifficultySelect-rjt_ConfigurationActions
                dc.w configurationAction_GameCompleted-rjt_ConfigurationActions
                dc.w configurationAction_GiveMoney-rjt_ConfigurationActions
                dc.w configurationAction_ActionTest-rjt_ConfigurationActions
                dc.w configurationAction_MessageTest-rjt_ConfigurationActions
                dc.w configurationAction_SoundTest-rjt_ConfigurationActions
                dc.w configurationAction_Reset-rjt_ConfigurationActions
                dc.w configurationAction_SavedData-rjt_ConfigurationActions
                
; ---------------------------------------------------------------------------
;
configurationAction_End:
                ori     #1,ccr ; set CCR carry-bit to complete setup
                rts


;
configurationAction_GameFlags:
                move.w  #600,d0
                jmp     DebugSetFlag


;
configurationAction_MapSelect:
                moveq   #CONFIGURATION_MESSAGE_MAP_SELECT,d1 ; "Which map?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                clr.w   d0
                getSavedByte CURRENT_MAP, d0
                bpl.s   @continue
                
                moveq   #MAP_GRANSEAL,d0 ; default to map 3
@continue       moveq   #0,d1
                moveq   #CONFIGURATION_MAP_SELECT_MAX_INDEX,d2
                moveq   #-1,d3          ; set update textbox content toggle
                getPointer p_table_MapNames, a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.s   @return         ; skip action if player pressed B
                
                setFlg  399             ; Set after first battle's cutscene OR first save? Checked at witch screens
                clr.w   d1
                jsr     (GetSavepointForMap).w
                moveq   #0,d4
                
                moveq   #1,d2           ; set return switch : Warp to selected map
                addq.l  #4,sp           ; drop current return address
                jmp     ConfigurationScreenEnd(pc)
                
@return         rts


;
configurationAction_BattleTest:
                moveq   #CONFIGURATION_MESSAGE_BATTLE_TEST_1,d1 ; "Which battle?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                clr.w   d0
                getSavedByte CURRENT_BATTLE, d0
                bpl.s   @continue
                
                moveq   #BATTLE_INSIDE_ANCIENT_TOWER,d0 ; default to battle 1 if not currently in battle
@continue       moveq   #0,d1
                moveq   #CONFIGURATION_BATTLE_TEST_MAX_INDEX,d2
                moveq   #-1,d3          ; set update textbox content toggle
                getPointer p_table_BattleNames, a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.s   @return         ; skip action if player pressed B
                
                move.w  d0,-(sp)
                moveq   #CONFIGURATION_MESSAGE_BATTLE_TEST_2,d1 ; "Play intro cutscene?"
                bsr.w   DisplayConfigurationMessage
                jsr     alt_YesNoPrompt
                movem.w (sp)+,d0
                bne.s   @noIntro
                
                ; Clear battle intro cutscene flag
                move.w  d0,d1
                addi.w  #BATTLE_INTRO_CUTSCENE_FLAGS_START,d1
                jsr     ClearFlag
                
                ; Clear follower flags
                moveq   #65,d1          ; Caravan is unlocked
                moveq   #18,d7
@loop           cmpi.w  #78,d1          ; Difficulty bit 0
                bne.s   @clear
                
                addq.w  #3,d1           ; Skip difficulty bits
@clear          jsr     ClearFlag
                dbf     d7,@loop
                
                bsr.w   ProcessBattleTestFollowers
                bra.s   @load
                
                ; Set battle intro cutscene flag
@noIntro        move.w  d0,d1
                addi.w  #BATTLE_INTRO_CUTSCENE_FLAGS_START,d1
                jsr     SetFlag
                
@load           move.w  d0,d1
                mulu.w  #BATTLEMAPCOORDINATES_ENTRY_SIZE_FULL,d0
                lea     table_BattleMapCoordinates,a0
                adda.w  d0,a0
                move.b  (a0)+,d0
                setSavedByte (a0)+, BATTLE_AREA_X
                setSavedByte (a0)+, BATTLE_AREA_Y
                setSavedByte (a0)+, BATTLE_AREA_WIDTH
                setSavedByte (a0)+, BATTLE_AREA_HEIGHT
                
                moveq   #-1,d2          ; set return switch : Start test battle
                addq.l  #4,sp           ; drop current return address
                jmp     ConfigurationScreenEnd(pc)
                
@return         rts


configurationAction_MenuSelect:
                moveq   #CONFIGURATION_MESSAGE_MENU_SELECT,d1 ; "Which menu?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                moveq   #0,d5           ; default to field menu
@start          move.w  d5,d0
                moveq   #0,d1
                moveq   #CONFIGURATION_MENU_SELECT_MAX_INDEX,d2
                moveq   #-1,d3          ; set update textbox content toggle
                getPointer p_table_MenuNames, a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d5
                bmi.s   @return         ; skip action if player pressed B
                
                clsTxt
                move.w  d5,d1
                add.w   d1,d1
                pea     @start(pc)
                jmp     @bt_MenuSelect(pc,d1.w)
                
@bt_MenuSelect  bra.s   @Field
                bra.s   @Church
                bra.s   @Shop
                bra.s   @Caravan
                
@Field          jmp     FieldMenu
@Church         jmp     ChurchMenu
@Shop           moveq   #CONFIGURATION_MESSAGE_SHOP_SELECT,d1 ; "Which shop?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                moveq   #SHOP_DEBUG,d0  ; default to shop 30
@startShop      moveq   #0,d1
                moveq   #CONFIGURATION_SHOP_SELECT_MAX_INDEX,d2
                moveq   #-1,d3          ; set update textbox content toggle
                getPointer p_table_ShopNames, a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.s   @return         ; skip action if player pressed B
                
                move.b  d0,((CURRENT_SHOP_INDEX-$1000000)).w
                pea     @startShop(pc)
                jmp     ShopMenu
@Caravan        jmp     CaravanMenu
                
@return         rts


;
configurationAction_PartySelect:
                moveq   #0,d0           ; default to recruit action
                moveq   #0,d1
                moveq   #1,d2
                moveq   #-1,d3          ; set update textbox content toggle
                getPointer p_table_PartySelectNames, a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.w   @return         ; skip action if player pressed B
                bgt.s   @dismiss
                
                ; Recruit
                moveq   #CONFIGURATION_MESSAGE_PARTY_SELECT_1,d1 ; "Recruit which character?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
@recruitStart   bsr.w   PopulateGenericListWithNonForceMembers
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                bne.s   @recruitMenu
                
                moveq   #CONFIGURATION_MESSAGE_PARTY_SELECT_2,d1 ; "All characters have joined!"
                bsr.w   DisplayConfigurationMessage
                bra.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
@recruitMenu    jsr     ExecuteMembersListScreenOnMainSummaryPage
                tst.w   d0
                bmi.s   @return
                
                pea     @recruitStart
                lea     JoinForce,a1
                bra.s   @checkStart
                
                ; Dismiss
@dismiss        moveq   #CONFIGURATION_MESSAGE_PARTY_SELECT_3,d1 ; "Dismiss which character?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
@dismissStart   jsr     PopulateGenericListWithCurrentForceMembers
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                bne.s   @dismissMenu
                
                moveq   #CONFIGURATION_MESSAGE_PARTY_SELECT_4,d1 ; "All characters have left!"
                bsr.w   DisplayConfigurationMessage
                bra.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
@dismissMenu    jsr     ExecuteMembersListScreenOnMainSummaryPage
                tst.w   d0
                bmi.s   @return
                bne.s   @continue
                
                moveq   #CONFIGURATION_MESSAGE_PARTY_SELECT_5,d1 ; "You can't dismiss yourself!"
                bsr.w   DisplayConfigurationMessage
                bra.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
@continue       pea     @dismissStart
                lea     LeaveForce,a1
                
                ; In: d0.w = ally index
@checkStart     clr.w   d7
                btst    #INPUT_BIT_START,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @loopSkip
                
                move.w  ((GENERIC_LIST_LENGTH-$1000000)).w,d7 ; recruit or dismiss all eligible characters if Start is being held
                lea     ((GENERIC_LIST-$1000000)).w,a0
                bra.s   @loopStart
                
@loop           move.b  (a0)+,d0
                tst.b   d0
                beq.s   @loopStart      ; do not dismiss the player character
                
@loopSkip       jsr     (a1)
@loopStart      dbf     d7,@loop
                
@return         rts


;
configurationAction_LevelUp:
                moveq   #CONFIGURATION_MESSAGE_LEVEL_UP_1,d1 ; "Level up which character?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                jsr     PopulateGenericListWithCurrentForceMembers
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                beq.s   @return
                
@start          jsr     ExecuteMembersListScreenOnMainSummaryPage
                move.w  d0,d5           ; save character index
                bmi.s   @return
                
                ; Enter new effective level
                moveq   #CONFIGURATION_MESSAGE_LEVEL_UP_2,d1 ; "Up to which level?"
                bsr.w   DisplayConfigurationMessage
                
                ; Determine effective level cap for class type
                move.w  #(CHAR_LEVELCAP_PROMOTED+CHAR_CLASS_EXTRALEVEL),d2
                jsr     GetClassType
                bne.s   @checkLevelCap
                
                moveq   #CHAR_LEVELCAP_BASE,d2
@checkLevelCap  jsr     CalculateEffectiveLevel
                addq.w  #1,d1
                cmp.w   d2,d1
                bls.s   @continue
                
                moveq   #CONFIGURATION_MESSAGE_LEVEL_UP_3,d1 ; "Already at max level!"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                bra.s   @start
                
@continue       move.w  d1,d0
                clr.w   d3              ; clear update textbox content toggle
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d2
                bmi.s   @start          ; restart if player pressed B
                
                ; Increase level by current level - d2, then re-execute the members list screen
                move.w  d5,d0           ; restore character index
                clr.w   d6
                btst    #INPUT_BIT_START,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @levelOne
                
                move.w  ((GENERIC_LIST_LENGTH-$1000000)).w,d6 ; level up all recruited characters if Start is being held
                lea     ((GENERIC_LIST-$1000000)).w,a0
                bra.s   @levelAll
                
@outerLoop      move.b  (a0)+,d0
@levelOne       jsr     CalculateEffectiveLevel
                move.w  d2,d7
                sub.w   d1,d7
                bmi.s   @levelAll
                bra.s   @inner
                
@innerLoop      jsr     LevelUp
@inner          dbf     d7,@innerLoop
@levelAll       dbf     d6,@outerLoop
                bra.s   @start
                
@return         rts


;
configurationAction_NameCharacter:
                moveq   #CONFIGURATION_MESSAGE_NAME_CHARACTER,d1 ; "Name which character?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                jsr     PopulateGenericListWithCurrentForceMembers
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                beq.s   @return
                
@start          jsr     ExecuteMembersListScreenOnMainSummaryPage
                tst.w   d0
                bmi.s   @return
                
                clr.w   d7
                btst    #INPUT_BIT_START,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @nameOne
                
                move.w  ((GENERIC_LIST_LENGTH-$1000000)).w,d7 ; level up all recruited characters if Start is being held
                lea     ((GENERIC_LIST-$1000000)).w,a0
                bra.s   @nameAll
                
                ; Name character, then re-execute the members list screen
@nameLoop       move.b  (a0)+,d0
@nameOne        jsr     NameAlly
@nameAll        dbf     d7,@nameLoop
                
                bra.s   @start
@return         rts


;
configurationAction_SpecialTurbo:
                move.b  ((SPECIAL_TURBO_TOGGLE-$1000000)).w,d0
                bsr.w   DisplayCurrentToggleState
                clr.b   ((SPECIAL_TURBO_TOGGLE-$1000000)).w
                jsr     alt_YesNoPrompt
                bne.s   @return
                
                st      ((SPECIAL_TURBO_TOGGLE-$1000000)).w
@return         bra.w   CloseConfigurationNumberPromptWindow


;
configurationAction_DebugMode:
                move.b  ((DEBUG_MODE_TOGGLE-$1000000)).w,d0
                bsr.w   DisplayCurrentToggleState
                clr.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                jsr     alt_YesNoPrompt
                bne.s   @return
                
                st      ((DEBUG_MODE_TOGGLE-$1000000)).w
@return         bra.w   CloseConfigurationNumberPromptWindow


;
configurationAction_ControlToggles:
                moveq   #CONFIGURATION_MESSAGE_CONTROL_ENEMIES,d1 ; "Control Opponent"
                bsr.w   DisplayConfigurationMessage
                move.b  ((CONTROL_OPPONENT_TOGGLE-$1000000)).w,d0
                bsr.w   DisplayCurrentToggleState
                clr.b   ((CONTROL_OPPONENT_TOGGLE-$1000000)).w
                jsr     alt_YesNoPrompt
                bne.s   @auto
                
                st      ((CONTROL_OPPONENT_TOGGLE-$1000000)).w
@auto           bsr.w   CloseConfigurationNumberPromptWindow
                moveq   #CONFIGURATION_MESSAGE_AUTO_BATTLE,d1 ; "Auto Battle"
                bsr.w   DisplayConfigurationMessage
                move.b  ((AUTO_BATTLE_TOGGLE-$1000000)).w,d0
                bsr.w   DisplayCurrentToggleState
                clr.b   ((AUTO_BATTLE_TOGGLE-$1000000)).w
                jsr     alt_YesNoPrompt
                bne.s   @return
                
                st      ((AUTO_BATTLE_TOGGLE-$1000000)).w
@return         bra.w   CloseConfigurationNumberPromptWindow


;
configurationAction_DifficultySelect:
                moveq   #CONFIGURATION_MESSAGE_DIFFICULTY_SELECT,d1 ; "Which difficulty level?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                jsr     GetDifficulty
                move.w  d1,d0
                moveq   #0,d1
                moveq   #CONFIGURATION_DIFFICULTY_MAX_LEVEL,d2
                moveq   #-1,d3          ; set update textbox content toggle
                getPointer p_table_DifficultyNames, a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.s   @return         ; skip action if player pressed B
                
                ; Set difficulty level
                clrFlg  FLAG_INDEX_DIFFICULTY1
                clrFlg  FLAG_INDEX_DIFFICULTY2
                btst    #0,d0
                beq.s   @bit1
                
                setFlg  FLAG_INDEX_DIFFICULTY1
@bit1           btst    #1,d0
                beq.s   @return
                
                setFlg  FLAG_INDEX_DIFFICULTY2
@return         rts


;
configurationAction_GameCompleted:
                
                ; Display current game completed toggle state
                clr.w   d0
                move.b  (SAVE_FLAGS).l,d0
                lsr.b   #7,d0
                move.w  d0,numberEntry(a2)
                bsr.w   OpenConfigurationNumberPromptWindow
                
                bclr    #7,(SAVE_FLAGS).l
                jsr     alt_YesNoPrompt
                bmi.s   @return         ; clear toggle if player pressed B or choose No
                
                bset    #7,(SAVE_FLAGS).l
@return         rts


;
configurationAction_GiveMoney:
                
                ; Display current gold
                jsr     OpenGoldWindowInFieldMenu
                
                jsr     alt_YesNoPrompt
                bne.s   @return         ; skip if player pressed B or choose No
                
                move.l  #CONFIGURATION_GIVE_MONEY_AMOUNT,d1
                jsr     IncreaseGold
@return         jmp     CloseGoldWindowInFieldMenu


;
configurationAction_ActionTest:
                
                ; Get ally index
@ally           moveq   #CONFIGURATION_MESSAGE_ACTION_TEST_1,d1 ; "Which ally?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                move.w  ally(a2),d0
                moveq   #0,d1
                moveq   #CONFIGURATION_ALLY_MAX_INDEX,d2
                moveq   #-1,d3          ; set update textbox content toggle
                getPointer p_table_AllyNames, a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.w   @return         ; return to main menu if player pressed B
                
                ; Save ally index
                move.w  d0,ally(a2)
                
                ; Get enemy index
@enemy          moveq   #CONFIGURATION_MESSAGE_ACTION_TEST_2,d1 ; "Which enemy?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                move.w  enemy(a2),d0
                moveq   #0,d1
                moveq   #CONFIGURATION_ENEMY_MAX_INDEX,d2
                moveq   #-1,d3          ; set update textbox content toggle
                getPointer p_table_EnemyNames, a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.s   @ally           ; back to get ally if player pressed B
                
                ; Save enemy index
                move.w  d0,enemy(a2)
                
                ; Get action type
@actionType     moveq   #CONFIGURATION_MESSAGE_ACTION_TEST_3,d1 ; "Which action type?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                move.w  actionType(a2),d0
                moveq   #0,d1
                moveq   #CONFIGURATION_ACTION_TYPE_MAX_INDEX,d2
                moveq   #-1,d3          ; set update textbox content toggle
                getPointer p_table_ActionTypeNames, a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.s   @enemy           ; back to get enemy if player pressed B
                
                ; Save actionType
                move.w  d0,actionType(a2)
                
                ; Ally or enemy actor?
@side           moveq   #CONFIGURATION_MESSAGE_ACTION_TEST_4,d1 ; "From which side?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                move.w  side(a2),d0
                moveq   #0,d1
                moveq   #1,d2
                moveq   #-1,d3          ; set update textbox content toggle
                getPointer p_table_SideNames, a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.s   @actionType     ; back to get enemy if player pressed B
                
                ; Save side
                move.w  #CONFIGURATION_ALLYBATTLEANIMATION_MAX_INDEX,d2
                move.w  d0,side(a2)
                beq.s   @action
                
                move.w  #CONFIGURATION_ENEMYBATTLEANIMATION_MAX_INDEX,d2
                
                ; Get action (i.e., battlesprite animation index)
@action         moveq   #CONFIGURATION_MESSAGE_ACTION_TEST_5,d1 ; "Which animation number?"
                bsr.w   DisplayConfigurationMessage
                
                ; Calculate initial value
                tst.w   side(a2)
                bne.s   @enemyActor
                
                ; Ally actor
                move.w  ally(a2),d0
                tst.w   actionType(a2) ; attack?
                beq.s   @continue
                
                cmpi.w  #1,actionType(a2) ; dodge?
                bne.s   @allySpecial
                
                addi.w  #ALLYBATTLEANIMATION_DODGES_START,d0
                bra.s   @continue
                
@allySpecial    move.w  #ALLYBATTLEANIMATION_SPECIALS_START,d0
                bra.s   @continue
                
                ; Enemy actor
@enemyActor     move.w  enemy(a2),d0
                tst.w   actionType(a2) ; attack?
                beq.s   @continue
                
                cmpi.w  #1,actionType(a2) ; dodge?
                bne.s   @enemySpecial
                
                addi.w  #ENEMYBATTLEANIMATION_DODGES_START,d0
                bra.s   @continue
                
@enemySpecial   move.w  #ENEMYBATTLEANIMATION_SPECIALS_START,d0
@continue       moveq   #0,d1
                clr.w   d3              ; clear update textbox content toggle
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.w   @side           ; back to get side if player pressed B
                
                ; Save action
                move.w  d0,action(a2)
                
                ; Get effect (i.e., spell animation index)
@effect         moveq   #CONFIGURATION_MESSAGE_ACTION_TEST_6,d1 ; "Which effect?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                move.w  effect(a2),d0
                moveq   #0,d1
                moveq   #CONFIGURATION_SPELLANIMATION_MAX_INDEX,d2
                moveq   #-1,d3          ; set update textbox content toggle
                getPointer p_table_EffectNames, a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.w   @side           ; back to get side if player pressed B
                
                ; Save effect
                move.w  d0,effect(a2)
                
                ; Get effect level (i.e., spell animation variation)
@effectLevel    moveq   #CONFIGURATION_MESSAGE_ACTION_TEST_7,d1 ; "Which level?"
                bsr.w   DisplayConfigurationMessage
                
                move.w  effectLevel(a2),d0
                moveq   #1,d1
                moveq   #SPELLENTRY_LEVELS_NUMBER,d2
                clr.w   d3              ; clear update textbox content toggle
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.s   @effect         ; back to get effect if player pressed B
                
                ; Save effect level
                move.w  d0,effectLevel(a2)
                
                ; Get background
@background     moveq   #CONFIGURATION_MESSAGE_ACTION_TEST_8,d1 ; "Which background?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                move.w  battleBackground(a2),d0
                moveq   #1,d1
                moveq   #SPELLENTRY_LEVELS_NUMBER,d2
                moveq   #-1,d3          ; set update textbox content toggle
                getPointer p_table_BackgroundNames, a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.s   @effectLevel    ; back to get effect level if player pressed B
                
                ; Save background
                move.w  d0,battleBackground(a2)
                
                ; Perform Battlescene
                bsr.w   WriteActionTestScript
                bsr.w   InitializeActionTest
                
@scriptLoop     jsr     ExecuteBattlesceneScript
                btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @scriptLoop
                
@return         rts


;
configurationAction_MessageTest:
                moveq   #CONFIGURATION_MESSAGE_MESSAGE_TEST,d1 ; "Which message number?"
                bsr.w   DisplayConfigurationMessage

@start          move.w  ((DEBUG_MODE_CURRENT_MESSAGE-$1000000)).w,d0
                cmpi.w  #MESSAGES_MAX_INDEX,d0
                bls.s   @continue
                
                move.w  #MESSAGES_MAX_INDEX,d0
@continue       moveq   #0,d1
                move.w  #MESSAGES_MAX_INDEX,d2
                clr.w   d3              ; clear update textbox content toggle
                bsr.w   ExecuteConfigurationNumberPrompt
                clsTxt
                move.w  numberEntry(a2),d0
                bmi.s   @return
                
                move.w  d0,((DEBUG_MODE_CURRENT_MESSAGE-$1000000)).w
                pea     @start(pc)
                jmp     (DisplayText).w
@return         rts


;
configurationAction_SoundTest:
                jmp     SoundTest


;
configurationAction_Reset:
                moveq   #CONFIGURATION_MESSAGE_RESET,d1 ; "Reset the game?"
                bsr.w   DisplayConfigurationMessage
                jsr     alt_YesNoPrompt
                bne.s   @return         ; skip if player pressed B or choose No
                
                jmp     (ResetGame).w
@return         rts


;
configurationAction_SavedData:
                moveq   #0,d0           ; default to save action
                moveq   #0,d1
                moveq   #1,d2
                moveq   #-1,d3          ; set update textbox content toggle
                getPointer p_table_SavedDataNames, a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.s   @return         ; skip action if player pressed B
                bgt.s   @load
                
                ; Save
                moveq   #CONFIGURATION_MESSAGE_SAVE,d1 ; "Save to which file?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                lea     (SaveGame).w,a3
                bra.s   @continue
                
                ; Load
@load           moveq   #CONFIGURATION_MESSAGE_LOAD,d1 ; "Load from which file?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                lea     (LoadGame).w,a3
                
@continue       clr.w   d0
                getCurrentSaveSlot d0
                moveq   #0,d1
                moveq   #1,d2
                clr.w   d3              ; clear update textbox content toggle
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a2),d0
                bmi.s   @return         ; skip action if player pressed B
                
                setCurrentSaveSlot d0
                jsr     (a3)
                moveq   #CONFIGURATION_MESSAGE_DONE,d1 ; "Done!"
                bsr.w   DisplayConfigurationMessage
                bra.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
@return         rts


; =============== S U B R O U T I N E =======================================


; In: d0.b
;
DisplayCurrentToggleState:
                andi.w  #1,d0
                move.w  d0,numberEntry(a2)
                bra.s   OpenConfigurationNumberPromptWindow


; In: a0 = names table address, d0.w  = initial value, d1.w = min value, d2.w = max value, d3.w = update text toggle
;
ExecuteConfigurationNumberPrompt:
                move.w  d0,numberEntry(a2)
                move.w  d1,numberMin(a2)
                move.w  d2,numberMax(a2)
                move.l  a0,entryNamesAddress(a2)
                
                pea     CloseConfigurationNumberPromptWindow(pc)
                pea     ProcessConfigurationNumberPromptInput(pc)
                pea     DisplayConfigurationEntryName(pc)
                
                ; continue into next routine


;
OpenConfigurationNumberPromptWindow:
                
                ; Create number prompt window
                move.w  #CONFIGURATION_NUMBER_PROMPT_SIZE,d0
                move.w  #CONFIGURATION_NUMBER_PROMPT_ORIGIN,d1
                jsr     (CreateWindow).w
                move.w  d0,windowSlot(a2)
                move.l  a1,windowLayoutEndAddress(a2)
                
                ; Build content and move to position
                bsr.w   WriteConfigurationNumberPromptDigits
                move.w  windowSlot(a2),d0
                move.w  #CONFIGURATION_NUMBER_PROMPT_DESTINATION,d1
                moveq   #CONFIGURATION_NUMBER_PROMPT_ANIMATION_LENGTH,d2
                jsr     (MoveWindowWithSfx).w
                jmp     (WaitForWindowMovementEnd).w


;
CloseConfigurationNumberPromptWindow:
                
                ; Remove, then delete window
                move.w  windowSlot(a2),d0
                move.w  #CONFIGURATION_NUMBER_PROMPT_ORIGIN,d1
                moveq   #CONFIGURATION_NUMBER_PROMPT_ANIMATION_LENGTH,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  windowSlot(a2),d0
                jmp     (DeleteWindow).w


; In: d2.w = update textbox message toggle
;
ProcessConfigurationNumberPromptInput:
                
                ; Check player input
@right          btst    #INPUT_BIT_RIGHT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @left
                moveq   #1,d4           ; add 1
                bsr.w   UpdateConfigurationPromptNumber
                
@left           btst    #INPUT_BIT_LEFT,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @down
                moveq   #-1,d4          ; subtract 1
                bsr.w   UpdateConfigurationPromptNumber
                
@down           btst    #INPUT_BIT_DOWN,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @up
                moveq   #10,d4          ; add 10
                bsr.w   UpdateConfigurationPromptNumber
                
@up             btst    #INPUT_BIT_UP,((CURRENT_PLAYER_INPUT-$1000000)).w
                beq.s   @otherInputs
                moveq   #-10,d4         ; subtract 10
                bsr.s   UpdateConfigurationPromptNumber
                
@otherInputs    btst    #INPUT_BIT_B,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.s   @default
                btst    #INPUT_BIT_C,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.s   @return
                btst    #INPUT_BIT_A,((CURRENT_PLAYER_INPUT-$1000000)).w
                bne.s   @return
                
                ; Update RNG seed every frame while checking player input
                movem.l d6-d7,-(sp)
                move.w  #256,d6
                jsr     (GenerateRandomNumber).w
                movem.l (sp)+,d6-d7
                
                pea     ProcessConfigurationNumberPromptInput(pc)
                jmp     (WaitForVInt).w
                
@default        move.w  #-1,numberEntry(a2)
@return         rts


; In: a6 = configuration screen stack
;
WriteConfigurationNumberPromptDigits:
                
                ; Digits
                movea.l windowLayoutEndAddress(a2),a1
                move.w  #CONFIGURATION_NUMBER_PROMPT_SIZE,d0
                jsr     alt_WriteWindowTiles
                movea.l windowLayoutEndAddress(a2),a1
                adda.w  #CONFIGURATION_NUMBER_PROMPT_DIGITS_OFFSET,a1
                move.w  numberEntry(a2),d0
                ext.l   d0
                moveq   #-14,d1
                moveq   #CONFIGURATION_NUMBER_PROMPT_DIGITS_NUMBER,d7
                jmp     WriteTilesFromNumber


; In: a6 = configuration screen stack, d3.w = update text toggle, d4.w = increment amount
;
UpdateConfigurationPromptNumber:
                
                move.w  numberEntry(a2),d0
                add.w   d4,d0
                
                cmp.w   numberMax(a2),d0
                ble.s   @maxSkip
                
@max            move.w  numberMax(a2),d0    ; cap to max, unless already at max, then roll back to min
                cmp.w   numberEntry(a2),d0
                beq.s   @min
                
@maxSkip        cmp.w   numberMin(a2),d0
                bge.s   @minSkip
                
@min            move.w  numberMin(a2),d0    ; cap to min, unless already at min, then roll back to max
                cmp.w   numberEntry(a2),d0
                bne.s   @minSkip
                
                move.w  numberMax(a2),d0
@minSkip        move.w  d0,numberEntry(a2)
                sndCom  SFX_MENU_SELECTION
                
                ; Update window content
                bsr.w   WriteConfigurationNumberPromptDigits
                move.w  windowSlot(a2),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                
                ; Update textbox message


; In: a0 = names table pointer
;
DisplayConfigurationEntryName:
                
                tst.w   d3
                bpl.s   @return
                
                move.w  numberEntry(a2),d1
                movea.l entryNamesAddress(a2),a0
                jmp     (DisplayUncompressedText).w
                
@return         rts


; In: d1.w = message index
;
DisplayConfigurationMessage:
                
                getPointer p_table_ConfigurationMessages, a0
                jmp     (DisplayUncompressedText).w


;
DelayUntilPlayerInput:
                
                moveq   #119,d0 ; same duration as text delay 3
@delayLoop      move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d1
                andi.b  #INPUT_UP|INPUT_DOWN|INPUT_LEFT|INPUT_RIGHT|INPUT_B|INPUT_C|INPUT_A,d1
                bne.s   @return
                
                jsr     (WaitForVInt).w
                dbf     d0,@delayLoop
                
@return         rts


;
PopulateGenericListWithNonForceMembers:
                
                movem.l d0-d2/d7-a0,-(sp)
                lea     ((GENERIC_LIST-$1000000)).w,a0
                moveq   #0,d2       ; list length
                moveq   #0,d0       ; first member
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                
@loop           move.w  d0,d1
                addi.w  #FORCEMEMBER_JOINED_FLAGS_START,d1
                jsr     CheckFlag
                bne.s   @nextMember ; skip if character has already joined
                
                move.b  d0,(a0)+
                addq.w  #1,d2
@nextMember     addq.b  #1,d0
                dbf     d7,@loop
                
                move.w  d2,((GENERIC_LIST_LENGTH-$1000000)).w
                movem.l (sp)+,d0-d2/d7-a0
                rts


; =============== S U B R O U T I N E =======================================


WriteActionTestScript:
                
                movem.l d0-a6,-(sp)
                lea     (FF0000_RAM_START).l,a6 ; beginning of battlescene command list
                
                ; Get battlescene test actor and target
                moveq   #1,d0
                move.w  d0,((TARGETS_LIST_LENGTH-$1000000)).w
                
                move.w  #COMBATANT_ENEMY_INDEX_20,d0
                move.w  ally(a2),d1
                
                tst.w   side(a2)
                bne.s   @enemyActor
                
                exg     d0,d1
@enemyActor     move.b  d0,((BATTLESCENE_ACTOR-$1000000)).w
                move.b  d0,((BATTLESCENE_ACTOR_COPY-$1000000)).w
                move.b  d1,((TARGETS_LIST-$1000000)).w
                
                jsr     LoadBattlesceneMusicIndex
                move.w  actionType(a2),d5
                move.w  effect(a2),d4
                move.w  effectLevel(a2),d0
                lsl.w   #5,d0
                or.w    d0,d4
                
                bscWaitForPlayerInput
                tst.w   side(a2)
                bne.s   @animateEnemy
                
                animateAllyAction d5,d4
                bra.s   @continue
                
@animateEnemy   ori.w   #$80,d4         ; mirror spellanimation
                animateEnemyAction d5,d4
@continue       makeActorIdleAndEndAnimation
                bscWaitForPlayerInput
                bscEnd
                movem.l (sp)+,d0-a6
                rts
                
    ; End of function WriteActionTestScript


; =============== S U B R O U T I N E =======================================

; In: d0 = combatant index, d1 = enemy index


InitializeActionTestEnemyStats:
                
                movem.l d0-a1,-(sp)
                move.w  d1,d6           ; d1.w, d6.w = enemy index
                mulu.w  #ENEMYDEF_ENTRY_SIZE,d1
                getPointer p_table_EnemyDefinitions, a1
                adda.w  d1,a1
                
                jsr     GetCombatantEntryAddress
                moveq   #ENEMYDEF_LONGWORDS_COUNTER,d7
                
@Loop:          move.l  (a1)+,d1
                setSavedLongWithPostIncrement d1, a0
                dbf     d7,@Loop
                
                jsr     GetMaxHp
                jsr     SetCurrentHp
                jsr     GetMaxMp
                jsr     SetCurrentMp
                
                moveq   #-1,d1
                jsr     SetCombatantX
                jsr     SetCombatantY
                
                move.b  d6,d1
                jsr     SetEnemyIndex
                jsr     AdjustEnemyBaseAttForDifficulty
                jsr     UpdateCombatantStats
                movem.l (sp)+,d0-a1
                rts

    ; End of function InitializeActionTestEnemyStats


; =============== S U B R O U T I N E =======================================


InitializeActionTest:
                
                move.l  a2,-(sp)
                jsr     FadeOutToBlackForBattlescene
                sndCom  SOUND_COMMAND_FADE_OUT
                
                move.w  #COMBATANT_ENEMY_INDEX_20,d0
                move.w  enemy(a2),d1
                bsr.s   InitializeActionTestEnemyStats
                
                ; Clear battlescene data table in RAM
                lea     ((BATTLESCENE_GROUND_MODIFICATION_POINTER-$1000000)).w,a0
                move.l  #((BATTLESCENE_DATA_END-BATTLESCENE_GROUND_MODIFICATION_POINTER)/4)-1,d2 ; battle scene data longwords counter
                
@ClearBattlesceneData_Loop:
                
                clr.l   (a0)+
                dbf     d2,@ClearBattlesceneData_Loop
                
                ; Get enemy graphics information
                jsr     GetEnemyGraphicsInformation
                
                ; Get ally graphics information
                move.w  ally(a2),d0
                jsr     GetAllyGraphicsInformation
                
                ; Get ground platform for ally
                st      ((BATTLESCENE_GROUND-$1000000)).w
                move.w  ((BATTLESCENE_ALLY-$1000000)).w,d0
                tst.b   d0
                bmi.s   @Skip
                
                ; Skip if ally is flying or hovering
                lea     table_AirborneMovetypes,a0
                jsr     GetMoveType
                moveq   #0,d2           ; zero property bytes
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcc.s   @Skip
                
                move.w  battleBackground(a2),((BATTLESCENE_GROUND-$1000000)).w
                
                ; Get background
@Skip:          move.w  battleBackground(a2),d1
                jsr     alt_InitializeBattlescene
                movea.l (sp)+,a2
                rts

    ; End of function InitializeActionTest


; =============== S U B R O U T I N E =======================================

; In: d0.w = battle index

ProcessBattleTestFollowers:
                
                move.w  d0,d7
@loop           moveq   #BATTLES_MAX_INDEX,d1
                sub.w   d7,d1
                add.w   d1,d1
                move.w  rjt_BattleTestFollowers(pc,d1.w),d1
                jsr     rjt_BattleTestFollowers(pc,d1.w)
                dbf     d7,@loop
                
                rts
                
rjt_BattleTestFollowers:
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers01-rjt_BattleTestFollowers
                dc.w battleTestFollowers02-rjt_BattleTestFollowers
                dc.w battleTestFollowers03-rjt_BattleTestFollowers
                dc.w battleTestFollowers04-rjt_BattleTestFollowers
                dc.w battleTestFollowers05-rjt_BattleTestFollowers
                dc.w battleTestFollowers06-rjt_BattleTestFollowers
                dc.w battleTestFollowers07-rjt_BattleTestFollowers
                dc.w battleTestFollowers08-rjt_BattleTestFollowers
                dc.w battleTestFollowers09-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers14-rjt_BattleTestFollowers
                dc.w battleTestFollowers15-rjt_BattleTestFollowers
                dc.w battleTestFollowers16-rjt_BattleTestFollowers
                dc.w battleTestFollowers17-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers19-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers24-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers30-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers34-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers37-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers39-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers
                dc.w battleTestFollowers00-rjt_BattleTestFollowers

battleTestFollowers00:
                rts
                
battleTestFollowers01:
                setFlg  66 ; Sarah + Chester are followers
                rts
                
battleTestFollowers02:
                clrFlg  66 ; No followers
                rts
                
battleTestFollowers03:
                setFlg  72 ; Kazin is a follower
                rts
                
battleTestFollowers04:
                clrFlg  72 ; No followers
                rts
                
battleTestFollowers05:
                setFlg  73 ; Slade is a follower
                rts
                
battleTestFollowers06:
                clrFlg  73 ; No followers
                rts
                
battleTestFollowers07:
                setFlg  83 ; King + Minister are followers
                rts
                
battleTestFollowers08:
                clrFlg  83 ; No followers
                rts
                
battleTestFollowers09:
                setFlg  67 ; Peter is a follower
                rts
                
battleTestFollowers14:
                setFlg  68 ; Peter + Oddler are followers
                rts
                
battleTestFollowers15:
                setFlg  77 ; Peter + Oddler + Old man are followers
                rts
                
battleTestFollowers16:
                clrFlg  77 ; Peter + Oddler are followers
                rts
                
battleTestFollowers17:
                setFlg  84 ; Peter + Oddler + Rohde are followers
                rts
                
battleTestFollowers19:
                setFlg  65
                clrFlg  84 ; Caravan is unlocked and Peter + Oddler are followers
                rts
                
battleTestFollowers24:
                setFlg  70
                clrFlg  68 ; Caravan is unlocked and Peter + Astral are followers
                rts
                
battleTestFollowers30:
                setFlg  82 ; Caravan is unlocked and Peter + Astral + Frayja are followers
                rts
                
battleTestFollowers34:
                setFlg  76
                clrFlg  82 ; Caravan is unlocked and Peter + Astral + Zynk are followers
                rts
                
battleTestFollowers37:
                clrFlg  76 ; Caravan is unlocked and Peter + Astral are followers
                rts
                
battleTestFollowers39:
                setFlg  71 ; Caravan is unlocked and Peter + Astral + Lemon are followers
                rts
