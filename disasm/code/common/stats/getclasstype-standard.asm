
; ASM FILE code\common\stats\getclasstype-standard.asm :


; =============== S U B R O U T I N E =======================================

; Get class type for ally d0.w -> d1.w

GetClassType:
                       
                bsr.w   GetClass                        ; class index -> d1.w
                move.b  table_ClassTypes(pc,d1.w),d1      ; 0,1,2,255 = Base, Promo, Special, Red Baron
                bpl.s   @Return
                moveq   #CLASSTYPE_SPECIAL,d1           ; handle Red Baron as a special class
@Return:
                
                rts

    ; End of function GetClassType
