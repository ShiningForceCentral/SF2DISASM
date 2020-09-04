
; ASM FILE data\stats\allies\growthcurves.asm :
; 0x1EE02C..0x1EE270 : Stat growth curves
tbl_StatGrowthCurves:
                
; 29 entries per curve (one per level), 2 bytes each :
;       a : Total fraction of growth expected to have been gained by this level = a/256
;       b : Fraction of growth to be gained this level = b/256
                
; Linear
                dc.w 8, 8               ;  level 2
                dc.w 17, 9              ;  level 3
                dc.w 26, 9              ;  level 4
                dc.w 35, 9              ;  level 5
                dc.w 44, 9              ;  level 6
                dc.w 52, 8              ;  level 7
                dc.w 61, 9              ;  level 8
                dc.w 70, 9              ;  level 9
                dc.w 79, 9              ;  level 10
                dc.w 88, 9              ;  level 11
                dc.w 97, 9              ;  level 12
                dc.w 105, 8             ;  level 13
                dc.w 114, 9             ;  level 14
                dc.w 123, 9             ;  level 15
                dc.w 132, 9             ;  level 16
                dc.w 141, 9             ;  level 17
                dc.w 150, 9             ;  level 18
                dc.w 158, 8             ;  level 19
                dc.w 167, 9             ;  level 20
                dc.w 176, 9             ;  level 21
                dc.w 185, 9             ;  level 22
                dc.w 194, 9             ;  level 23
                dc.w 203, 9             ;  level 24
                dc.w 211, 8             ;  level 25
                dc.w 220, 9             ;  level 26
                dc.w 229, 9             ;  level 27
                dc.w 238, 9             ;  level 28
                dc.w 247, 9             ;  level 29
                dc.w 256, 9             ;  level 30
                    
                ; Late
                dc.w 6, 6               ;  level 2
                dc.w 13, 7              ;  level 3
                dc.w 20, 7              ;  level 4
                dc.w 27, 7              ;  level 5
                dc.w 35, 8              ;  level 6
                dc.w 42, 7              ;  level 7
                dc.w 50, 8              ;  level 8
                dc.w 58, 8              ;  level 9
                dc.w 66, 8              ;  level 10
                dc.w 74, 8              ;  level 11
                dc.w 82, 8              ;  level 12
                dc.w 90, 8              ;  level 13
                dc.w 99, 9              ;  level 14
                dc.w 108, 9             ;  level 15
                dc.w 117, 9             ;  level 16
                dc.w 126, 9             ;  level 17
                dc.w 135, 9             ;  level 18
                dc.w 144, 9             ;  level 19
                dc.w 153, 9             ;  level 20
                dc.w 163, 10            ;  level 21
                dc.w 173, 10            ;  level 22
                dc.w 183, 10            ;  level 23
                dc.w 193, 10            ;  level 24
                dc.w 202, 9             ;  level 25
                dc.w 213, 11            ;  level 26
                dc.w 223, 10            ;  level 27
                dc.w 234, 11            ;  level 28
                dc.w 244, 10            ;  level 29
                dc.w 256, 12            ;  level 30
                    
                ; Early
                dc.w 11, 11             ;  level 2
                dc.w 22, 11             ;  level 3
                dc.w 32, 10             ;  level 4
                dc.w 43, 11             ;  level 5
                dc.w 53, 10             ;  level 6
                dc.w 62, 9              ;  level 7
                dc.w 73, 11             ;  level 8
                dc.w 82, 9              ;  level 9
                dc.w 92, 10             ;  level 10
                dc.w 102, 10            ;  level 11
                dc.w 112, 10            ;  level 12
                dc.w 120, 8             ;  level 13
                dc.w 129, 9             ;  level 14
                dc.w 138, 9             ;  level 15
                dc.w 147, 9             ;  level 16
                dc.w 156, 9             ;  level 17
                dc.w 165, 9             ;  level 18
                dc.w 173, 8             ;  level 19
                dc.w 181, 8             ;  level 20
                dc.w 189, 8             ;  level 21
                dc.w 197, 8             ;  level 22
                dc.w 206, 9             ;  level 23
                dc.w 213, 7             ;  level 24
                dc.w 220, 7             ;  level 25
                dc.w 228, 8             ;  level 26
                dc.w 235, 7             ;  level 27
                dc.w 242, 7             ;  level 28
                dc.w 250, 8             ;  level 29
                dc.w 256, 6             ;  level 30
                    
                ; Middle
                dc.w 6, 6               ;  level 2
                dc.w 13, 7              ;  level 3
                dc.w 21, 8              ;  level 4
                dc.w 29, 8              ;  level 5
                dc.w 37, 8              ;  level 6
                dc.w 44, 7              ;  level 7
                dc.w 53, 9              ;  level 8
                dc.w 62, 9              ;  level 9
                dc.w 72, 10             ;  level 10
                dc.w 81, 9              ;  level 11
                dc.w 91, 10             ;  level 12
                dc.w 100, 9             ;  level 13
                dc.w 111, 11            ;  level 14
                dc.w 122, 11            ;  level 15
                dc.w 133, 11            ;  level 16
                dc.w 144, 11            ;  level 17
                dc.w 155, 11            ;  level 18
                dc.w 164, 9             ;  level 19
                dc.w 174, 10            ;  level 20
                dc.w 183, 9             ;  level 21
                dc.w 193, 10            ;  level 22
                dc.w 202, 9             ;  level 23
                dc.w 211, 9             ;  level 24
                dc.w 218, 7             ;  level 25
                dc.w 226, 8             ;  level 26
                dc.w 234, 8             ;  level 27
                dc.w 242, 8             ;  level 28
                dc.w 249, 7             ;  level 29
                dc.w 256, 7             ;  level 30
                    
                ; Early and late
                dc.w 12, 12             ;  level 2
                dc.w 24, 12             ;  level 3
                dc.w 35, 11             ;  level 4
                dc.w 46, 11             ;  level 5
                dc.w 56, 10             ;  level 6
                dc.w 64, 8              ;  level 7
                dc.w 73, 9              ;  level 8
                dc.w 81, 8              ;  level 9
                dc.w 89, 8              ;  level 10
                dc.w 97, 8              ;  level 11
                dc.w 104, 7             ;  level 12
                dc.w 111, 7             ;  level 13
                dc.w 117, 6             ;  level 14
                dc.w 124, 7             ;  level 15
                dc.w 131, 7             ;  level 16
                dc.w 138, 7             ;  level 17
                dc.w 144, 6             ;  level 18
                dc.w 151, 7             ;  level 19
                dc.w 158, 7             ;  level 20
                dc.w 166, 8             ;  level 21
                dc.w 174, 8             ;  level 22
                dc.w 182, 8             ;  level 23
                dc.w 191, 9             ;  level 24
                dc.w 199, 8             ;  level 25
                dc.w 209, 10            ;  level 26
                dc.w 220, 11            ;  level 27
                dc.w 231, 11            ;  level 28
                dc.w 243, 12            ;  level 29
                dc.w 256, 13            ;  level 30
                    
