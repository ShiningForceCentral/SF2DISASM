; ---------------------------------------------------------------------------
; Cutscene Macros
; One macro per cutscene command
; Maybe also aliases when needed for more efficiency in writing cutscenes
; ---------------------------------------------------------------------------


csWait: macro
    dc.b $80
    dc.b \1 ; duration
    endm

nextSingleText: macro
    dc.w $00
    dc.b \1 ; portrait modifier ($0-none, $40-mirrored, $80-display on right, $FF-undisplayed)
    dc.b \2 ; entity
    endm
    
nextSingleTextVar: macro
    dc.w $01
    dc.b \1 ; 
    dc.b \2 ; 
    dc.b \3 ; 
    dc.b \4 ; 
    endm
    
nextText: macro
    dc.w $02
    dc.b \1 ; portrait modifier ($0-none, $40-mirrored, $80-display on right, $FF-undisplayed)
    dc.b \2 ; entity
    endm
    
nextTextVar: macro
    dc.w $03
    dc.b \1 ; 
    dc.b \2 ; 
    dc.b \3 ; 
    dc.b \4 ; 
    dc.w \5 ; 
    endm
        
textCursor: macro
    dc.w $04
    dc.w \1 ; text line to load
    endm
    
playSound: macro
    dc.w $05
    dc.w \1 ; music/sound/command to start
    endm
    
csc06: macro
    dc.w $06
    endm
    
warp: macro
    dc.w $07
    dc.b \1 ; destination map
    dc.b \2 ; X
    dc.b \3 ; Y
    dc.b \4 ; facing
    endm
    
join: macro
    dc.w $08
    dc.w \1 ; ally index and sad join modifier (special case: 128-Sarah & Chester)
    endm
    
hideText: macro
    dc.w $09
    endm
    
executeSubroutine: macro
    dc.w $0A
    dc.l \1 ; subroutine address
    endm
    
jump: macro
    dc.w $0B
    dc.l \1 ; address to jump to
    endm
    
jumpIfFlagSet: macro
    dc.w $0C
    dc.w \1 ; associated flag
    dc.l \2 ; address to jump to
    endm
    
jumpIfFlagClear: macro
    dc.w $0D
    dc.w \1 ; associated flag
    dc.l \2 ; address to jump to
    endm
    
jumpIfDefeatedByLastAttack: macro
    dc.w $0E
    dc.w \1 ; 
    dc.l \2 ; 
    endm
    
jumpIfDead: macro
    dc.w $0F
    dc.w \1 ; 
    dc.l \2 ; 
    endm
    
csc10: macro
    dc.w $10
    dc.w \1 ; associated flag
    dc.w \2 ; set or clear
    endm
    
setF: macro ;alias
    csc10 \1,$FFFF
    endm
    
clearF: macro ;alias
    csc10 \1,0
    endm
    
yesNo: macro
    dc.w $11
    endm
    
menu: macro
    dc.w $12
    dc.w \1 ; 
    endm
    
setStoryFlag: macro
    dc.w $13
    dc.w \1 ; battle index to unlock
    endm
    
csc14: macro
    dc.w $14
    dc.b \1 ; entity to act
    dc.b \2 ; 
    endm
    
customActscript: macro ;alias
    csc14 \1,0
    endm    
    
customActscriptWait: macro ;alias
    csc14 \1,$FF
    endm    
    
csc15: macro
    dc.w $15
    dc.b \1 ; entity to act
    dc.b \2 ; 
    dc.l \3 ; action script to execute
    endm
    
setActscript: macro ;alias
    csc15 \1,0,\2
    endm    
    
setActscriptWait: macro ;alias
    csc15 \1,$FF,\2
    endm    
    
waitIdle: macro
    dc.w $16
    dc.w \1 ; entity to act
    endm
    
setPosFlash: macro
    dc.w $17
    dc.b \1 ; entity to act
    dc.b \2 ; X
    dc.b \3 ; Y
    dc.b \4 ; facing
    endm
    
entityFlashWhite: macro
    dc.w $18
    dc.w \1 ; entity to act
    dc.w \2 ; duration
    endm
    
setPos: macro
    dc.w $19
    dc.b \1 ; entity to act
    dc.b \2 ; X
    dc.b \3 ; Y
    dc.b \4 ; facing
    endm
    
setSprite: macro
    dc.w $1A
    dc.w \1 ; entity to act
    dc.w \2 ; new mapsprite
    endm
    
startEntity: macro
    dc.w $1B
    dc.w \1 ; entity to act
    endm
    
stopEntity: macro
    dc.w $1C
    dc.w \1 ; entity to act
    endm
    
showPortrait: macro
    dc.w $1D
    dc.b \1 ; portrait modifier ($0-none, $40-mirrored, $80-display on right, $FF-undisplayed)
    dc.b \2 ; entity
    endm
    
hidePortrait: macro
    dc.w $1E
    endm
    
allyDefeated: macro
    dc.w $1F
    dc.w \1 ; 
    endm
    
updateDefeatedAllies: macro
    dc.w $20
    endm
    
reviveAlly: macro
    dc.w $21
    dc.w \1 ; 
    endm
    
animEntityFX: macro
    dc.w $22
    dc.w \1 ; entity to act
    defineShorthand.w ENTITY_TRANSITION_,\2 ; transition type
    endm 
    
setFacing: macro
    dc.w $23
    dc.b \1 ; entity to act
    dc.b \2 ; facing
    endm
    
setCameraEntity: macro
    dc.w $24
    dc.w \1 ; target entity
    endm
    
cloneEntity: macro
    dc.w $25
    dc.w \1 ; copied entity
    dc.w \2 ; entity clone
    endm
    
nod: macro
    dc.w $26
    dc.w \1 ; entity to act
    endm
    
headshake: macro
    dc.w $27
    dc.w \1 ; entity to act
    endm
        
moveNextToPlayer: macro
    dc.w $28
    dc.w \1 ; entity to act
    dc.w \2 ; direction adjacent to player
    endm
    
setDest: macro
    dc.w $29
    dc.w \1 ; entity to act
    dc.w \2 ; X
    dc.w \3 ; Y
    endm
    
shiver: macro
    dc.w $2A
    dc.w \1 ; entity to act
    endm
    
newEntity: macro
    dc.w $2B
    dc.w \1 ; entity number
    dc.b \2 ; X
    dc.b \3 ; Y
    dc.b \4 ; facing
    dc.b \5 ; mapsprite
    endm
    
followEntity: macro
    dc.w $2C
    dc.w \1 ; follower
    dc.w \2 ; who to follow
    dc.w \3 ; relative place (1-, 2-behind, 3-, 5-, 6-)
    endm
    
csc2D: macro
    dc.w $2D
    dc.b \1 ; entity to act
    dc.b \2 ; 
    endm
        
entityActions: macro ;alias
    csc2D \1,0
    endm
        
entityActionsWait: macro ;alias
    csc2D \1,$FF
    endm
    
hide: macro
    dc.w $2E
    dc.w \1 ; entity to act
    endm
    
fly: macro
    dc.w $2F
    dc.w \1 ; entity
    dc.w \2 ; layer priority  ($0-normal, $FFFF-roof layer)
    endm
    
removeShadow: macro
    dc.w $30
    dc.w \1 ; target entity
    endm
    
moveEntityAboveAnother: macro
    dc.w $31
    dc.w \1 ; 
    dc.w \2 ; 
    endm
    
setCamDest: macro
    dc.w $32
    dc.w \1 ; X (left border)
    dc.w \2 ; Y (top border)
    endm
    
setQuake: macro
    dc.w $33
    dc.w \1 ; ? ($4000-, $8000-
    endm
    
setBlocks: macro
    dc.w $34
    dc.b \1 ; source x
    dc.b \2 ; source y
    dc.b \3 ; width
    dc.b \4 ; height
    dc.b \5 ; destination x
    dc.b \6 ; destination y
    endm
    
setBlocksVar: macro
    dc.w $35
    dc.b \1 ; source x
    dc.b \2 ; source y
    dc.b \3 ; width
    dc.b \4 ; height
    dc.b \5 ; destination x
    dc.b \6 ; destination y
    endm
    
resetMap: macro
    dc.w $36
    endm
    
loadMapFadeIn: macro
    dc.w $37
    dc.w \1 ; map
    dc.w \2 ; camera X
    dc.w \3 ; camera Y
    endm
    
fadeInB: macro
    dc.w $39
    endm
    
fadeOutB: macro
    dc.w $3A
    endm
    
slowFadeInB: macro
    dc.w $3B
    endm
    
slowFadeOutB: macro
    dc.w $3C
    endm
    
tintMap: macro
    dc.w $3D
    endm
    
flickerOnce: macro
    dc.w $3E
    endm
    
mapFadeOutToWhite: macro
    dc.w $3F
    endm
    
mapFadeInFromWhite: macro
    dc.w $40
    endm
    
flashScreenWhite: macro
    dc.w $41
    dc.w \1 ; duration
    endm
    
loadMapEntities: macro
    dc.w $42
    dc.l \1 ; address of entity table
    endm
    
roofEvent: macro
    dc.w $43
    dc.w \1 ; trigger X
    dc.w \2 ; trigger Y
    endm
    
reloadEntities: macro
    dc.w $44
    dc.l \1 ; address of entity table
    endm
    
cameraSpeed: macro
    dc.w $45
    dc.w \1 ; ($8-, $10-, $20-, $28-, $30-, $38-, $40-)
    endm
    
reloadMap: macro
    dc.w $46
    dc.w \1 ; camera X
    dc.w \2 ; camera Y
    endm
    
stepEvent: macro
    dc.w $47
    dc.w \1 ; trigger X
    dc.w \2 ; trigger Y
    endm
    
mapLoad: macro
    dc.w $48
    dc.w \1 ; map
    dc.w \2 ; camera X
    dc.w \3 ; camera Y
    endm
    
loadEntitiesFromMapSetup: macro
    dc.w $49
    dc.w \1 ; 
    dc.w \2 ; 
    dc.w \3 ; 
    endm
    
fadeInFromBlackHalf: macro
    dc.w $4A
    endm
    
fadeOutToBlackHalf: macro
    dc.w $4B
    endm
    
setSize: macro
    dc.w $50
    dc.w \1 ; entity to act
    dc.w \2 ; size in pixels
    endm
    
joinBatParty: macro
    dc.w $51
    dc.w \1 ; entity
    endm
    
faceEntity: macro
    dc.w $52
    dc.w \1 ; entity to act
    dc.w \2 ; entity to face
    endm
    
setPriority: macro
    dc.w $53
    dc.w \1 ; entity
    dc.w \2 ; priority layer ($0 - bottom layer, $FF-top layer)
    endm
    
joinForceAI: macro
    dc.w $54
    dc.w \1 ; entity
    dc.w \2 ; AI status (0:on, -1:off)
    endm
    
resetForceBattleStats: macro
    dc.w $55
    endm
    
addNewFollower: macro
    dc.w $56
    dc.w \1 ; following entity
    endm
    
; 

moveRight: macro
    dc.b $00
    dc.b \1 ; amount to move
    endm
    
moveUp: macro
    dc.b $01
    dc.b \1 ; amount to move
    endm
    
moveLeft: macro
    dc.b $02
    dc.b \1 ; amount to move
    endm
    
moveDown: macro
    dc.b $03
    dc.b \1 ; amount to move
    endm
    
moveUpRight: macro
    dc.b $04
    dc.b \1 ; amount to move
    endm
    
moveUpLeft: macro
    dc.b $05
    dc.b \1 ; amount to move
    endm
    
moveDownLeft: macro
    dc.b $06
    dc.b \1 ; amount to move
    endm
    
moveDownRight: macro
    dc.b $07
    dc.b \1 ; amount to move
    endm
    
faceRight: macro
    dc.b $08
    dc.b \1 ; duration
    endm
    
faceUp: macro
    dc.b $09
    dc.b \1 ; duration
    endm
    
faceLeft: macro
    dc.b $0A
    dc.b \1 ; duration
    endm
    
faceDown: macro
    dc.b $0B
    dc.b \1 ; duration
    endm
    
eaWait: macro
    dc.b $0C
    dc.b \1 ; duration
    endm
    
jumpUp: macro
    dc.b $0D
    dc.b \1 ; duration
    endm
    
jumpRight: macro
    dc.b $0E
    dc.b \1 ; duration
    endm
    
jumpLeft: macro
    dc.b $0F
    dc.b \1 ; duration
    endm

endActions: macro
    dc.w $8080
    endm
    
cscNop: macro
    endm

csc_end: macro
    dc.w $FFFF
    endm


; entity data structure

mainEntity: macro
    dc.w \1 ; X
    dc.w \2 ; Y
    dc.w \3 ; facing
    endm

entity: macro
    dc.b \1 ; X
    dc.b \2 ; Y
    dc.b \3 ; facing
    dc.b \4 ; mapsprite
    dc.l \5 ; action script
    endm
    
cscEntitiesEnd: macro
    dc.w $FFFF
    align
    endm
    
entityRandomWalk: macro
    dc.b \1 ; X
    dc.b \2 ; Y
    dc.b \3 ; facing
    dc.b \4 ; mapsprite
    dc.b $FF
    dc.b \5 ; origin X
    dc.b \6 ; origin Y
    dc.b \7 ; range to walk
    endm    
    
    
; entity actscript commands    
    
ac_end: macro
    dc.w $8080
    endm

ac_wait: macro
    dc.w 0
    dc.w \1 ; duration
    endm
 
ac_waitDest: macro
    dc.w 1
    endm

ac_controlCharacter: macro
    dc.w 2
    endm

ac_follow: macro
    dc.w 3
    dc.w \1 ; entity to follow
    dc.w \2 ; relative X (pixels)
    dc.w \3 ; relative Y (pixels)
    endm

ac_moveRel: macro
    dc.w 4
    dc.w \1 ; relative X destination
    dc.w \2 ; relative Y destination
    endm

ac_moveAbs: macro
    dc.w 5
    dc.w \1 ; X destination
    dc.w \2 ; Y destination
    endm

ac_randomWalk: macro
    dc.w 6
    dc.w \1 ; X speed
    dc.w \2 ; Y speed
    dc.w \3 ; 
    endm

ac_controlRaft: macro
    dc.w 7
    endm

ac_controlCaravan: macro
    dc.w 8
    endm

ac_moveFacRelPos: macro
    dc.w 9
    dc.w \1 ; 
    dc.w \2 ; 
    endm

ac_updateSprite: macro
    dc.w $A
    endm

ac_setSize: macro
    dc.w $B
    dc.w \1 ; size in pixels
    endm

ac_setPos: macro
    dc.w $C
    dc.w \1 ; X (in map tiles)
    dc.w \2 ; Y (in map tiles)
    endm

ac_clonePos: macro
    dc.w $D
    dc.w \1 ; entity to clone
    endm

ac_moveEntFacRelPos: macro
    dc.w $E
    dc.w \1 ; entity
    dc.w \2 ; 
    dc.w \3 ; 
    endm

ac_waitDestEntity: macro
    dc.w $F
    dc.w \1 ; 
    endm

ac_setSpeed: macro
    dc.w $10
    dc.b \1 ; X speed
    dc.b \2 ; Y speed
    endm

ac_accelFactors: macro
    dc.w $11
    dc.b \1 ; X
    dc.b \2 ; Y
    endm

ac_acceleration: macro
    dc.w $12
    dc.b \1&$FF ; 
    dc.b \2&$FF ; 
    endm

ac_deceleration: macro
    dc.w $13
    dc.b \1&$FF ; 
    dc.b \2&$FF ; 
    endm

ac_motion: macro
    dc.w $14
    dc.w \1 ; state ON/OFF
    endm

ac_autoFacing: macro
    dc.w $15
    dc.w \1 ; state ON/OFF
    endm

ac_setId: macro
    dc.w $16
    dc.w \1 ; 
    endm

ac_setSprite: macro
    dc.w $17
    dc.w \1 ; mapsprite
    endm

ac_entityObstructable: macro
    dc.w $18
    dc.w \1 ; state ON/OFF
    endm

ac_mapUncollidable: macro
    dc.w $19
    dc.w \1 ; state ON/OFF
    endm

ac_entityUncollidable: macro
    dc.w $1A
    dc.w \1 ; state ON/OFF
    endm

ac_orientUp: macro
    dc.w $1B
    dc.w 0
    endm

ac_orientLeft: macro
    dc.w $1B
    dc.w 1
    endm

ac_orientDown: macro
    dc.w $1B
    dc.w 2
    endm

ac_orientRight: macro
    dc.w $1B
    dc.w 3
    endm

ac_transparency: macro
    dc.w $1C
    dc.w \1 ; state ON/OFF
    endm

ac_setGhost: macro
    dc.w $1D
    dc.w \1 ; 
    endm

ac_animSpeedX2: macro
    dc.w $1E
    dc.w \1 ; state ON/OFF
    endm

ac_resizable: macro
    dc.w $1F
    dc.w \1 ; state ON/OFF
    endm

ac_immersed: macro
    dc.w $20
    dc.w \1 ; state ON/OFF
    endm

ac_set1Cb4: macro
    dc.w $21
    dc.w \1 ; 
    endm

ac_setFacing: macro
    dc.w $22
    dc.w \1 ; facing
    endm

ac_soundCommand: macro
    dc.w $23
    dc.w \1 ; sound
    endm

ac_branch: macro
    dc.w $30
    endm

ac_jump: macro
    dc.w $34
    dc.l \1 ; address
    endm

ac_checkMapBlockCopy: macro
    dc.w $40
    endm

ac_pass: macro
    dc.w $41
    dc.w \1 ; 
    endm

    
    