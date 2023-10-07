
; ASM FILE data\battles\global\aipriority.asm :
; 0xD8F4..0xDA82 : AI priority data
table_HealPriorityMoveTypes:
                dc.b $FF
                dc.b MOVETYPE_LOWER_HEALER
                dc.b MOVETYPE_LOWER_MAGE
                dc.b MOVETYPE_LOWER_STEALTH_ARCHER
                dc.b MOVETYPE_LOWER_CENTAUR_ARCHER
                dc.b MOVETYPE_LOWER_ARCHER
                dc.b MOVETYPE_LOWER_HOVERING
                dc.b MOVETYPE_LOWER_FLYING
                dc.b MOVETYPE_LOWER_BRASS_GUNNER
                dc.b MOVETYPE_LOWER_STEALTH
                dc.b MOVETYPE_LOWER_CENTAUR
                dc.b MOVETYPE_LOWER_REGULAR
                dc.b MOVETYPE_LOWER_AQUATIC
                
table_AttackPriority_Regular:
                dc.b CLASS_SDMN
                dc.b CLASS_HERO
                dc.b CLASS_MAGE
                dc.b CLASS_SORC
                dc.b CLASS_WIZ
                dc.b CLASS_PRST
                dc.b CLASS_VICR
                dc.b CLASS_MMNK
                dc.b CLASS_BDMN
                dc.b CLASS_PHNK
                dc.b CLASS_BDBT
                dc.b CLASS_PGNT
                dc.b CLASS_PHNX
                dc.b CLASS_THIF
                dc.b CLASS_NINJ
                dc.b CLASS_ACHR
                dc.b CLASS_RNGR
                dc.b CLASS_SNIP
                dc.b CLASS_BWNT
                dc.b CLASS_BRGN
                dc.b CLASS_WFMN
                dc.b CLASS_WFBR
                dc.b CLASS_KNTE
                dc.b CLASS_PLDN
                dc.b CLASS_RBT
                dc.b CLASS_WARR
                dc.b CLASS_RDBN
                dc.b CLASS_BRN
                dc.b CLASS_GLDT
                dc.b CLASS_GLM
                dc.b CLASS_TORT
                dc.b CLASS_MNST
                
table_AttackPriority_Mage:
                dc.b CLASS_SDMN
                dc.b CLASS_HERO
                dc.b CLASS_TORT
                dc.b CLASS_MNST
                dc.b CLASS_GLM
                dc.b CLASS_WARR
                dc.b CLASS_GLDT
                dc.b CLASS_BRN
                dc.b CLASS_RDBN
                dc.b CLASS_RBT
                dc.b CLASS_KNTE
                dc.b CLASS_PLDN
                dc.b CLASS_WFMN
                dc.b CLASS_WFBR
                dc.b CLASS_RNGR
                dc.b CLASS_ACHR
                dc.b CLASS_BRGN
                dc.b CLASS_BWNT
                dc.b CLASS_SNIP
                dc.b CLASS_THIF
                dc.b CLASS_NINJ
                dc.b CLASS_MAGE
                dc.b CLASS_WIZ
                dc.b CLASS_SORC
                dc.b CLASS_PRST
                dc.b CLASS_MMNK
                dc.b CLASS_VICR
                dc.b CLASS_PHNK
                dc.b CLASS_BDMN
                dc.b CLASS_PHNX
                dc.b CLASS_PGNT
                dc.b CLASS_BDBT
                
table_AttackPriority_Archer:
                dc.b CLASS_BDMN
                dc.b CLASS_PHNK
                dc.b CLASS_BDBT
                dc.b CLASS_PGNT
                dc.b CLASS_PHNX
                dc.b CLASS_MAGE
                dc.b CLASS_SORC
                dc.b CLASS_WIZ
                dc.b CLASS_PRST
                dc.b CLASS_VICR
                dc.b CLASS_MMNK
                dc.b CLASS_SDMN
                dc.b CLASS_HERO
                dc.b CLASS_THIF
                dc.b CLASS_NINJ
                dc.b CLASS_ACHR
                dc.b CLASS_RNGR
                dc.b CLASS_SNIP
                dc.b CLASS_BWNT
                dc.b CLASS_BRGN
                dc.b CLASS_WFMN
                dc.b CLASS_WFBR
                dc.b CLASS_KNTE
                dc.b CLASS_PLDN
                dc.b CLASS_RBT
                dc.b CLASS_WARR
                dc.b CLASS_RDBN
                dc.b CLASS_BRN
                dc.b CLASS_GLDT
                dc.b CLASS_GLM
                dc.b CLASS_TORT
                dc.b CLASS_MNST
                
table_AttackPriority_Flying:
                dc.b CLASS_SDMN
                dc.b CLASS_HERO
                dc.b CLASS_MAGE
                dc.b CLASS_SORC
                dc.b CLASS_WIZ
                dc.b CLASS_PRST
                dc.b CLASS_VICR
                dc.b CLASS_MMNK
                dc.b CLASS_WARR
                dc.b CLASS_RDBN
                dc.b CLASS_BRN
                dc.b CLASS_GLDT
                dc.b CLASS_GLM
                dc.b CLASS_WFMN
                dc.b CLASS_WFBR
                dc.b CLASS_KNTE
                dc.b CLASS_PLDN
                dc.b CLASS_RBT
                dc.b CLASS_TORT
                dc.b CLASS_MNST
                dc.b CLASS_BDMN
                dc.b CLASS_PHNK
                dc.b CLASS_BDBT
                dc.b CLASS_PGNT
                dc.b CLASS_PHNX
                dc.b CLASS_THIF
                dc.b CLASS_NINJ
                dc.b CLASS_ACHR
                dc.b CLASS_RNGR
                dc.b CLASS_SNIP
                dc.b CLASS_BWNT
                dc.b CLASS_BRGN
                dc.b CLASS_NONE
                
pt_AttackPriorityForMoveType:
                dc.l table_AttackPriority_Regular ; moveType None
                dc.l table_AttackPriority_Regular ; moveType Regular
                dc.l table_AttackPriority_Regular ; moveType Centaur
                dc.l table_AttackPriority_Regular ; moveType Stealth
                dc.l table_AttackPriority_Regular ; moveType Brass Gunner
                dc.l table_AttackPriority_Flying ; moveType Flying
                dc.l table_AttackPriority_Flying ; moveType Hovering
                dc.l table_AttackPriority_Regular ; moveType Aquatic
                dc.l table_AttackPriority_Archer ; moveType Archer
                dc.l table_AttackPriority_Archer ; moveType Centaur Archer
                dc.l table_AttackPriority_Mage ; moveType Stealth Archer
                dc.l table_AttackPriority_Mage ; moveType Mage
                dc.l table_AttackPriority_Regular ; moveType Healer
                dc.l table_AttackPriority_Regular
                dc.l table_AttackPriority_Regular
                dc.l table_AttackPriority_Regular
                
pt_D9C2:        dc.l table_DA02         ; moveType None
                dc.l table_DA02         ; moveType Regular
                dc.l table_DA02         ; moveType Centaur
                dc.l table_DA02         ; moveType Stealth
                dc.l table_DA02         ; moveType Brass Gunner
                dc.l table_DA62         ; moveType Flying
                dc.l table_DA62         ; moveType Hovering
                dc.l table_DA02         ; moveType Aquatic
                dc.l table_DA42         ; moveType Archer
                dc.l table_DA42         ; moveType Centaur Archer
                dc.l table_DA22         ; moveType Stealth Archer
                dc.l table_DA22         ; moveType Mage
                dc.l table_DA02         ; moveType Healer
                dc.l table_DA02
                dc.l table_DA02
                dc.l table_DA02
                
table_DA02:     dc.b 4
                dc.b 1
                dc.b 0
                dc.b 4
                dc.b 4
                dc.b 2
                dc.b 2
                dc.b 1
                dc.b 2
                dc.b 2
                dc.b 2
                dc.b 0
                dc.b 4
                dc.b 1
                dc.b 2
                dc.b 0
                dc.b 0
                dc.b 4
                dc.b 4
                dc.b 4
                dc.b 4
                dc.b 2
                dc.b 2
                dc.b 2
                dc.b 1
                dc.b 2
                dc.b 2
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                
table_DA22:     dc.b 3
                dc.b 1
                dc.b 3
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 3
                dc.b 3
                dc.b 2
                dc.b 0
                dc.b 3
                dc.b 3
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 3
                dc.b 2
                dc.b 3
                dc.b 3
                
table_DA42:     dc.b 3
                dc.b 1
                dc.b 0
                dc.b 3
                dc.b 3
                dc.b 2
                dc.b 4
                dc.b 2
                dc.b 2
                dc.b 4
                dc.b 2
                dc.b 0
                dc.b 3
                dc.b 1
                dc.b 4
                dc.b 0
                dc.b 0
                dc.b 3
                dc.b 3
                dc.b 3
                dc.b 3
                dc.b 2
                dc.b 2
                dc.b 4
                dc.b 2
                dc.b 2
                dc.b 4
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                
table_DA62:     dc.b 3
                dc.b 2
                dc.b 2
                dc.b 3
                dc.b 3
                dc.b 0
                dc.b 1
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 3
                dc.b 2
                dc.b 1
                dc.b 2
                dc.b 2
                dc.b 3
                dc.b 3
                dc.b 3
                dc.b 3
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 1
                dc.b 2
                dc.b 2
                dc.b 2
