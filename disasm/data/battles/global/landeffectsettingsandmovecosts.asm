
; ASM FILE data\battles\global\landeffectsettingsandmovecosts.asm :
; 0xD824..0xD8F4 : Land effect settings and move costs table
tbl_LandEffectSettingsAndMoveCosts:
                
; Syntax        landEffectAndMoveCost [LANDEFFECTSETTING_]enum|moveCost
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
; 0: 
                landEffectAndMoveCost LE0|2 ; 0: Low Sky
                landEffectAndMoveCost LE0|2 ; 1: Plains
                landEffectAndMoveCost LE0|2 ; 2: Path
                landEffectAndMoveCost LE0|2 ; 3: Grass
                landEffectAndMoveCost LE0|2 ; 4: Forest
                landEffectAndMoveCost LE0|2 ; 5: Hills
                landEffectAndMoveCost LE0|2 ; 6: Desert
                landEffectAndMoveCost LE0|2 ; 7: High Sky
                landEffectAndMoveCost LE0|2 ; 8: Water
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 1: Regular
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost LE15|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost LE30|4
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 2: Centaur
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost LE15|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost LE30|5
                landEffectAndMoveCost LE30|5
                landEffectAndMoveCost LE30|5
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 3: Stealth
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost LE15|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE30|2
                landEffectAndMoveCost LE30|2
                landEffectAndMoveCost LE30|2
                landEffectAndMoveCost LE30|4
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 4: Brass Gunner
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost LE15|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE30|2
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 5: Flying
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 6: Hovering
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE15|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE30|2
                landEffectAndMoveCost LE30|2
                landEffectAndMoveCost LE30|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 7: Aquatic
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost LE30|2
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 8: Archer
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost LE15|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost LE30|4
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 9: Centaur Archer
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost LE15|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost LE30|5
                landEffectAndMoveCost LE30|5
                landEffectAndMoveCost LE30|5
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 10: Stealth Archer
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost LE15|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE30|2
                landEffectAndMoveCost LE30|2
                landEffectAndMoveCost LE30|2
                landEffectAndMoveCost LE30|4
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 11: Mage
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost LE15|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost LE30|4
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 12: Healer
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost LE15|2
                landEffectAndMoveCost LE0|2
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost LE30|4
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost LE30|3
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
