
; ASM FILE data\maps\entries\map06\mapsetups\s4_descriptions.asm :
; 0x54D8A..0x54E4C : 

; =============== S U B R O U T I N E =======================================


ms_map6_AreaDescriptions:
                
                move.w  #$FF4,d3        ; "A book...{N}GREAT VOYAGE{W1}"
                lea     byte_54D9A(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map6_AreaDescriptions

byte_54D9A:     msDesc 5, 7, 4, 0       ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}GREAT VOYAGE{W1}"
                msDesc 6, 7, 4, 1       ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}FATHER CARPENTER{W1}"
                msDesc 4, 14, 4, 2      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}SOAP OPERAS{W1}"
                msDesc 5, 14, 4, 3      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A magazine...{N}HUNTER'S LIFE{W1}"
                msDesc 6, 14, 4, 4      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}DESPOTISM{W1}"
                msDesc 19, 6, 4, 5      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}AGRICULTURE{W1}"
                msDesc 17, 13, 2, 6     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "ITEMS{W1}"
                msDescFunction 16, 13, Map6_DescFunc0-byte_54D9A
                msDesc 29, 7, 2, 8      ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "WEAPONS{W1}"
                msDesc 20, 17, 4, 9     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}BUY AND SELL{W1}"
                msDescFunction 21, 24, Map6_DescFunc1-byte_54D9A
                msDescEnd

; =============== S U B R O U T I N E =======================================


Map6_DescFunc0:
                
                 
                chkFlg  702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                bne.s   loc_54DEE
                move.w  #$FFB,d0        ; It reads...{N}OUT TO LUNCH{W1}
                jsr     (DisplayText).w 
                bra.s   return_54E02
loc_54DEE:
                
                clr.w   ((TEXT_NAME_INDEX_1-$1000000)).w
                move.w  #$1A8,d0        ; {NAME} investigated.{W2}{CLEAR}
                jsr     (DisplayText).w 
                move.w  #$1B2,d0        ; Nothing special there.{W1}
                jsr     (DisplayText).w 
return_54E02:
                
                rts

    ; End of function Map6_DescFunc0


; =============== S U B R O U T I N E =======================================


Map6_DescFunc1:
                
                move.w  #$FFE,d0
                jsr     (DisplayText).w 
                jsr     j_YesNoPrompt
                tst.w   d0
                bne.s   return_54E4A
                ori.b   #0,d0
                sndCom  SFX_FALLING
                moveq   #$32,d0 
                jsr     (Sleep).w       
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                bne.s   loc_54E38
                sndCom  SFX_BLO
                move.w  #$FFF,d0
                jsr     (DisplayText).w 
                bra.s   return_54E4A
loc_54E38:
                
                moveq   #$32,d0 
                jsr     (Sleep).w       
                sndCom  SFX_BLO
                move.w  #$1000,d0
                jsr     (DisplayText).w 
return_54E4A:
                
                rts

    ; End of function Map6_DescFunc1

