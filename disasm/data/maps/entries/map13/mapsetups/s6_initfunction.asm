
; ASM FILE data\maps\entries\map13\mapsetups\s6_initfunction.asm :
; 0x582E0..0x58330 : 

; =============== S U B R O U T I N E =======================================


ms_map13_InitFunction:
                
                 
                chkFlg  711             ; Set after you dislodge the turtle/fairy in Polca, also set after you speak to Volcanon
                bne.s   byte_582EC      
                script  cs_58310
byte_582EC:
                
                chkFlg  716             ; Set after your raft-giving conversation with the mayor in Polca
                beq.s   byte_582FE      
                move.w  #$89,d0 
                moveq   #3,d1
                jsr     sub_4781A       
byte_582FE:
                
                chkFlg  718             ; Set after Oddler runs after you as you leave Polca, and tags along
                beq.s   return_5830E
                move.w  #$8C,d0 
                jsr     MoveEntityOutOfMap
return_5830E:
                
                rts

    ; End of function ms_map13_InitFunction

cs_58310:       setFacing 130,DOWN
                customActscriptWait 130
                 ac_motion OFF          ;   
                 ac_orientRight         ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                startEntity 130
                csc_end
