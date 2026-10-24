; Reserved RAM space for music and SFX channel states,
; as well as more space for music resuming feature.
; See doc/channel_data.txt for content details.

    db  "MUSICYM1"  
    align  10h, 0
MUSIC_CHANNEL_YM1:
    align  30h,0
    db  "MUSICYM2"
    align  10h,0    
MUSIC_CHANNEL_YM2:
    align  30h,0
    db  "MUSICYM3"    
    align  10h,0      
MUSIC_CHANNEL_YM3:
    align  30h,0
    db  "MUSICYM4"  
    align  10h,0  
MUSIC_CHANNEL_YM4:
    align  30h,0
    db  "MUSICYM5"    
    align  10h,0  
MUSIC_CHANNEL_YM5:
    align  30h,0
    db  "MUSICYM6"
    align  10h,0      
MUSIC_CHANNEL_YM6:
    align  30h,0
    db  "MUSICTN1"  
    align  10h,0      
MUSIC_CHANNEL_PSG1:
    align  30h,0
    db  "MUSICTN2"
    align  10h,0
MUSIC_CHANNEL_PSG2:
    align  30h,0
    db  "MUSICTN3"  
    align  10h,0
MUSIC_CHANNEL_PSG3:
    align  30h,0  
    db  "MUSICNOI"      
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
    db  "SAVEDYM2"  
    align  30h,0
    db  "SAVEDYM3"  
    align  30h,0
    db  "SAVEDYM4"
    align  30h,0
    db  "SAVEDYM5"
    align  30h,0
    db  "SAVEDYM6"
    align  30h,0
    db  "SAVEDTN1"  
    align  30h,0
    db  "SAVEDTN2"
    align  30h,0
    db  "SAVEDTN3"
    align  30h,0
    db  "SAVEDNOI"  
    align  30h,0
; Temporary copy space for swapping of music/saved channels when resuming
    db  "TEMPYM1"
    align  10h,0  
TMPCPY_MUSIC_CHANNEL_YM1:
    align  30h,0
    db  "TEMPYM2"  
    align  30h,0
    db  "TEMPYM3"  
    align  30h,0
    db  "TEMPYM4"
    align  30h,0
    db  "TEMPYM5"  
    align  30h,0
    db  "TEMPYM6"  
    align  30h,0
    db  "TEMPTN1"  
    align  30h,0
    db  "TEMPTN2"
    align  30h,0
    db  "TEMPTN3"
    align  30h,0
    db  "TEMPNOI"
    align  30h,0    
TMPCPY_MUSIC_BANK: 
    db  0    
TMPCPY_MUSIC_DOESNT_USE_SAMPLES:
    db  0    
TMPCPY_YM_TIMER_VALUE:
    db  0