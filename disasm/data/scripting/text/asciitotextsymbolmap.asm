
; ASM FILE data\scripting\text\asciitotextsymbolmap.asm :
; 0x666E..0x676E : ASCII to Variable Width Font text symbol map table

                                  ; ASCII Dec Hex | VWF symbol
table_AsciiToTextSymbolMap:
                dc.b 1                  ;   0 $00
                dc.b 1                  ;   1 $01
                dc.b 1                  ;   2 $02
                dc.b 1                  ;   3 $03
                dc.b 1                  ;   4 $04
                dc.b 1                  ;   5 $05
                dc.b 1                  ;   6 $06
                dc.b 1                  ;   7 $07
                dc.b 1                  ;   8 $08
                dc.b 1                  ;   9 $09
                dc.b 1                  ;  10 $0A
                dc.b 1                  ;  11 $0B
                dc.b 1                  ;  12 $0C
                dc.b 1                  ;  13 $0D
                dc.b 1                  ;  14 $0E
                dc.b 1                  ;  15 $0F
                dc.b 1                  ;  16 $10
                dc.b 1                  ;  17 $11
                dc.b 1                  ;  18 $12
                dc.b 1                  ;  19 $13
                dc.b 1                  ;  20 $14
                dc.b 1                  ;  21 $15
                dc.b 1                  ;  22 $16
                dc.b 1                  ;  23 $17
                dc.b 1                  ;  24 $18
                dc.b 1                  ;  25 $19
                dc.b 1                  ;  26 $1A
                dc.b 1                  ;  27 $1B
                dc.b 1                  ;  28 $1C
                dc.b 1                  ;  29 $1D
                dc.b 1                  ;  30 $1E
                dc.b 1                  ;  31 $1F
                dc.b 1                  ;  32 $20
                dc.b 68                 ;  33 $21 | !
                dc.b 1                  ;  34 $22
                dc.b 75                 ;  35 $23 | #
                dc.b 1                  ;  36 $24
                dc.b 76                 ;  37 $25 | %
                dc.b 77                 ;  38 $26 | &
                dc.b 72                 ;  39 $27 | '
                dc.b 73                 ;  40 $28 | (
                dc.b 74                 ;  41 $29 | )
                dc.b 1                  ;  42 $2A
                dc.b 78                 ;  43 $2B | +
                dc.b 67                 ;  44 $2C | ,
                dc.b 65                 ;  45 $2D | -
                dc.b 66                 ;  46 $2E | .
                dc.b 79                 ;  47 $2F | /
                dc.b 2                  ;  48 $30 | 0
                dc.b 3                  ;  49 $31 | 1
                dc.b 4                  ;  50 $32 | 2
                dc.b 5                  ;  51 $33 | 3
                dc.b 6                  ;  52 $34 | 4
                dc.b 7                  ;  53 $35 | 5
                dc.b 8                  ;  54 $36 | 6
                dc.b 9                  ;  55 $37 | 7
                dc.b 10                 ;  56 $38 | 8
                dc.b 11                 ;  57 $39 | 9
                dc.b 80                 ;  58 $3A | :
                dc.b 1                  ;  59 $3B
                dc.b 73                 ;  60 $3C | (   (duplicate)
                dc.b 1                  ;  61 $3D
                dc.b 74                 ;  62 $3E | )   (duplicate)
                dc.b 69                 ;  63 $3F | ?
                dc.b 1                  ;  64 $40
                dc.b 12                 ;  65 $41 | A
                dc.b 13                 ;  66 $42 | B
                dc.b 14                 ;  67 $43 | C
                dc.b 15                 ;  68 $44 | D
                dc.b 16                 ;  69 $45 | E
                dc.b 17                 ;  70 $46 | F
                dc.b 18                 ;  71 $47 | G
                dc.b 19                 ;  72 $48 | H
                dc.b 20                 ;  73 $49 | I
                dc.b 21                 ;  74 $4A | J
                dc.b 22                 ;  75 $4B | K
                dc.b 23                 ;  76 $4C | L
                dc.b 24                 ;  77 $4D | M
                dc.b 25                 ;  78 $4E | N
                dc.b 26                 ;  79 $4F | O
                dc.b 27                 ;  80 $50 | P
                dc.b 28                 ;  81 $51 | Q
                dc.b 29                 ;  82 $52 | R
                dc.b 30                 ;  83 $53 | S
                dc.b 31                 ;  84 $54 | T
                dc.b 32                 ;  85 $55 | U
                dc.b 33                 ;  86 $56 | V
                dc.b 34                 ;  87 $57 | W
                dc.b 35                 ;  88 $58 | X
                dc.b 36                 ;  89 $59 | Y
                dc.b 37                 ;  90 $5A | Z
                dc.b 1                  ;  91 $5B
                dc.b 1                  ;  92 $5C
                dc.b 1                  ;  93 $5D
                dc.b 1                  ;  94 $5E
                dc.b 64                 ;  95 $5F | _
                dc.b 1                  ;  96 $60
                dc.b 38                 ;  97 $61 | a
                dc.b 39                 ;  98 $62 | b
                dc.b 40                 ;  99 $63 | c
                dc.b 41                 ; 100 $64 | d
                dc.b 42                 ; 101 $65 | e
                dc.b 43                 ; 102 $66 | f
                dc.b 44                 ; 103 $67 | g
                dc.b 45                 ; 104 $68 | h
                dc.b 46                 ; 105 $69 | i
                dc.b 47                 ; 106 $6A | j
                dc.b 48                 ; 107 $6B | k
                dc.b 49                 ; 108 $6C | l
                dc.b 50                 ; 109 $6D | m
                dc.b 51                 ; 110 $6E | n
                dc.b 52                 ; 111 $6F | o
                dc.b 53                 ; 112 $70 | p
                dc.b 54                 ; 113 $71 | q
                dc.b 55                 ; 114 $72 | r
                dc.b 56                 ; 115 $73 | s
                dc.b 57                 ; 116 $74 | t
                dc.b 58                 ; 117 $75 | u
                dc.b 59                 ; 118 $76 | v
                dc.b 60                 ; 119 $77 | w
                dc.b 61                 ; 120 $78 | x
                dc.b 62                 ; 121 $79 | y
                dc.b 63                 ; 122 $7A | z
                dc.b 1                  ; 123 $7B
                dc.b 1                  ; 124 $7C
                dc.b 1                  ; 125 $7D
                dc.b 1                  ; 126 $7E
                dc.b 64                 ; 127 $7F | _   (duplicate)
                dc.b 1                  ; 128 $80
                dc.b 38                 ; 129 $81 | a   (duplicate)
                dc.b 39                 ; 130 $82 | b   (duplicate)
                dc.b 40                 ; 131 $83 | c   (duplicate)
                dc.b 41                 ; 132 $84 | d   (duplicate)
                dc.b 42                 ; 133 $85 | e   (duplicate)
                dc.b 43                 ; 134 $86 | f   (duplicate)
                dc.b 44                 ; 135 $87 | g   (duplicate)
                dc.b 45                 ; 136 $88 | h   (duplicate)
                dc.b 46                 ; 137 $89 | i   (duplicate)
                dc.b 47                 ; 138 $8A | j   (duplicate)
                dc.b 48                 ; 139 $8B | k   (duplicate)
                dc.b 49                 ; 140 $8C | l   (duplicate)
                dc.b 50                 ; 141 $8D | m   (duplicate)
                dc.b 51                 ; 142 $8E | n   (duplicate)
                dc.b 52                 ; 143 $8F | o   (duplicate)
                dc.b 53                 ; 144 $90 | p   (duplicate)
                dc.b 54                 ; 145 $91 | q   (duplicate)
                dc.b 55                 ; 146 $92 | r   (duplicate)
                dc.b 56                 ; 147 $93 | s   (duplicate)
                dc.b 57                 ; 148 $94 | t   (duplicate)
                dc.b 58                 ; 149 $95 | u   (duplicate)
                dc.b 59                 ; 150 $96 | v   (duplicate)
                dc.b 60                 ; 151 $97 | w   (duplicate)
                dc.b 61                 ; 152 $98 | x   (duplicate)
                dc.b 62                 ; 153 $99 | y   (duplicate)
                dc.b 63                 ; 154 $9A | z   (duplicate)
                dc.b 1                  ; 155 $9B
                dc.b 1                  ; 156 $9C
                dc.b 1                  ; 157 $9D
                dc.b 1                  ; 158 $9E
                dc.b 64                 ; 159 $9F | _   (duplicate)
                dc.b 1                  ; 160 $A0
                dc.b 66                 ; 161 $A1 | .   (duplicate)
                dc.b 73                 ; 162 $A2 | (   (duplicate)
                dc.b 74                 ; 163 $A3 | )   (duplicate)
                dc.b 66                 ; 164 $A4 | .   (duplicate)
                dc.b 1                  ; 165 $A5
                dc.b 1                  ; 166 $A6
                dc.b 1                  ; 167 $A7
                dc.b 1                  ; 168 $A8
                dc.b 1                  ; 169 $A9
                dc.b 1                  ; 170 $AA
                dc.b 1                  ; 171 $AB
                dc.b 1                  ; 172 $AC
                dc.b 1                  ; 173 $AD
                dc.b 1                  ; 174 $AE
                dc.b 1                  ; 175 $AF
                dc.b 1                  ; 176 $B0
                dc.b 1                  ; 177 $B1
                dc.b 1                  ; 178 $B2
                dc.b 1                  ; 179 $B3
                dc.b 1                  ; 180 $B4
                dc.b 1                  ; 181 $B5
                dc.b 1                  ; 182 $B6
                dc.b 1                  ; 183 $B7
                dc.b 1                  ; 184 $B8
                dc.b 1                  ; 185 $B9
                dc.b 1                  ; 186 $BA
                dc.b 1                  ; 187 $BB
                dc.b 1                  ; 188 $BC
                dc.b 1                  ; 189 $BD
                dc.b 1                  ; 190 $BE
                dc.b 1                  ; 191 $BF
                dc.b 1                  ; 192 $C0
                dc.b 1                  ; 193 $C1
                dc.b 1                  ; 194 $C2
                dc.b 1                  ; 195 $C3
                dc.b 1                  ; 196 $C4
                dc.b 1                  ; 197 $C5
                dc.b 1                  ; 198 $C6
                dc.b 1                  ; 199 $C7
                dc.b 1                  ; 200 $C8
                dc.b 1                  ; 201 $C9
                dc.b 1                  ; 202 $CA
                dc.b 1                  ; 203 $CB
                dc.b 1                  ; 204 $CC
                dc.b 1                  ; 205 $CD
                dc.b 1                  ; 206 $CE
                dc.b 1                  ; 207 $CF
                dc.b 1                  ; 208 $D0
                dc.b 1                  ; 209 $D1
                dc.b 1                  ; 210 $D2
                dc.b 1                  ; 211 $D3
                dc.b 1                  ; 212 $D4
                dc.b 1                  ; 213 $D5
                dc.b 1                  ; 214 $D6
                dc.b 1                  ; 215 $D7
                dc.b 1                  ; 216 $D8
                dc.b 1                  ; 217 $D9
                dc.b 1                  ; 218 $DA
                dc.b 1                  ; 219 $DB
                dc.b 1                  ; 220 $DC
                dc.b 1                  ; 221 $DD
                dc.b 1                  ; 222 $DE
                dc.b 1                  ; 223 $DF
                dc.b 1                  ; 224 $E0
                dc.b 1                  ; 225 $E1
                dc.b 1                  ; 226 $E2
                dc.b 1                  ; 227 $E3
                dc.b 1                  ; 228 $E4
                dc.b 1                  ; 229 $E5
                dc.b 1                  ; 230 $E6
                dc.b 1                  ; 231 $E7
                dc.b 1                  ; 232 $E8
                dc.b 1                  ; 233 $E9
                dc.b 1                  ; 234 $EA
                dc.b 1                  ; 235 $EB
                dc.b 1                  ; 236 $EC
                dc.b 1                  ; 237 $ED
                dc.b 1                  ; 238 $EE | Flag: {DICT}
                dc.b 1                  ; 239 $EF | Flag: {N}
                dc.b 1                  ; 240 $F0 | Flag: {D2}
                dc.b 1                  ; 241 $F1 | Flag: {#}
                dc.b 1                  ; 242 $F2 | Flag: {NAME}
                dc.b 1                  ; 243 $F3 | Flag: {LEADER}
                dc.b 1                  ; 244 $F4 | Flag: {ITEM}
                dc.b 1                  ; 245 $F5 | Flag: {SPELL}
                dc.b 1                  ; 246 $F6 | Flag: {CLASS}
                dc.b 1                  ; 247 $F7 | Flag: {W2}
                dc.b 1                  ; 248 $F8 | Flag: {D1}
                dc.b 1                  ; 249 $F9 | Flag: {D3}
                dc.b 1                  ; 250 $FA | Flag: {W1}
                dc.b 1                  ; 251 $FB | Flag: {CLEAR}
                dc.b 1                  ; 252 $FC | Flag: {NAME
                dc.b 1                  ; 253 $FD | Flag: {COLOR
                dc.b 1                  ; 254 $FE | Flag: (START/EOL)
                dc.b 1                  ; 255 $FF | Flag: UNUSED
