
; 68K ROM offsets
SFX_ROM_OFFSET                 equ 01EE000h
DAC_BANK_1_ROM_OFFSET          equ 01E0000h
DAC_BANK_2_ROM_OFFSET          equ 01E8000h
YM_INSTRUMENTS_BANK_ROM_OFFSET equ 01EB000h
MUSIC_BANK_2_ROM_OFFSET        equ 01F0000h
MUSIC_BANK_1_ROM_OFFSET        equ 01F8000h

; Banks defined by 32kB slot position in ROM, 
; and then pointers to mapped range 0x8000..0xFFFF when needed
SFX_BANK                       equ SFX_ROM_OFFSET/08000h
SFX_BANK_OFFSET                equ SFX_ROM_OFFSET#08000h+08000h
DAC_BANK_1                     equ DAC_BANK_1_ROM_OFFSET/08000h
DAC_BANK_2                     equ DAC_BANK_2_ROM_OFFSET/08000h
MUSIC_BANK_1                   equ MUSIC_BANK_1_ROM_OFFSET/08000h
MUSIC_BANK_2                   equ MUSIC_BANK_2_ROM_OFFSET/08000h
YM_INSTRUMENTS_BANK            equ YM_INSTRUMENTS_BANK_ROM_OFFSET/08000h
YM_INSTRUMENTS_BANK_OFFSET     equ YM_INSTRUMENTS_BANK_ROM_OFFSET#08000h+08000h

; Z80 RAM offsets
STACK_START                    equ 1FE0h
SAVED_MUSIC_BANK               equ 1FE0h
PREVIOUS_MUSIC                 equ 1FE1h
SAVED_YM_TIMER_VALUE           equ 1FE2h
SAVED_MUSIC_YM6_FM_MODE        equ 1FE3h
NEW_SAMPLE                     equ 1FE4h
DAC_LAST_OFFSET                equ 1FE5h
TEMP_FREQUENCY                 equ 1FE6h ; 2 bytes
RESUMING_DEACTIVATED           equ 1FE8h
CURRENT_PSG_CHANNEL            equ 1FE9h
CURRENT_CHANNEL                equ 1FEAh
FADE_OUT_LENGTH                equ 1FEBh
FADE_OUT_TIMER                 equ 1FECh
FADE_OUT_COUNTER               equ 1FEDh
CURRENTLY_FADING_OUT           equ 1FEEh
COMMANDS_COUNTER               equ 1FEFh
MUSIC_BANK                     equ 1FF0h
CURRENT_MUSIC                  equ 1FF1h
YM_TIMER_VALUE                 equ 1FF2h
MUSIC_YM6_FM_MODE              equ 1FF3h
DAC_BANK                       equ 1FF4h
DAC_REMAINING_LENGTH           equ 1FF5h ; 2 bytes
PROCESSING_SFX                 equ 1FF7h
CALL_YM_PART2                  equ 1FF8h
CURRENTLY_MANAGING_SFX_TYPE_2  equ 1FF9h
TEMP_REGISTER                  equ 1FFAh
FADE_IN_TIMER                  equ 1FFBh
FADE_IN_PARAMS                 equ 1FFCh ; nibble 1 : fade in  speed. nibble 2 : fade in start level.
OUTPUT_LEVEL                   equ 1FFDh ; general output level set from 68k
LAST_COMMAND                   equ 1FFEh
NEW_COMMAND                    equ 1FFFh
          
; Registers
YM1_REGISTER                   equ 4000h
YM1_DATA                       equ 4001h
YM2_REGISTER                   equ 4002h
YM2_DATA                       equ 4003h
BANK_REGISTER                  equ 6000h
PSG_PORT                       equ 7F11h

; YM registers
YMREG_TIMER_B                  equ 26h
YMREG_KEY_ON_OFF               equ 28h
YMREG_DAC_OUTPUT               equ 2Ah
YMREG_DAC_ENABLE               equ 2Bh
YMREG_MUL_DT                   equ 30h
YMREG_TOTAL_LEVEL              equ 40h
YMREG_PANNING                  equ 0B4h

; Channel data offsets
CHANNEL_DATA_SIZE              equ 30h
DATA_CURSOR                    equ 00h     ; $00-$01 Data cursor
TIME_COUNTER                   equ 02h     ; $02     Time counter for note/sample play length
CHANNEL_FREE                   equ 03h     ; $03     Channel is free/inactive (set to 1)
LEVEL                          equ 04h     ; $04     Output level, from $00 to $0F
YM_ALGORITHM                   equ 05h
PSG_OUTPUT_LEVEL               equ 05h     ; $05     YM algorithm / PSG actual output level (=base-$F+instrument)
KEY_RELEASE                    equ 06h     ; $06     Key release value. Release key when time counter 02 reaches this value.
PLAY_LENGTH                    equ 07h     ; $07     Note/sample play length
NO_RELEASE                     equ 08h     ; $08     Set to $80 when there is no key release, even between different notes
VIBRATO_DELAY                  equ 09h     ; $09     Vibrato delay time
VIBRATO_COUNTER                equ 0Ah     ; $0A     Time counter for vibrato
VIBRATO_POINTER                equ 0Bh     ; $0B-$0C Vibrato data start pointer
VIBRATO_CURSOR                 equ 0Dh     ; $0D     Vibrato data cursor
CURRENT_FREQUENCY              equ 0Eh     ; $0E-$0F Current frequency
YM_INSTRUMENT_ID               equ 10h
PSG_INSTRUMENT_POINTER         equ 10h     ; $10     YM Instrument / PSG Instrument Pointer (bytes $10-$11)
YM_TARGET_FREQUENCY            equ 11h
PSG_INSTRUMENT_CURSOR          equ 12h     ; $11-$12 Target YM frequency for slide / PSG Instrument Cursor (byte $12)
INFINITE_LOOP_START_POINTER    equ 13h     ; $13-$14 Infinite Loop start pointer
VOLTA_START_POINTER            equ 15h     ; $15-$16 Volta Brackets start pointer
COUNTED_LOOP_POINTER           equ 17h     ; $17-$18 Counted Loop start pointer
COUNTER_LOOP_COUNTER           equ 19h     ; $19     Counted Loop counter
VOLTA_END_1_DONE               equ 1Ah     ; $1A     Volta ending 1 done (set to 1)
VOLTA_END_2_DONE               equ 1Bh     ; $1B     Volta ending 2 done (set to 1)
NOTE_SHIFT                     equ 1Ch     ; $1C     Note shift value
FREQUENCY_SHIFT                equ 1Dh     ; $1D     Frequency shift value
STEREO_PANNING                 equ 1Eh     ; $1E     YM Stereo Output setup
KEY_RELEASED                   equ 1Eh     ; $1E     PSG Key Released
SLIDE_SPEED                    equ 1Fh     ; $1F     Slide speed


