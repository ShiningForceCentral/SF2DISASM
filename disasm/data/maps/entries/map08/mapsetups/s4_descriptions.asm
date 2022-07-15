
; ASM FILE data\maps\entries\map08\mapsetups\s4_descriptions.asm :
; 0x561EC..0x562E0 : 

; =============== S U B R O U T I N E =======================================


ms_map8_AreaDescriptions:
                
                move.w  #$546,d3        ; "It reads...{N}NO STRANGERS!{N}-Shopkeeper{W1}"
                lea     byte_561FC(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map8_AreaDescriptions

byte_561FC:     msDesc 5, 15, 2, 11     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "WEAPONS AND ITEMS{N}BY HASSAN{W1}"
                msDesc 27, 15, 5, 12    ; "{NAME} looked into{N}the well.{W2}{CLEAR}"
                                        ; "A very deep well.{W1}"
                msDescFunction 6, 15, Map8_DescFunc0-byte_561FC
                msDescFunction 7, 15, Map8_DescFunc0-byte_561FC
                msDescFunction 7, 25, Map8_DescFunc2-byte_561FC
                msDescFunction 25, 12, Map8_DescFunc2-byte_561FC
                msDescFunction 22, 24, Map8_DescFunc2-byte_561FC
                msDesc 6, 25, 6, 3      ; "{NAME} looked at{N}the paper.{W2}{CLEAR}"
                                        ; "Historian Paseran{W1}"
                msDesc 26, 12, 6, 6     ; "{NAME} looked at{N}the paper.{W2}{CLEAR}"
                                        ; "Historian Keseran{W1}"
                msDescFunction 24, 8, Map8_DescFunc5-byte_561FC
                msDescFunction 15, 18, Map8_DescFunc6-byte_561FC
                msDescFunction 16, 18, Map8_DescFunc6-byte_561FC
                msDescEnd

; =============== S U B R O U T I N E =======================================


Map8_DescFunc0:
                
                 
                chkFlg  708             ; Set after the scene in Ribble where the mayor confronts Bowie
                bne.s   loc_56256
                move.w  #$546,d0        ; It reads...{N}NO STRANGERS!{N}-Shopkeeper{W1}
                jsr     (DisplayText).w 
                bra.s   return_5626A
loc_56256:
                
                clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #$1A8,d0        ; {NAME} investigated.{W2}{CLEAR}
                jsr     (DisplayText).w 
                move.w  #$1B2,d0        ; Nothing special there.{W1}
                jsr     (DisplayText).w 
return_5626A:
                
                rts

    ; End of function Map8_DescFunc0


; =============== S U B R O U T I N E =======================================


Map8_DescFunc2:
                
                 
                chkFlg  708             ; Set after the scene in Ribble where the mayor confronts Bowie
                bne.s   loc_56284
                move.w  #$547,d0        ; {LEADER} checks the door.{W2}
                jsr     (DisplayText).w 
                move.w  #$548,d0        ; It's locked.{W1}
                jsr     (DisplayText).w 
                bra.s   return_56298
loc_56284:
                
                clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #$1A8,d0        ; {NAME} investigated.{W2}{CLEAR}
                jsr     (DisplayText).w 
                move.w  #$1B2,d0        ; Nothing special there.{W1}
                jsr     (DisplayText).w 
return_56298:
                
                rts

    ; End of function Map8_DescFunc2


; =============== S U B R O U T I N E =======================================


Map8_DescFunc5:
                
                move.w  #$54D,d0        ; Found Keseran's diary.{N}{LEADER} reads it.{W2}
                jsr     (DisplayText).w 
                move.w  #$54E,d0        ; I spent another day{N}searching for it....{N}I'LL NEVER GIVE UP!{W2}
                jsr     (DisplayText).w 
                move.w  #$54F,d0        ; I'll find the Caravan, even{N}if I have to travel all over{N}the continent!{W2}
                jsr     (DisplayText).w 
                move.w  #$550,d0        ; I need the Achilles Sword{N}to defeat the giant Taros{N}in the shrine!{W1}
                jmp     (DisplayText).w 

    ; End of function Map8_DescFunc5


; =============== S U B R O U T I N E =======================================

; set after you open the tree in Ribble with the wooden plank


Map8_DescFunc6:
                
                 
                chkFlg  731             ; Set after you open the tree in Ribble with the wooden plank
                bne.s   loc_562CA
                move.w  #$54A,d0        ; There's a hollow to put{N}something into!{W1}
                jmp     (DisplayText).w 
                bra.s   return_562DE
loc_562CA:
                
                clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #$1A8,d0        ; {NAME} investigated.{W2}{CLEAR}
                jsr     (DisplayText).w 
                move.w  #$1B2,d0        ; Nothing special there.{W1}
                jsr     (DisplayText).w 
return_562DE:
                
                rts

    ; End of function Map8_DescFunc6

