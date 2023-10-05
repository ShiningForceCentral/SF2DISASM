
; ASM FILE code\common\scripting\entity\unused_entityscriptfunction.asm :
; 0x4E86..0x4EC6 : Unused entity script function

; =============== S U B R O U T I N E =======================================

; unused


sub_4E86:
                
                movem.l a0-a1,-(sp)
                move.w  d0,-(sp)
                lea     ((byte_FFAF47-$1000000)).w,a1
                lea     ((ENTITY_DATA-$1000000)).w,a0
                moveq   #$1F,d7
@LoopAllies:
                
                clr.w   d0
                move.b  (a1)+,d0
                bmi.w   @NotAlly
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                cmpi.w  #$7000,(a0,d0.w)
                bge.s   @LoopAllies
                move.w  (a0),(a0,d0.w)
                move.w  (a0),ENTITYDEF_OFFSET_XDEST(a0,d0.w)
                move.w  ENTITYDEF_OFFSET_Y(a0),ENTITYDEF_OFFSET_Y(a0,d0.w)
                move.w  ENTITYDEF_OFFSET_Y(a0),ENTITYDEF_OFFSET_YDEST(a0,d0.w)
                bra.s   @LoopAllies
@NotAlly:
                
                move.w  (sp)+,d0
                movem.l (sp)+,a0-a1
                rts

    ; End of function sub_4E86

