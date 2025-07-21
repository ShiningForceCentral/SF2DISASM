
; ASM FILE data\battles\entries\battle43\cs_afterbattle.asm :
; 0x4F35E..0x4F47A : Cutscene after battle 43
abcs_battle43:  setCamDest 8,2
                playSound SOUND_COMMAND_FADE_OUT
                csWait 40
                playSound SFX_BIG_DOOR_RUMBLE
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                playSound SFX_BIG_DOOR_RUMBLE
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                hide 128
                playSound SFX_BIG_DOOR_RUMBLE
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                playSound SFX_BIG_DOOR_RUMBLE
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                setBlocks 12,54,7,4,10,3
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                playSound SFX_BIG_DOOR_RUMBLE
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                setBlocks 12,49,7,4,10,3
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                playSound SFX_BIG_DOOR_RUMBLE
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                setBlocks 12,44,7,4,10,3
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                setQuake 3
                playSound SFX_BIG_DOOR_RUMBLE
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                setBlocks 12,39,7,4,10,3
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                playSound SFX_BLAST_SPELL
                flashScreenWhite 20
                setQuake 5
                playSound SFX_BIG_DOOR_RUMBLE
                csWait 120
                mapFadeOutToWhite
                csWait 40
                mapFadeInFromWhite
                warp MAP_ZEON_BATTLEFIELD,12,11,UP
                setQuake 0
                clearF 67               ; Peter is a follower
                clearF 70               ; Astral is a follower
                clearF 71               ; Lemon is a follower
                clearF 76               ; Zynk is a follower
                csc_end
