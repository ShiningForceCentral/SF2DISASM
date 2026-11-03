; Reserved RAM space for music and SFX channel states,
; as well as more space for music resuming feature.
; See doc/channel_data.txt for content details.

    db  "--CHANNEL_DATA--"  
    align  10h, 0
MUSIC_CHANNEL_YM1:
	db     1
    align  20h,0
MUSIC_CHANNEL_YM2:
	db     2
    align  20h,0 
MUSIC_CHANNEL_YM3:
	db     3
    align  20h,0
MUSIC_CHANNEL_YM4:
	db     4
    align  20h,0
MUSIC_CHANNEL_YM5:
	db     5
    align  20h,0
MUSIC_CHANNEL_YM6:
	db     6
    align  20h,0 
MUSIC_CHANNEL_PSG1:
	db     7
    align  20h,0
MUSIC_CHANNEL_PSG2:
	db     8
    align  20h,0
MUSIC_CHANNEL_PSG3:
	db     9
    align  20h,0  
MUSIC_CHANNEL_NOISE:
	db     10
    align  20h,0

; SFX channel data requires proper initialization
; TODO : identify and keep only what is required exactly    
SFX_CHANNEL_YM1:
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  20h,0  
SFX_CHANNEL_YM2:       
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  20h,0
SFX_CHANNEL_YM3:
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  20h,0
SFX_CHANNEL_YM4:
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  20h,0
SFX_CHANNEL_YM5:  
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  20h,0
SFX_CHANNEL_YM6: 
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  20h,0
SFX_CHANNEL_PSG1:
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  20h,0
SFX_CHANNEL_PSG2:   
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  20h,0
SFX_CHANNEL_YPSG3:
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  20h,0
SFX_CHANNEL_NOISE:   
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  20h,0

 ; Music resuming feature always keeping state of previous music   
SAVED_MUSIC_CHANNEL_YM1:
	db     "(saved YM1)"
    align  20h,0
	db     "(saved YM2)"
    align  20h,0
	db     "(saved YM3)"
    align  20h,0
	db     "(saved YM4)"
    align  20h,0
	db     "(saved YM5)"
    align  20h,0
	db     "(saved YM6)"
    align  20h,0
	db     "(saved PSG1)"
    align  20h,0
	db     "(saved PSG2)"
    align  20h,0
	db     "(saved PSG3)"
    align  20h,0
	db     "(saved Noise)"
    align  20h,0

; Temporary copy space for swapping of music/saved channels when resuming
TMPCPY_MUSIC_CHANNEL_YM1:
	db     "(temp YM1)"
    align  20h,0
	db     "(temp YM2)"
    align  20h,0
	db     "(temp YM3)"
    align  20h,0
	db     "(temp YM4)"
    align  20h,0
	db     "(temp YM5)"
    align  20h,0
	db     "(temp YM6)"
    align  20h,0
	db     "(temp PSG1)"
    align  20h,0
	db     "(temp PSG2)"
    align  20h,0
	db     "(temp PSG3)"
    align  20h,0
	db     "(temp Noise)"
    align  20h,0
TMPCPY_MUSIC_BANK: 
    db  0    
TMPCPY_MUSIC_DOESNT_USE_SAMPLES:
    db  0    
TMPCPY_YM_TIMER_VALUE:
    db  0
