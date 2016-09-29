
; SCRIPT SECTION battles\entries\battle43\cs_afterbattle :
; Cutscene after battle 43
abcs_battle43:      dc.w $32                ; 0032 SET CAMERA DEST 8 2
										dc.w 8
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $2E                ; 002E HIDE ENTITY 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $34                ; 0034 SET BLOCKS C36 704 A03
										dc.w $C36
										dc.w $704
										dc.w $A03
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $34                ; 0034 SET BLOCKS C31 704 A03
										dc.w $C31
										dc.w $704
										dc.w $A03
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $34                ; 0034 SET BLOCKS C2C 704 A03
										dc.w $C2C
										dc.w $704
										dc.w $A03
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $34                ; 0034 SET BLOCKS C27 704 A03
										dc.w $C27
										dc.w $704
										dc.w $A03
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 5
										dc.w 5
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 3B0C0B01
										dc.l $3B0C0B01
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $10                ; 0010 SET FLAG 43 0 : Peter is a follower
										dc.w $43
										dc.w 0
										dc.w $10                ; 0010 SET FLAG 46 0 : Astral is a follower
										dc.w $46
										dc.w 0
										dc.w $10                ; 0010 SET FLAG 47 0 : Lemon is a follower
										dc.w $47
										dc.w 0
										dc.w $10                ; 0010 SET FLAG 4C 0 : Zynk is a follower
										dc.w $4C
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
