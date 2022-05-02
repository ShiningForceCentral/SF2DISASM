
; In: a0 = pointer to properties table, d1.b = object index, d2.w = number of properties
; Out: a0 = pointer to properties for object, or ccr carry-bit set if object was not found

                module
@Loop:          adda.w  d2,a0
                
FindSpecialPropertiesAddressForObject:
                cmpi.b  #$FF,(a0)
                beq.s   @NotFound
                cmp.b   (a0)+,d1
                bne.s   @Loop
                rts
                
@NotFound:      ori     #1,ccr
                rts
                modend
