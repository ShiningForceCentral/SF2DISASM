
; ASM FILE code\common\tech\interrupts\errors.asm :
; 0x490..0x556 : Error interrupts

; =============== S U B R O U T I N E =======================================


Int_AddressError:
                
                move.l  #'ADDR',(ERRCODE_BYTE0).l
                move.l  $A(sp),(ERRCODE_BYTE4).l
                bsr.w   SaveErrorCode
                bra.w   Int_ExternalInterrupt

    ; End of function Int_AddressError


; =============== S U B R O U T I N E =======================================


Int_IllegalInstruction:
                
                move.l  #'BAD ',(ERRCODE_BYTE0).l
                move.l  2(sp),(ERRCODE_BYTE4).l
                bsr.w   SaveErrorCode
                bra.w   Int_ExternalInterrupt

    ; End of function Int_IllegalInstruction


; =============== S U B R O U T I N E =======================================


Int_ZeroDivide:
                
                move.l  #'ZERO',(ERRCODE_BYTE0).l
                move.l  2(sp),(ERRCODE_BYTE4).l
                bsr.w   SaveErrorCode
                bra.w   Int_ExternalInterrupt

    ; End of function Int_ZeroDivide


; =============== S U B R O U T I N E =======================================


Int_OtherError:
                
                move.l  #'OTHR',(ERRCODE_BYTE0).l
                move.l  2(sp),(ERRCODE_BYTE4).l
                bsr.w   SaveErrorCode
                bra.w   Int_ExternalInterrupt

    ; End of function Int_OtherError


; =============== S U B R O U T I N E =======================================


SaveErrorCode:
                
                move.b  (ERRCODE_BYTE0).l,(SAVED_ERRCODE_BYTE0).l
                move.b  (ERRCODE_BYTE1).l,(SAVED_ERRCODE_BYTE1).l
                move.b  (ERRCODE_BYTE2).l,(SAVED_ERRCODE_BYTE2).l
                move.b  (ERRCODE_BYTE3).l,(SAVED_ERRCODE_BYTE3).l
                move.b  (ERRCODE_BYTE4).l,(SAVED_ERRCODE_BYTE4).l
                move.b  (ERRCODE_BYTE5).l,(SAVED_ERRCODE_BYTE5).l
                move.b  (ERRCODE_BYTE6).l,(SAVED_ERRCODE_BYTE6).l
                move.b  (ERRCODE_BYTE7).l,(SAVED_ERRCODE_BYTE7).l

    ; End of function SaveErrorCode


; START OF FUNCTION CHUNK FOR Int_AddressError

Int_ExternalInterrupt:
                
                move    #$2700,sr
                nop
                nop
                bra.s   Int_ExternalInterrupt

; END OF FUNCTION CHUNK FOR Int_AddressError


; =============== S U B R O U T I N E =======================================


IntLvl7:
                
                nop
                bra.s   IntLvl7

    ; End of function IntLvl7

