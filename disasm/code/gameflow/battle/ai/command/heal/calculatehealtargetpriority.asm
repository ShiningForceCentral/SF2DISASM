
; ASM FILE code\gameflow\battle\ai\command\heal\calculatehealtargetpriority.asm :
; 0xCDEA..0xCE36 : Calculate heal target priority function

; =============== S U B R O U T I N E =======================================

; If the target for healing uses AI #14 or #15, then return the maximum
;   priority of 13.
; 
; If not, then return a priority based upon the movetype for the enemy,
;   which approximately goes highest to lowest priority of
;   healer, mage, archer, flyer, melee, aquatic.
; 
; Specific decending priority for each move type is in table_HealPriorityMovetypes.
; 
; The first byte in that table is -1 to ensure there is never a movetype
;   match and therefore nothing has a priority higher than AI #14 or AI #15.
; 
;       In: d0.b = target index
;       Out: d6.w = target priority


CalculateHealTargetPriority:
                
                movem.l d0-d5/d7-a6,-(sp)
                bsr.w   GetAiCommandset 
                cmpi.w  #AICOMMANDSET_CRITICAL,d1
                bne.s   @CheckLeaderAi
                
                move.w  #MOVETYPES_NUMBER,d6
                bra.w   @Done
@CheckLeaderAi:
                
                cmpi.w  #AICOMMANDSET_LEADER,d1
                bne.s   @PrioritizeByMovetype
                
                move.w  #MOVETYPES_NUMBER,d6
                bra.w   @Done
@PrioritizeByMovetype:
                
                bsr.w   GetMovetype     
                lea     (table_HealPriorityMovetypes).l,a0
                move.w  #MOVETYPES_NUMBER,d6
                clr.w   d0
@FindHealPriority_Loop:
                
                ; Iterate movetypes in decreasing priority until there is a match
                ;
                ; Priority order roughly follows highest to lowest priority of
                ;   healer, mage, archer, flying, regular, and aquatic
                cmp.b   (a0,d0.w),d1
                bne.s   @NextMovetype
                bra.w   @Done           ; match found! return the value in d6.w
@NextMovetype:
                
                addi.w  #1,d0
                subq.w  #1,d6
                bne.s   @FindHealPriority_Loop ; no match found, so decrement and check again
@Done:
                
                movem.l (sp)+,d0-d5/d7-a6
                rts

    ; End of function CalculateHealTargetPriority

