
; ASM FILE code\specialscreens\witch\witchactions.asm :
; 0x7406..0x75C4 : Witch actions

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
                
                jsr     j_WitchMainMenu
                tst.w   d0
                bmi.s   byte_73C2       
                subq.w  #1,d0
                setCurrentSaveSlot
                jsr     j_NewGame
byte_743E:
                
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
                jsr     j_WitchMainMenu
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
                
                getCurrentSaveSlot
                move.b  #3,((CURRENT_MAP-$1000000)).w
                move.b  #3,((EGRESS_MAP_INDEX-$1000000)).w
                bsr.w   SaveGame
                disableSram
                clsTxt
                move.b  #MAP_GRANSEAL,d0 ; HARDCODED new game starting map
                move.w  #$38,d1 ; HARDCODED main entity starting X
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
                jsr     j_WitchMainMenu
                tst.w   d0
                bmi.w   byte_73C2       
                subq.w  #1,d0
                setCurrentSaveSlot
                bsr.w   LoadGame
                disableSram
                txt     226             ; "{NAME;0}, yes!  I knew it!{W2}"
                bsr.w   CheatModeConfiguration
                txt     224             ; "Now, good luck!{N}You have no time to waste!{W1}"
                clsTxt
                clr.b   ((DEACTIVATE_WINDOW_HIDING-$1000000)).w
                chkFlg  88              ; checks if a game has been saved for copying purposes ? (or if saved from battle?)
                beq.s   loc_753A
                jsr     j_BattleLoop
                bra.w   loc_75E0        
loc_753A:
                
                clr.w   d0
                move.b  ((CURRENT_MAP-$1000000)).w,d0
                jsr     GetSavePointForMap(pc)
                nop
                moveq   #$FFFFFFFF,d4
                bra.w   loc_75E0        

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
                jsr     j_WitchMainMenu
                tst.w   d0
                bmi.w   byte_73C2       
                subq.w  #1,d0
                setCurrentSaveSlot
                txt     230             ; "Delete?  Are you sure?"
                jsr     j_YesNoChoiceBox
                tst.w   d0
                bne.w   byte_73C2       
                getCurrentSaveSlot
                bsr.w   ClearSaveSlotFlag
                txt     231             ; "Hee, hee!  It's gone!{W2}"
                bra.w   byte_73C2       

    ; End of function WitchDel
