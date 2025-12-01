
; ASM FILE data\battles\global\aipriority.asm :
; 0xD8F4..0xDA82 : AI priority data
table_HealPriorityMovetypes:
                dc.b -1
                dc.b MOVETYPE_HEALER
                dc.b MOVETYPE_MAGE
                dc.b MOVETYPE_STEALTH_ARCHER
                dc.b MOVETYPE_CENTAUR_ARCHER
                dc.b MOVETYPE_ARCHER
                dc.b MOVETYPE_HOVERING
                dc.b MOVETYPE_FLYING
                dc.b MOVETYPE_BRASS_GUNNER
                dc.b MOVETYPE_STEALTH
                dc.b MOVETYPE_CENTAUR
                dc.b MOVETYPE_REGULAR
                dc.b MOVETYPE_AQUATIC
                
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
                
                align
                
pt_AttackPriorityClassesForMovetype:
                dc.l table_AttackPriority_Regular ; movetype None
                dc.l table_AttackPriority_Regular ; movetype Regular
                dc.l table_AttackPriority_Regular ; movetype Centaur
                dc.l table_AttackPriority_Regular ; movetype Stealth
                dc.l table_AttackPriority_Regular ; movetype Brass Gunner
                dc.l table_AttackPriority_Flying ; movetype Flying
                dc.l table_AttackPriority_Flying ; movetype Hovering
                dc.l table_AttackPriority_Regular ; movetype Aquatic
                dc.l table_AttackPriority_Archer ; movetype Archer
                dc.l table_AttackPriority_Archer ; movetype Centaur Archer
                dc.l table_AttackPriority_Mage ; movetype Stealth Archer
                dc.l table_AttackPriority_Mage ; movetype Mage
                dc.l table_AttackPriority_Regular ; movetype Healer
                dc.l table_AttackPriority_Regular
                dc.l table_AttackPriority_Regular
                dc.l table_AttackPriority_Regular
                
pt_AttackPriorityAdjustmentsForMovetype:
                dc.l table_PriorityAdjustments_Regular ; movetype None
                dc.l table_PriorityAdjustments_Regular ; movetype Regular
                dc.l table_PriorityAdjustments_Regular ; movetype Centaur
                dc.l table_PriorityAdjustments_Regular ; movetype Stealth
                dc.l table_PriorityAdjustments_Regular ; movetype Brass Gunner
                dc.l table_PriorityAdjustments_Flying ; movetype Flying
                dc.l table_PriorityAdjustments_Flying ; movetype Hovering
                dc.l table_PriorityAdjustments_Regular ; movetype Aquatic
                dc.l table_PriorityAdjustments_Archer ; movetype Archer
                dc.l table_PriorityAdjustments_Archer ; movetype Centaur Archer
                dc.l table_PriorityAdjustments_Mage ; movetype Stealth Archer
                dc.l table_PriorityAdjustments_Mage ; movetype Mage
                dc.l table_PriorityAdjustments_Regular ; movetype Healer
                dc.l table_PriorityAdjustments_Regular
                dc.l table_PriorityAdjustments_Regular
                dc.l table_PriorityAdjustments_Regular
                
table_PriorityAdjustments_Regular:
                dc.b 4                  ; SDMN
                dc.b 1                  ; KNTE
                dc.b 0                  ; WARR
                dc.b 4                  ; MAGE
                dc.b 4                  ; PRST
                dc.b 2                  ; ACHR
                dc.b 2                  ; BDMN
                dc.b 1                  ; WFMN
                dc.b 2                  ; RNGR
                dc.b 2                  ; PHNK
                dc.b 2                  ; THIF
                dc.b 0                  ; TORT
                dc.b 4                  ; HERO
                dc.b 1                  ; PLDN
                dc.b 2                  ; PGNT
                dc.b 0                  ; GLDT
                dc.b 0                  ; BRN
                dc.b 4                  ; WIZ
                dc.b 4                  ; SORC
                dc.b 4                  ; VICR
                dc.b 4                  ; MMNK
                dc.b 2                  ; SNIP
                dc.b 2                  ; BRGN
                dc.b 2                  ; BDBT
                dc.b 1                  ; WFBR
                dc.b 2                  ; BWNT
                dc.b 2                  ; PHNX
                dc.b 2                  ; NINJ
                dc.b 0                  ; MNST
                dc.b 1                  ; RBT
                dc.b 0                  ; GLM
                dc.b 0                  ; RDBN
                
table_PriorityAdjustments_Mage:
                dc.b 3                  ; SDMN
                dc.b 1                  ; KNTE
                dc.b 3                  ; WARR
                dc.b 0                  ; MAGE
                dc.b 0                  ; PRST
                dc.b 1                  ; ACHR
                dc.b 0                  ; BDMN
                dc.b 1                  ; WFMN
                dc.b 1                  ; RNGR
                dc.b 0                  ; PHNK
                dc.b 1                  ; THIF
                dc.b 3                  ; TORT
                dc.b 3                  ; HERO
                dc.b 2                  ; PLDN
                dc.b 0                  ; PGNT
                dc.b 3                  ; GLDT
                dc.b 3                  ; BRN
                dc.b 0                  ; WIZ
                dc.b 0                  ; SORC
                dc.b 0                  ; VICR
                dc.b 0                  ; MMNK
                dc.b 1                  ; SNIP
                dc.b 1                  ; BRGN
                dc.b 0                  ; BDBT
                dc.b 1                  ; WFBR
                dc.b 1                  ; BWNT
                dc.b 0                  ; PHNX
                dc.b 1                  ; NINJ
                dc.b 3                  ; MNST
                dc.b 2                  ; RBT
                dc.b 3                  ; GLM
                dc.b 3                  ; RDBN
                
table_PriorityAdjustments_Archer:
                dc.b 3                  ; SDMN
                dc.b 1                  ; KNTE
                dc.b 0                  ; WARR
                dc.b 3                  ; MAGE
                dc.b 3                  ; PRST
                dc.b 2                  ; ACHR
                dc.b 4                  ; BDMN
                dc.b 2                  ; WFMN
                dc.b 2                  ; RNGR
                dc.b 4                  ; PHNK
                dc.b 2                  ; THIF
                dc.b 0                  ; TORT
                dc.b 3                  ; HERO
                dc.b 1                  ; PLDN
                dc.b 4                  ; PGNT
                dc.b 0                  ; GLDT
                dc.b 0                  ; BRN
                dc.b 3                  ; WIZ
                dc.b 3                  ; SORC
                dc.b 3                  ; VICR
                dc.b 3                  ; MMNK
                dc.b 2                  ; SNIP
                dc.b 2                  ; BRGN
                dc.b 4                  ; BDBT
                dc.b 2                  ; WFBR
                dc.b 2                  ; BWNT
                dc.b 4                  ; PHNX
                dc.b 2                  ; NINJ
                dc.b 0                  ; MNST
                dc.b 1                  ; RBT
                dc.b 0                  ; GLM
                dc.b 0                  ; RDBN
                
table_PriorityAdjustments_Flying:
                dc.b 3                  ; SDMN
                dc.b 2                  ; KNTE
                dc.b 2                  ; WARR
                dc.b 3                  ; MAGE
                dc.b 3                  ; PRST
                dc.b 0                  ; ACHR
                dc.b 1                  ; BDMN
                dc.b 2                  ; WFMN
                dc.b 0                  ; RNGR
                dc.b 1                  ; PHNK
                dc.b 0                  ; THIF
                dc.b 1                  ; TORT
                dc.b 3                  ; HERO
                dc.b 2                  ; PLDN
                dc.b 1                  ; PGNT
                dc.b 2                  ; GLDT
                dc.b 2                  ; BRN
                dc.b 3                  ; WIZ
                dc.b 3                  ; SORC
                dc.b 3                  ; VICR
                dc.b 3                  ; MMNK
                dc.b 0                  ; SNIP
                dc.b 0                  ; BRGN
                dc.b 1                  ; BDBT
                dc.b 2                  ; WFBR
                dc.b 0                  ; BWNT
                dc.b 1                  ; PHNX
                dc.b 0                  ; NINJ
                dc.b 1                  ; MNST
                dc.b 2                  ; RBT
                dc.b 2                  ; GLM
                dc.b 2                  ; RDBN
