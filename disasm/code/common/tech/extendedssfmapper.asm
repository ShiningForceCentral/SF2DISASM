
; ASM FILE code\common\tech\extendedssfmapper.asm :
; Functions for handling various Extended SSF mapper implementations,
; enabling simultaneous support for SRAM and ROM banks switching.

aSegaEverDrive: dc.b 'SEGA EVERDRIVE  '

; =============== S U B R O U T I N E =======================================

; Return "equal" when test completes successfully

TestSram:
                lea     aSegaEverDrive(pc), a0
                movea.l #SRAM_TEST_SPACE,a1
                moveq   #15,d1
                
@Loop:          
                move.b  (a0),(a1)
                cmpm.b  (a0)+,(a1)+
                bne.s   @Break
                clr.b   -1(a1)      ; clear test space as we parse it
                lea     1(a1),a1
                dbf     d1,@Loop
                
@Break:
                rts

    ; End of function TestSram


; =============== S U B R O U T I N E =======================================


InitMapper:
                ; Determine SRAM control method
                moveq   #0,d0
                move.b  #1,(SEGA_MAPPER_CTRL0).l    ; test SRAM enable method 0 (SEGA mapper)
                bsr.s   TestSram
                beq.s   @Success
                
                moveq   #1,d0
                move.w  #1,(EXTENDED_SSF_CTRL0).l   ; test SRAM enable method 1 (PicoDrive)
                bsr.s   TestSram
                beq.s   @Success
                
                ; Check if MEGAOS firmware is present in ROM bank 30
                move.b  #30,(ROM_BANK4).l
                lea     aSegaEverDrive(pc), a0
                movea.l #$200100,a1                 ; MEGAOS header System ID string location
                moveq   #15,d1
                
@Loop:          
                cmpm.b  (a0)+,(a1)+
                dbne    d1,@Loop
                bne.s   @Method3
                
                moveq   #2,d0
                move.b  #28,(ROM_BANK4).l   ; test SRAM enable method 2 (Extended SSF v1)
                bra.s   @Continue
                
@Method3:
                moveq   #3,d0
                move.b  #31,(ROM_BANK4).l    ; test SRAM enable method 3 (Extended SSF v2)
                
@Continue:
                ; Disable write protection
                move.w  #$A000,(EXTENDED_SSF_CTRL0).l
                bsr.s   TestSram
                beq.s   @Success
                
                ; SRAM control -1 indicates that saving is not supported on this device
                moveq   #-1,d0
                
@Success:
                ; Save first tested working SRAM control method
                move.b  d0,((SRAM_CONTROL-$1000000)).w 
                bsr.s   DisableMapperSram
                
                ; Init ROM banks
                move.b  #1,(ROM_BANK1).l
                move.b  #2,(ROM_BANK2).l
                move.b  #3,(ROM_BANK3).l
                move.b  #4,(ROM_BANK4).l
                move.b  #5,(ROM_BANK5).l
                move.b  #6,(ROM_BANK6).l
                move.b  #7,(ROM_BANK7).l
                
                rts

    ; End of function InitMapper


; =============== S U B R O U T I N E =======================================


DisableMapperSram:
                move.w  d0,-(sp)
                clr.w   d0
                move.b  ((SRAM_CONTROL-$1000000)).w,d0
                bmi.s   @SramDisableMethod2
                add.w   d0,d0
                jmp     @bt_SramDisableMethods(pc,d0.w)
                
@bt_SramDisableMethods:
                bra.s   @SramDisableMethod0
                bra.s   @SramDisableMethod1
                bra.s   @SramDisableMethod2
                bra.s   @SramDisableMethod2
                
@SramDisableMethod0:
                move.b  #0,(SEGA_MAPPER_CTRL0).l
                bra.s   @Done
                
@SramDisableMethod1:
                move.w  #0,(EXTENDED_SSF_CTRL0).l
                bra.s   @Done
                
@SramDisableMethod2:
                move.b  #4,(ROM_BANK4).l
                
@Done:
                move.w  (sp)+,d0
                rts

    ; End of function DisableMapperSram


; =============== S U B R O U T I N E =======================================


EnableMapperSram:
                move.w  d0,-(sp)
                clr.w   d0
                move.b  ((SRAM_CONTROL-$1000000)).w,d0
                bmi.s   @Done
                add.w   d0,d0
                jmp     @bt_SramEnableMethods(pc,d0.w)
                
@bt_SramEnableMethods:
                bra.s   @SramEnableMethod0
                bra.s   @SramEnableMethod1
                bra.s   @SramEnableMethod2
                bra.s   @SramEnableMethod3
                
@SramEnableMethod0:
                move.b  #1,(SEGA_MAPPER_CTRL0).l
                bra.s   @Done
                
@SramEnableMethod1:
                move.w  #1,(EXTENDED_SSF_CTRL0).l
                bra.s   @Done
                
@SramEnableMethod2:
                move.b  #28,(ROM_BANK4).l
                bra.s   @Done
                
@SramEnableMethod3:
                move.b  #31,(ROM_BANK4).l
                
@Done:
                move.w  (sp)+,d0
                rts

    ; End of function EnableMapperSram
