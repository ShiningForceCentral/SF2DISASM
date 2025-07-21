
; ASM FILE code\common\tech\findspecialproperties-standard.asm :

; Out: a0 = pointer to properties for object, or ccr carry-bit set if object was not found
                module
                
; In: a0 = pointer to properties table, d1.b = object index, d2.w = offset to next object (i.e., number of properties)
@Loop1:         adda.w  d2,a0
                
FindSpecialPropertyBytesAddressForObject:
                cmpi.b  #TERMINATOR_BYTE,(a0)
                beq.s   @NotFound
                cmp.b   (a0)+,d1
                bne.s   @Loop1
                rts
                
; In: a0 = pointer to properties table, d1.w = object index, d2.w = offset to next object (i.e., number of properties * 2)
@Loop2:         adda.w  d2,a0
                
FindSpecialPropertyWordsAddressForObject:
                cmpi.w  #TERMINATOR_WORD,(a0)
                beq.s   @NotFound
                cmp.w   (a0)+,d1
                bne.s   @Loop2
                rts
                
@NotFound:      ori     #1,ccr
                rts
                modend
