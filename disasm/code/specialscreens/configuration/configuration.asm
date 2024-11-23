
; ASM FILE code\specialscreens\configuration\configuration.asm :
;

; enum Configuration
CONFIGURATION_INITIAL_INDEX: equ 1 ; Battle Select
CONFIGURATION_MAX_INDEX: equ 14
CONFIGURATION_BATTLE_SELECT_MAX_INDEX: equ BATTLES_MAX_INDEX
CONFIGURATION_DIFFICULTY_MAX_LEVEL: equ 3 ; 0 = normal, 1 = hard, 2 = super, 3 = ouch
CONFIGURATION_ALLY_MAX_INDEX: equ COMBATANT_ALLIES_NUMBER-1
CONFIGURATION_ENEMY_MAX_INDEX: equ COMBATANT_ENEMIES_NUMBER-1
CONFIGURATION_ACTION_TYPE_MAX_INDEX: equ 2
CONFIGURATION_ALLYBATTLEANIMATION_MAX_INDEX: equ 86
CONFIGURATION_ENEMYBATTLEANIMATION_MAX_INDEX: equ 120
CONFIGURATION_SPELLANIMATION_MAX_INDEX: equ 31
CONFIGURATION_GIVE_MONEY_AMOUNT: equ 500000
CONFIGURATION_NUMBER_PROMPT_SIZE: equ $703
CONFIGURATION_NUMBER_PROMPT_ORIGIN: equ $2001
CONFIGURATION_NUMBER_PROMPT_DESTINATION: equ $1801
CONFIGURATION_NUMBER_PROMPT_ANIMATION_LENGTH: equ 4
CONFIGURATION_NUMBER_PROMPT_DIGITS_OFFSET: equ 16
CONFIGURATION_NUMBER_PROMPT_DIGITS_NUMBER: equ 5


; enum ConfigurationMessages
                rsreset
CONFIGURATION_MESSAGE_END: rs.b 1
CONFIGURATION_MESSAGE_BATTLE_SELECT: rs.b 1
CONFIGURATION_MESSAGE_SPECIAL_TURBO: rs.b 1
CONFIGURATION_MESSAGE_TEST_MODE: rs.b 1
CONFIGURATION_MESSAGE_CHARACTER_SELECT_1: rs.b 1
CONFIGURATION_MESSAGE_CHARACTER_SELECT_2: rs.b 1
CONFIGURATION_MESSAGE_LEVEL_SELECT: rs.b 1
CONFIGURATION_MESSAGE_CONTROL_ENEMIES: rs.b 1
CONFIGURATION_MESSAGE_AUTO_BATTLE: rs.b 1
CONFIGURATION_MESSAGE_DIFFICULTY_SELECT: rs.b 1
CONFIGURATION_MESSAGE_GAME_COMPLETED: rs.b 1
CONFIGURATION_MESSAGE_GIVE_MONEY: rs.b 1
CONFIGURATION_MESSAGE_ACTION_TEST_1: rs.b 1
CONFIGURATION_MESSAGE_ACTION_TEST_2: rs.b 1
CONFIGURATION_MESSAGE_ACTION_TEST_3: rs.b 1
CONFIGURATION_MESSAGE_ACTION_TEST_4: rs.b 1
CONFIGURATION_MESSAGE_ACTION_TEST_5: rs.b 1
CONFIGURATION_MESSAGE_EFFECT_TEST_1: rs.b 1
CONFIGURATION_MESSAGE_EFFECT_TEST_2: rs.b 1
CONFIGURATION_MESSAGE_SOUND_TEST: rs.b 1
CONFIGURATION_MESSAGE_RESET: rs.b 1
CONFIGURATION_MESSAGE_SAVE: rs.b 1


; =============== S U B R O U T I N E =======================================

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

Configuration:
                
                movem.l d1-a1,-(sp)
                link    a6,#-32
                
                ; Initialize battlescene related variables
                moveq   #0,d0
                move.w  d0,ally(a6)
                move.w  d0,enemy(a6)
                move.w  d0,actionType(a6)
                move.w  d0,side(a6)
                move.w  d0,action(a6)
                move.w  d0,effect(a6)
                moveq   #1,d0
                move.w  d0,effectLevel(a6)
                
                txt     448             ; "Configuration....{D3}"
                moveq   #CONFIGURATION_INITIAL_INDEX,d0
                bra.s   @continue
                
@start          move.w  lastEntry(a6),d0
@continue       moveq   #0,d1
                moveq   #CONFIGURATION_MAX_INDEX,d2
                moveq   #-1,d3          ; set update textbox content toggle
                lea     table_ConfigurationNames(pc),a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a6),d0
                bmi.s   @end            ; skip action if player pressed B
                
                ; Run action
                move.w  d0,lastEntry(a6)
                add.w   d0,d0
                move.w  rjt_ConfigurationActions(pc,d0.w),d0
                jsr     rjt_ConfigurationActions(pc,d0.w)
                bcc.s   @start          ; loop back to start unless End action
                
                ; End
@end            moveq   #CONFIGURATION_MESSAGE_END,d1 ; "Setup complete."
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                clsTxt
                
                unlk    a6
                movem.l (sp)+,d1-a1
                rts

    ; End of function Configuration


; ---------------------------------------------------------------------------
rjt_ConfigurationActions:
                dc.w configurationAction_End-rjt_ConfigurationActions
                dc.w configurationAction_BattleSelect-rjt_ConfigurationActions
                dc.w configurationAction_SpecialTurbo-rjt_ConfigurationActions
                dc.w configurationAction_TestMode-rjt_ConfigurationActions
                dc.w configurationAction_PartySelect-rjt_ConfigurationActions
                dc.w configurationAction_LevelSelect-rjt_ConfigurationActions
                dc.w configurationAction_ControlToggles-rjt_ConfigurationActions
                dc.w configurationAction_DifficultySelect-rjt_ConfigurationActions
                dc.w configurationAction_GameCompleted-rjt_ConfigurationActions
                dc.w configurationAction_GiveMoney-rjt_ConfigurationActions
                dc.w configurationAction_ActionTest-rjt_ConfigurationActions
                dc.w configurationAction_EffectTest-rjt_ConfigurationActions
                dc.w configurationAction_SoundTest-rjt_ConfigurationActions
                dc.w configurationAction_Reset-rjt_ConfigurationActions
                dc.w configurationAction_Save-rjt_ConfigurationActions
                
; ---------------------------------------------------------------------------


;
configurationAction_End:
                ori     #1,ccr ; set CCR carry-bit to complete setup
                rts


;
configurationAction_BattleSelect:
                moveq   #CONFIGURATION_MESSAGE_BATTLE_SELECT,d1 ; "Which battle number?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                clr.w   d0
                getSavedByte CURRENT_BATTLE, d0
                bpl.s   @continue
                
                moveq   #1,d0           ; default to battle 1 if not currently in battle
@continue       moveq   #1,d1
                moveq   #CONFIGURATION_BATTLE_SELECT_MAX_INDEX,d2
                moveq   #-1,d3          ; set update textbox content toggle
                lea     table_BattleNames(pc),a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a6),d0
                bmi.s   @return         ; skip action if player pressed B
                
                setSavedByte d0, CURRENT_BATTLE
@return         rts


;
configurationAction_SpecialTurbo:
                move.b  ((SPECIAL_TURBO_TOGGLE-$1000000)).w,d0
                bsr.w   DisplayCurrentToggleState
                clr.b   ((SPECIAL_TURBO_TOGGLE-$1000000)).w
                jsr     alt_YesNoPrompt
                bne.s   @return
                
                st      ((SPECIAL_TURBO_TOGGLE-$1000000)).w
@return         rts


;
configurationAction_TestMode:
                move.b  ((DEBUG_MODE_TOGGLE-$1000000)).w,d0
                bsr.w   DisplayCurrentToggleState
                clr.b   ((DEBUG_MODE_TOGGLE-$1000000)).w
                jsr     alt_YesNoPrompt
                bne.s   @return
                
                st      ((DEBUG_MODE_TOGGLE-$1000000)).w
@return         rts


;
configurationAction_PartySelect:
                moveq   #CONFIGURATION_MESSAGE_CHARACTER_SELECT_1,d1 ; "Recruit which character?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
@start          bsr.w   PopulateGenericListWithNonForceMembers
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                bne.s   @continue
                
                moveq   #CONFIGURATION_MESSAGE_CHARACTER_SELECT_2,d1 ; "All characters have joined!"
                bsr.w   DisplayConfigurationMessage
                bra.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
@continue       jsr     ExecuteMembersListScreenOnMainSummaryPage
                tst.w   d0
                bmi.s   @return
                
                ; Recruit character, then check whether battle party is full
                jsr     JoinForce
                moveq   #1,d1               ; battle party members
                jsr     PopulateGenericListWithMembersList
                bhs.s   @start
                
                pea     @start(pc)
                jmp     JoinBattleParty
                
@return         rts


;
configurationAction_LevelSelect:
                moveq   #CONFIGURATION_MESSAGE_LEVEL_SELECT,d1 ; "Level up which character?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                jsr     PopulateGenericListWithCurrentForceMembers
                tst.w   ((GENERIC_LIST_LENGTH-$1000000)).w
                beq.s   @return
                
@start          jsr     ExecuteMembersListScreenOnMainSummaryPage
                tst.w   d0
                bmi.s   @return
                
                ; Set character's experience to 0 and increase level by 1, then re-execute the members list screen
                moveq   #0,d1
                pea     @start(pc)
                pea     LevelUp
                jmp     SetCurrentExp
                
@return         rts


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
                lea     table_DifficultyNames(pc),a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a6),d0
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
                move.w  d0,numberEntry(a6)
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
                
                move.w  ally(a6),d0
                moveq   #0,d1
                moveq   #CONFIGURATION_ALLY_MAX_INDEX,d2
                moveq   #-1,d3          ; set update textbox content toggle
                lea     table_AllyNames,a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a6),d0
                bmi.w   @return         ; return to main menu if player pressed B
                
                ; Save ally index
                move.w  d0,ally(a6)
                
                ; Get enemy index
@enemy          moveq   #CONFIGURATION_MESSAGE_ACTION_TEST_2,d1 ; "Which enemy?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                move.w  enemy(a6),d0
                moveq   #0,d1
                moveq   #CONFIGURATION_ENEMY_MAX_INDEX,d2
                moveq   #-1,d3          ; set update textbox content toggle
                lea     table_EnemyNames,a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a6),d0
                bmi.s   @ally           ; back to get ally if player pressed B
                
                ; Save enemy index
                move.w  d0,enemy(a6)
                
                ; Get action type
@actionType     moveq   #CONFIGURATION_MESSAGE_ACTION_TEST_3,d1 ; "Which action type?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                move.w  actionType(a6),d0
                moveq   #0,d1
                moveq   #CONFIGURATION_ACTION_TYPE_MAX_INDEX,d2
                moveq   #-1,d3          ; set update textbox content toggle
                lea     table_ActionTypeNames(pc),a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a6),d0
                bmi.s   @enemy           ; back to get ally if player pressed B
                
                ; Save actionType
                move.w  d0,actionType(a6)
                
                ; Ally or enemy actor?
@side           moveq   #CONFIGURATION_MESSAGE_ACTION_TEST_4,d1 ; "From which side?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                move.w  side(a6),d0
                moveq   #0,d1
                moveq   #1,d2
                moveq   #-1,d3          ; set update textbox content toggle
                lea     table_SideNames(pc),a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a6),d0
                bmi.s   @actionType     ; back to get enemy if player pressed B
                
                ; Save side
                move.w  #CONFIGURATION_ALLYBATTLEANIMATION_MAX_INDEX,d2
                move.w  d0,side(a6)
                beq.s   @action
                
                move.w  #CONFIGURATION_ENEMYBATTLEANIMATION_MAX_INDEX,d2
                
                ; Get action (i.e., battlesprite animation index)
@action         moveq   #CONFIGURATION_MESSAGE_ACTION_TEST_5,d1 ; "Which animation number?"
                bsr.w   DisplayConfigurationMessage
                
                ; Calculate initial value
                tst.w   side(a6)
                bne.s   @enemyActor
                
                ; Ally actor
                move.w  ally(a6),d0
                tst.w   actionType(a6) ; attack?
                beq.s   @continue
                
                cmpi.w  #1,actionType(a6) ; dodge?
                bne.s   @allySpecial
                
                addi.w  #ALLYBATTLEANIMATION_DODGES_START,d0
                bra.s   @continue
                
@allySpecial    move.w  #ALLYBATTLEANIMATION_SPECIALS_START,d0
                bra.s   @continue
                
                ; Enemy actor
@enemyActor     move.w  enemy(a6),d0
                tst.w   actionType(a6) ; attack?
                beq.s   @continue
                
                cmpi.w  #1,actionType(a6) ; dodge?
                bne.s   @enemySpecial
                
                addi.w  #ENEMYBATTLEANIMATION_DODGES_START,d0
                bra.s   @continue
                
@enemySpecial   move.w  #ENEMYBATTLEANIMATION_SPECIALS_START,d0
@continue       moveq   #0,d1
                clr.w   d3              ; clear update textbox content toggle
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a6),d0
                bmi.w   @side           ; back to get side if player pressed B
                
                ; Save action
                move.w  d0,action(a6)
                
                ; Initialize battlescene
                txt     1               ; "....{W1}"
@return         rts


;
configurationAction_EffectTest:
                
                ; Ally or enemy actor?
@side           moveq   #CONFIGURATION_MESSAGE_ACTION_TEST_4,d1 ; "From which side?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                move.w  side(a6),d0
                moveq   #0,d1
                moveq   #1,d2
                moveq   #-1,d3          ; set update textbox content toggle
                lea     table_SideNames(pc),a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a6),d0
                bmi.s   @return         ; return to main menu if player pressed B
                
                ; Save side
                move.w  d0,side(a6)
                
                ; Get effect (i.e., spell animation index)
@effect         moveq   #CONFIGURATION_MESSAGE_EFFECT_TEST_2,d1 ; "Which effect number?"
                bsr.w   DisplayConfigurationMessage
                bsr.w   DelayUntilPlayerInput ; Delay for approximately 2 seconds or until player input
                
                move.w  effect(a6),d0
                moveq   #0,d1
                moveq   #CONFIGURATION_SPELLANIMATION_MAX_INDEX,d2
                moveq   #-1,d3          ; set update textbox content toggle
                lea     table_EffectNames(pc),a0
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a6),d0
                bmi.s   @side           ; back to get side if player pressed B
                
                ; Save effect
                move.w  d0,effect(a6)
                
                ; Get effect level (i.e., spell animation variation)
@effectLevel    moveq   #CONFIGURATION_MESSAGE_EFFECT_TEST_2,d1 ; "Which level?"
                bsr.w   DisplayConfigurationMessage
                
                move.w  effectLevel(a6),d0
                moveq   #1,d1
                moveq   #SPELLENTRY_LEVELS_NUMBER,d2
                clr.w   d3              ; clear update textbox content toggle
                bsr.w   ExecuteConfigurationNumberPrompt
                move.w  numberEntry(a6),d0
                bmi.s   @effect         ; back to get effect if player pressed B
                
                ; Save effect level
                move.w  d0,effectLevel(a6)
                
                ; Initialize battlescene
                txt     1               ; "....{W1}"
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
configurationAction_Save:
                moveq   #CONFIGURATION_MESSAGE_SAVE,d1 ; "Save the game?"
                bsr.w   DisplayConfigurationMessage
                jsr     alt_YesNoPrompt
                bne.s   @return         ; skip if player pressed B or choose No
                
                jmp     (SaveGame).w
@return         rts


; =============== S U B R O U T I N E =======================================


; In: d0.b
;
DisplayCurrentToggleState:
                andi.w  #1,d0
                move.w  d0,numberEntry(a6)
                bra.s   OpenConfigurationNumberPromptWindow


; In: a0 = names table address, d0.w  = initial value, d1.w = min value, d2.w = max value, d3.w = update text toggle
;
ExecuteConfigurationNumberPrompt:
                move.w  d0,numberEntry(a6)
                move.w  d1,numberMin(a6)
                move.w  d2,numberMax(a6)
                move.l  a0,entryNamesAddress(a6)
                
                pea     CloseConfigurationNumberPromptWindow(pc)
                pea     ProcessConfigurationNumberPromptInput(pc)
                pea     DisplayConfigurationEntryName(pc)


;
OpenConfigurationNumberPromptWindow:
                
                ; Create number prompt window
                move.w  #CONFIGURATION_NUMBER_PROMPT_SIZE,d0
                move.w  #CONFIGURATION_NUMBER_PROMPT_ORIGIN,d1
                jsr     (CreateWindow).w
                move.w  d0,windowSlot(a6)
                move.l  a1,windowLayoutEndAddress(a6)
                
                ; Build content and move to position
                bsr.w   WriteConfigurationNumberPromptDigits
                move.w  windowSlot(a6),d0
                move.w  #CONFIGURATION_NUMBER_PROMPT_DESTINATION,d1
                moveq   #CONFIGURATION_NUMBER_PROMPT_ANIMATION_LENGTH,d2
                jsr     (MoveWindowWithSfx).w
                jmp     (WaitForWindowMovementEnd).w


;
CloseConfigurationNumberPromptWindow:
                
                ; Remove, then delete window
                move.w  windowSlot(a6),d0
                move.w  #CONFIGURATION_NUMBER_PROMPT_ORIGIN,d1
                moveq   #CONFIGURATION_NUMBER_PROMPT_ANIMATION_LENGTH,d2
                jsr     (MoveWindowWithSfx).w
                jsr     (WaitForWindowMovementEnd).w
                move.w  windowSlot(a6),d0
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
                
@default        move.w  #-1,numberEntry(a6)
@return         rts


; In: a6 = configuration screen stack
;
WriteConfigurationNumberPromptDigits:
                
                ; Digits
                movea.l windowLayoutEndAddress(a6),a1
                move.w  #CONFIGURATION_NUMBER_PROMPT_SIZE,d0
                jsr     alt_WriteWindowTiles
                movea.l windowLayoutEndAddress(a6),a1
                adda.w  #CONFIGURATION_NUMBER_PROMPT_DIGITS_OFFSET,a1
                move.w  numberEntry(a6),d0
                ext.l   d0
                moveq   #-14,d1
                moveq   #CONFIGURATION_NUMBER_PROMPT_DIGITS_NUMBER,d7
                jmp     WriteTilesFromNumber


; In: a6 = configuration screen stack, d3.w = update text toggle, d4.w = increment amount
;
UpdateConfigurationPromptNumber:
                
                move.w  numberEntry(a6),d0
                add.w   d4,d0
                
                cmp.w   numberMax(a6),d0
                ble.s   @maxSkip
                
@max            move.w  numberMax(a6),d0    ; cap to max, unless already at max, then roll back to min
                cmp.w   numberEntry(a6),d0
                beq.s   @min
                
@maxSkip        cmp.w   numberMin(a6),d0
                bge.s   @minSkip
                
@min            move.w  numberMin(a6),d0    ; cap to min, unless already at min, then roll back to max
                cmp.w   numberEntry(a6),d0
                bne.s   @minSkip
                
                move.w  numberMax(a6),d0
@minSkip        move.w  d0,numberEntry(a6)
                sndCom  SFX_MENU_SELECTION
                
                ; Update window content
                bsr.w   WriteConfigurationNumberPromptDigits
                move.w  windowSlot(a6),d0
                move.w  #$8080,d1
                jsr     (SetWindowDestination).w
                
                ; Update textbox message


; In: a0 = names table pointer
;
DisplayConfigurationEntryName:
                
                tst.w   d3
                bpl.s   @return
                
                move.w  numberEntry(a6),d1
                movea.l entryNamesAddress(a6),a0
                jmp     (DisplayUncompressedText).w
                
@return         rts


; In: d1.w = message index
;
DisplayConfigurationMessage:
                
                lea     table_ConfigurationMessages(pc),a0
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


; ---------------------------------------------------------------------------
;
table_ConfigurationNames:
                defineName "End"
                defineName "Battle Select"
                defineName "Skip Events Mode"
                defineName "Test Mode"
                defineName "Party Select"
                defineName "Level Select"
                defineName "Control Toggles"
                defineName "Difficulty Select"
                defineName "Game Completed"
                defineName "Give Money"
                defineName "Action Test"
                defineName "Effect Test"
                defineName "Sound Test"
                defineName "Reset"
                defineName "Save"


;
table_BattleNames:
                defineName "Versus All Bosses"
                defineName "Inside the Ancient Tower"
                defineName "To Yeel"
                defineName "To Hawel's House"
                defineName "Ambushed by Galam Soldiers"
                defineName "Galam Castle"
                defineName "To Granseal"
                defineName "Versus Dark Smokes"
                defineName "North Cliff"
                defineName "To Ribble"
                defineName "To the East"
                defineName "Cave of Darkness"
                defineName "Mount Volcano"
                defineName "Polca Village"
                defineName "Southeast Desert"
                defineName "Shrine South of Ribble"
                defineName "Versus Kraken"
                defineName "To Taros's Shrine"
                defineName "Versus Taros"
                defineName "Outside the Elven Village"
                defineName "Harpies Pond"
                defineName "Devil's Tail"
                defineName "Chessboard"
                defineName "Versus Willard"
                defineName "To North Parmecia"
                defineName "North Cave"
                defineName "Outside Ketto"
                defineName "To Tristan"
                defineName "Pangoat Valley Bridge"
                defineName "Outside Mitula's Shrine"
                defineName "Versus Zalbard"
                defineName "Pacalon"
                defineName "To Moun"
                defineName "Inside Moun"
                defineName "Versus Cameela"
                defineName "To Roft"
                defineName "Versus Prism Flowers"
                defineName "Versus Red Baron"
                defineName "Versus Geshp"
                defineName "To the Ancient Shrine"
                defineName "Versus Odd Eye"
                defineName "Outside the Ancient Tower"
                defineName "Versus Galam"
                defineName "Versus Zeon"
                defineName "Fairy Woods"


;
table_DifficultyNames:
                defineName "Normal"
                defineName "Hard"
                defineName "Super"
                defineName "Ouch!!"


;
table_ActionTypeNames:
                defineName "Attack"
                defineName "Dodge"
                defineName "Special"


;
table_SideNames:
                defineName "Ally"
                defineName "Enemy"


;
table_EffectNames:
                defineName "None"
                defineName "Blaze"
                defineName "Freeze"
                defineName "Desoul"
                defineName "Healing Fairy"
                defineName "Blast"
                defineName "Detox"
                defineName "Bolt"
                defineName "Buff 1"
                defineName "Debuff 1"
                defineName "Absorb"
                defineName "Demon Breath"
                defineName "Flame Breath"
                defineName "Arrows and Spears"
                defineName "Cannon Projectile"
                defineName "Shot Projectile"
                defineName "Gunner Projectile"
                defineName "Dao"
                defineName "Apollo"
                defineName "Neptun"
                defineName "Atlas"
                defineName "Prism Laser"
                defineName "Bubble Breath"
                defineName "Snow Breath"
                defineName "Cutoff"
                defineName "Buff 2"
                defineName "Attack Spell"
                defineName "Debuff 2"
                defineName "Debuff 3"
                defineName "Phoenix Attack"
                defineName "Burst Rock Explosion"
                defineName "Odd Eye Beam"


;
table_ConfigurationMessages:
                defineName "Setup complete."
                defineName "Which battle number?"
                defineName "...."                           ; Special Turbo
                defineName "...."                           ; Test mode
                defineName "Recruit which character?"
                defineName "All characters have joined!"
                defineName "Level up which character?"
                defineName "Control Opponent"               ; Control Toggle 1
                defineName "Auto Battle"                    ; Control Toggle 2
                defineName "Which difficulty level?"
                defineName "...."                           ; Game Completed
                defineName "...."                           ; Give Money
                defineName "Which ally?"                    ; Action Test 1
                defineName "Which enemy?"                   ; Action Test 2
                defineName "Which action type?"             ; Action Test 3
                defineName "From which side?"               ; Action Test 4
                defineName "Which animation number?"        ; Action Test 5
                defineName "Which effect number?"           ; Effect Test 1
                defineName "Which level?"                   ; Effect Test 2
                defineName "Which sound number?"
                defineName "Reset the game?"
                defineName "Save the game?"
