
; ASM FILE code\common\tech\mapperfunctions-standard.asm :
;

; Functions for communicating with the mapper present in the cartridge.
;
; Requires the playback device to emulate either the SEGA mapper,
;  or the EverDrive Extended SSF mapper in such a way that both
;  SRAM and ROM bank switching are supported.
;
; A short save test is performed during system initialization to determine
;  which mapper is currently active, and the result is stored in a 68K RAM
;  byte to inform the game on how to control SRAM mapping over the course of
;  the play session.
;
; This byte is not saved, and the test is performed again every time the game
;  is booted or reset, so that saved game data remain interchangeable between
;  devices.

; =============== S U B R O U T I N E =======================================


InitializeMapper:     ; Init ROM banks
                bsr.s   ControlMapper_RestoreRomBanks ; make sure banks are restored now in case of soft reset
                
                ; Test SEGA mapper control register
                clr.b  ((SRAM_CONTROL-$1000000)).w
                move.w  #$8000,(EXTENDED_SSF_CTRL0).l ; enable ROM write protection
                bsr.s   ControlMapper_EnableSram
                bsr.s   TestSram
                beq.s   @Return
                
                ; Test EverDrive Extended SSF SRAM bank
                st      ((SRAM_CONTROL-$1000000)).w
                move.w  #$A000,(EXTENDED_SSF_CTRL0).l ; disable ROM write protection
                bsr.s   ControlMapper_EnableSram
                bsr.s   TestSram
                beq.s   @Return
                
                ; Mapper error
                neg.b   ((SRAM_CONTROL-$1000000)).w
@Return:        rts

    ; End of function InitializeMapper


; =============== S U B R O U T I N E =======================================

; Return "equal" when test completes successfully.

TestSram:       lea     SramCheckString(pc), a0
                movea.l #SRAM_TEST_SPACE,a1
                moveq   #SRAM_STRING_CHECK_COUNTER,d0
                
@Loop:          move.b  (a0),(a1)
                cmpm.b  (a0)+,(a1)+
                bne.s   @Break
                clr.b   -1(a1)                  ; clear test space as we parse it
                addq.w  #1,a1
                dbf     d0,@Loop
                
@Break:         rts

    ; End of function TestSram


; =============== S U B R O U T I N E =======================================


ControlMapper_RestoreRomBanks:
                move.b  #4,(ROM_BANK4).l
                move.b  #5,(ROM_BANK5).l
                move.b  #6,(ROM_BANK6).l
                move.b  #7,(ROM_BANK7).l
                rts
                
ControlMapper_RestoreRomBanksAndEnableSram:
                bsr.s   ControlMapper_RestoreRomBanks
                
ControlMapper_EnableSram:
                tst.b   ((SRAM_CONTROL-$1000000)).w
                bmi.s   @ExtendedSsf
                
                ; SEGA mapper
                move.b  #1,(SEGA_MAPPER_CTRL0).l
                rts
                
@ExtendedSsf:   move.b  #28,(ROM_BANK4).l
                rts

    ; End of function ControlMapper_EnableSram


; =============== S U B R O U T I N E =======================================


ControlMapper_DisableSramAndSwitchRomBanks:
                bsr.s   ControlMapper_DisableSram
                
ControlMapper_SwitchRomBanks:
                move.b  #8,(ROM_BANK4).l
                move.b  #9,(ROM_BANK5).l
                move.b  #10,(ROM_BANK6).l
                move.b  #11,(ROM_BANK7).l
                rts
                
ControlMapper_DisableSram:
                tst.b   ((SRAM_CONTROL-$1000000)).w
                bmi.s   @ExtendedSsf
                
                ; SEGA mapper
                move.b  #0,(SEGA_MAPPER_CTRL0).l
                rts
                
@ExtendedSsf:   move.b  #4,(ROM_BANK4).l
                rts

    ; End of function ControlMapper_DisableSram

