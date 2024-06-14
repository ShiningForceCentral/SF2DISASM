
; ASM FILE code\specialscreens\witch\witchstart.asm :
; 0x724E..0x75C4 : Start witch screen
StartWitchScreen:
                
                module                  ; Start of witch screen module
                bsr.w   DisableDisplayAndInterrupts ; title screen -> witch screen
                bsr.w   ClearVsramAndSprites
                bsr.w   EnableDisplayAndInterrupts
                move.b  #-1,((DEACTIVATE_WINDOW_HIDING-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                clr.w   d6
                jsr     (UpdateForegroundHScrollData).w
                jsr     (UpdateBackgroundHScrollData).w
                jsr     (UpdateForegroundVScrollData).w
                jsr     (UpdateBackgroundVScrollData).w
                jsr     (WaitForDmaQueueProcessing).w
                bsr.w   InitializeDisplay
                bsr.w   DisableDisplayAndInterrupts
                clr.b   ((MOUTH_CONTROL_TOGGLE-$1000000)).w
                move.w  #SFX_DIALOG_BLEEP_4,((CURRENT_SPEECH_SFX-$1000000)).w 
                                                        ; Witch speech SFX
                bsr.w   BuildWitchScreen
                move.w  #30,((BLINK_COUNTER-$1000000)).w
                move.w  #6,((word_FFB07C-$1000000)).w
                move.b  #0,((BLINK_CONTROL_TOGGLE-$1000000)).w
                jsr     j_ClearEntities
                movea.l (p_tiles_SpeechBalloon).l,a0
                lea     ($8000).l,a1
                move.w  #1024,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDmaOnCompressedTiles).w
                bsr.w   EnableDisplayAndInterrupts
                sndCom  MUSIC_WITCH
                bsr.w   FadeInFromBlack
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_UpdateWindows
                bsr.w   InitializeWindowProperties
                bsr.w   WaitForVInt
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_WitchBlink
                bsr.w   CheckSram       
                moveq   #32,d7
                move.b  d7,(SAVED_ERRCODE_BYTE0).l
                move.b  d7,(SAVED_ERRCODE_BYTE1).l
                move.b  d7,(SAVED_ERRCODE_BYTE2).l
                move.b  d7,(SAVED_ERRCODE_BYTE3).l
                move.b  d7,(SAVED_ERRCODE_BYTE4).l
                move.b  d7,(SAVED_ERRCODE_BYTE5).l
                move.b  d7,(SAVED_ERRCODE_BYTE6).l
                move.b  d7,(SAVED_ERRCODE_BYTE7).l
                tst.w   d0
                bpl.s   @IsSaveSlot2Corrupted
                
                move.l  #1,((DIALOGUE_NUMBER-$1000000)).w
                sndCom  MUSIC_CORRUPTED_SAVE
                txt     237             ; "Ooops!  Record {#} has{N}vanished!{W2}"
                jsr     j_FadeOut_WaitForP1Input
@IsSaveSlot2Corrupted:
                
                tst.w   d1
                bpl.s   @StartWitchDialogue
                
                move.l  #2,((DIALOGUE_NUMBER-$1000000)).w
                sndCom  MUSIC_CORRUPTED_SAVE
                txt     237             ; "Ooops!  Record {#} has{N}vanished!{W2}"
                jsr     j_FadeOut_WaitForP1Input
@StartWitchDialogue:
                
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                bne.w   @SkipWitchDialogue
                txt     216             ; "{CLEAR}Hee, hee, hee...{N}You're finally here!{W2}"
                bsr.w   WaitForVInt
                bsr.w   UpdateWitchHead
                bsr.w   WaitForVInt
                move.w  #30,((BLINK_COUNTER-$1000000)).w
                move.w  #6,((word_FFB07C-$1000000)).w
                move.b  #-1,((BLINK_CONTROL_TOGGLE-$1000000)).w
                txt     217             ; "Ah, you look so confused.{N}You don't know why you're{N}here?{W2}"
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                bne.w   byte_73C2       ; @DisplayText
                txt     218             ; "Yes, yes...I used a spell{N}on you.{W2}"
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                bne.w   byte_73C2       ; @DisplayText
                txt     219             ; "Ha, ha.  Where are you{N}going?  You can't escape{W2}"
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                bne.w   byte_73C2       ; @DisplayText
                txt     220             ; "from this mystery forest{N}unless you help me.{W2}"
                bra.w   byte_73C2       ; @DisplayText
@SkipWitchDialogue:
                
                bsr.w   WaitForVInt
                bsr.w   UpdateWitchHead
                bsr.w   WaitForVInt
                move.w  #30,((BLINK_COUNTER-$1000000)).w
                move.b  #-1,((BLINK_CONTROL_TOGGLE-$1000000)).w
byte_73C2:
                
                @DisplayText:
                txt     221             ; "{CLEAR}Whatcha gonna do?"
                move.b  (SAVE_FLAGS).l,d3
                andi.w  #3,d3
                bne.s   @loc_5
                
                clr.w   d0              ; d0 = 0 if there are no saved games
                moveq   #1,d2
                bra.s   @WitchMenu
@loc_5:
                
                moveq   #1,d0           ; d0 = 1 if there is at least one saved game
                cmpi.w  #3,d3
                bne.s   @loc_6
                
                moveq   #%110,d2        ; d2 = 6 if there are no free save slots
                bra.s   @WitchMenu
@loc_6:
                
                move.w  #%1111,d2       ; d2 = 15 if there is a free save slot
@WitchMenu:
                
                clr.w   d1
                jsr     j_ExecuteWitchMainMenu
                tst.w   d0
                bmi.s   byte_73C2       
                
                add.w   d0,d0
                move.w  rjt_WitchMenuActions(pc,d0.w),d0
                jmp     rjt_WitchMenuActions(pc,d0.w)

; END OF FUNCTION CHUNK FOR InitializeGame

rjt_WitchMenuActions:
                dc.w witchMenuAction_New-rjt_WitchMenuActions
                dc.w witchMenuAction_Load-rjt_WitchMenuActions
                dc.w witchMenuAction_Del-rjt_WitchMenuActions
                dc.w witchMenuAction_Copy-rjt_WitchMenuActions

; =============== S U B R O U T I N E =======================================


witchMenuAction_New:
                
                 
                txt     222             ; "What should I call you?{W2}"
                move.b  (SAVE_FLAGS).l,d2
                andi.w  #3,d2
                eori.w  #3,d2
                lsl.w   #1,d2
                btst    #1,d2
                beq.s   @loc_8
                
                moveq   #1,d0
                bra.s   @loc_9
@loc_8:
                
                moveq   #2,d0
@loc_9:
                
                moveq   #1,d1
                jsr     j_ExecuteWitchMainMenu
                tst.w   d0
                bmi.s   byte_73C2       
                subq.w  #1,d0
                setCurrentSaveSlot d0
                jsr     j_NewGame
                clsTxt
                clr.w   d0
                jsr     j_NameAlly
                btst    #7,(SAVE_FLAGS).l ; "Game completed" bit
                beq.w   byte_7476       ; @Configuration
                btst    #INPUT_BIT_START,((PLAYER_1_INPUT-$1000000)).w
                beq.w   byte_7476       ; @Configuration
                
                moveq   #1,d0
                moveq   #COMBATANT_ALLIES_MINUS_PLAYER_AND_CREATURE_COUNTER,d7
@NameAlly_Loop:
                
                jsr     j_NameAlly
@SkipNaming:
                
                addq.w  #1,d0
                cmpi.w  #ALLY_KIWI,d0
                beq.s   @SkipNaming
                dbf     d7,@NameAlly_Loop
byte_7476:
                
                @Configuration:
                txt     223             ; "{NAME;0}....{N}Nice name, huh?{W2}"
                bsr.w   CheatModeConfiguration
                txt     232             ; "I'll let you decide the{N}difficulty level at this time."
                clr.w   d0
                moveq   #3,d1
                moveq   #%1111,d2
                jsr     j_ExecuteWitchMainMenu
                tst.w   d0
                bpl.s   @loc_13
                clr.w   d0
@loc_13:
                
                btst    #0,d0
                beq.s   @loc_14
                setFlg  78              ; Difficulty bit 0
@loc_14:
                
                btst    #1,d0
                beq.s   @loc_15         
                setFlg  79              ; Difficulty bit 1
@loc_15:
                
                addi.w  #233,d0         ; HARDCODED text index for difficulty choice reactions
                bsr.w   DisplayText     
                txt     224             ; "Now, good luck!{N}You have no time to waste!{W1}"
                
                getCurrentSaveSlot d0
                setSavedByte #GAMESTART_MAP, CURRENT_MAP
                setSavedByte #GAMESTART_MAP, EGRESS_MAP
                bsr.w   SaveGame
                clsTxt
                
                ; HARDCODED initial starting position : map, x, y, facing
                move.b  #GAMESTART_MAP,d0 ; 3: Granseal
                move.w  #GAMESTART_SAVEPOINT_X,d1 ; 56
                move.w  #GAMESTART_SAVEPOINT_Y,d2 ; 3
                move.w  #GAMESTART_FACING,d3 ; 3: Down
                moveq   #1,d4
                bra.w   MainLoop        

    ; End of function witchMenuAction_New


; =============== S U B R O U T I N E =======================================


witchMenuAction_Load:
                
                 
                txt     225             ; "By the way, who are you?"
                move.b  (SAVE_FLAGS).l,d2
                andi.w  #3,d2
                lsl.w   #1,d2
                btst    #1,d2
                beq.s   @loc_16
                moveq   #1,d0
                bra.s   @loc_17
@loc_16:
                
                moveq   #2,d0
@loc_17:
                
                moveq   #2,d1
                jsr     j_ExecuteWitchMainMenu
                tst.w   d0
                bmi.w   byte_73C2       
                subq.w  #1,d0
                setCurrentSaveSlot d0
                bsr.w   LoadGame
                txt     226             ; "{NAME;0}, yes!  I knew it!{W2}"
                bsr.w   CheatModeConfiguration
                txt     224             ; "Now, good luck!{N}You have no time to waste!{W1}"
                clsTxt
                clr.b   ((DEACTIVATE_WINDOW_HIDING-$1000000)).w
                chkFlg  88              ; checks if a game has been saved for copying purposes ? (or if saved from battle?)
                beq.s   @loc_18
                jsr     j_BattleLoop
                bra.w   alt_MainLoopEntry
@loc_18:
                
                clr.w   d0
                getSavedByte CURRENT_MAP, d0
                jsr     GetSavepointForMap(pc)
                nop
                moveq   #-1,d4
                bra.w   alt_MainLoopEntry

    ; End of function witchMenuAction_Load


; =============== S U B R O U T I N E =======================================


witchMenuAction_Copy:
                
                 
                txt     227             ; "Copy?  Really?"
                jsr     j_alt_YesNoPrompt
                tst.w   d0
                bne.w   byte_73C2       
                move.b  (SAVE_FLAGS).l,d0
                andi.w  #3,d0
                subq.w  #1,d0
                bsr.w   CopySave
                txt     228             ; "Hee, hee!  It's done.{W2}"
                bra.w   byte_73C2       

    ; End of function witchMenuAction_Copy


; =============== S U B R O U T I N E =======================================


witchMenuAction_Del:
                
                 
                txt     229             ; "Delete which one?"
                move.b  (SAVE_FLAGS).l,d2
                andi.w  #3,d2
                lsl.w   #1,d2
                btst    #1,d2
                beq.s   @loc_19
                moveq   #1,d0
                bra.s   @loc_20
@loc_19:
                
                moveq   #2,d0
@loc_20:
                
                moveq   #2,d1
                jsr     j_ExecuteWitchMainMenu
                tst.w   d0
                bmi.w   byte_73C2       
                subq.w  #1,d0
                setCurrentSaveSlot d0
                txt     230             ; "Delete?  Are you sure?"
                jsr     j_alt_YesNoPrompt
                tst.w   d0
                bne.w   byte_73C2       
                getCurrentSaveSlot d0
                bsr.w   ClearSaveSlotFlag
                txt     231             ; "Hee, hee!  It's gone!{W2}"
                bra.w   byte_73C2       

    ; End of function witchMenuAction_Del

                modend                  ; End of witch screen module
