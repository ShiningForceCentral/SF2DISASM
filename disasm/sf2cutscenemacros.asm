; ---------------------------------------------------------------------------
; Cutscene Macros
; One macro per cutscene command
; Maybe also aliases when needed for more efficiency in writing cutscenes
; ---------------------------------------------------------------------------


csWait:	macro
	dc.b $80
	dc.b \1
	endm

csc00:	macro
	dc.w $00
	dc.b \1
	dc.b \2
	endm

nextSingleText:	macro ;alias
	csc00 \1,\2
	endm
	
csc01:	macro
	dc.w $01
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	endm

nextSingleTextVar:	macro ;alias
	csc01 \1,\2,\3,\4 
	endm
	
csc02:	macro
	dc.w $02
	dc.b \1
	dc.b \2
	endm
	
nextText:	macro ;alias
	csc02 \1,\2
	endm	
	
csc03:	macro
	dc.w $03
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	dc.w \5
	endm

nextTextVar:	macro ;alias
	csc03 \1,\2,\3,\4,\5 
	endm
		
csc04:	macro
	dc.w $04
	dc.w \1
	endm
	
textCursor:	macro ;alias
	csc04 \1
	endm		
	
csc05:	macro
	dc.w $05
	dc.w \1
	endm
	
playSound:	macro ;alias
	csc05 \1
	endm		
	
csc06:	macro
	dc.w $06
	endm
	
csc07:	macro
	dc.w $07
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	endm
	
warp:	macro ;alias
	csc07 \1,\2,\3,\4
	endm
	
csc08:	macro
	dc.w $08
	dc.w \1
	endm
	
join:	macro ;alias
	csc08 \1
	endm
	
csc09:	macro
	dc.w $09
	endm
	
hideText:	macro ;alias
	csc09
	endm	
	
csc0A:	macro
	dc.w $0A
	dc.l \1
	endm
	
executeSubroutine:	macro ;alias
	csc0A \1
	endm
	
csc0B:	macro
	dc.w $0B
	dc.l \1
	endm
	
jump:	macro ;alias
	csc0B \1
	endm	
	
csc0C:	macro
	dc.w $0C
	dc.w \1
	dc.l \2
	endm
	
jumpIfFlagSet:	macro ;alias
	csc0C \1,\2
	endm	
	
csc0D:	macro
	dc.w $0D
	dc.w \1
	dc.l \2
	endm
	
jumpIfFlagClear:	macro ;alias
	csc0D \1,\2
	endm	
	
csc0E:	macro
	dc.w $0E
	dc.w \1
	dc.l \2
	endm
	
jumpIfDefeated:	macro ;alias
	csc0E \1,\2
	endm	
	
csc0F:	macro
	dc.w $0F
	dc.w \1
	dc.l \2
	endm
	
jumpIfAlive:	macro ;alias
	csc0F \1,\2
	endm	
	
csc10:	macro
	dc.w $10
	dc.w \1
	dc.w \2
	endm
	
setF:	macro ;alias
	csc10 \1,$FFFF
	endm
	
clearF:	macro ;alias
	csc10 \1,0
	endm
	
csc11:	macro
	dc.w $11
	endm
	
yesNo:	macro ;alias
	csc11
	endm
	
csc12:	macro
	dc.w $12
	dc.w \1
	endm
	
menu:	macro ;alias
	csc12 \1
	endm
	
csc13:	macro
	dc.w $13
	dc.w \1
	endm
	
setStoryFlag:	macro ;alias
	csc13 \1
	endm
	
csc14:	macro
	dc.w $14
	dc.b \1
	dc.b \2
	endm
	
customActscript:	macro ;alias
	csc14 \1,0
	endm	
	
customActscriptWait:	macro ;alias
	csc14 \1,$FF
	endm	
	
csc15:	macro
	dc.w $15
	dc.b \1
	dc.b \2
	dc.l \3
	endm
	
setActscript:	macro ;alias
	csc15 \1,0,\2
	endm	
	
setActscriptWait:	macro ;alias
	csc15 \1,$FF,\2
	endm	
	
csc16:	macro
	dc.w $16
	dc.w \1
	endm
	
waitIdle:	macro ;alias
	csc16 \1
	endm
	
csc17:	macro
	dc.w $17
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	endm
	
setPosFlash:	macro ;alias
	csc17 \1,\2,\3,\4
	endm
	
csc18:	macro
	dc.w $18
	dc.w \1
	dc.w \2
	endm
	
entityFlashWhite:	macro ;alias
	csc18 \1,\2
	endm	
	
csc19:	macro
	dc.w $19
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	endm

setPos:	macro ;alias
	csc19 \1,\2,\3,\4
	endm
	
csc1A:	macro
	dc.w $1A
	dc.w \1
	dc.w \2
	endm

setSprite:	macro ;alias
	csc1A \1,\2
	endm
	
csc1B:	macro
	dc.w $1B
	dc.w \1
	endm
	
startEntity:	macro ;alias
	csc1B \1
	endm	
	
csc1C:	macro
	dc.w $1C
	dc.w \1
	endm
	
stopEntity:	macro ;alias
	csc1C \1
	endm		
	
csc1D:	macro
	dc.w $1D
	dc.b \1
    dc.b \2
	endm
	
showPortrait:	macro ;alias
	csc1D \1,\2
	endm		
	
csc1E:	macro
	dc.w $1E
	endm
	
hidePortrait:	macro ;alias
	csc1E
	endm	
	
csc1F:	macro
	dc.w $1F
	dc.w \1
	endm
	
allyDefeated:	macro ;alias
	csc1F \1
	endm	
	
csc20:	macro
	dc.w $20
	endm
	
updateDefeatedAllies:	macro ;alias
	csc20
	endm	
	
csc21:	macro
	dc.w $21
	dc.w \1
	endm
	
reviveAlly:	macro ;alias
	csc21 \1
	endm	
	
csc22:	macro
	dc.w $22
	dc.w \1
	dc.w \2
	endm
		
animEntityFX:	macro ;alias
	csc22 \1,\2
	endm	
	
csc23:	macro
	dc.w $23
	dc.b \1
	dc.b \2
	endm
		
setFacing:	macro ;alias
	csc23 \1,\2
	endm	
	
csc24:	macro
	dc.w $24
	dc.w \1
	endm
		
setCameraEntity:	macro ;alias
	csc24 \1
	endm	
	
csc25:	macro
	dc.w $25
	dc.w \1
	dc.w \2
	endm
		
cloneEntity:	macro ;alias
	csc25 \1,\2
	endm	
	
csc26:	macro
	dc.w $26
	dc.w \1
	endm
	
nod:	macro ;alias
	csc26 \1
	endm	
	
csc27:	macro
	dc.w $27
	dc.w \1
	endm
	
headshake:	macro ;alias
	csc27 \1
	endm
		
csc28:	macro
	dc.w $28
	dc.w \1
	dc.w \2
	endm
		
moveNextToPlayer:	macro ;alias
	csc28 \1,\2
	endm	
	
csc29:	macro
	dc.w $29
	dc.w \1
	dc.w \2
	dc.w \3
	endm
		
setDest:	macro ;alias
	csc29 \1,\2,\3
	endm	
	
csc2A:	macro
	dc.w $2A
	dc.w \1
	endm
		
shiver:	macro ;alias
	csc2A \1
	endm	
	
csc2B:	macro
	dc.w $2B
	dc.w \1
	dc.b \2
	dc.b \3
	dc.b \4
	dc.b \5
	endm	
	
newEntity:	macro ;alias
	csc2B \1,\2,\3,\4,\5
	endm	
	
csc2C:	macro
	dc.w $2C
	dc.w \1
	dc.w \2
	dc.w \3
	endm
		
followEntity:	macro ;alias
	csc2C \1,\2,\3
	endm
	
csc2D:	macro
	dc.w $2D
	dc.b \1
	dc.b \2
	endm
		
entityActions:	macro ;alias
	csc2D \1,0
	endm
		
entityActionsWait:	macro ;alias
	csc2D \1,$FF
	endm
	
moveRight:	macro
	dc.b $00
	dc.b \1
	endm
	
moveUp:	macro
	dc.b $01
	dc.b \1
	endm
	
moveLeft:	macro
	dc.b $02
	dc.b \1
	endm
	
moveDown:	macro
	dc.b $03
	dc.b \1
	endm
	
moveUpRight:	macro
	dc.b $04
	dc.b \1
	endm
	
moveUpLeft:	macro
	dc.b $05
	dc.b \1
	endm
	
moveDownLeft:	macro
	dc.b $06
	dc.b \1
	endm
	
moveDownRight:	macro
	dc.b $07
	dc.b \1
	endm
	
faceRight:	macro
	dc.b $08
	dc.b \1
	endm
	
faceUp:	macro
	dc.b $09
	dc.b \1
	endm
	
faceLeft:	macro
	dc.b $0A
	dc.b \1
	endm
	
faceDown:	macro
	dc.b $0B
	dc.b \1
	endm
	
eaWait:	macro
	dc.b $0C
	dc.b \1
	endm
	
jumpUp:	macro
	dc.b $0D
	dc.b \1
	endm
	
jumpRight:	macro
	dc.b $0E
	dc.b \1
	endm
	
jumpLeft:	macro
	dc.b $0F
	dc.b \1
	endm

endActions:	macro
	dc.w $8080
	endm
	
csc2E:	macro
	dc.w $2E
	dc.w \1
	endm
		
hide:	macro ;alias
	csc2E \1
	endm
	
csc2F:	macro
	dc.w $2F
	dc.w \1
	dc.w \2
	endm
		
fly:	macro ;alias
	csc2F \1,\2
	endm
	
csc30:	macro
	dc.w $30
	dc.w \1
	endm
		
removeShadow:	macro ;alias
	csc30 \1
	endm
	
csc31:	macro
	dc.w $31
	dc.w \1
	dc.w \2
	endm
		
moveEntityAboveAnother:	macro ;alias
	csc31 \1,\2
	endm
	
csc32:	macro
	dc.w $32
	dc.w \1
	dc.w \2
	endm
		
setCamDest:	macro ;alias
	csc32 \1,\2
	endm
	
csc33:	macro
	dc.w $33
	dc.w \1
	endm
		
setQuake:	macro ;alias
	csc33 \1
	endm
	
csc34:	macro
	dc.w $34
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	dc.b \5
	dc.b \6
	endm
	
setBlocks:	macro ;alias
	csc34 \1,\2,\3,\4,\5,\6
	endm	
	
csc35:	macro
	dc.w $35
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	dc.b \5
	dc.b \6
	endm
	
setBlocksVar:	macro ;alias
	csc35 \1,\2,\3,\4,\5,\6
	endm	
	
csc36:	macro
	dc.w $36
	endm
	
resetMap:	macro ;alias
	csc36
	endm	
	
csc37:	macro
	dc.w $37
	dc.w \1
	dc.w \2
	dc.w \3
	endm

loadMapFadeIn:	macro ;alias
	csc37 \1,\2,\3
	endm		
	
csc39:	macro
	dc.w $39
	endm
	
fadeInB:	macro ;alias
	csc39
	endm	
	
csc3A:	macro
	dc.w $3A
	endm
	
fadeOutB:	macro ;alias
	csc3A
	endm
	
csc3B:	macro
	dc.w $3B
	endm
	
slowFadeInB:	macro ;alias
	csc3B
	endm
	
csc3C:	macro
	dc.w $3C
	endm
	
slowFadeOutB:	macro ;alias
	csc3C
	endm
	
csc3D:	macro
	dc.w $3D
	endm
	
tintMap:	macro ;alias
	csc3D
	endm
	
csc3E:	macro
	dc.w $3E
	endm
	
flickerOnce:	macro ;alias
	csc3E
	endm
	
csc3F:	macro
	dc.w $3F
	endm
	
mapFadeOutToWhite:	macro ;alias
	csc3F
	endm
	
csc40:	macro
	dc.w $40
	endm
	
mapFadeInFromWhite:	macro ;alias
	csc40
	endm
	
csc41:	macro
	dc.w $41
	dc.w \1
	endm
	
flashScreenWhite:	macro ;alias
	csc41 \1
	endm
	
csc42:	macro
	dc.w $42
	dc.l \1
	endm
	
loadMapEntities:	macro ;alias
	csc42 \1
	endm
	
csc43:	macro
	dc.w $43
	dc.w \1
	dc.w \2
	endm
	
roofEvent:	macro ;alias
	csc43 \1,\2
	endm
	
csc44:	macro
	dc.w $44
	dc.l \1
	endm
	
reloadEntities:	macro ;alias
	csc44 \1
	endm
	
csc45:	macro
	dc.w $45
	dc.w \1
	endm
	
cameraSpeed:	macro ;alias
	csc45 \1
	endm
	
csc46:	macro
	dc.w $46
	dc.w \1
	dc.w \2
	endm
	
reloadMap:	macro ;alias
	csc46 \1,\2
	endm	
	
csc47:	macro
	dc.w $47
	dc.w \1
	dc.w \2
	endm
	
stepEvent:	macro ;alias
	csc47 \1,\2
	endm
	
csc48:	macro
	dc.w $48
	dc.w \1
	dc.w \2
	dc.w \3
	endm
	
mapLoad:	macro ;alias
	csc48 \1,\2,\3
	endm	
	
csc49:	macro
	dc.w $49
	dc.w \1
	dc.w \2
	dc.w \3
	endm
	
loadEntitiesFromMapSetup:	macro ;alias
	csc49 \1,\2,\3
	endm	
	
csc4A:	macro
	dc.w $4A
	endm
	
fadeInFromBlackHalf:	macro ;alias
	csc4A
	endm
	
csc4B:	macro
	dc.w $4B
	endm
	
fadeOutToBlackHalf:	macro ;alias
	csc4B
	endm
	
csc50:	macro
	dc.w $50
	dc.w \1
	dc.w \2
	endm
	
setSize:	macro ;alias
	csc50 \1,\2
	endm	
	
csc51:	macro
	dc.w $51
	dc.w \1
	endm
	
joinBatParty:	macro ;alias
	csc51 \1
	endm	
	
csc52:	macro
	dc.w $52
	dc.w \1
	dc.w \2
	endm
	
faceEntity:	macro ;alias
	csc52 \1,\2
	endm	
	
csc53:	macro
	dc.w $53
	dc.w \1
	dc.w \2
	endm
	
setPriority:	macro ;alias
	csc53 \1,\2
	endm	
	
csc54:	macro
	dc.w $54
	dc.w \1
	dc.w \2
	endm
	
joinForceAI:	macro ;alias
	csc54 \1,\2
	endm	
	
csc55:	macro
	dc.w $55
	endm
	
resetForceBattleStats:	macro ;alias
	csc55
	endm	
	
csc56:	macro
	dc.w $56
	dc.w \1
	endm
	
addNewFollower:	macro ;alias
	csc56 \1
	endm
	
cscNop:	macro
	endm

csc_end:	macro
	dc.w $FFFF
	endm


; entity data structure

mainEntity:	macro
	dc.w \1
	dc.w \2
	dc.w \3
	endm

entity:		macro
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	dc.l \5
	endm
	
entityRandomWalk:	macro
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	dc.b $FF
	dc.b \5
	dc.b \6
	dc.b \7
	endm	
	
	
; entity actscript commands	
	
ac_end:	macro
	dc.w $8080
	endm

ac_wait:	macro
	dc.w 0
	dc.w \1
	endm
 
ac_waitDest:	macro
	dc.w 1
	endm

ac_controlCharacter:	macro
	dc.w 2
	endm

ac_follow:	macro
	dc.w 3
	dc.w \1
	dc.w \2
	dc.w \3
	endm

ac_moveRel:	macro
	dc.w 4
	dc.w \1
	dc.w \2
	endm

ac_moveAbs:	macro
	dc.w 5
	dc.w \1
	dc.w \2
	endm

ac_randomWalk:	macro
	dc.w 6
	dc.w \1
	dc.w \2
	dc.w \3
	endm

ac_controlRaft:	macro
	dc.w 7
	endm

ac_controlCaravan:	macro
	dc.w 8
	endm

ac_moveFacRelPos:	macro
	dc.w 9
	dc.w \1
	dc.w \2
	endm

ac_updateSprite:	macro
	dc.w $A
	endm

ac_setSize:	macro
	dc.w $B
	dc.w \1
	endm

ac_setPos:	macro
	dc.w $C
	dc.w \1
	dc.w \2
	endm

ac_clonePos:	macro
	dc.w $D
	dc.w \1
	endm

ac_moveEntFacRelPos:	macro
	dc.w $E
	dc.w \1
	dc.w \2
	dc.w \3
	endm

ac_waitDestEntity:	macro
	dc.w $F
	dc.w \1
	endm

ac_setSpeed:	macro
	dc.w $10
	dc.b \1
	dc.b \2
	endm

ac_accelFactors:	macro
	dc.w $11
	dc.b \1
	dc.b \2
	endm

ac_acceleration:	macro
	dc.w $12
	dc.b \1&$FF
	dc.b \2&$FF
	endm

ac_deceleration:	macro
	dc.w $13
	dc.b \1&$FF
	dc.b \2&$FF
	endm

ac_motion:	macro
	dc.w $14
	dc.w \1
	endm

ac_autoFacing:	macro
	dc.w $15
	dc.w \1
	endm

ac_setId:	macro
	dc.w $16
	dc.w \1
	endm

ac_setSprite:	macro
	dc.w $17
	dc.w \1
	endm

ac_entityObstructable:	macro
	dc.w $18
	dc.w \1
	endm

ac_mapUncollidable:	macro
	dc.w $19
	dc.w \1
	endm

ac_entityUncollidable:	macro
	dc.w $1A
	dc.w \1
	endm

ac_orientUp:	macro
	dc.w $1B
	dc.w 0
	endm

ac_orientLeft:	macro
	dc.w $1B
	dc.w 1
	endm

ac_orientDown:	macro
	dc.w $1B
	dc.w 2
	endm

ac_orientRight:	macro
	dc.w $1B
	dc.w 3
	endm

ac_transparency:	macro
	dc.w $1C
	dc.w \1
	endm

ac_setGhost:	macro
	dc.w $1D
	dc.w \1
	endm

ac_animSpeedX2:	macro
	dc.w $1E
	dc.w \1
	endm

ac_resizable:	macro
	dc.w $1F
	dc.w \1
	endm

ac_immersed:	macro
	dc.w $20
	dc.w \1
	endm

ac_set1Cb4:	macro
	dc.w $21
	dc.w \1
	endm

ac_setFacing:	macro
	dc.w $22
	dc.w \1
	endm

ac_soundCommand:	macro
	dc.w $23
	dc.w \1
	endm

ac_branch:	macro
	dc.w $30
	endm

ac_jump:	macro
	dc.w $34
	dc.l \1
	endm

ac_checkMapBlockCopy:	macro
	dc.w $40
	endm

ac_pass:	macro
	dc.w $41
	dc.w \1
	endm

	
	