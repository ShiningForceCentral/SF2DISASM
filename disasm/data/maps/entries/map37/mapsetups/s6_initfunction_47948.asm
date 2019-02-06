
; ASM FILE data\maps\entries\map37\mapsetups\s6_initfunction_47948.asm :
; 0x47948..0x47992 : Map 37 init function

; =============== S U B R O U T I N E =======================================

InitNazcaShipForceMembers:
                
                movem.l d0-a2,-(sp)
                moveq   #1,d0
                moveq   #$1C,d7
                lea     ((OTHER_ENTITIES-$1000000)).w,a0
                lea     byte_47A38(pc), a2
loc_47958:
                
                move.w  d0,d1
                jsr     j_CheckFlag
                bne.s   loc_47982
                move.w  #$5E80,d2
                move.w  d2,(a0)
                move.w  d2,ENTITYDEF_OFFSET_Y(a0)
                move.w  d2,ENTITYDEF_OFFSET_XDEST(a0)
                move.w  d2,ENTITYDEF_OFFSET_YDEST(a0)
                move.b  #3,ENTITYDEF_OFFSET_FACING(a0)
                move.l  #eas_Idle,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
loc_47982:
                
                addq.w  #1,d0
                lea     $20(a0),a0
                dbf     d7,loc_47958
                movem.l (sp)+,d0-a2
                rts

	; End of function InitNazcaShipForceMembers

