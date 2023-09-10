
; ASM FILE code\specialscreens\witch\witchstart.asm :
; 0x724E..0x75C4 : Start witch screen

StartWitchScreen:
                
                bsr.w   DisableDisplayAndInterrupts ; title screen -> witch menu
                bsr.w   ClearVsramAndSprites
                bsr.w   EnableDisplayAndInterrupts
                move.b  #$FF,((DEACTIVATE_WINDOW_HIDING-$1000000)).w
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
                clr.b   ((byte_FFB198-$1000000)).w
                move.w  #SFX_DIALOG_BLEEP_4,((SPEECH_SFX-$1000000)).w 
                                                        ; Witch speech SFX
                bsr.w   BuildWitchScreen
                move.w  #$1E,((BLINK_COUNTER-$1000000)).w
                move.w  #6,((word_FFB07C-$1000000)).w
loc_729C:
                
                move.b  #0,((BLINK_CONTROL_TOGGLE-$1000000)).w
                jsr     j_ClearEntities
                getPointer p_SpeechBalloonTiles, a0
                lea     ($8000).l,a1
                move.w  #$400,d0
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
                moveq   #$20,d7 
                move.b  d7,(SAVED_ERRCODE_BYTE0).l
                move.b  d7,(SAVED_ERRCODE_BYTE1).l
                move.b  d7,(SAVED_ERRCODE_BYTE2).l
                move.b  d7,(SAVED_ERRCODE_BYTE3).l
                move.b  d7,(SAVED_ERRCODE_BYTE4).l
                move.b  d7,(SAVED_ERRCODE_BYTE5).l
                move.b  d7,(SAVED_ERRCODE_BYTE6).l
                move.b  d7,(SAVED_ERRCODE_BYTE7).l
                tst.w   d0
                bpl.s   loc_7332
                move.l  #1,((TEXT_NUMBER-$1000000)).w
                sndCom  MUSIC_CORRUPTED_SAVE
                txt     237             ; "Ooops!  Record {#} has{N}vanished!{W2}"
                jsr     j_FadeOut_WaitForP1Input
loc_7332:
                
                tst.w   d1
                bpl.s   loc_734C
                move.l  #2,((TEXT_NUMBER-$1000000)).w
                sndCom  MUSIC_CORRUPTED_SAVE
                txt     237             ; "Ooops!  Record {#} has{N}vanished!{W2}"
                jsr     j_FadeOut_WaitForP1Input
loc_734C:
                
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                bne.w   loc_73AA
                txt     216             ; "{CLEAR}Hee, hee, hee...{N}You're finally here!{W2}"
                bsr.w   WaitForVInt
                bsr.w   UpdateWitchHead
                bsr.w   WaitForVInt
                move.w  #$1E,((BLINK_COUNTER-$1000000)).w
                move.w  #6,((word_FFB07C-$1000000)).w
                move.b  #$FF,((BLINK_CONTROL_TOGGLE-$1000000)).w
                txt     217             ; "Ah, you look so confused.{N}You don't know why you're{N}here?{W2}"
loc_737C:
                
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                bne.w   byte_73C2       
                txt     218             ; "Yes, yes...I used a spell{N}on you.{W2}"
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                bne.w   byte_73C2       
                txt     219             ; "Ha, ha.  Where are you{N}going?  You can't escape{W2}"
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                bne.w   byte_73C2       
                txt     220             ; "from this mystery forest{N}unless you help me.{W2}"
                bra.w   byte_73C2       
loc_73AA:
                
                bsr.w   WaitForVInt
                bsr.w   UpdateWitchHead
                bsr.w   WaitForVInt
                move.w  #$1E,((BLINK_COUNTER-$1000000)).w
                move.b  #$FF,((BLINK_CONTROL_TOGGLE-$1000000)).w
byte_73C2:
                
                txt     221             ; "{CLEAR}Whatcha gonna do?"
                move.b  (SAVE_FLAGS).l,d3
                andi.w  #3,d3
                bne.s   loc_73D8
                clr.w   d0
                moveq   #1,d2
                bra.s   loc_73E8
loc_73D8:
                
                moveq   #1,d0
                cmpi.w  #3,d3
                bne.s   loc_73E4
                moveq   #6,d2
                bra.s   loc_73E8
loc_73E4:
                
                move.w  #$F,d2
loc_73E8:
                
                clr.w   d1
                jsr     j_ExecuteWitchMainMenu
                tst.w   d0
                bmi.s   byte_73C2       
                add.w   d0,d0
                move.w  rjt_WitchChoice(pc,d0.w),d0
                jmp     rjt_WitchChoice(pc,d0.w)

; END OF FUNCTION CHUNK FOR InitializeGame

rjt_WitchChoice:dc.w WitchNew-rjt_WitchChoice
                dc.w WitchLoad-rjt_WitchChoice
                dc.w WitchDel-rjt_WitchChoice
                dc.w WitchCopy-rjt_WitchChoice

; =============== S U B R O U T I N E =======================================


WitchNew:
                
                 
                txt     222             ; "What should I call you?{W2}"
                move.b  (SAVE_FLAGS).l,d2
                andi.w  #3,d2
                eori.w  #3,d2
                lsl.w   #1,d2
                btst    #1,d2
                beq.s   loc_7424
                moveq   #1,d0
                bra.s   loc_7426
loc_7424:
                
                moveq   #2,d0
loc_7426:
                
                moveq   #1,d1
loc_7428:
                
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
                beq.w   byte_7476       
                btst    #INPUT_BIT_START,((P1_INPUT-$1000000)).w
                beq.w   byte_7476       
                moveq   #1,d0
                moveq   #$1B,d7
loc_7464:
                
                jsr     j_NameAlly
loc_746A:
                
                addq.w  #1,d0
                cmpi.w  #6,d0
                beq.s   loc_746A
                dbf     d7,loc_7464
byte_7476:
                
                txt     223             ; "{NAME;0}....{N}Nice name, huh?{W2}"
                bsr.w   CheatModeConfiguration
                txt     232             ; "I'll let you decide the{N}difficulty level at this time."
                clr.w   d0
                moveq   #3,d1
                moveq   #$F,d2
                jsr     j_ExecuteWitchMainMenu
                tst.w   d0
                bpl.s   loc_7494
                clr.w   d0
loc_7494:
                
                btst    #0,d0
                beq.s   loc_749E
                setFlg  78              ; Difficulty bit 0
loc_749E:
                
                btst    #1,d0
                beq.s   loc_74A8        
                setFlg  79              ; Difficulty bit 1
loc_74A8:
                
                addi.w  #$E9,d0 ; HARDCODED text index for difficulty choice reactions
                bsr.w   DisplayText     
                txt     224             ; "Now, good luck!{N}You have no time to waste!{W1}"
loc_74B4:
                
                getCurrentSaveSlot d0
                setSavedByte #MAP_GRANSEAL, CURRENT_MAP
                setSavedByte #MAP_GRANSEAL, EGRESS_MAP
                bsr.w   SaveGame
                clsTxt
                move.b  #MAP_GRANSEAL,d0 ; HARDCODED new game starting map
                move.w  #56,d1          ; HARDCODED main entity starting X
                move.w  #3,d2           ; HARDCODED main entity starting Y
                move.w  #DOWN,d3        ; HARDCODED main entity starting facing
                moveq   #1,d4
loc_74DE:
                
                bra.w   MainLoop        

    ; End of function WitchNew


; =============== S U B R O U T I N E =======================================


WitchLoad:
                
                 
                txt     225             ; "By the way, who are you?"
                move.b  (SAVE_FLAGS).l,d2
                andi.w  #3,d2
                lsl.w   #1,d2
                btst    #1,d2
                beq.s   loc_74FC
                moveq   #1,d0
                bra.s   loc_74FE
loc_74FC:
                
                moveq   #2,d0
loc_74FE:
                
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
                beq.s   loc_753A
                jsr     j_BattleLoop
                bra.w   alt_MainLoopEntry        
loc_753A:
                
                clr.w   d0
                getSavedByte CURRENT_MAP, d0
                jsr     GetSavePointForMap(pc)
                nop
                moveq   #$FFFFFFFF,d4
                bra.w   alt_MainLoopEntry        

    ; End of function WitchLoad


; =============== S U B R O U T I N E =======================================


WitchCopy:
                
                 
                txt     227             ; "Copy?  Really?"
                jsr     j_YesNoChoiceBox
                tst.w   d0
                bne.w   byte_73C2       
                move.b  (SAVE_FLAGS).l,d0
                andi.w  #3,d0
                subq.w  #1,d0
                bsr.w   CopySave
                txt     228             ; "Hee, hee!  It's done.{W2}"
                bra.w   byte_73C2       

    ; End of function WitchCopy


; =============== S U B R O U T I N E =======================================


WitchDel:
                
                 
                txt     229             ; "Delete which one?"
                move.b  (SAVE_FLAGS).l,d2
                andi.w  #3,d2
                lsl.w   #1,d2
                btst    #1,d2
                beq.s   loc_758E
                moveq   #1,d0
                bra.s   loc_7590
loc_758E:
                
                moveq   #2,d0
loc_7590:
                
                moveq   #2,d1
                jsr     j_ExecuteWitchMainMenu
                tst.w   d0
                bmi.w   byte_73C2       
                subq.w  #1,d0
                setCurrentSaveSlot d0
                txt     230             ; "Delete?  Are you sure?"
                jsr     j_YesNoChoiceBox
                tst.w   d0
                bne.w   byte_73C2       
                getCurrentSaveSlot d0
                bsr.w   ClearSaveSlotFlag
                txt     231             ; "Hee, hee!  It's gone!{W2}"
                bra.w   byte_73C2       

    ; End of function WitchDel
