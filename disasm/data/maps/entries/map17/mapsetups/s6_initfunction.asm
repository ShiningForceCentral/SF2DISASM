
; ASM FILE data\maps\entries\map17\mapsetups\s6_initfunction.asm :
; 0x52450..0x52530 : 

; =============== S U B R O U T I N E =======================================


ms_map17_InitFunction:
                
                 
                chkFlg  660             ; Set after initial wake-up in prison sequence
                bne.s   byte_52460      
                script  cs_5249E
                setFlg  660             ; Set after initial wake-up in prison sequence
byte_52460:
                
                chkFlg  663             ; Set after Galam and Lemon leave with their army
                beq.s   byte_52476      
                move.w  #$83,d0 
                jsr     MoveEntityOutOfMap
                script  cs_5247C
byte_52476:
                
                setFlg  611             ; Set after prison wake-up sequence IF 0297 is *not* also set
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
                textCursor 880
                reloadMap 52,1
                setPos ALLY_BOWIE,59,4,UP
                nextSingleText $0,ALLY_SARAH ; "Impossible!{N}Galam and Granseal are{N}allies!{W1}"
                nextSingleText $C0,132  ; "But it's true.  I'm a scholar.{N}I'm here because I tried{N}to stop him.{W1}"
                nextText $C0,133        ; "I'm a leader of the Galam{N}Army.  I disagreed with{N}the war and now I'm here.{W2}"
                nextText $C0,133        ; "What did your kingdom{N}do to Galam?{W2}"
                nextSingleText $C0,133  ; "What is the reason for this{N}war?{W1}"
                nextText $0,ALLY_KAZIN  ; "What about Sir Hawel?{N}He was killed by Galam!{W2}"
                nextSingleText $0,ALLY_KAZIN ; "What did Galam want?{N}What is Ground Seal?{W1}"
                nextSingleText $C0,132  ; "Ground Seal...do you know{N}what Ground Seal is?{W1}"
                nextSingleText $0,ALLY_CHESTER ; "What is Ground Seal?{N}Please tell me!{W1}"
                nextText $C0,132        ; "I heard King Galam say{N}those words.{W2}"
                nextSingleText $C0,132  ; "I just know that something{N}is being concealed.{W1}"
                loadMapFadeIn MAP_GALAM_CASTLE_INNER,52,1
                csWait 1
                playSound MUSIC_CASTLE
                fadeInB
                csWait 30
                setDest ALLY_BOWIE,59,5
                headshake ALLY_BOWIE
                nod ALLY_BOWIE
                nextSingleText $0,ALLY_BOWIE ; "(Yawn){W1}"
                setFacing ALLY_BOWIE,LEFT
                csWait 40
                setFacing ALLY_CHESTER,RIGHT
                textCursor 892
                nextText $0,ALLY_CHESTER ; "{LEADER}!{N}You finally woke up!{W2}"
                nextSingleText $0,ALLY_CHESTER ; "We're talking about{N}Ground Seal.{N}Please, join in.{W1}"
                setFacing ALLY_CHESTER,LEFT
                csc_end
