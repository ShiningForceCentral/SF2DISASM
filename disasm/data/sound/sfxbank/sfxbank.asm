
   cpu z80
   listing off
   phase    0
   include "..\macros.asm"
   include "..\enums.asm"
   org 08000h+6000h
    
pt_SFX:         
    dw Sfx_1
    dw Sfx_2                
    dw Sfx_3                
    dw Sfx_4                
    dw Sfx_5                
    dw Sfx_6                
    dw Sfx_7                
    dw Sfx_8                
    dw Sfx_9                
    dw Sfx_10               
    dw Sfx_11               
    dw Sfx_12               
    dw Sfx_13               
    dw Sfx_14               
    dw Sfx_15               
    dw Sfx_16               
    dw Sfx_17               
    dw Sfx_18               
    dw Sfx_19               
    dw Sfx_20               
    dw Sfx_21               
    dw Sfx_22               
    dw Sfx_23               
    dw Sfx_24               
    dw Sfx_25               
    dw Sfx_26               
    dw Sfx_27
    dw Sfx_28
    dw Sfx_29
    dw Sfx_30
    dw Sfx_31
    dw Sfx_32
    dw Sfx_33
    dw Sfx_34
    dw Sfx_35
    dw Sfx_36
    dw Sfx_37
    dw Sfx_38
    dw Sfx_39
    dw Sfx_40
    dw Sfx_41
    dw Sfx_42
    dw Sfx_43
    dw Sfx_44
    dw Sfx_45
    dw Sfx_46
    dw Sfx_47
    dw Sfx_48
    dw Sfx_49
    dw Sfx_50
    dw Sfx_51
    dw Sfx_52
    dw Sfx_53
    dw Sfx_54
    dw Sfx_55
    dw Sfx_56               ; end of SFX pointer table
Sfx_1:          db 2                    ; sound 1 data
    dw Sfx_1_Channel_5
    dw Sfx_1_Channel_4
    dw Sfx_1_Channel_5
Sfx_1_Channel_4:  inst 64
      vol 0Eh
      vibrato 00h
      setRelease 00h
            noteL F4,1
      sustain
      vibrato 010h
            note  Fs5
            note  A6
      setRelease 01h
      vibrato 0F0h
            noteL B8,12
Sfx_1_Channel_5:channel_end
Sfx_2:          db 1                    ; sound 2
    dw Sfx_2_Channel_9
    dw Sfx_2_Channel_9
    dw Sfx_2_Channel_9
    dw Sfx_2_Channel_9
    dw Sfx_2_Channel_9
    dw Sfx_2_Channel_9
    dw Sfx_2_Channel_9
    dw Sfx_2_Channel_9
    dw Sfx_2_Channel_8
    dw Sfx_2_Channel_9
Sfx_2_Channel_8:  psgInst 02Ch
      setRelease 00h
      vibrato 00h
            psgNoteL B4,2
            psgNoteL E5,6
      psgInst 028h
            psgNoteL B4,2
            psgNoteL E5,6
Sfx_2_Channel_9:channel_end
Sfx_3:          db 1                    ; sound 3
    dw Sfx_3_Channel_9
    dw Sfx_3_Channel_9
    dw Sfx_3_Channel_9
    dw Sfx_3_Channel_9
    dw Sfx_3_Channel_9
    dw Sfx_3_Channel_9
    dw Sfx_3_Channel_9
    dw Sfx_3_Channel_9
    dw Sfx_3_Channel_8
    dw Sfx_3_Channel_9
Sfx_3_Channel_8:  psgInst 02Eh
      setRelease 00h
      vibrato 00h
            psgNoteL B5,2
            psgNoteL E6,6
      psgInst 02Ah
            psgNoteL B5,2
            psgNoteL E6,6
      psgInst 027h
            psgNoteL B5,2
            psgNoteL E6,6
      psgInst 024h
            psgNoteL B5,2
            psgNoteL E6,6
Sfx_3_Channel_9:channel_end
Sfx_4:          db 2                    ; sound 4
    dw Sfx_4_Channel_5
    dw Sfx_4_Channel_4
    dw Sfx_4_Channel_5
Sfx_4_Channel_4:  inst 65
      vol 0Fh
      setRelease 00h
      vibrato 00h
    countedLoopStart 2
            noteL D2,1
            wait
    countedLoopEnd
            waitL 4
    countedLoopStart 10
            noteL D2,1
            wait
    countedLoopEnd
Sfx_4_Channel_5:channel_end
Sfx_5:          db 1                    ; sound 5
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_5_Channel_8
    dw Sfx_12_Channel_9
Sfx_6:          db 1                    ; sound 6
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_6_Channel_8
    dw Sfx_12_Channel_9
Sfx_7:          db 1                    ; sound 7
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_7_Channel_8
    dw Sfx_12_Channel_9
Sfx_8:          db 1                    ; sound 8
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_8_Channel_8
    dw Sfx_12_Channel_9
Sfx_9:          db 1                    ; sound 9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_9_Channel_8
    dw Sfx_12_Channel_9
Sfx_10:         db 1                    ; sound A
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_10_Channel_8
    dw Sfx_12_Channel_9
Sfx_11:         db 1                    ; sound B
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_11_Channel_8
    dw Sfx_12_Channel_9
Sfx_12:         db 1                    ; sound C
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_9
    dw Sfx_12_Channel_8
    dw Sfx_12_Channel_9
Sfx_5_Channel_8:  psgInst 0Fh
      setRelease 00h
      vibrato 0C1h
            psgNoteL E5,4
Sfx_12_Channel_9:
    channel_end
Sfx_6_Channel_8:  psgInst 0Eh
      setRelease 00h
      vibrato 0C1h
            psgNoteL Gs4,4
    channel_end
Sfx_7_Channel_8:  psgInst 0Eh
      setRelease 00h
      vibrato 0C1h
            psgNoteL Gs3,4
    channel_end
Sfx_8_Channel_8:  psgInst 0Fh
      setRelease 00h
      vibrato 0E1h
            psgNoteL E3,4
    channel_end
Sfx_9_Channel_8:  psgInst 0Fh
      setRelease 00h
      vibrato 0D1h
            psgNoteL As2,4
    channel_end
Sfx_10_Channel_8:
      psgInst 0Fh
      setRelease 00h
      vibrato 0D1h
            psgNoteL G2,4
    channel_end
Sfx_11_Channel_8:
      psgInst 0Fh
      setRelease 00h
      vibrato 0D1h
            psgNoteL D2,4
    channel_end
Sfx_12_Channel_8:
      psgInst 0Fh
      setRelease 00h
      vibrato 0D1h
            psgNoteL B1,4
    channel_end
Sfx_13:         db 2                    ; sound D
    dw Sfx_13_Channel_3
    dw Sfx_13_Channel_5
    dw Sfx_13_Channel_5
Sfx_13_Channel_3:
      inst 64
      setRelease 00h
      vibrato 0A0h
      vol 0Ah
            noteL F5,3
      vol 0Bh
            note  F5
      vol 0Ch
            note  Fs5
      vol 0Dh
            note  A5
      vol 0Eh
            note  As5
      vol 0Fh
            note  B5
            note  C6
            note  Cs6
            note  D6
            note  Ds6
            note  Ds6
            note  Ds6
            noteL E6,48
Sfx_13_Channel_5:
    channel_end
Sfx_21:         db 1                    ; sound 15
    dw Sfx_21_Channel_7
    dw Sfx_21_Channel_7
    dw Sfx_21_Channel_7
    dw Sfx_21_Channel_7
    dw Sfx_21_Channel_7
    dw Sfx_21_Channel_7
    dw Sfx_21_Channel_7
    dw Sfx_21_Channel_7
    dw Sfx_21_Channel_8
    dw Sfx_21_Channel_9
Sfx_21_Channel_8:
      psgInst 00h
      setRelease 00h
      vibrato 080h
            psgNoteL B6,6
    channel_end
Sfx_21_Channel_9:
      psgInst 07Fh
      setRelease 01h
            psgNoteL G0,4
Sfx_21_Channel_7:
    channel_end
Sfx_22:         db 2                    ; sound 16
    dw Sfx_22_Channel_5
    dw Sfx_22_Channel_4
    dw Sfx_22_Channel_5
Sfx_22_Channel_4:
      inst 69
      vol 0Fh
      setRelease 00h
      vibrato 010h
            noteL B8,1
            note  B8
            noteL B8,10
Sfx_22_Channel_5:
    channel_end
Sfx_23:         db 1                    ; sound 17
    dw Sfx_23_Channel_7
    dw Sfx_23_Channel_7
    dw Sfx_23_Channel_7
    dw Sfx_23_Channel_7
    dw Sfx_23_Channel_7
    dw Sfx_23_Channel_7
    dw Sfx_23_Channel_7
    dw Sfx_23_Channel_7
    dw Sfx_23_Channel_8
    dw Sfx_23_Channel_9
Sfx_23_Channel_7:
    channel_end
Sfx_23_Channel_8:
      setRelease 00h
      vibrato 0A2h
      psgInst 07Eh
            psgNoteL C4,17
Sfx_23_Channel_9:
    channel_end
Sfx_24:         db 2                    ; sound 18
    dw Sfx_24_Channel_3
    dw Sfx_24_Channel_4
    dw Sfx_24_Channel_5
Sfx_24_Channel_3:
    channel_end
Sfx_24_Channel_4:
      inst 73
      vol 0Ch
      setRelease 00h
      vibrato 0B0h
            noteL A7,36
    channel_end
Sfx_24_Channel_5:
    channel_end
Sfx_25:         db 1                    ; sound 19 : stairs
    dw Sfx_25_Channel_8
    dw Sfx_25_Channel_8
    dw Sfx_25_Channel_8
    dw Sfx_25_Channel_8
    dw Sfx_25_Channel_8
    dw Sfx_25_Channel_8
    dw Sfx_25_Channel_8
    dw Sfx_25_Channel_8
    dw Sfx_25_Channel_8
    dw Sfx_25_Channel_9
Sfx_25_Channel_9:
      psgInst 01Eh
      setRelease 0Bh
            psgNoteL F0,13
            psgNote  F0
            psgNote  F0
Sfx_25_Channel_8:
    channel_end
Sfx_26:         db 1                    ; sound 1A
    dw Sfx_26_Channel_9
    dw Sfx_26_Channel_9
    dw Sfx_26_Channel_9
    dw Sfx_26_Channel_9
    dw Sfx_26_Channel_9
    dw Sfx_26_Channel_9
    dw Sfx_26_Channel_9
    dw Sfx_26_Channel_9
    dw Sfx_26_Channel_8
    dw Sfx_26_Channel_9
Sfx_26_Channel_8:
      psgInst 02Fh
      setRelease 04h
      vibrato 00h
            psgNoteL F3,1
            psgNote  A3
      psgInst 02Eh
            psgNote  B3
            psgNote  D4
Sfx_26_Channel_9:
    channel_end
Sfx_35:         db 1
    dw Sfx_35_Channel_9
    dw Sfx_35_Channel_9
    dw Sfx_35_Channel_9
    dw Sfx_35_Channel_9
    dw Sfx_35_Channel_9
    dw Sfx_35_Channel_9
    dw Sfx_35_Channel_9
    dw Sfx_35_Channel_9
    dw Sfx_35_Channel_8
    dw Sfx_35_Channel_9
Sfx_35_Channel_8:
      psgInst 02Fh
      setRelease 04h
      vibrato 00h
            psgNoteL F3,1
            psgNote  A3
      psgInst 02Eh
            psgNote  B3
            psgNote  D4
            psgNote  F4
Sfx_35_Channel_9:
    channel_end
Sfx_27:         db 1
    dw Sfx_27_Channel_7
    dw Sfx_27_Channel_7
    dw Sfx_27_Channel_7
    dw Sfx_27_Channel_7
    dw Sfx_27_Channel_7
    dw Sfx_27_Channel_7
    dw Sfx_27_Channel_7
    dw Sfx_27_Channel_7
    dw Sfx_27_Channel_8
    dw Sfx_27_Channel_9
Sfx_27_Channel_8:
      psgInst 00h
      setRelease 00h
      vibrato 063h
            psgNoteL A6,19
    channel_end
Sfx_27_Channel_9:
      psgInst 01Fh
      setRelease 00h
            psgNoteL G0,6
            psgNoteL G0,9
Sfx_27_Channel_7:
    channel_end
Sfx_28:         db 2
    dw Sfx_28_Channel_3
    dw Sfx_28_Channel_4
    dw Sfx_28_Channel_5
Sfx_28_Channel_3:
      inst 74
      vol 0Fh
      setRelease 01h
      vibrato 0F0h
            noteL F2,4
            noteL F2,6
    channel_end
Sfx_28_Channel_4:
      inst 70
      vol 0Dh
      setRelease 01h
      vibrato 0F0h
            noteL D2,2
            noteL D2,6
Sfx_28_Channel_5:
    channel_end
Sfx_16:         db 1                    ; sound 10
    dw Sfx_16_Channel_9
    dw Sfx_16_Channel_9
    dw Sfx_16_Channel_9
    dw Sfx_16_Channel_9
    dw Sfx_16_Channel_9
    dw Sfx_16_Channel_9
    dw Sfx_16_Channel_9
    dw Sfx_16_Channel_9
    dw Sfx_16_Channel_8
    dw Sfx_16_Channel_9
Sfx_16_Channel_8:
      vibrato 00h
      psgInst 0Eh
      setRelease 00h
            psgNoteL Ds5,3
            psgNote  G5
            psgNoteL As5,5
      psgInst 0Ch
            psgNoteL Ds5,3
            psgNote  G5
            psgNoteL As5,5
      psgInst 09h
            psgNoteL Ds5,3
            psgNote  G5
            psgNoteL As5,5
      psgInst 07h
            psgNoteL Ds5,3
            psgNote  G5
            psgNoteL As5,5
      psgInst 05h
            psgNoteL Ds5,3
            psgNote  G5
            psgNote  As5
Sfx_16_Channel_9:
    channel_end
Sfx_29:         db 2
    dw Sfx_29_Channel_3
    dw Sfx_29_Channel_4
    dw Sfx_29_Channel_5
Sfx_29_Channel_3:
      inst 67
      vol 0Fh
      setRelease 02h
      vibrato 00h
    countedLoopStart 16
            noteL Ds2,7
    countedLoopEnd
    channel_end
Sfx_29_Channel_4:
      inst 67
      vol 0Fh
      setRelease 02h
      vibrato 00h
    countedLoopStart 14
            noteL E2,8
    countedLoopEnd
    channel_end
Sfx_29_Channel_5:
    channel_end
Sfx_30:         db 2
    dw Sfx_30_Channel_3
    dw Sfx_30_Channel_4
    dw Sfx_30_Channel_5
Sfx_30_Channel_3:
    channel_end
Sfx_30_Channel_4:
      inst 71
      vol 0Fh
      vibrato 00h
      setRelease 00h
            noteL F5,2
      sustain
      vibrato 010h
            note  Fs6
            note  A7
      setRelease 01h
      vibrato 0F0h
            note  B8
      sustain
            note  F5
      setRelease 01h
            noteL B8,12
    channel_end
Sfx_30_Channel_5:
    channel_end
Sfx_33:         db 2
    dw Sfx_33_Channel_5
    dw Sfx_33_Channel_4
    dw Sfx_33_Channel_5
Sfx_33_Channel_4:
      inst 61
      vol 0Fh
      setRelease 00h
      vibrato 00h
            noteL A5,4
Sfx_33_Channel_5:
    channel_end
Sfx_31:         db 1
    dw Sfx_31_Channel_9
    dw Sfx_31_Channel_9
    dw Sfx_31_Channel_9
    dw Sfx_31_Channel_9
    dw Sfx_31_Channel_9
    dw Sfx_31_Channel_9
    dw Sfx_31_Channel_9
    dw Sfx_31_Channel_9
    dw Sfx_31_Channel_8
    dw Sfx_31_Channel_9
Sfx_31_Channel_8:
      psgInst 07Dh
      setRelease 06h
      vibrato 080h
            psgNoteL G3,9
      vibrato 0B0h
      psgInst 02Dh
      setRelease 02h
            psgNoteL Fs3,8
      psgInst 07Dh
      vibrato 080h
      setRelease 01h
            psgNoteL B3,4
Sfx_31_Channel_9:
    channel_end
Sfx_34:         db 2
    dw Sfx_34_Channel_5
    dw Sfx_34_Channel_4
    dw Sfx_34_Channel_5
Sfx_34_Channel_4:
      inst 61
      vol 0Fh
      setRelease 00h
      vibrato 00h
            noteL A5,4
            noteL A5,6
Sfx_34_Channel_5:
    channel_end
Sfx_36:         db 1
    dw Sfx_36_Channel_9
    dw Sfx_36_Channel_9
    dw Sfx_36_Channel_9
    dw Sfx_36_Channel_9
    dw Sfx_36_Channel_9
    dw Sfx_36_Channel_9
    dw Sfx_36_Channel_9
    dw Sfx_36_Channel_9
    dw Sfx_36_Channel_8
    dw Sfx_36_Channel_9
Sfx_36_Channel_8:
      psgInst 02Fh
      setRelease 00h
      vibrato 00h
            psgNoteL F2,1
            psgNote  A2
Sfx_36_Channel_9:
    channel_end
Sfx_15:         db 1                    ; sound F
    dw Sfx_15_Channel_9
    dw Sfx_15_Channel_9
    dw Sfx_15_Channel_9
    dw Sfx_15_Channel_9
    dw Sfx_15_Channel_9
    dw Sfx_15_Channel_9
    dw Sfx_15_Channel_9
    dw Sfx_15_Channel_9
    dw Sfx_15_Channel_8
    dw Sfx_15_Channel_9
Sfx_15_Channel_8:
      psgInst 02Fh
      setRelease 04h
      vibrato 00h
            psgNoteL D2,5
            psgNote  D3
      psgInst 02Bh
            psgNote  D2
            psgNote  D3
      psgInst 028h
            psgNote  D2
            psgNote  D3
Sfx_15_Channel_9:
    channel_end
Sfx_37:         db 1
    dw Sfx_37_Channel_9
    dw Sfx_37_Channel_9
    dw Sfx_37_Channel_9
    dw Sfx_37_Channel_9
    dw Sfx_37_Channel_9
    dw Sfx_37_Channel_9
    dw Sfx_37_Channel_9
    dw Sfx_37_Channel_9
    dw Sfx_37_Channel_8
    dw Sfx_37_Channel_9
Sfx_37_Channel_8:
      psgInst 01Eh
      setRelease 00h
      vibrato 00h
            psgNoteL C5,2
            psgNoteL F5,3
            psgNoteL C6,6
      psgInst 01Bh
            psgNoteL C5,2
            psgNoteL F5,3
            psgNoteL C6,6
      psgInst 017h
            psgNoteL C5,2
            psgNoteL F5,3
            psgNoteL C6,6
      psgInst 012h
            psgNoteL C5,2
            psgNoteL F5,3
            psgNoteL C6,6
Sfx_37_Channel_9:
    channel_end
Sfx_38:         db 1
    dw Sfx_38_Channel_9
    dw Sfx_38_Channel_9
    dw Sfx_38_Channel_9
    dw Sfx_38_Channel_9
    dw Sfx_38_Channel_9
    dw Sfx_38_Channel_9
    dw Sfx_38_Channel_9
    dw Sfx_38_Channel_9
    dw Sfx_38_Channel_8
    dw Sfx_38_Channel_9
Sfx_38_Channel_8:
      psgInst 01Eh
      setRelease 00h
      vibrato 00h
            psgNoteL D2,2
            psgNote  F2
            psgNote  D3
            psgNote  F3
            psgNote  D4
            psgNoteL F4,3
            psgNoteL G4,5
      psgInst 01Bh
            psgNoteL D3,2
            psgNote  F3
            psgNote  D4
            psgNoteL F4,3
            psgNoteL G4,5
      psgInst 017h
            psgNoteL D3,2
            psgNote  F3
            psgNote  D4
            psgNoteL F4,3
            psgNoteL G4,5
Sfx_38_Channel_9:
    channel_end
Sfx_39:         db 1
    dw Sfx_39_Channel_9
    dw Sfx_39_Channel_9
    dw Sfx_39_Channel_9
    dw Sfx_39_Channel_9
    dw Sfx_39_Channel_9
    dw Sfx_39_Channel_9
    dw Sfx_39_Channel_9
    dw Sfx_39_Channel_9
    dw Sfx_39_Channel_8
    dw Sfx_39_Channel_9
Sfx_39_Channel_8:
      psgInst 02Eh
      setRelease 00h
      vibrato 00h
            psgNoteL A1,1
            psgNote  A2
            psgNote  A1
            psgNote  A2
            psgNote  Gs3
            psgNote  Fs3
            psgNote  Gs3
            psgNote  Fs3
            psgNoteL Gs3,4
      psgInst 02Bh
            psgNoteL A2,1
            psgNote  Gs3
            psgNote  Fs3
            psgNote  Gs3
            psgNote  Fs3
            psgNoteL Gs3,4
      psgInst 027h
            psgNoteL A2,1
            psgNote  Gs3
            psgNote  Fs3
            psgNote  Gs3
            psgNote  Fs3
            psgNoteL Gs3,4
Sfx_39_Channel_9:
    channel_end
Sfx_40:         db 1
    dw Sfx_40_Channel_9
    dw Sfx_40_Channel_9
    dw Sfx_40_Channel_9
    dw Sfx_40_Channel_9
    dw Sfx_40_Channel_9
    dw Sfx_40_Channel_9
    dw Sfx_40_Channel_9
    dw Sfx_40_Channel_9
    dw Sfx_40_Channel_8
    dw Sfx_40_Channel_9
Sfx_40_Channel_8:
      psgInst 02Eh
      setRelease 00h
      vibrato 0B0h
            psgNoteL A1,1
            psgNote  A2
            psgNote  A1
            psgNote  A2
            psgNote  G3
            psgNoteL C4,6
      psgInst 02Bh
            psgNoteL A2,1
            psgNote  G3
            psgNoteL C4,6
      psgInst 029h
            psgNoteL A2,1
            psgNote  G3
            psgNoteL C4,6
      psgInst 026h
            psgNoteL A2,1
            psgNote  G3
            psgNoteL C4,6
Sfx_40_Channel_9:
    channel_end
Sfx_41:         db 2
    dw Sfx_41_Channel_5
    dw Sfx_41_Channel_4
    dw Sfx_41_Channel_5
Sfx_41_Channel_4:
      inst 70
      vol 0Ch
      setRelease 01h
      vibrato 00h
    countedLoopStart 12
            noteL C2,2
            note  C2
            waitL 3
    countedLoopEnd
Sfx_41_Channel_5:
    channel_end
Sfx_42:         db 2
    dw Sfx_42_Channel_5
    dw Sfx_42_Channel_4
    dw Sfx_42_Channel_5
Sfx_42_Channel_4:
      inst 76
      vol 0Eh
      setRelease 00h
      vibrato 0F0h
            noteL E2,2
            wait
            note  A2
            note  Ds3
            waitL 6
Sfx_42_Channel_5:
    channel_end
    db  2
    db 0A1h
    db 1Bh
    db 93h
    db 1Bh
    db 0A1h
    db 1Bh
    db 0FEh
    db 25h
    db 0FDh
    db 0Fh
    db 0FCh
    db  0
    db 0FBh
    db  0
    db 0C0h
    db  6
    db 3Ch
    db 40h
    db 0BCh
    db 18h
    db 0FFh
    db  0
    db  0
Sfx_49:         db 2
    dw Sfx_49_Channel_3
    dw Sfx_49_Channel_4
    dw Sfx_49_Channel_5
Sfx_49_Channel_3:
      inst 55
      vol 0Fh
      setRelease 01h
      vibrato 00h
            noteL F6,4
            note  G6
            note  A6
            note  B6
            note  C7
            note  D7
            note  E7
            noteL F7,10
            waitL 12
    channel_end
Sfx_49_Channel_4:
      shifting 020h
            waitL 6
      inst 55
      vol 0Dh
      setRelease 01h
      vibrato 00h
            noteL F6,4
            note  G6
            note  A6
            note  B6
            note  C7
            note  D7
            note  E7
            noteL F7,10
            waitL 12
Sfx_49_Channel_5:
    channel_end
Sfx_32:         db 2
    dw Sfx_32_Channel_3
    dw Sfx_32_Channel_4
    dw Sfx_32_Channel_5
Sfx_32_Channel_4:
      inst 33
      setRelease 00h
      vibrato 00h
      vol 0Fh
            noteL C2,1
      vol 0Ch
            note  C3
      vol 0Fh
            note  C3
      vol 0Ch
            note  C4
      vol 08h
            note  C5
      vol 0Fh
            note  E2
      vol 0Ch
            note  E3
      vol 0Fh
            note  E3
      vol 0Ch
            note  E4
      vol 08h
            note  E5
      vol 07h
            note  E6
      vol 05h
            noteL E7,6
    channel_end
Sfx_32_Channel_3:
      inst 33
      setRelease 00h
      vibrato 00h
      vol 0Fh
            noteL Cs2,1
      vol 0Ch
            note  Cs3
      vol 0Fh
            note  Cs3
      vol 0Ch
            note  Cs4
      vol 08h
            note  Cs5
      vol 0Fh
            note  F2
      vol 0Ch
            note  F3
      vol 0Fh
            note  F3
      vol 0Ch
            note  F4
      vol 08h
            note  F5
      vol 07h
            note  F6
      vol 05h
            noteL F7,6
Sfx_32_Channel_5:
    channel_end
Sfx_44:         db 2
    dw Sfx_44_Channel_3
    dw Sfx_44_Channel_4
    dw Sfx_44_Channel_5
Sfx_44_Channel_3:
      stereo 040h
      inst 59
      vol 07h
      setRelease 00h
      vibrato 00h
            noteL As6,1
            note  C7
            note  D7
            noteL E7,5
      vol 08h
            noteL As6,1
            note  C7
            note  D7
            noteL E7,5
      vol 09h
            noteL As6,1
            note  C7
            note  D7
            noteL E7,5
      vol 0Ah
            noteL As6,1
            note  C7
            note  D7
            noteL E7,5
      vol 0Bh
            noteL As6,1
            note  C7
            note  D7
            noteL E7,5
      vol 0Ch
            noteL As6,1
            note  C7
            note  D7
            noteL E7,5
      vol 0Dh
            noteL As6,1
            note  C7
            note  D7
            noteL E7,5
            waitL 6
    channel_end
Sfx_44_Channel_4:
      stereo 080h
            waitL 4
      inst 59
      vol 08h
      setRelease 00h
      vibrato 00h
            noteL As6,1
            note  C7
            note  D7
            noteL E7,5
      vol 09h
            noteL As6,1
            note  C7
            note  D7
            noteL E7,5
      vol 0Ah
            noteL As6,1
            note  C7
            note  D7
            noteL E7,5
      vol 0Bh
            noteL As6,1
            note  C7
            note  D7
            noteL E7,5
      vol 0Ch
            noteL As6,1
            note  C7
            note  D7
            noteL E7,5
      vol 0Dh
            noteL As6,1
            note  C7
            note  D7
            noteL E7,5
      vol 0Eh
            noteL As6,1
            note  C7
            note  D7
            noteL E7,5
            wait
Sfx_44_Channel_5:
    channel_end
Sfx_51:         db 1
    dw Sfx_51_Channel_7
    dw Sfx_51_Channel_7
    dw Sfx_51_Channel_7
    dw Sfx_51_Channel_7
    dw Sfx_51_Channel_7
    dw Sfx_51_Channel_7
    dw Sfx_51_Channel_7
    dw Sfx_51_Channel_7
    dw Sfx_51_Channel_8
    dw Sfx_51_Channel_9
Sfx_51_Channel_8:
      psgInst 00h
      setRelease 00h
      vibrato 063h
            psgNoteL C7,19
    channel_end
Sfx_51_Channel_9:
      setRelease 00h
      psgInst 07Bh
            psgNoteL G0,4
      psgInst 07Dh
            psgNoteL G0,4
      psgInst 07Fh
            psgNoteL G0,5
      psgInst 01Fh
            psgNote  G0
Sfx_51_Channel_7:
    channel_end
Sfx_50:         db 1
    dw Sfx_50_Channel_7
    dw Sfx_50_Channel_7
    dw Sfx_50_Channel_7
    dw Sfx_50_Channel_7
    dw Sfx_50_Channel_7
    dw Sfx_50_Channel_7
    dw Sfx_50_Channel_7
    dw Sfx_50_Channel_7
    dw Sfx_50_Channel_8
    dw Sfx_50_Channel_9
Sfx_50_Channel_8:
      psgInst 00h
      setRelease 00h
      vibrato 060h
            psgNoteL B6,5
            psgNoteL G6,5
    channel_end
Sfx_50_Channel_9:
      psgInst 07Fh
      setRelease 03h
            psgNoteL G0,6
      psgInst 01Fh
      setRelease 00h
            psgNoteL G0,6
Sfx_50_Channel_7:
    channel_end
Sfx_55:         db 2
    dw Sfx_55_Channel_3
    dw Sfx_55_Channel_4
    dw Sfx_55_Channel_5
Sfx_55_Channel_3:
    channel_end
Sfx_55_Channel_4:
      inst 68
      vol 0Fh
      setRelease 00h
      vibrato 02h
    countedLoopStart 0
            noteL B3,2
            note  Ds3
            note  G3
            note  D3
            note  F3
            note  C3
            note  Fs3
    countedLoopEnd
      vol 0Eh
            noteL B3,2
      vol 0Dh
            note  Ds3
      vol 0Ch
            note  G3
      vol 0Bh
            note  D3
      vol 0Ah
            note  F3
      vol 09h
            note  C3
      vol 08h
            note  Fs3
    channel_end
Sfx_55_Channel_5:
    channel_end
Sfx_14:         db 2                    ; sound E
    dw Sfx_14_Channel_3
    dw Sfx_14_Channel_4
    dw Sfx_14_Channel_5
Sfx_14_Channel_3:
      inst 74
      vol 0Fh
      setRelease 00h
      vibrato 0F0h
            noteL A2,6
    channel_end
Sfx_14_Channel_4:
      inst 70
      vol 0Bh
      setRelease 00h
      vibrato 0F0h
            noteL A2,6
    channel_end
Sfx_14_Channel_5:
    channel_end
Sfx_45:         db 2
    dw Sfx_45_Channel_5
    dw Sfx_45_Channel_4
    dw Sfx_45_Channel_5
Sfx_45_Channel_4:
      inst 75
      vol 0Fh
      vibrato 00h
      setRelease 00h
            noteL Ds4,1
      sustain
      vibrato 010h
            note  E5
            note  G6
      setRelease 01h
      vibrato 0F0h
            note  A8
      sustain
            note  Ds4
      setRelease 01h
            noteL A8,6
      sustain
            noteL Ds4,1
            note  F5
            note  A6
            note  As6
      setRelease 01h
            noteL A8,4
Sfx_45_Channel_5:
    channel_end
Sfx_46:         db 1
    dw Sfx_46_Channel_8
    dw Sfx_46_Channel_8
    dw Sfx_46_Channel_8
    dw Sfx_46_Channel_8
    dw Sfx_46_Channel_8
    dw Sfx_46_Channel_8
    dw Sfx_46_Channel_8
    dw Sfx_46_Channel_8
    dw Sfx_46_Channel_8
    dw Sfx_46_Channel_9
Sfx_46_Channel_9:
      psgInst 01Fh
      setRelease 00h
            psgNoteL E0,3
            psgNote  F0
            psgNote  Fs0
      psgInst 01Bh
            psgNote  E0
            psgNote  F0
            psgNote  Fs0
      psgInst 019h
            psgNote  E0
            psgNote  F0
            psgNote  Fs0
      psgInst 015h
            psgNote  E0
            psgNote  F0
            psgNote  Fs0
Sfx_46_Channel_8:
    channel_end
Sfx_47:         db 2
    dw Sfx_47_Channel_3
    dw Sfx_47_Channel_4
    dw Sfx_47_Channel_5
Sfx_47_Channel_3:
    channel_end
Sfx_47_Channel_4:
      inst 64
      vol 0Fh
      setRelease 00h
      vibrato 02h
    countedLoopStart 2
            noteL B4,2
            note  Ds4
            note  G4
            note  D4
            note  F4
            note  C4
            note  Fs4
    countedLoopEnd
      vol 0Eh
            noteL B4,2
      vol 0Dh
            note  Ds4
      vol 0Ch
            note  G4
      vol 0Bh
            note  D4
      vol 0Ah
            note  F4
      vol 09h
            note  C4
      vol 08h
            note  Fs4
    channel_end
Sfx_47_Channel_5:
    channel_end
Sfx_48:         db 2
    dw Sfx_48_Channel_3
    dw Sfx_48_Channel_5
    dw Sfx_48_Channel_5
Sfx_48_Channel_3:
      inst 64
      vol 0Fh
      setRelease 00h
      vibrato 00h
            noteL F6,2
            wait
      sustain
            noteL F6,5
      vol 0Eh
            noteL F6,3
      vol 0Dh
            note  F6
      vol 0Ch
            note  F6
      vol 0Bh
            note  F6
      vol 0Ah
            note  F6
      vol 09h
            note  F6
      setRelease 00h
      vol 08h
            noteL F6,1
Sfx_48_Channel_5:
    channel_end
Sfx_43:         db 2
    dw Sfx_43_Channel_5
    dw Sfx_43_Channel_4
    dw Sfx_43_Channel_5
Sfx_43_Channel_4:
      inst 27
      vol 0Ch
      sustain
      vibrato 010h
      noSlide
            noteL Cs4,0
      setSlide 020h
            noteL Gs4,36
            noteL G4,6
            note  Fs4
      setRelease 01h
            noteL Gs3,5
Sfx_43_Channel_5:
    channel_end
Sfx_54:         db 2
    dw Sfx_54_Channel_4
    dw Sfx_54_Channel_4
    dw Sfx_54_Channel_5
Sfx_53:         db 2
    dw Sfx_54_Channel_4
    dw Sfx_54_Channel_4
    dw Sfx_53_Channel_5
Sfx_54_Channel_5:
            sampleL 6,7
            sampleL 6,4
            sampleL 6,13
            sampleL 11,4
            sampleL 11,36
Sfx_53_Channel_5:
            sampleL 12,12
            sampleL 13,15
            sampleL 14,18
            sampleL 15,21
            sampleL 16,25
Sfx_54_Channel_4:
    channel_end
Sfx_56:         db 1
    dw Sfx_56_Channel_9
    dw Sfx_56_Channel_9
    dw Sfx_56_Channel_9
    dw Sfx_56_Channel_9
    dw Sfx_56_Channel_9
    dw Sfx_56_Channel_9
    dw Sfx_56_Channel_9
    dw Sfx_56_Channel_9
    dw Sfx_56_Channel_8
    dw Sfx_56_Channel_9
Sfx_56_Channel_8:
      psgInst 01Fh
      setRelease 00h
      vibrato 00h
            psgNoteL E6,2
            psgNote  G6
            psgNoteL B6,3
      psgInst 01Ch
            psgNoteL E6,2
            psgNote  G6
            psgNoteL B6,3
      psgInst 018h
            psgNoteL E6,2
            psgNote  G6
            psgNoteL B6,3
      psgInst 016h
            psgNoteL E6,2
            psgNote  G6
            psgNoteL B6,3
Sfx_56_Channel_9:
    channel_end
Sfx_17:         db 2                    ; sound 11
    dw Sfx_52_Channel_4
    dw Sfx_52_Channel_4
    dw Sfx_17_Channel_5
Sfx_17_Channel_5:
            sampleL 6,22
    channel_end
Sfx_18:         db 2                    ; sound 12
    dw Sfx_52_Channel_4
    dw Sfx_52_Channel_4
    dw Sfx_18_Channel_5
Sfx_18_Channel_5:
            sampleL 7,27
    channel_end
Sfx_19:         db 2                    ; sound 13
    dw Sfx_52_Channel_4
    dw Sfx_52_Channel_4
    dw Sfx_19_Channel_5
Sfx_19_Channel_5:
            sampleL 8,19
    channel_end
Sfx_20:         db 2                    ; sound 14
    dw Sfx_52_Channel_4
    dw Sfx_52_Channel_4
    dw Sfx_20_Channel_5
Sfx_20_Channel_5:
            sampleL 9,20
    channel_end
Sfx_52:         db 2
    dw Sfx_52_Channel_4
    dw Sfx_52_Channel_4
    dw Sfx_52_Channel_5
Sfx_52_Channel_5:
            sampleL 10,37
    channel_end
byte_1F1D:      db 0F0h
    db  0
Sfx_52_Channel_4:
    channel_end
    db 2
    dw byte_1F1D
    dw byte_1F1D
    dw byte_1F1D
