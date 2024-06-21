
; ASM FILE data\battles\global\landeffectsettingsandmovecosts.asm :
; 0xD824..0xD8F4 : Land effect settings and move costs table
table_LandEffectSettingsAndMovecosts:
                
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
                landEffectAndMoveCost OBSTRUCTED ; 0: Low Sky
                landEffectAndMoveCost LE15|2 ; 1: Plains
                landEffectAndMoveCost LE0|2 ; 2: Path
                landEffectAndMoveCost LE30|3 ; 3: Grass
                landEffectAndMoveCost LE30|4 ; 4: Forest
                landEffectAndMoveCost LE30|3 ; 5: Hills
                landEffectAndMoveCost LE30|3 ; 6: Desert
                landEffectAndMoveCost OBSTRUCTED ; 7: High Sky
                landEffectAndMoveCost OBSTRUCTED ; 8: Water
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 2: Centaur
                landEffectAndMoveCost OBSTRUCTED ; 0: Low Sky
                landEffectAndMoveCost LE15|2 ; 1: Plains
                landEffectAndMoveCost LE0|2 ; 2: Path
                landEffectAndMoveCost LE30|3 ; 3: Grass
                landEffectAndMoveCost LE30|5 ; 4: Forest
                landEffectAndMoveCost LE30|5 ; 5: Hills
                landEffectAndMoveCost LE30|5 ; 6: Desert
                landEffectAndMoveCost OBSTRUCTED ; 7: High Sky
                landEffectAndMoveCost OBSTRUCTED ; 8: Water
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 3: Stealth
                landEffectAndMoveCost OBSTRUCTED ; 0: Low Sky
                landEffectAndMoveCost LE15|2 ; 1: Plains
                landEffectAndMoveCost LE0|2 ; 2: Path
                landEffectAndMoveCost LE30|2 ; 3: Grass
                landEffectAndMoveCost LE30|2 ; 4: Forest
                landEffectAndMoveCost LE30|2 ; 5: Hills
                landEffectAndMoveCost LE30|4 ; 6: Desert
                landEffectAndMoveCost OBSTRUCTED ; 7: High Sky
                landEffectAndMoveCost OBSTRUCTED ; 8: Water
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 4: Brass Gunner
                landEffectAndMoveCost OBSTRUCTED ; 0: Low Sky
                landEffectAndMoveCost LE15|2 ; 1: Plains
                landEffectAndMoveCost LE0|2 ; 2: Path
                landEffectAndMoveCost LE30|2 ; 3: Grass
                landEffectAndMoveCost LE30|3 ; 4: Forest
                landEffectAndMoveCost LE30|3 ; 5: Hills
                landEffectAndMoveCost LE30|3 ; 6: Desert
                landEffectAndMoveCost OBSTRUCTED ; 7: High Sky
                landEffectAndMoveCost OBSTRUCTED ; 8: Water
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 5: Flying
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
                
; 6: Hovering
                landEffectAndMoveCost LE0|2 ; 0: Low Sky
                landEffectAndMoveCost LE15|2 ; 1: Plains
                landEffectAndMoveCost LE0|2 ; 2: Path
                landEffectAndMoveCost LE30|2 ; 3: Grass
                landEffectAndMoveCost LE30|2 ; 4: Forest
                landEffectAndMoveCost LE30|2 ; 5: Hills
                landEffectAndMoveCost LE0|2 ; 6: Desert
                landEffectAndMoveCost OBSTRUCTED ; 7: High Sky
                landEffectAndMoveCost LE0|2 ; 8: Water
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 7: Aquatic
                landEffectAndMoveCost OBSTRUCTED ; 0: Low Sky
                landEffectAndMoveCost OBSTRUCTED ; 1: Plains
                landEffectAndMoveCost OBSTRUCTED ; 2: Path
                landEffectAndMoveCost OBSTRUCTED ; 3: Grass
                landEffectAndMoveCost OBSTRUCTED ; 4: Forest
                landEffectAndMoveCost OBSTRUCTED ; 5: Hills
                landEffectAndMoveCost OBSTRUCTED ; 6: Desert
                landEffectAndMoveCost OBSTRUCTED ; 7: High Sky
                landEffectAndMoveCost LE30|2 ; 8: Water
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 8: Archer
                landEffectAndMoveCost OBSTRUCTED ; 0: Low Sky
                landEffectAndMoveCost LE15|2 ; 1: Plains
                landEffectAndMoveCost LE0|2 ; 2: Path
                landEffectAndMoveCost LE30|3 ; 3: Grass
                landEffectAndMoveCost LE30|4 ; 4: Forest
                landEffectAndMoveCost LE30|3 ; 5: Hills
                landEffectAndMoveCost LE30|3 ; 6: Desert
                landEffectAndMoveCost OBSTRUCTED ; 7: High Sky
                landEffectAndMoveCost OBSTRUCTED ; 8: Water
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 9: Centaur Archer
                landEffectAndMoveCost OBSTRUCTED ; 0: Low Sky
                landEffectAndMoveCost LE15|2 ; 1: Plains
                landEffectAndMoveCost LE0|2 ; 2: Path
                landEffectAndMoveCost LE30|3 ; 3: Grass
                landEffectAndMoveCost LE30|5 ; 4: Forest
                landEffectAndMoveCost LE30|5 ; 5: Hills
                landEffectAndMoveCost LE30|5 ; 6: Desert
                landEffectAndMoveCost OBSTRUCTED ; 7: High Sky
                landEffectAndMoveCost OBSTRUCTED ; 8: Water
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 10: Stealth Archer
                landEffectAndMoveCost OBSTRUCTED ; 0: Low Sky
                landEffectAndMoveCost LE15|2 ; 1: Plains
                landEffectAndMoveCost LE0|2 ; 2: Path
                landEffectAndMoveCost LE30|2 ; 3: Grass
                landEffectAndMoveCost LE30|2 ; 4: Forest
                landEffectAndMoveCost LE30|2 ; 5: Hills
                landEffectAndMoveCost LE30|4 ; 6: Desert
                landEffectAndMoveCost OBSTRUCTED ; 7: High Sky
                landEffectAndMoveCost OBSTRUCTED ; 8: Water
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 11: Mage
                landEffectAndMoveCost OBSTRUCTED ; 0: Low Sky
                landEffectAndMoveCost LE15|2 ; 1: Plains
                landEffectAndMoveCost LE0|2 ; 2: Path
                landEffectAndMoveCost LE30|3 ; 3: Grass
                landEffectAndMoveCost LE30|4 ; 4: Forest
                landEffectAndMoveCost LE30|3 ; 5: Hills
                landEffectAndMoveCost LE30|3 ; 6: Desert
                landEffectAndMoveCost OBSTRUCTED ; 7: High Sky
                landEffectAndMoveCost OBSTRUCTED ; 8: Water
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
; 12: Healer
                landEffectAndMoveCost OBSTRUCTED ; 0: Low Sky
                landEffectAndMoveCost LE15|2 ; 1: Plains
                landEffectAndMoveCost LE0|2 ; 2: Path
                landEffectAndMoveCost LE30|3 ; 3: Grass
                landEffectAndMoveCost LE30|4 ; 4: Forest
                landEffectAndMoveCost LE30|3 ; 5: Hills
                landEffectAndMoveCost LE30|3 ; 6: Desert
                landEffectAndMoveCost OBSTRUCTED ; 7: High Sky
                landEffectAndMoveCost OBSTRUCTED ; 8: Water
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                landEffectAndMoveCost OBSTRUCTED
                
