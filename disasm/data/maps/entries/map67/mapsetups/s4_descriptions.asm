
; ASM FILE data\maps\entries\map67\mapsetups\s4_descriptions.asm :
; 0x4FCCE..0x4FD42 : 

; =============== S U B R O U T I N E =======================================


ms_map67_AreaDescriptions:
                
                move.w  #$1B2,d3        ; "Nothing special there.{W1}"
                lea     byte_4FCDE(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function ms_map67_AreaDescriptions

byte_4FCDE:     msDescFunction 57, 23, Map67_DescFunc0-byte_4FCDE
                msDescEnd

; =============== S U B R O U T I N E =======================================


Map67_DescFunc0:
                
                 
                txt     424             ; "{NAME} investigated.{W2}{CLEAR}"
                chkFlg  751             ; Set after Elric opens the passage to Devil's Tail
                bne.s   byte_4FD3C      
                txt     2590            ; "There's a wobbly rock.{W1}"
                clsTxt
                move.w  ((CURRENT_SPEECH_SFX-$1000000)).w,((SPEECH_SFX_COPY-$1000000)).w
                move.w  #7,d0
                jsr     GetEntityPortaitAndSpeechSfx
                move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
                move.w  d2,((CURRENT_SPEECH_SFX-$1000000)).w
                chkFlg  13              ; Elric joined
                bne.s   loc_4FD22
                jsr     LoadAndDisplayCurrentPortrait
                txt     2591            ; "That rock looks{N}suspicious....{W1}"
                bra.s   loc_4FD3A
loc_4FD22:
                
                move.w  #ALLY_ELRIC,d0
                jsr     j_GetCurrentHp
                tst.w   d1
                bne.s   loc_4FD3A
                jsr     LoadAndDisplayCurrentPortrait
                txt     2592            ; "Maybe {NAME;13} can{N}help us.{W1}"
loc_4FD3A:
                
                bra.s   return_4FD40
byte_4FD3C:
                
                txt     434             ; "Nothing special there.{W1}"
return_4FD40:
                
                rts

    ; End of function Map67_DescFunc0

