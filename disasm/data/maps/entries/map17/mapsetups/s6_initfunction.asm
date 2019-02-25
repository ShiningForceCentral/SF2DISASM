
; ASM FILE data\maps\entries\map17\mapsetups\s6_initfunction.asm :
; 0x52450..0x52530 : 

; =============== S U B R O U T I N E =======================================

ms_map17_InitFunction:
                
                 
                chkFlg  $294            ; Set after initial wake-up in prison sequence
                bne.s   byte_52460      
                script  cs_5249E
                setFlg  $294            ; Set after initial wake-up in prison sequence
byte_52460:
                
                chkFlg  $297            ; Set after Galam and Lemon leave with their army
                beq.s   byte_52476      
                move.w  #$83,d0 
                jsr     MoveEntityOutOfMap
                script  cs_5247C
byte_52476:
                
                setFlg  $263            ; Set after prison wake-up sequence IF 0297 is *not* also set
                rts

	; End of function ms_map17_InitFunction

cs_5247C:       setBlocks 48,7,1,1,48,8
                setBlocks 62,20,1,2,48,20
                setBlocks 57,7,1,1,57,8
                setBlocks 62,20,1,2,57,20
                csc_end
cs_5249E:       playSound $FD
                resetForceBattleStats
                resetMap
                loadEntitiesFromMapSetup 0,0,RIGHT
                csWait 60
                fadeInB
                textCursor $370
                reloadMap 52,1
                setPos $0,59,4,UP
                nextSingleText $0,$1    ; "Impossible!{N}Galam and Granseal are{N}allies!{W1}"
                nextSingleText $C0,$84  ; "But it's true.  I'm a scholar.{N}I'm here because I tried{N}to stop him.{W1}"
                nextText $C0,$85        ; "I'm a leader of the Galam{N}Army.  I disagreed with{N}the war and now I'm here.{W2}"
                nextText $C0,$85        ; "What did your kingdom{N}do to Galam?{W2}"
                nextSingleText $C0,$85  ; "What is the reason for this{N}war?{W1}"
                nextText $0,$4          ; "What about Sir Hawel?{N}He was killed by Galam!{W2}"
                nextSingleText $0,$4    ; "What did Galam want?{N}What is Ground Seal?{W1}"
                nextSingleText $C0,$84  ; "Ground Seal...do you know{N}what Ground Seal is?{W1}"
                nextSingleText $0,$2    ; "What is Ground Seal?{N}Please tell me!{W1}"
                nextText $C0,$84        ; "I heard King Galam say{N}those words.{W2}"
                nextSingleText $C0,$84  ; "I just know that something{N}is being concealed.{W1}"
                loadMapFadeIn 17,52,1
                csWait 1
                playSound MUSIC_CASTLE
                fadeInB
                csWait 30
                setDest $0,59,5
                headshake $0
                nod $0
                nextSingleText $0,$0    ; "(Yawn){W1}"
                setFacing $0,LEFT
                csWait 40
                setFacing $2,RIGHT
                textCursor $37C
                nextText $0,$2          ; "{LEADER}!{N}You finally woke up!{W2}"
                nextSingleText $0,$2    ; "We're talking about{N}Ground Seal.{N}Please, join in.{W1}"
                setFacing $2,LEFT
                csc_end
