
; ASM FILE data\maps\entries\map33\mapsetups\s6_initfunction.asm :
; 0x5AB7C..0x5AC56 : 

; =============== S U B R O U T I N E =======================================


ms_map33_InitFunction:
                
                 
                chkFlg  523             ; Battle 23 completed - BATTLE_VERSUS_WILLARD              
                beq.s   byte_5AB98      
                chkFlg  783             ; Set after the scene where Creed restores the Force and heads down the basement
                bne.s   byte_5AB98      
                script  cs_5B016
                setFlg  783             ; Set after the scene where Creed restores the Force and heads down the basement
                move.b  #9,((EGRESS_MAP_INDEX-$1000000)).w
byte_5AB98:
                
                chkFlg  22              ; Frayja joined
                beq.s   byte_5ABB2      
                script  cs_5ABA8
                bra.w   loc_5ABB0
cs_5ABA8:
                
                setPos 128,14,14,UP
                csc_end
loc_5ABB0:
                
                bra.s   byte_5ABEE      
byte_5ABB2:
                
                chkFlg  784             ; Set after the event in the basement of Creed's Mansion
                beq.s   byte_5ABBC      
                nop
                bra.s   byte_5ABEE      
byte_5ABBC:
                
                chkFlg  783             ; Set after the scene where Creed restores the Force and heads down the basement
                beq.s   byte_5ABD6      
                script  cs_5ABCC
                bra.w   loc_5ABD4
cs_5ABCC:
                
                setPos 128,17,10,DOWN
                csc_end
loc_5ABD4:
                
                bra.s   byte_5ABEE      
byte_5ABD6:
                
                chkFlg  774             ; Set after the first scene with Goliath at Creed's Mansion
                beq.s   byte_5ABEE      
                script  cs_5ABE6
                bra.w   byte_5ABEE      
cs_5ABE6:
                
                setPos 128,17,12,DOWN
                csc_end
byte_5ABEE:
                
                chkFlg  784             ; Set after the event in the basement of Creed's Mansion
                beq.s   return_5AC54
                chkFlg  14              ; Eric joined
                bne.s   byte_5AC0C      
                script  cs_5AC04
                bra.w   byte_5AC0C      
cs_5AC04:
                
                setPos ALLY_ERIC,15,14,DOWN
                csc_end
byte_5AC0C:
                
                chkFlg  16              ; Ranfolf joined
                bne.s   byte_5AC24      
                script  cs_5AC1C
                bra.w   byte_5AC24      
cs_5AC1C:
                
                setPos ALLY_RANDOLF,16,15,DOWN
                csc_end
byte_5AC24:
                
                chkFlg  17              ; Tyrin joined
                bne.s   byte_5AC3C      
                script  cs_5AC34
                bra.w   byte_5AC3C      
cs_5AC34:
                
                setPos ALLY_TYRIN,18,15,DOWN
                csc_end
byte_5AC3C:
                
                chkFlg  15              ; Karna joined
                bne.s   return_5AC54
                script  cs_5AC4C
                bra.w   return_5AC54
cs_5AC4C:
                
                setPos ALLY_KARNA,19,14,DOWN
                csc_end
return_5AC54:
                
                rts

    ; End of function ms_map33_InitFunction

