; Reserved RAM space for music and SFX channel states,
; as well as more space for music resuming feature.
; See doc/channel_data.txt for content details.

    db  "MSCYM1"  
    align  10h, 0
MUSIC_CHANNEL_YM1:
    align  30h,0
    db  "MUCYM2"
    align  10h,0    
MUSIC_CHANNEL_YM2:
    align  30h,0
    db  "MSCYM3"    
    align  10h,0      
MUSIC_CHANNEL_YM3:
    align  30h,0
    db  "MSCYM4"  
    align  10h,0  
MUSIC_CHANNEL_YM4:
    align  30h,0
    db  "MSCYM5"    
    align  10h,0  
MUSIC_CHANNEL_YM5:
    align  30h,0
    db  "MSCYM6"
    align  10h,0      
MUSIC_CHANNEL_YM6:
    align  30h,0
    db  "MSCTN1"  
    align  10h,0      
MUSIC_CHANNEL_PSG1:
    align  30h,0
    db  "MSCTN2"
    align  10h,0
MUSIC_CHANNEL_PSG2:
    align  30h,0
    db  "MSCTN3"  
    align  10h,0
MUSIC_CHANNEL_PSG3:
    align  30h,0  
    db  "MSCNOI"      
    align  10h,0
MUSIC_CHANNEL_NOISE:
    align  30h,0

; SFX channel data requires proper initialization
; TODO : identify and keep only what is required exactly    
    db  "SFXYM1"    
    align  10h,0    
SFX_CHANNEL_YM1:
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  30h,0  
    db  "SFXYM2"
    align  10h,0    
SFX_CHANNEL_YM2:       
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  30h,0
    db  "SFXYM3"    
    align  10h,0    
SFX_CHANNEL_YM3:
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  30h,0
    db  "SFXYM4"    
    align  10h,0  
SFX_CHANNEL_YM4:
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  30h,0
    db  "SFXYM5"  
    align  10h,0   
SFX_CHANNEL_YM5:  
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  30h,0
    db  "SFXYM6"    
    align  10h,0   
SFX_CHANNEL_YM6: 
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  30h,0
    db  "SFXTN1"  
    align  10h,0      
SFX_CHANNEL_PSG1:
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  30h,0
    db  "SFXTN2"  
    align  10h,0   
SFX_CHANNEL_PSG2:   
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  30h,0
    db  "SFXTN3"  
    align  10h,0   
SFX_CHANNEL_YPSG3:
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  30h,0
    db  "SFXNOI"  
    align  10h,0   
SFX_CHANNEL_NOISE:   
    db 0, 0, 0, 1, 0Eh, 0, 1, 24, 0, 0, 0
    dw PITCH_EFFECT_0
    align  30h,0

 ; Music resuming feature always keeping state of previous music   
    db  "SAVEDYM1"    
    align  10h,0  
SAVED_MUSIC_CHANNEL_YM1:
    align  30h,0
    db  "BKPYM2"  
    align  30h,0
    db  "BKPYM3"  
    align  30h,0
    db  "BKPYM4"
    align  30h,0
    db  "BKPYM5"
    align  30h,0
    db  "BKPYM6"
    align  30h,0
    db  "BKPTN1"  
    align  30h,0
    db  "BKPTN2"
    align  30h,0
    db  "BKPTN3"
    align  30h,0
    db  "BKPNOI"  
    align  30h,0
; Temporary copy space for swapping of music/saved channels when resuming
    db  "TMPYM1"
    align  10h,0  
TMPCPY_MUSIC_CHANNEL_YM1:
    align  30h,0
    db  "TMPYM2"  
    align  30h,0
    db  "TMPYM3"  
    align  30h,0
    db  "TMPYM4"
    align  30h,0
    db  "TMPYM5"  
    align  30h,0
    db  "TMPYM6"  
    align  30h,0
    db  "TMPTN1"  
    align  30h,0
    db  "TMPTN2"
    align  30h,0
    db  "TMPTN3"
    align  30h,0
    db  "TMPNOI"
    align  30h,0    
TMPCPY_MUSIC_BANK: 
    db  0    
TMPCPY_MUSIC_DOESNT_USE_SAMPLES:
    db  0    
TMPCPY_YM_TIMER_VALUE:
    db  0