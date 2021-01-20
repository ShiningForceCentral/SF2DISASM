
; ASM FILE data\maps\entries\map31\mapsetups\s4_descriptions.asm :
; 0x5D574..0x5D60E : 

; =============== S U B R O U T I N E =======================================


ms_map31_AreaDescriptions:
                
                move.w  #$1045,d3       ; "A book...{N}MYSTERY OF NAZCA{W1}"
                lea     byte_5D584(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map31_AreaDescriptions

byte_5D584:     msDesc 8, 26, 4, 0      ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}MYSTERY OF NAZCA{W1}"
                msDesc 20, 22, 4, 1     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}A PAINTING FLIES{W1}"
                msDesc 4, 33, 5, 2      ; "{NAME} looked into{N}the well.{W2}{CLEAR}"
                                        ; "A dried up well.{W1}"
                msDesc 25, 18, 2, 3     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "WEAPONS SHOP{W1}"
                msDesc 26, 18, 2, 4     ; "{NAME} investigated{N}the sign.{W2}{CLEAR}"
                                        ; "ITEMS SHOP{W1}"
                msDescFunction 29, 5, Map31_DescFunc0-byte_5D584
                msDescFunctionD6 8, 3, $1, Map31_DescFunc1-byte_5D584
                msDescEnd

; =============== S U B R O U T I N E =======================================


Map31_DescFunc0:
                
                 
                chkFlg  832             ; Set after talking to the painter in Moun for the first time
                beq.s   return_5D5BC
                script  cs_5D732
return_5D5BC:
                
                rts

    ; End of function Map31_DescFunc0


; =============== S U B R O U T I N E =======================================


Map31_DescFunc1:
                
                 
                chkFlg  834             ; Set after making the Arm of Golem appear in Moun
                beq.s   return_5D60C
                chkFlg  835             ; Set after picking up the Arm of Golem in Moun
                bne.s   return_5D60C
                txt     2017            ; "{LEADER} found the Arm of{N}Golem.{W2}"
                txt     2018            ; "Pick it up?"
                jsr     j_YesNoPrompt
                tst.w   d0
                bne.s   byte_5D608      
                move.w  #$75,d0 
                moveq   #0,d1
                jsr     GetMandatoryItem
                btst    #0,d0
                bne.s   byte_5D5FE      
                setFlg  835             ; Set after picking up the Arm of Golem in Moun
                move.w  #$89,d0 
                jsr     MoveEntityOutOfMap
                bra.s   loc_5D606
byte_5D5FE:
                
                txt     2020            ; "But {LEADER}'s hands{N}are full.{W1}"
                txt     2023            ; "{LEADER} looks at the{N}Arm of Golem.{W1}"
loc_5D606:
                
                bra.s   return_5D60C
byte_5D608:
                
                txt     2023            ; "{LEADER} looks at the{N}Arm of Golem.{W1}"
return_5D60C:
                
                rts

    ; End of function Map31_DescFunc1

