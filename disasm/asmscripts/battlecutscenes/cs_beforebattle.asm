
; SCRIPT SECTION battlecutscenes\cs_beforebattle :
; Before battle cutscenes

; =============== S U B R O U T I N E =======================================

; cutscene before the battle begins

j_ExecuteBattleCutscene_Intro_0:
										
										movem.l d1,-(sp)
										clr.w   d1
										move.b  ((RAM_CurrentBattleIdx-$1000000)).w,d1
										add.w   #$1C2,d1
										jsr     j_CheckFlag
										bne.w   loc_47AE8
										movem.l d0/a0,-(sp)
										clr.w   d0
										move.b  ((RAM_CurrentBattleIdx-$1000000)).w,d0
										add.w   d0,d0
										move.w  rpt_BeforeBattleCutscenes(pc,d0.w),d0
																						; rpt_BattleCutscenes
										lea     rpt_BeforeBattleCutscenes(pc,d0.w),a0
										bsr.w   ExecuteMapScript
										movem.l (sp)+,d0/a0
										bra.w   loc_47AE8
rpt_BeforeBattleCutscenes:
										
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w bbcs_01-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w bbcs_03-rpt_BeforeBattleCutscenes
										dc.w bbcs_04-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w bbcs_06-rpt_BeforeBattleCutscenes
										dc.w bbcs_07-rpt_BeforeBattleCutscenes
										dc.w bbcs_08-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w bbcs_11-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w bbcs_15-rpt_BeforeBattleCutscenes
										dc.w bbcs_16-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w bbcs_18-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w bbcs_21-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w bbcs_26-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w bbcs_28-rpt_BeforeBattleCutscenes
										dc.w bbcs_29-rpt_BeforeBattleCutscenes
										dc.w bbcs_30-rpt_BeforeBattleCutscenes
										dc.w bbcs_31-rpt_BeforeBattleCutscenes
										dc.w bbcs_32-rpt_BeforeBattleCutscenes
										dc.w bbcs_33-rpt_BeforeBattleCutscenes
										dc.w bbcs_34-rpt_BeforeBattleCutscenes
										dc.w bbcs_35-rpt_BeforeBattleCutscenes
										dc.w bbcs_36-rpt_BeforeBattleCutscenes
										dc.w bbcs_37-rpt_BeforeBattleCutscenes
										dc.w bbcs_38-rpt_BeforeBattleCutscenes
										dc.w bbcs_39-rpt_BeforeBattleCutscenes
										dc.w bbcs_40-rpt_BeforeBattleCutscenes
										dc.w bbcs_41-rpt_BeforeBattleCutscenes
										dc.w bbcs_42-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
										dc.w cs_Nothing+$10000-rpt_BeforeBattleCutscenes
