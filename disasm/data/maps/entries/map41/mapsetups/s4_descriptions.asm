
; ASM FILE data\maps\entries\map41\mapsetups\s4_descriptions.asm :
; 0x5F40E..0x5F46C : 

; =============== S U B R O U T I N E =======================================


ms_map41_AreaDescriptions:
                
                move.w  #$DB7,d3        ; "A statue of a devil's head.{N}It looks ready to bite you.{W1}"
                lea     byte_5F41E(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map41_AreaDescriptions

byte_5F41E:     msDescFunctionD6 6, 7, $FF, Map41_DescFunc0-byte_5F41E
                msDescFunction 6, 7, Map41_DescFunc1-byte_5F41E
                msDescEnd

; =============== S U B R O U T I N E =======================================


Map41_DescFunc0:
                
                 
                chkFlg  930             ; Set after opening Devil's Head with the Force Sword
                bne.s   byte_5F44C      
                moveq   #$43,d1 ; force sword
                jsr     j_GetItemInventoryLocation ; check if force sword available in inventory ?
                cmpi.w  #$FFFF,d0
                bne.s   byte_5F446      
                txt     3511            ; "A statue of a devil's head.{N}It looks ready to bite you.{W1}"
                bra.s   loc_5F44A
byte_5F446:
                
                txt     3512            ; "A statue of a fierce{N}devil's head.  There's a{N}slit at its mouth.{W1}"
loc_5F44A:
                
                bra.s   return_5F454
byte_5F44C:
                
                txt     423             ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
                txt     412             ; "Nothing was there.{W1}"
return_5F454:
                
                rts

    ; End of function Map41_DescFunc0


; =============== S U B R O U T I N E =======================================


Map41_DescFunc1:
                
                 
                chkFlg  930             ; Set after opening Devil's Head with the Force Sword
                bne.s   byte_5F462      
                txt     3511            ; "A statue of a devil's head.{N}It looks ready to bite you.{W1}"
                bra.s   return_5F46A
byte_5F462:
                
                txt     423             ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
                txt     412             ; "Nothing was there.{W1}"
return_5F46A:
                
                rts

    ; End of function Map41_DescFunc1

