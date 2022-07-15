
; ASM FILE data\maps\entries\map05\mapsetups\s6_initfunction_530.asm :
; 0x6061E..0x60708 : 

; =============== S U B R O U T I N E =======================================


ms_map5_flag530_InitFunction:
                
                 
                chkFlg  944             ; Set after Lemon jumps off the cliff in Yeel
                bne.s   byte_60630
                script  cs_607DE
                setFlg  944             ; Set after Lemon jumps off the cliff in Yeel
                bra.s   ms_map5_flag28_InitFunction
byte_60630:
                
                script  cs_6060E
ms_map5_flag28_InitFunction:
                
                chkFlg  942             ; Set after the scene in underground Yeel where Chaz paces and consults books
                bne.s   byte_6067C      
                cmpi.l  #$6005580,((ENTITY_DATA-$1000000)).w
                bne.s   byte_6067C      
                chkFlg  28              ; Lemon joined
                beq.s   byte_6065E
                script  cs_60656
                bra.w   byte_6065E
cs_60656:
                
                setPos ALLY_LEMON,27,55,UP
                csc_end
byte_6065E:
                
                script  cs_60C42
                chkFlg  930             ; Set after opening Devil's Head with the Force Sword
                beq.s   byte_60672
                script  cs_60EB2
                bra.s   byte_60678      
byte_60672:
                
                script  cs_60CA4
byte_60678:
                
                setFlg  942             ; Set after the scene in underground Yeel where Chaz paces and consults books
byte_6067C:
                
                chkFlg  27              ; Chaz joined
                beq.s   byte_6068C      
                move.w  #$1B,d0
                jsr     MoveEntityOutOfMap
byte_6068C:
                
                chkFlg  944             ; Set after Lemon jumps off the cliff in Yeel
                bne.s   byte_6069C      
                move.w  #$82,d0 
                jsr     MoveEntityOutOfMap
byte_6069C:
                
                chkFlg  941             ; Set after Chaz and the priest go downstars in Yeel
                beq.s   byte_606B4      
                script  cs_606AC
                bra.w   byte_606B4      
cs_606AC:
                
                setPos 128,26,50,DOWN
                csc_end
byte_606B4:
                
                chkFlg  28              ; Lemon joined
                beq.s   byte_606BE      
                setFlg  945             ; Set after recruiting Lemon in Yeel
byte_606BE:
                
                chkFlg  940             ; Set after playing the piano in Yeel (during the late game)
                beq.s   return_606E8
                chkFlg  941             ; Set after Chaz and the priest go downstars in Yeel
                bne.s   return_606E8
                script  cs_606EA
                chkFlg  28              ; Lemon joined
                beq.s   return_606E8
                script  cs_606E0
                bra.w   return_606E8
cs_606E0:
                
                setPos ALLY_LEMON,11,10,UP
                csc_end
return_606E8:
                
                rts

    ; End of function ms_map5_flag530_InitFunction

cs_606EA:       setPos ALLY_BOWIE,11,10,UP
                setPos ALLY_PETER,11,10,UP
                setPos FOLLOWER_B,11,10,UP
                csWait 1
                reloadMap 5,4
                csWait 10
                csc_end
