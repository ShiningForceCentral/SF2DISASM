
; ASM FILE code\gameflow\start\gameintro.asm :
; 0x71C0..0x7406 : Game intro

; =============== S U B R O U T I N E =======================================

j_GameIntro:
		
		bra.w   GameIntro

	; End of function j_GameIntro


; =============== S U B R O U T I N E =======================================

sub_71C4:
		
		jsr     j_DisplaySegaLogo
		bne.w   loc_71EC

	; End of function sub_71C4


; START OF FUNCTION CHUNK FOR GameInit

GameIntro:
		
		move.l  sp,(SECONDS_COUNTER_0).l
		move.l  #loc_71EC,((AFTER_INTRO_JUMP_OFFSET-$1000000)).w
		jsr     (EnableDisplayAndInterrupts).w
		clr.w   d0
		jsr     j_PlayIntroOrEndCutscene
		clr.l   ((AFTER_INTRO_JUMP_OFFSET-$1000000)).w
loc_71EC:
		
		clr.w   ((word_FFA80C-$1000000)).w
		move.b  #3,((FADING_COUNTER_MAX-$1000000)).w
		bsr.w   EnableInterrupts
		lea     (PALETTE_1).l,a0
		lea     (PALETTE_1_BIS).l,a1
		move.w  #$80,d7 
		bsr.w   CopyBytes       
		bsr.w   FadeOutToBlack
		trap    #VINT_FUNCTIONS

; END OF FUNCTION CHUNK FOR GameInit

		dc.w VINTS_CLEAR
		clr.w   d6
		jsr     (ClearHscrollStuff).w
		jsr     (ClearOtherHscrollStuff).w
		jsr     (ClearVscrollStuff).w
		jsr     (ClearOtherVscrollStuff).w
		jsr     (SetFFDE94b3andWait).w
		bsr.w   InitDisplay     
		bsr.w   DisableDisplayAndVInt
		trap    #SOUND_COMMAND
		dc.w MUSIC_TITLE
		jsr     TitleScreen
		bne.s   loc_724E        
		move    #$2700,sr
		movea.l (InitStack).w,sp
		movea.l (p_Start).w,a0  
		jmp     (a0)            
						; reset
loc_724E:
		bsr.w   DisableDisplayAndVInt
						; title screen -> witch menu
		bsr.w   ClearVsramAndSprites
		bsr.w   EnableDisplayAndInterrupts
		move.b  #$FF,((WINDOW_HIDING_FORBIDDEN-$1000000)).w
		trap    #VINT_FUNCTIONS
		dc.w VINTS_CLEAR
		clr.w   d6
		jsr     (ClearHscrollStuff).w
		jsr     (ClearOtherHscrollStuff).w
		jsr     (ClearVscrollStuff).w
		jsr     (ClearOtherVscrollStuff).w
		jsr     (SetFFDE94b3andWait).w
		bsr.w   InitDisplay     
		bsr.w   DisableDisplayAndVInt
		clr.b   ((byte_FFB198-$1000000)).w
		move.w  #$48,((CURRENT_SPEAK_SOUND-$1000000)).w 
		bsr.w   sub_7C5E
		move.w  #$1E,((BLINK_COUNTER-$1000000)).w
		move.w  #6,((word_FFB07C-$1000000)).w
loc_729C:
		move.b  #0,((byte_FFB082-$1000000)).w
		jsr     j_ClearEntities
		movea.l (p_SpeechBalloonTiles).l,a0
		lea     ($8000).l,a1
		move.w  #$400,d0
		moveq   #2,d1
		jsr     (DmaTilesViaFF8804).w
		bsr.w   EnableDisplayAndInterrupts
		trap    #SOUND_COMMAND
		dc.w MUSIC_WITCH
		bsr.w   FadeInFromBlack
		trap    #VINT_FUNCTIONS
		dc.w VINTS_ADD
		dc.l VInt_UpdateWindows
		bsr.w   InitWindowProperties
		bsr.w   WaitForVInt     
		trap    #VINT_FUNCTIONS
		dc.w VINTS_ADD
		dc.l VInt_WitchBlink
		bsr.w   CheckSRAM
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
		trap    #SOUND_COMMAND
		dc.w MUSIC_CORRUPTED_SAVE
		trap    #TEXTBOX
		dc.w $ED                
						; "Ooops!  Record {#} has{N}vanished!{W2}"
		jsr     j_FadeOut_WaitForP2Input
loc_7332:
		tst.w   d1
		bpl.s   loc_734C
		move.l  #2,((TEXT_NUMBER-$1000000)).w
		trap    #SOUND_COMMAND
		dc.w MUSIC_CORRUPTED_SAVE
		trap    #TEXTBOX
		dc.w $ED                
						; "Ooops!  Record {#} has{N}vanished!{W2}"
		jsr     j_FadeOut_WaitForP2Input
loc_734C:
		btst    #7,((P1_INPUT-$1000000)).w
		bne.w   loc_73AA
		trap    #TEXTBOX
		dc.w $D8                
						; "{CLEAR}Hee, hee, hee...{N}You're finally here!{W2}"
		bsr.w   WaitForVInt     
		bsr.w   sub_7CF4
		bsr.w   WaitForVInt     
		move.w  #$1E,((BLINK_COUNTER-$1000000)).w
		move.w  #6,((word_FFB07C-$1000000)).w
		move.b  #$FF,((byte_FFB082-$1000000)).w
		trap    #TEXTBOX
		dc.w $D9                
						; "Ah, you look so confused.{N}You don't know why you're{N}here?{W2}"
loc_737C:
		btst    #7,((P1_INPUT-$1000000)).w
		bne.w   loc_73C2
		trap    #TEXTBOX
		dc.w $DA                
						; "Yes, yes...I used a spell{N}on you.{W2}"
		btst    #7,((P1_INPUT-$1000000)).w
		bne.w   loc_73C2
		trap    #TEXTBOX
		dc.w $DB                
						; "Ha, ha.  Where are you{N}going?  You can't escape{W2}"
		btst    #7,((P1_INPUT-$1000000)).w
		bne.w   loc_73C2
		trap    #TEXTBOX
		dc.w $DC                
						; "from this mystery forest{N}unless you help me.{W2}"
		bra.w   loc_73C2
loc_73AA:
		bsr.w   WaitForVInt     
		bsr.w   sub_7CF4
		bsr.w   WaitForVInt     
		move.w  #$1E,((BLINK_COUNTER-$1000000)).w
		move.b  #$FF,((byte_FFB082-$1000000)).w

; START OF FUNCTION CHUNK FOR WitchDel

loc_73C2:
		
		trap    #TEXTBOX

; END OF FUNCTION CHUNK FOR WitchDel

		dc.w $DD                
						; "{CLEAR}Whatcha gonna do?"
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
		jsr     j_WitchMainMenu
		tst.w   d0
		bmi.s   loc_73C2
		add.w   d0,d0
		move.w  rjt_WitchChoice(pc,d0.w),d0
		jmp     rjt_WitchChoice(pc,d0.w)
rjt_WitchChoice:
		dc.w WitchNew-rjt_WitchChoice
		dc.w WitchLoad-rjt_WitchChoice
		dc.w WitchDel-rjt_WitchChoice
		dc.w WitchCopy-rjt_WitchChoice
