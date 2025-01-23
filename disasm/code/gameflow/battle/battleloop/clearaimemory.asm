
; ASM FILE code\gameflow\battle\battlefield\clearaimemory.asm :
; 0xC070..0xC09A : Battlefield engine

; =============== S U B R O U T I N E =======================================

; Unused in standard build

ClearAiMemory:
                
            if (VANILLA_BUILD=1)
                movem.l d0-a6,-(sp)
                lea     ((AI_LAST_TARGET_TABLE-$1000000)).w,a0
                lea     ((AI_MEMORY_TABLE-$1000000)).w,a1
                clr.w   d0
                move.w  #48,d1
@Loop:
                
                move.b  #-1,(a0,d0.w)
                move.b  #0,(a1,d0.w)
                addq.w  #1,d0
                subq.w  #1,d1
                bne.s   @Loop
                
                movem.l (sp)+,d0-a6
                rts
            endif

    ; End of function ClearAiMemory

