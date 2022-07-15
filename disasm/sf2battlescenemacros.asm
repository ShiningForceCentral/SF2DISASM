; ---------------------------------------------------------------------------
; Battle Scene Command Macros
; ---------------------------------------------------------------------------
    
writeBscParam: macro
    if (instr('\1','(a')=0)
    move.w  \1,(a6)+
    else
    move.b  #0,(a6)+
    move.b  \1,(a6)+
    endc
    endm
    
animateEnemyAction: macro
    move.w  #0,(a6)+
    writeBscParam \1
    writeBscParam \2
    endm
    
animateAllyAction: macro
    move.w  #1,(a6)+
    writeBscParam \1
    writeBscParam \2
    endm
    
moveEnemyBattleSprite: macro
    move.w  #2,(a6)+
    writeBscParam \1
    endm
    
moveAllyBattleSprite: macro
    move.w  #3,(a6)+
    writeBscParam \1
    endm
    
makeEnemyIdle: macro
    move.w  #4,(a6)+
    endm
    
makeAllyIdle: macro
    move.w  #5,(a6)+
    endm
    
switchEnemies: macro
    move.w  #6,(a6)+
    writeBscParam \1
    writeBscParam \2
    endm
    
switchAllies: macro
    move.w  #7,(a6)+
    writeBscParam \1
    writeBscParam \2
    endm
    
switchToEnemyAlone: macro
    move.w  #8,(a6)+
    writeBscParam \1
    endm
    
switchToAllyAlone: macro
    move.w  #9,(a6)+
    writeBscParam \1
    endm
    
executeEnemyReaction: macro
    move.w  #$A,(a6)+
    writeBscParam \1
    writeBscParam \2
    writeBscParam \3
    writeBscParam \4
    endm
    
executeAllyReaction: macro
    move.w  #$B,(a6)+
    writeBscParam \1
    writeBscParam \2
    writeBscParam \3
    writeBscParam \4
    endm
    
makeActorIdleAndEndAnimation: macro
    move.w  #$C,(a6)+
    endm
    
endAnimation: macro
    move.w  #$D,(a6)+
    endm
    
bscWait: macro
    move.w  #$E,(a6)+
    writeBscParam \1
    endm
    
giveEXP: macro
    move.w  #$F,(a6)+
    writeBscParam \1
    endm
    
displayMessage: macro
    move.w  #$10,(a6)+
    writeBscParam \1
    writeBscParam \2
    writeBscParam \3
    move.w  #0,(a6)+
    writeBscParam \4
    endm
    
displayMessageWithNoWait: macro
    move.w  #$11,(a6)+
    writeBscParam \1
    writeBscParam \2
    writeBscParam \3
    move.w  #0,(a6)+
    writeBscParam \4
    endm
    
bscHideTextBox: macro
    move.w  #$12,(a6)+
    endm
    
bscWaitForPlayerInput: macro
    move.w  #$13,(a6)+
    endm
    
bscNullCommand: macro
    move.w  #$14,(a6)+
    endm
    
bscEnd: macro
    move.w  #$FFFF,(a6)+
    endm
    