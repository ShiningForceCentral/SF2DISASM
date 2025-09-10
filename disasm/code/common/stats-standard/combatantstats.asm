
; ASM FILE code\common\stats-standard\combatantstats.asm :
; Combatant stats functions

; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index
; 
; Out: a0 = address of name
;      d7.w = length of name


GetCombatantName:
                
                movem.l d0-d1/a1,-(sp)
                tst.b   d0
                bmi.s   @Enemy
                
                bsr.s   GetCombatantEntryAddress
                movea.l a0,a1
                lea     ((ALLY_NAME_LOADING_SPACE-$1000000)).w,a0
                moveq   #ALLYNAME_CHARACTERS_COUNTER,d0
                clr.w   d7
@CountNameLength_Loop:
                
                move.w  d7,d1
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                add.w   d1,d1
            endif
                move.b  (a1,d1.w),(a0,d7.w)     ; load ally name into temp space
                beq.s   @Done           ; break out of loop upon reaching end of name
                
                addq.w  #1,d7
                dbf     d0,@CountNameLength_Loop
                
                bra.s   @Done
@Enemy:
                
                clr.w   d1
                bsr.w   GetEnemy        
                getPointer p_table_EnemyNames, a0
                bsr.w   FindName        
@Done:
                
                movem.l (sp)+,d0-d1/a1
                rts

    ; End of function GetCombatantName


; =============== S U B R O U T I N E =======================================

; Get class type for ally d0.w -> d1.w


GetClassType:
                
                move.l  a0,-(sp)
                bsr.s   GetClass                    ; class index -> d1.w
                getPointer p_table_ClassTypes, a0
                move.b  (a0,d1.w),d1                ; 0,1,2,255 = Base, Promo, Special, Red Baron
                bpl.s   @Done
                
                moveq   #CLASSTYPE_SPECIAL,d1       ; handle Red Baron as a special class
@Done:          movea.l (sp)+,a0
                rts

    ; End of function GetClassType


; =============== S U B R O U T I N E =======================================

; Return the effective level (i.e., current + promoted extra levels) for combatant d0.b -> d1.w


CalculateEffectiveLevel:
                
                bsr.s   GetLevel
                tst.b   d0
                bmi.s   @Return ; return current level for enemies
                
                move.w  d1,-(sp)
                bsr.s   GetClassType
                movem.w (sp)+,d1
                beq.s   @Return ; return current level if ally is not promoted
                
                addi.w  #CHAR_CLASS_EXTRALEVEL,d1
@Return:        rts

    ; End of function CalculateEffectiveLevel


; =============== S U B R O U T I N E =======================================

; Get pointer to combatant d0.b's entry in RAM -> a0


GetCombatantEntryAddress:
                
                move.l  d0,-(sp)
                move.l  d1,-(sp)
                tst.b   d0
                bmi.s   @Enemy
                
                cmpi.b  #COMBATANT_ALLIES_SPACE_END_MINUS_ONE,d0
                bhi.s   @ErrorHandling
                
                bra.s   @GetAddress
@Enemy:
                
                cmpi.b  #COMBATANT_ENEMIES_SPACE_END,d0
                bhi.s   @ErrorHandling
                
                subi.b  #COMBATANT_ENEMIES_START_MINUS_ALLIES_SPACE_END,d0
@GetAddress:
                
                andi.w  #BYTE_MASK,d0
                mulu.w  #COMBATANT_DATA_ENTRY_SIZE,d0
                loadSavedDataAddress COMBATANT_DATA, a0
                adda.w  d0,a0
                move.l  (sp)+,d1
                move.l  (sp)+,d0
                rts
@ErrorHandling:
                
                move.l  (sp)+,d1
                move.l  (sp)+,d0
                move.l  #'CNUM',(ERRCODE_BYTE0).l
                move.l  (sp),(ERRCODE_BYTE4).l
                trap    #VINT_FUNCTIONS
                dc.w VINTS_DEACTIVATE
                dc.l 0
@InfiniteLoop:
                
                bra.s   @InfiniteLoop

    ; End of function GetCombatantEntryAddress


; =============== S U B R O U T I N E =======================================

; Get class index for combatant d0.b -> d1.w


GetClass:
                
                move.l  a0,-(sp)
                bsr.s   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_CLASS(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetClass


; =============== S U B R O U T I N E =======================================

; Get current level for combatant d0.b -> d1.w


GetLevel:
                
                move.l  a0,-(sp)
                bsr.s   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_LEVEL(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetLevel


; =============== S U B R O U T I N E =======================================


GetMaxHp:
                
                move.l  a0,-(sp)
                bsr.s   GetCombatantEntryAddress
                getSavedWord a0, d1, COMBATANT_OFFSET_HP_MAX
                tst.w   d1
                movea.l (sp)+,a0
                rts

    ; End of function GetMaxHp


; =============== S U B R O U T I N E =======================================


GetCurrentHp:
                
                move.l  a0,-(sp)
                bsr.s   GetCombatantEntryAddress
                getSavedWord a0, d1, COMBATANT_OFFSET_HP_CURRENT
                tst.w   d1
                movea.l (sp)+,a0
                rts

    ; End of function GetCurrentHp


; =============== S U B R O U T I N E =======================================


GetMaxMp:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_MP_MAX(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetMaxMp


; =============== S U B R O U T I N E =======================================


GetCurrentMp:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_MP_CURRENT(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetCurrentMp


; =============== S U B R O U T I N E =======================================


GetBaseAtt:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_ATT_BASE(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetBaseAtt


; =============== S U B R O U T I N E =======================================


GetCurrentAtt:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_ATT_CURRENT(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetCurrentAtt


; =============== S U B R O U T I N E =======================================


GetBaseDef:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_DEF_BASE(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetBaseDef


; =============== S U B R O U T I N E =======================================


GetCurrentDef:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_DEF_CURRENT(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetCurrentDef


; =============== S U B R O U T I N E =======================================


GetBaseAgi:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_AGI_BASE(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetBaseAgi


; =============== S U B R O U T I N E =======================================


GetCurrentAgi:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_AGI_CURRENT(a0),d1
                movea.l (sp)+,a0
                
                rts

    ; End of function GetCurrentAgi


; =============== S U B R O U T I N E =======================================


GetBaseMov:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_MOV_BASE(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetBaseMov


; =============== S U B R O U T I N E =======================================


GetCurrentMov:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_MOV_CURRENT(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetCurrentMov


; =============== S U B R O U T I N E =======================================


GetBaseResistance:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                getSavedWord a0, d1, COMBATANT_OFFSET_RESIST_BASE
                tst.w   d1
                movea.l (sp)+,a0
                rts

    ; End of function GetBaseResistance


; =============== S U B R O U T I N E =======================================


GetCurrentResistance:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                getSavedWord a0, d1, COMBATANT_OFFSET_RESIST_CURRENT
                tst.w   d1
                movea.l (sp)+,a0
                rts

    ; End of function GetCurrentResistance


; =============== S U B R O U T I N E =======================================


GetBaseProwess:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_PROWESS_BASE(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetBaseProwess


; =============== S U B R O U T I N E =======================================


GetCurrentProwess:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_PROWESS_CURRENT(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetCurrentProwess


; =============== S U B R O U T I N E =======================================


GetStatusEffects:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                getSavedWord a0, d1, COMBATANT_OFFSET_STATUSEFFECTS
                tst.w   d1
                movea.l (sp)+,a0
                rts

    ; End of function GetStatusEffects


; =============== S U B R O U T I N E =======================================


GetCombatantX:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_X(a0),d1
                ext.w   d1
                movea.l (sp)+,a0
                rts

    ; End of function GetCombatantX


; =============== S U B R O U T I N E =======================================


GetCombatantY:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_Y(a0),d1
                ext.w   d1
                movea.l (sp)+,a0
                rts

    ; End of function GetCombatantY


; =============== S U B R O U T I N E =======================================

; Get distance between two combatants on the battlefield (simple X and Y calculation, no obstructions.)
; 
;       In: d0.w = actor combatant
;           d1.w = target combatant
; 
;       Out: d2.w = distance in map blocks, or -1 if either combatant is positioned out of the battlefield


GetDistanceBetweenCombatants:
                
                movem.l d0-d1/d3-d5,-(sp)
                move.w  d1,d5
                bsr.s   GetCombatantX
                cmpi.b  #-1,d1
                beq.s   @loc_3
                
                move.w  d1,d2           ; d2.w = actor X
                
                bsr.s   GetCombatantY
                cmpi.b  #-1,d1
                beq.s   @loc_3
                
                move.w  d1,d3           ; d3.w = actor Y
                
                move.w  d5,d0
                bsr.s   GetCombatantX
                cmpi.b  #-1,d1
                beq.s   @loc_3
                
                move.w  d1,d4           ; d4.w = target X
                
                bsr.s   GetCombatantY
                cmpi.b  #-1,d1
                beq.s   @loc_3
                
                move.w  d1,d5           ; d5.w = target Y
                
                sub.w   d4,d2
                bhs.s   @loc_1
                
                neg.w   d2
@loc_1:         sub.w   d5,d3
                bhs.s   @loc_2
                
                neg.w   d3
@loc_2:         add.w   d3,d2
                bra.s   @Done
                
@loc_3:         moveq   #-1,d2
@Done:          movem.l (sp)+,d0-d1/d3-d5
                rts

    ; End of function GetDistanceBetweenCombatants


; =============== S U B R O U T I N E =======================================


GetCurrentExp:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_EXP(a0),d1
                movea.l (sp)+,a0
                rts

    ; End of function GetCurrentExp


; =============== S U B R O U T I N E =======================================

; Get movetype for combatant d0.w, shifted to the lower nibble position -> d1.w


GetMoveType:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_MOVETYPE_AND_AI(a0),d1
                lsr.b   #NIBBLE_SHIFT_COUNT,d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                movea.l (sp)+,a0
                rts

    ; End of function GetMoveType


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index  Out: CCR carry-bit clear if true


IsAirborneMoveType:
                
                movem.l d1-d2/a0,-(sp)
                lea     table_AirborneMovetypes(pc), a0
                bsr.s   GetMoveType
                moveq   #0,d2           ; zero property bytes
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                movem.l (sp)+,d1-d2/a0
                rts

    ; End of function IsAirborneMoveType


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index  Out: CCR carry-bit clear if true


IsArcherMoveType:
                
                movem.l d1-d2/a0,-(sp)
                lea     table_ArcherMovetypes(pc), a0
                bsr.s   GetMoveType
                moveq   #0,d2           ; zero property bytes
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                movem.l (sp)+,d1-d2/a0
                rts

    ; End of function IsArcherMoveType


; =============== S U B R O U T I N E =======================================

; Get AI commandset for combatant d0.w -> d1.w


GetAiCommandset:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_MOVETYPE_AND_AI(a0),d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                movea.l (sp)+,a0
                rts

    ; End of function GetAiCommandset


; =============== S U B R O U T I N E =======================================

; Out: d1.w = combatant index to follow, or first AI point if bit 6 is set
;      d2.w = second AI point


GetAiSpecialMoveOrders:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                getSavedWord a0, d1, COMBATANT_OFFSET_AI_SPECIAL_MOVE_ORDERS
                move.w  d1,d2
                lsr.w   #BYTE_SHIFT_COUNT,d1
                andi.w  #BYTE_MASK,d1
                andi.w  #BYTE_MASK,d2
                movea.l (sp)+,a0
                rts

    ; End of function GetAiSpecialMoveOrders


; =============== S U B R O U T I N E =======================================

; In: d0.w = combatant index
; Out: d1.w, d2.w = AI activation regions 1 and 2 indexes


GetAiRegion:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_AI_REGION(a0),d1
                move.b  d1,d2
                lsr.b   #NIBBLE_SHIFT_COUNT,d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d1
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d2
                movea.l (sp)+,a0
                rts

    ; End of function GetAiRegion


; =============== S U B R O U T I N E =======================================


GetActivationBitfield:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                getSavedWord a0, d1, COMBATANT_OFFSET_ACTIVATION_BITFIELD
                tst.w   d1
                movea.l (sp)+,a0
                rts

    ; End of function GetActivationBitfield


; =============== S U B R O U T I N E =======================================

; In: d0.b = combatant index
; Out: d1.w = enemy index, or -1 if not an enemy


GetEnemy:
                tst.b   d0
                bpl.s   @Exit
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                clr.w   d1
                move.b  COMBATANT_OFFSET_ENEMY_INDEX(a0),d1
                movea.l (sp)+,a0
                rts
@Exit:
                move.w  #-1,d1
                rts

    ; End of function GetEnemy


; =============== S U B R O U T I N E =======================================


GetKills:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                getSavedWord a0, d1, COMBATANT_OFFSET_ALLY_KILLS
                tst.w   d1
                movea.l (sp)+,a0
                rts

    ; End of function GetKills


; =============== S U B R O U T I N E =======================================


GetDefeats:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                getSavedWord a0, d1, COMBATANT_OFFSET_ALLY_DEFEATS
                tst.w   d1
                movea.l (sp)+,a0
                rts

    ; End of function GetDefeats


; =============== S U B R O U T I N E =======================================

; Load ally name into combatant data block.
;
; In: a0 = pointer to temporarily loaded name in RAM


LoadAllyName:
                
                tst.b   (a0)
                beq.s   @Return         ; skip copying name if entered string is null (and keep default name)
                
                movem.l d0/a0-a1,-(sp)
                lea     (a0),a1
                bsr.w   GetCombatantEntryAddress
                moveq   #ALLYNAME_CHARACTERS_COUNTER,d0
@Loop:
                
                setSavedByteWithPostIncrement (a1)+, a0
                dbf     d0,@Loop
                
                movem.l (sp)+,d0/a0-a1
@Return:
                
                rts

    ; End of function LoadAllyName


; =============== S U B R O U T I N E =======================================


SetClass:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_CLASS(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetClass


; =============== S U B R O U T I N E =======================================


SetLevel:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_LEVEL(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetLevel


; =============== S U B R O U T I N E =======================================


SetMaxHp:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                setSavedWord d1, a0, COMBATANT_OFFSET_HP_MAX
                movea.l (sp)+,a0
                rts

    ; End of function SetMaxHp


; =============== S U B R O U T I N E =======================================


SetCurrentHp:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                setSavedWord d1, a0, COMBATANT_OFFSET_HP_CURRENT
                movea.l (sp)+,a0
                rts

    ; End of function SetCurrentHp


; =============== S U B R O U T I N E =======================================


SetMaxMp:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_MP_MAX(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetMaxMp


; =============== S U B R O U T I N E =======================================


SetCurrentMp:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_MP_CURRENT(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetCurrentMp


; =============== S U B R O U T I N E =======================================


SetBaseAtt:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_ATT_BASE(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetBaseAtt


; =============== S U B R O U T I N E =======================================


SetCurrentAtt:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_ATT_CURRENT(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetCurrentAtt


; =============== S U B R O U T I N E =======================================


SetBaseDef:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_DEF_BASE(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetBaseDef


; =============== S U B R O U T I N E =======================================


SetCurrentDef:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_DEF_CURRENT(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetCurrentDef


; =============== S U B R O U T I N E =======================================


SetBaseAgi:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_AGI_BASE(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetBaseAgi


; =============== S U B R O U T I N E =======================================


SetCurrentAgi:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_AGI_CURRENT(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetCurrentAgi


; =============== S U B R O U T I N E =======================================


SetBaseMov:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_MOV_BASE(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetBaseMov


; =============== S U B R O U T I N E =======================================


SetCurrentMov:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_MOV_CURRENT(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetCurrentMov


; =============== S U B R O U T I N E =======================================


SetBaseResistance:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                setSavedWord d1, a0, COMBATANT_OFFSET_RESIST_BASE
                movea.l (sp)+,a0
                rts

    ; End of function SetBaseResistance


; =============== S U B R O U T I N E =======================================


SetCurrentResistance:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                setSavedWord d1, a0, COMBATANT_OFFSET_RESIST_CURRENT
                movea.l (sp)+,a0
                rts

    ; End of function SetCurrentResistance


; =============== S U B R O U T I N E =======================================


SetBaseProwess:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_PROWESS_BASE(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetBaseProwess


; =============== S U B R O U T I N E =======================================


SetCurrentProwess:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_PROWESS_CURRENT(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetCurrentProwess


; =============== S U B R O U T I N E =======================================


SetStatusEffects:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                setSavedWord d1, a0, COMBATANT_OFFSET_STATUSEFFECTS
                movea.l (sp)+,a0
                rts

    ; End of function SetStatusEffects


; =============== S U B R O U T I N E =======================================


SetCombatantX:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_X(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetCombatantX


; =============== S U B R O U T I N E =======================================


SetCombatantY:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_Y(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetCombatantY


; =============== S U B R O U T I N E =======================================


SetCurrentExp:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_EXP(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetCurrentExp


; =============== S U B R O U T I N E =======================================

; Set combined movetype and ai commandset when initializing an enemy.

SetMoveTypeAndAiCommandset:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_MOVETYPE_AND_AI(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetMoveTypeAndAiCommandset


; =============== S U B R O U T I N E =======================================


SetAiSpecialMoveOrders:
                
                movem.l d1-d2/a0,-(sp)
                lsl.w   #BYTE_SHIFT_COUNT,d1
                andi.w  #BYTE_MASK,d2
                or.w    d2,d1
                bsr.w   GetCombatantEntryAddress
                setSavedWord d1, a0, COMBATANT_OFFSET_AI_SPECIAL_MOVE_ORDERS
                movem.l (sp)+,d1-d2/a0
                rts

    ; End of function SetAiSpecialMoveOrders


; =============== S U B R O U T I N E =======================================


SetAiRegion:
                
                movem.l d1-d2/a0,-(sp)
                lsl.b   #NIBBLE_SHIFT_COUNT,d1
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d2
                or.b    d2,d1
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_AI_REGION(a0)
                movem.l (sp)+,d1-d2/a0
                rts

    ; End of function SetAiRegion


; =============== S U B R O U T I N E =======================================


SetActivationBitfield:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                setSavedWord d1, a0, COMBATANT_OFFSET_ACTIVATION_BITFIELD
                movea.l (sp)+,a0
                rts

    ; End of function SetActivationBitfield


; =============== S U B R O U T I N E =======================================


SetEnemyIndex:
                
                move.l  a0,-(sp)
                bsr.w   GetCombatantEntryAddress
                move.b  d1,COMBATANT_OFFSET_ENEMY_INDEX(a0)
                movea.l (sp)+,a0
                rts

    ; End of function SetEnemyIndex


; =============== S U B R O U T I N E =======================================


IncreaseMaxHp:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_HP,d6
                moveq   #COMBATANT_OFFSET_HP_MAX,d7
                bsr.s   IncreaseAndClampWord
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseMaxHp


; =============== S U B R O U T I N E =======================================


IncreaseCurrentHp:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                bsr.w   GetCombatantEntryAddress
                getSavedWord a0, d6, COMBATANT_OFFSET_HP_MAX
                moveq   #COMBATANT_OFFSET_HP_CURRENT,d7
                bsr.s   IncreaseAndClampWord
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentHp


; =============== S U B R O U T I N E =======================================

; Out: d1.w = stat value after increase


IncreaseAndClampWord:
                
                bsr.w   GetCombatantEntryAddress
                adda.w  d7,a0
                getSavedWord a0, d7
                add.w   d7,d1
                bcs.s   @MakeMaxValue   ; check if overflow to negative
                
                cmp.w   d6,d1           ; check if less or same than max
                bls.s   @Continue
@MakeMaxValue:
                
                move.w  d6,d1
                bra.s   @Done
@Continue:
                
                cmp.w   d5,d1
                bhs.s   @Done
                
                move.w  d5,d1           ; if below min, set to min
@Done:
                
                setSavedWord d1, a0
                rts

    ; End of function IncreaseAndClampWord


; =============== S U B R O U T I N E =======================================


IncreaseMaxMp:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_MP,d6
                moveq   #COMBATANT_OFFSET_MP_MAX,d7
                bsr.s   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseMaxMp


; =============== S U B R O U T I N E =======================================


IncreaseCurrentMp:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_MP_MAX(a0),d6
                moveq   #COMBATANT_OFFSET_MP_CURRENT,d7
                bsr.s   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentMp


; =============== S U B R O U T I N E =======================================


IncreaseBaseAtt:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_ATT,d6
                moveq   #COMBATANT_OFFSET_ATT_BASE,d7
                bsr.s   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseBaseAtt


; =============== S U B R O U T I N E =======================================


IncreaseCurrentAtt:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_ATT,d6
                moveq   #COMBATANT_OFFSET_ATT_CURRENT,d7
                bsr.s   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentAtt


; =============== S U B R O U T I N E =======================================


IncreaseBaseDef:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_DEF,d6
                moveq   #COMBATANT_OFFSET_DEF_BASE,d7
                bsr.s   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseBaseDef


; =============== S U B R O U T I N E =======================================


IncreaseCurrentDef:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_DEF,d6
                moveq   #COMBATANT_OFFSET_DEF_CURRENT,d7
                bsr.s   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentDef


; =============== S U B R O U T I N E =======================================

; Clamp d7.b of combatant d0's data + d1.b between d5.b and d6.b


IncreaseAndClampByte:
                
                bsr.w   GetCombatantEntryAddress
                add.b   (a0,d7.w),d1
                bcs.s   @MakeMaxValue   ; check if overflow to negative
                
                cmp.b   d6,d1           ; check if less or same than max
                bls.s   @Continue
@MakeMaxValue:
                
                move.b  d6,d1
                bra.s   @Done
@Continue:
                
                cmp.b   d5,d1
                bhs.s   @Done
                
                move.b  d5,d1           ; if below min, set to min
@Done:
                
                move.b  d1,(a0,d7.w)
                andi.w  #BYTE_MASK,d1
                rts

    ; End of function IncreaseAndClampByte


; =============== S U B R O U T I N E =======================================

; Increase current AGI while preserving the double turn bit.


IncreaseBaseAgi:
                
                movem.l d2-d3/d5-a0,-(sp)
                clr.w   d5
                moveq   #CHAR_STATCAP_AGI_BASE,d6
                moveq   #COMBATANT_OFFSET_AGI_BASE,d7
                bsr.s   IncreaseAndClamp7Bits
                movem.l (sp)+,d2-d3/d5-a0
                rts

    ; End of function IncreaseBaseAgi


; =============== S U B R O U T I N E =======================================

; Increase current AGI while preserving the double turn bit.


IncreaseCurrentAgi:
                
                movem.l d2-d3/d5-a0,-(sp)
                clr.w   d5
                moveq   #CHAR_STATCAP_AGI_CURRENT,d6
                moveq   #COMBATANT_OFFSET_AGI_CURRENT,d7
                bsr.s   IncreaseAndClamp7Bits
                movem.l (sp)+,d2-d3/d5-a0
                rts

    ; End of function IncreaseCurrentAgi


; =============== S U B R O U T I N E =======================================


IncreaseAndClamp7Bits:
                
                bsr.w   GetCombatantEntryAddress
                move.b  (a0,d7.w),d2
                move.b  d2,d3
                andi.b  #TWO_TURN_THRESHOLD,d3
                andi.b  #TURN_AGILITY_MASK,d2 
                add.b   d2,d1
                bcs.s   @MakeMaxValue
                
                cmp.b   d6,d1
                bls.s   @Continue
@MakeMaxValue:
                
                move.b  d6,d1
                bra.s   @Done
@Continue:
                
                cmp.b   d5,d1
                bhs.s   @Done
                
                move.b  d5,d1
@Done:
                
                or.b    d3,d1
                move.b  d1,(a0,d7.w)
                andi.w  #BYTE_MASK,d1
                rts

    ; End of function IncreaseAndClamp7Bits


; =============== S U B R O U T I N E =======================================


IncreaseBaseMov:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_MOV,d6
                moveq   #COMBATANT_OFFSET_MOV_BASE,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseBaseMov


; =============== S U B R O U T I N E =======================================


IncreaseCurrentMov:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_MOV,d6
                moveq   #COMBATANT_OFFSET_MOV_CURRENT,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseCurrentMov


; =============== S U B R O U T I N E =======================================


IncreaseExp:
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_EXP,d6
                moveq   #COMBATANT_OFFSET_EXP,d7
                bsr.w   IncreaseAndClampByte
                movem.l (sp)+,d5-a0
                rts

    ; End of function IncreaseExp


; =============== S U B R O U T I N E =======================================


IncreaseKills:
                
                tst.b   d0
                bmi.s   @Return
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #9999,d6
                moveq   #COMBATANT_OFFSET_ALLY_KILLS,d7
                bsr.w   IncreaseAndClampWord
                movem.l (sp)+,d5-a0
                
@Return:        rts

    ; End of function IncreaseKills


; =============== S U B R O U T I N E =======================================


IncreaseDefeats:
                
                tst.b   d0
                bmi.s   @Return
                
                movem.l d5-a0,-(sp)
                clr.w   d5
                move.w  #9999,d6
                moveq   #COMBATANT_OFFSET_ALLY_DEFEATS,d7
                bsr.w   IncreaseAndClampWord
                movem.l (sp)+,d5-a0
                
@Return:        rts

    ; End of function IncreaseDefeats


; =============== S U B R O U T I N E =======================================


DecreaseCurrentHp:
                
                movem.l d4-a0,-(sp)
                clr.w   d5
                bsr.w   GetCombatantEntryAddress
                getSavedWord a0, d6, COMBATANT_OFFSET_HP_MAX
                moveq   #COMBATANT_OFFSET_HP_CURRENT,d7
                bsr.s   DecreaseAndClampWord
                movem.l (sp)+,d4-a0
                rts

    ; End of function DecreaseCurrentHp


; =============== S U B R O U T I N E =======================================


DecreaseAndClampWord:
                
                bsr.w   GetCombatantEntryAddress
                move.w  d1,d4
                adda.w  d7,a0
                getSavedWord a0, d1
                sub.w   d4,d1
                bcs.s   @MakeMinValue   ; check if less than value
                
                cmp.w   d5,d1
                bhs.s   @CheckForMaxValue ; compare to min
@MakeMinValue:
                
                move.w  d5,d1           ; set to min
                bra.s   @Continue
@CheckForMaxValue:
                
                cmp.w   d6,d1
                bls.s   @Continue
                
                move.w  d6,d1           ; if above max, set to max
@Continue:
                
                setSavedWord d1, a0
                rts

    ; End of function DecreaseAndClampWord


; =============== S U B R O U T I N E =======================================


DecreaseCurrentMp:
                
                movem.l d4-a0,-(sp)
                clr.w   d5
                bsr.w   GetCombatantEntryAddress
                move.b  COMBATANT_OFFSET_MP_MAX(a0),d6
                moveq   #COMBATANT_OFFSET_MP_CURRENT,d7
                bsr.s   DecreaseAndClampByte
                movem.l (sp)+,d4-a0
                rts

    ; End of function DecreaseCurrentMp


; =============== S U B R O U T I N E =======================================


DecreaseCurrentAtt:
                
                movem.l d4-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_ATT,d6
                moveq   #COMBATANT_OFFSET_ATT_CURRENT,d7
                bsr.s   DecreaseAndClampByte
                movem.l (sp)+,d4-a0
                rts

    ; End of function DecreaseCurrentAtt


; =============== S U B R O U T I N E =======================================


DecreaseCurrentDef:
                
                movem.l d4-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_DEF,d6
                moveq   #COMBATANT_OFFSET_DEF_CURRENT,d7
                bsr.s   DecreaseAndClampByte
                movem.l (sp)+,d4-a0
                rts

    ; End of function DecreaseCurrentDef


; =============== S U B R O U T I N E =======================================

; Clamp d7.b of combatant d0's data - d1.b between d5.b and d6.b


DecreaseAndClampByte:
                
                bsr.w   GetCombatantEntryAddress
                move.b  d1,d4
                move.b  (a0,d7.w),d1
                sub.b   d4,d1
                bcs.s   @MakeMinValue
                
                cmp.b   d5,d1
                bhs.s   @CheckForMaxValue
@MakeMinValue:
                
                move.b  d5,d1
                bra.s   @Continue
@CheckForMaxValue:
                
                cmp.b   d6,d1
                bls.s   @Continue
                
                move.b  d6,d1           ; if above max, set to max
@Continue:
                
                move.b  d1,(a0,d7.w)
                andi.w  #BYTE_MASK,d1
                rts

    ; End of function DecreaseAndClampByte


; =============== S U B R O U T I N E =======================================

; Decrease current AGI while preserving the double turn bit.


DecreaseCurrentAgi:
                
                movem.l d2-d3/d5-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_AGI_DECREASING,d6
                moveq   #COMBATANT_OFFSET_AGI_CURRENT,d7
                bsr.s   DecreaseAndClamp7Bits
                movem.l (sp)+,d2-d3/d5-a0
                rts

    ; End of function DecreaseCurrentAgi


; =============== S U B R O U T I N E =======================================


DecreaseAndClamp7Bits:
                
                bsr.w   GetCombatantEntryAddress
                move.b  d1,d3
                move.b  (a0,d7.w),d1
                move.b  d1,d2
                andi.b  #TWO_TURN_THRESHOLD,d2
                andi.b  #TURN_AGILITY_MASK,d1
                sub.b   d3,d1
                bcs.s   @MakeMinValue
                
                cmp.b   d5,d1
                bhs.s   @CheckForMaxValue
@MakeMinValue:
                
                move.b  d5,d1
                bra.s   @Continue
@CheckForMaxValue:
                
                cmp.b   d6,d1
                bls.s   @Continue
                
                move.b  d6,d1
@Continue:
                
                or.b    d2,d1
                move.b  d1,(a0,d7.w)
                andi.w  #BYTE_MASK,d1
                rts

    ; End of function IncreaseAndClamp7Bits


; =============== S U B R O U T I N E =======================================


DecreaseBaseMov:
                
                movem.l d4-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_MOV,d6
                moveq   #COMBATANT_OFFSET_MOV_BASE,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d4-a0
                rts

    ; End of function DecreaseCurrentMov


; =============== S U B R O U T I N E =======================================


DecreaseCurrentMov:
                
                movem.l d4-a0,-(sp)
                clr.w   d5
                move.w  #CHAR_STATCAP_MOV,d6
                moveq   #COMBATANT_OFFSET_MOV_CURRENT,d7
                bsr.w   DecreaseAndClampByte
                movem.l (sp)+,d4-a0
                rts

    ; End of function DecreaseCurrentMov

