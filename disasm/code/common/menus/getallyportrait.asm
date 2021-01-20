
; ASM FILE code\common\menus\getallyportrait.asm :
; 0x15736..0x15772 : Get ally portrait index function

; =============== S U B R O U T I N E =======================================

; In: D0 = ally or portrait index (depending on caller function)
; 
; Out: D0 = portrait index adjusted for class


GetAllyPortrait:
                
                move.w  d1,-(sp)
                cmpi.b  #COMBATANT_ALLIES_NUMBER,d0
                bhi.w   @Done
                jsr     j_GetClass
                
                ; Check HERO
                cmpi.b  #CLASS_HERO,d1
                bne.s   @CheckPHNX      ; HARDCODED promotion classes which trigger new portraits
                moveq   #PORTRAIT_BOWIE_PROMO,d0
@CheckPHNX:
                
                cmpi.b  #CLASS_PHNX,d1
                bne.s   @CheckWFBR
                moveq   #PORTRAIT_PETER_PROMO,d0
@CheckWFBR:
                
                cmpi.b  #CLASS_WFBR,d1
                bne.s   @CheckNINJ
                moveq   #PORTRAIT_GERHALT_PROMO,d0
@CheckNINJ:
                
                cmpi.b  #CLASS_NINJ,d1
                bne.s   @CheckMNST
                moveq   #PORTRAIT_SLADE_PROMO,d0
@CheckMNST:
                
                cmpi.b  #CLASS_MNST,d1
                bne.s   @Done
                moveq   #PORTRAIT_KIWI_PROMO,d0
@Done:
                
                move.w  (sp)+,d1
                rts

    ; End of function GetAllyPortrait

