
; ASM FILE code\gameflow\battle\battlescenes\animation\update\buff.asm :
; 0x1CFFC..0x1D038 : 

; =============== S U B R O U T I N E =======================================


spellanimationUpdate_Buff:
                
                lea     ((SPELLANIMATION_PROPERTIES-$1000000)).w,a5
                lea     ((byte_FFB532-$1000000)).w,a3
                tst.w   (a5)
                beq.w   return_1D036
                addq.w  #1,(a5)
                subq.w  #1,2(a5)
                bne.w   return_1D036
                move.w  4(a5),d0
                add.w   (a3),d0
                beq.w   sub_1B82A
                bmi.w   sub_1B82A
                cmpi.w  #$20,d0 
                bcc.w   sub_1B82A
                move.w  d0,2(a5)
                move.w  d0,4(a5)
                sndCom  SFX_PSH
return_1D036:
                
                rts

    ; End of function spellanimationUpdate_Buff

