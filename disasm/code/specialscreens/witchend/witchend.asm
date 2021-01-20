
; ASM FILE code\specialscreens\witchend\witchend.asm :
; 0x279D8..0x27D8E : Witch end functions

; =============== S U B R O U T I N E =======================================


EndGame:
                
                enableSram              
                bset    #7,(SAVE_FLAGS).l
                disableSram
                jsr     (DisableDisplayAndInterrupts).w
                movea.l (p_WitchEndTiles).l,a0
                lea     (FF6802_LOADING_SPACE).l,a1
                move.l  a1,-(sp)
                jsr     (LoadCompressedData).w
                movea.l (sp)+,a0
                lea     ($2000).w,a1
                move.w  #$2000,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                movea.l (p_WitchEndLayout).l,a0
                lea     (PLANE_B_LAYOUT).l,a1
                move.w  #$800,d7
                jsr     (CopyBytes).w   
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                move.l  #$21382139,$21E(a0)
                move.l  #$21422143,$25E(a0)
                lea     ($C000).l,a1
                move.w  #$380,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                movea.l (p_plt_WitchEnd).l,a0
                lea     (PALETTE_1_BASE).l,a1
                moveq   #$20,d7 
                jsr     (CopyBytes).w   
                lea     $20(a1),a1
                jsr     (CopyBytes).w   
                jsr     (EnableDisplayAndInterrupts).w
                move.w  #$3C,d0 
                jsr     (Sleep).w       
                jsr     (FadeInFromWhite).w
                move.w  #$1E,((BLINK_COUNTER-$1000000)).w
                move.b  #$FF,((byte_FFB082-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_WitchEndBlink
                move.w  #$46,((SPEECH_SFX-$1000000)).w 
                txt     239             ; "{NAME;0}, I thank you.{N}You enabled me to return{N}to my original form.{D2}{D2}{N}Someday we'll meet again.{N}I'll never forget you....{D2}{D2}{D2}"
                clsTxt
                move.w  #$5A,d0 
                jsr     (Sleep).w       
                move.b  #OUT_TO_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #1,((FADING_PALETTE_BITMAP-$1000000)).w
                moveq   #$3C,d0 
                jsr     (Sleep).w       
                clr.b   ((byte_FFB082-$1000000)).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_REMOVE
                dc.l VInt_WitchEndBlink
                trap    #VINT_FUNCTIONS
                dc.w VINTS_ADD
                dc.l VInt_FallingJewels
                moveq   #$1E,d0
                jsr     (Sleep).w       
                move.b  #OUT_TO_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #2,((FADING_PALETTE_BITMAP-$1000000)).w
                moveq   #$3C,d0 
                jsr     (Sleep).w       
                trap    #VINT_FUNCTIONS
                dc.w VINTS_REMOVE
                dc.l VInt_FallingJewels
                jsr     (DisableDisplayAndInterrupts).w
                lea     (PLANE_A_MAP_LAYOUT).l,a0
                clr.l   $21E(a0)
                clr.l   $25E(a0)
                lea     ($C000).l,a1
                move.w  #$380,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                movea.l (p_JewelEndScreenTiles).l,a0
                lea     (FF6802_LOADING_SPACE).l,a1
                move.l  a1,-(sp)
                jsr     (LoadCompressedData).w
                movea.l (sp)+,a0
                lea     ($2000).w,a1
                move.w  #$2000,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                movea.l (p_JewelEndScreenLayout).l,a0
                lea     (PLANE_B_LAYOUT).l,a1
                move.w  #$800,d7
                jsr     (CopyBytes).w   
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$400,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                movea.l (p_plt_JewelsEndScreen).l,a0
                lea     (PALETTE_1_BASE).l,a1
                moveq   #$40,d7 
                jsr     (CopyBytes).w   
                jsr     (EnableDisplayAndInterrupts).w
                move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #1,((FADING_PALETTE_BITMAP-$1000000)).w
                moveq   #$78,d0 
                jsr     (Sleep).w       
                move.w  #0,d0
                jsr     sub_27C64(pc)
                nop
                jsr     sub_27C64(pc)
                nop
                jsr     sub_27C64(pc)
                nop
                jsr     sub_27C64(pc)
                nop
                jsr     sub_27C64(pc)
                nop
                jsr     sub_27C64(pc)
                nop
                jsr     sub_27C64(pc)
                nop
                moveq   #$78,d0 
                jsr     (Sleep).w       
                move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
                clr.w   ((FADING_TIMER_WORD-$1000000)).w
                clr.b   ((FADING_POINTER-$1000000)).w
                move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
                move.b  #2,((FADING_PALETTE_BITMAP-$1000000)).w
                move.w  #$12C,d0
                jsr     (Sleep).w       
                sndCom  SOUND_COMMAND_FADE_OUT
                move.w  #END_GAME_TIMER,d0 ; wait for 3 minutes
                jsr     (Sleep).w       
                txt     465             ; "And more...{W1}"
                clsTxt
                move.b  #3,((FADING_COUNTER_MAX-$1000000)).w
                jsr     (FadeOutToBlack).w
                lea     (PALETTE_1_BASE).l,a0
                moveq   #$1F,d7
loc_27C2C:
                
                clr.l   (a0)+
                dbf     d7,loc_27C2C
                jsr     j_ClearEntities
                setFlg  400             ; Battle 0 unlocked - BATTLE_VERSUS_ALL_BOSSES         
                move.w  #$3F,d0 
                jsr     (CheckBattle).w 
                move.w  d7,d1
                bsr.w   BattleLoop      
                jsr     (FadeOutToWhite).w
                trap    #VINT_FUNCTIONS
                dc.w VINTS_CLEAR
                jsr     (DisableDisplayAndInterrupts).w
                move    #$2700,sr
                movea.l (InitStack).w,sp
                movea.l (p_Start).w,a0  
                jmp     (a0)            ; reset

    ; End of function EndGame


; =============== S U B R O U T I N E =======================================


sub_27C64:
                
                move.w  d0,-(sp)
                movea.l (p_JewelEndScreenLayout).l,a0
                lea     $700(a0),a0
                mulu.w  #$1E,d0
                adda.w  d0,a0
                lea     (byte_FFE31C).l,a1
                move.w  #$503,d1
                jsr     (UpdateWitchLayoutZone).w
                jsr     (QueueDmaForWitchLayout).w
                moveq   #4,d0
                jsr     (Sleep).w       
                move.w  (sp)+,d0
                addq.w  #1,d0
                rts

    ; End of function sub_27C64


; =============== S U B R O U T I N E =======================================


VInt_FallingJewels:
                
                subq.w  #1,(VERTICAL_SCROLL_DATA).l
                jsr     (UpdateVdpVScrollData).w
                jsr     (EnableDmaQueueProcessing).w
                rts

    ; End of function VInt_FallingJewels


; =============== S U B R O U T I N E =======================================

var_2 = -2

VInt_WitchEndBlink:
                
                link    a6,#-2
                tst.b   ((byte_FFB082-$1000000)).w
                beq.w   loc_27D6A
                clr.w   var_2(a6)
                lea     ((BLINK_COUNTER-$1000000)).w,a2
                subq.w  #1,(a2)
                cmpi.w  #3,(a2)
                bne.s   loc_27CDC
                movea.l (p_WitchEndLayout).l,a0
                lea     $700(a0),a0
                lea     (byte_FFE0DC).l,a1
                move.w  #$403,d1
                jsr     (UpdateWitchLayoutZone).w
                addq.w  #1,var_2(a6)
loc_27CDC:
                
                tst.w   (a2)
                bne.s   loc_27D08
                movea.l (p_WitchEndLayout).l,a0
                lea     $720(a0),a0
                lea     (byte_FFE0DC).l,a1
                move.w  #$403,d1
                jsr     (UpdateWitchLayoutZone).w
                addq.w  #1,var_2(a6)
                moveq   #$78,d6 
                jsr     (GenerateRandomNumber).w
                addi.w  #$1E,d7
                move.w  d7,(a2)
loc_27D08:
                
                lea     ((word_FFB07C-$1000000)).w,a2
                tst.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
                bne.s   loc_27D1A
                cmpi.w  #5,(a2)
                ble.s   loc_27D42
                bra.s   loc_27D6A
loc_27D1A:
                
                subq.w  #1,(a2)
                cmpi.w  #5,(a2)
                bne.s   loc_27D3E
                movea.l (p_WitchEndLayout).l,a0
                lea     $718(a0),a0
                lea     (byte_FFE19C).l,a1
                move.w  #$401,d1
                jsr     (UpdateWitchLayoutZone).w
                addq.w  #1,var_2(a6)
loc_27D3E:
                
                tst.w   (a2)
                bne.s   loc_27D6A
loc_27D42:
                
                movea.l (p_WitchEndLayout).l,a0
                lea     $738(a0),a0
                lea     (byte_FFE19C).l,a1
                move.w  #$401,d1
                jsr     (UpdateWitchLayoutZone).w
                addq.w  #1,var_2(a6)
                moveq   #5,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$A,d7
                move.w  d7,(a2)
loc_27D6A:
                
                tst.w   var_2(a6)
                beq.s   loc_27D8A
                lea     (PLANE_B_LAYOUT).l,a0
                lea     ($E000).l,a1
                move.w  #$200,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
loc_27D8A:
                
                unlk    a6
                rts

    ; End of function VInt_WitchEndBlink

