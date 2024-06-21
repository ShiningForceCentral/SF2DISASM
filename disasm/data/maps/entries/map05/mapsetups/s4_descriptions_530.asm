
; ASM FILE data\maps\entries\map05\mapsetups\s4_descriptions_530.asm :
; 0x60548..0x60606 : 

; =============== S U B R O U T I N E =======================================


ms_map5_flag530_AreaDescriptions:
                
                move.w  #$D9C,d3        ; "A poster...{N}PULL IT!  PUSH IT!{W1}"
                lea     byte_60558(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map5_flag530_AreaDescriptions

byte_60558:     msDesc 9, 15, 6, 0      ; "{NAME} looked at{N}the paper.{W2}{CLEAR}"
                                        ; "A poster...{N}PULL IT!  PUSH IT!{W1}"
                msDesc 10, 16, 4, 1     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}ANCIENT KINGDOMS{W1}"
                msDesc 11, 16, 4, 2     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}CIVILIZATIONS{W1}"
                msDesc 23, 50, 4, 3     ; "{NAME} investigated{N}the book shelves.{W2}{CLEAR}"
                                        ; "A book...{N}THE ANCIENT TOWER{W1}"
                msDescFunction 22, 11, Map5_212_DescFunc0-byte_60558
                msDescFunction 19, 33, Map5_212_DescFunc1-byte_60558
                msDescEnd
                dc.b $4E 
                dc.b $75 
                dc.b $4E 
                dc.b $75 

; =============== S U B R O U T I N E =======================================


Map5_212_DescFunc0:
                
                 
                chkFlg  940             ; Set after playing the piano in Yeel (during the late game)
                bne.s   return_6058E
                script  cs_60F64
return_6058E:
                
                rts

    ; End of function Map5_212_DescFunc0


; =============== S U B R O U T I N E =======================================


Map5_212_DescFunc1:
                
                 
                chkFlg  945             ; Set after recruiting Lemon in Yeel
                bne.s   byte_605C4      
                script  cs_6060E
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                move.w  #ALLY_LEMON,d0
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                jsr     LoadAndDisplayCurrentPortrait
                txt     3483            ; "I can't believe it!{N}I want to die, but I can't!{W1}"
                setFlg  945             ; Set after recruiting Lemon in Yeel
                bra.s   return_60604
byte_605C4:
                
                chkFlg  28              ; Lemon joined
                bne.s   loc_605EE
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                move.w  #ALLY_LEMON,d0
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                jsr     LoadAndDisplayCurrentPortrait
                txt     3483            ; "I can't believe it!{N}I want to die, but I can't!{W1}"
                bra.s   return_60604
loc_605EE:
                
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                clr.w   ((CURRENT_SPEECH_SFX-$1000000)).w
                clr.w   ((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     423             ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
                txt     4082            ; "A hole.{W1}"
return_60604:
                
                rts

    ; End of function Map5_212_DescFunc1

