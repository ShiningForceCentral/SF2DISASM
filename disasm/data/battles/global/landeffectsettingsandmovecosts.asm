
; ASM FILE data\battles\global\landeffectsettingsandmovecosts.asm :
; 0xD824..0xD8F4 : Land effect settings and move costs table
table_LandEffectSettingsAndMovecosts:
                
; Syntax        landEffectAndMovecost [LANDEFFECTSETTING_]enum|movecost
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
; 0: Unrestricted
                landEffectAndMovecost LE0|2         ; 0: Low Sky
                landEffectAndMovecost LE0|2         ; 1: Plains
                landEffectAndMovecost LE0|2         ; 2: Path
                landEffectAndMovecost LE0|2         ; 3: Grass
                landEffectAndMovecost LE0|2         ; 4: Forest
                landEffectAndMovecost LE0|2         ; 5: Hills
                landEffectAndMovecost LE0|2         ; 6: Desert
                landEffectAndMovecost LE0|2         ; 7: High Sky
                landEffectAndMovecost LE0|2         ; 8: Water
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                
; 1: Regular
                landEffectAndMovecost OBSTRUCTED    ; 0: Low Sky
                landEffectAndMovecost LE15|2        ; 1: Plains
                landEffectAndMovecost LE0|2         ; 2: Path
                landEffectAndMovecost LE30|3        ; 3: Grass
                landEffectAndMovecost LE30|4        ; 4: Forest
                landEffectAndMovecost LE30|3        ; 5: Hills
                landEffectAndMovecost LE30|3        ; 6: Desert
                landEffectAndMovecost OBSTRUCTED    ; 7: High Sky
                landEffectAndMovecost OBSTRUCTED    ; 8: Water
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                
; 2: Centaur
                landEffectAndMovecost OBSTRUCTED    ; 0: Low Sky
                landEffectAndMovecost LE15|2        ; 1: Plains
                landEffectAndMovecost LE0|2         ; 2: Path
                landEffectAndMovecost LE30|3        ; 3: Grass
                landEffectAndMovecost LE30|5        ; 4: Forest
                landEffectAndMovecost LE30|5        ; 5: Hills
                landEffectAndMovecost LE30|5        ; 6: Desert
                landEffectAndMovecost OBSTRUCTED    ; 7: High Sky
                landEffectAndMovecost OBSTRUCTED    ; 8: Water
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                
; 3: Stealth
                landEffectAndMovecost OBSTRUCTED    ; 0: Low Sky
                landEffectAndMovecost LE15|2        ; 1: Plains
                landEffectAndMovecost LE0|2         ; 2: Path
                landEffectAndMovecost LE30|2        ; 3: Grass
                landEffectAndMovecost LE30|2        ; 4: Forest
                landEffectAndMovecost LE30|2        ; 5: Hills
                landEffectAndMovecost LE30|4        ; 6: Desert
                landEffectAndMovecost OBSTRUCTED    ; 7: High Sky
                landEffectAndMovecost OBSTRUCTED    ; 8: Water
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                
; 4: Brass Gunner
                landEffectAndMovecost OBSTRUCTED    ; 0: Low Sky
                landEffectAndMovecost LE15|2        ; 1: Plains
                landEffectAndMovecost LE0|2         ; 2: Path
                landEffectAndMovecost LE30|2        ; 3: Grass
                landEffectAndMovecost LE30|3        ; 4: Forest
                landEffectAndMovecost LE30|3        ; 5: Hills
                landEffectAndMovecost LE30|3        ; 6: Desert
                landEffectAndMovecost OBSTRUCTED    ; 7: High Sky
                landEffectAndMovecost OBSTRUCTED    ; 8: Water
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                
; 5: Flying
                landEffectAndMovecost LE0|2         ; 0: Low Sky
                landEffectAndMovecost LE0|2         ; 1: Plains
                landEffectAndMovecost LE0|2         ; 2: Path
                landEffectAndMovecost LE0|2         ; 3: Grass
                landEffectAndMovecost LE0|2         ; 4: Forest
                landEffectAndMovecost LE0|2         ; 5: Hills
                landEffectAndMovecost LE0|2         ; 6: Desert
                landEffectAndMovecost LE0|2         ; 7: High Sky
                landEffectAndMovecost LE0|2         ; 8: Water
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                
; 6: Hovering
                landEffectAndMovecost LE0|2         ; 0: Low Sky
                landEffectAndMovecost LE15|2        ; 1: Plains
                landEffectAndMovecost LE0|2         ; 2: Path
                landEffectAndMovecost LE30|2        ; 3: Grass
                landEffectAndMovecost LE30|2        ; 4: Forest
                landEffectAndMovecost LE30|2        ; 5: Hills
                landEffectAndMovecost LE0|2         ; 6: Desert
                landEffectAndMovecost OBSTRUCTED    ; 7: High Sky
                landEffectAndMovecost LE0|2         ; 8: Water
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                
; 7: Aquatic
                landEffectAndMovecost OBSTRUCTED    ; 0: Low Sky
                landEffectAndMovecost OBSTRUCTED    ; 1: Plains
                landEffectAndMovecost OBSTRUCTED    ; 2: Path
                landEffectAndMovecost OBSTRUCTED    ; 3: Grass
                landEffectAndMovecost OBSTRUCTED    ; 4: Forest
                landEffectAndMovecost OBSTRUCTED    ; 5: Hills
                landEffectAndMovecost OBSTRUCTED    ; 6: Desert
                landEffectAndMovecost OBSTRUCTED    ; 7: High Sky
                landEffectAndMovecost LE30|2        ; 8: Water
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                
; 8: Archer
                landEffectAndMovecost OBSTRUCTED    ; 0: Low Sky
                landEffectAndMovecost LE15|2        ; 1: Plains
                landEffectAndMovecost LE0|2         ; 2: Path
                landEffectAndMovecost LE30|3        ; 3: Grass
                landEffectAndMovecost LE30|4        ; 4: Forest
                landEffectAndMovecost LE30|3        ; 5: Hills
                landEffectAndMovecost LE30|3        ; 6: Desert
                landEffectAndMovecost OBSTRUCTED    ; 7: High Sky
                landEffectAndMovecost OBSTRUCTED    ; 8: Water
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                
; 9: Centaur Archer
                landEffectAndMovecost OBSTRUCTED    ; 0: Low Sky
                landEffectAndMovecost LE15|2        ; 1: Plains
                landEffectAndMovecost LE0|2         ; 2: Path
                landEffectAndMovecost LE30|3        ; 3: Grass
                landEffectAndMovecost LE30|5        ; 4: Forest
                landEffectAndMovecost LE30|5        ; 5: Hills
                landEffectAndMovecost LE30|5        ; 6: Desert
                landEffectAndMovecost OBSTRUCTED    ; 7: High Sky
                landEffectAndMovecost OBSTRUCTED    ; 8: Water
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                
; 10: Stealth Archer
                landEffectAndMovecost OBSTRUCTED    ; 0: Low Sky
                landEffectAndMovecost LE15|2        ; 1: Plains
                landEffectAndMovecost LE0|2         ; 2: Path
                landEffectAndMovecost LE30|2        ; 3: Grass
                landEffectAndMovecost LE30|2        ; 4: Forest
                landEffectAndMovecost LE30|2        ; 5: Hills
                landEffectAndMovecost LE30|4        ; 6: Desert
                landEffectAndMovecost OBSTRUCTED    ; 7: High Sky
                landEffectAndMovecost OBSTRUCTED    ; 8: Water
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                
; 11: Mage
                landEffectAndMovecost OBSTRUCTED    ; 0: Low Sky
                landEffectAndMovecost LE15|2        ; 1: Plains
                landEffectAndMovecost LE0|2         ; 2: Path
                landEffectAndMovecost LE30|3        ; 3: Grass
                landEffectAndMovecost LE30|4        ; 4: Forest
                landEffectAndMovecost LE30|3        ; 5: Hills
                landEffectAndMovecost LE30|3        ; 6: Desert
                landEffectAndMovecost OBSTRUCTED    ; 7: High Sky
                landEffectAndMovecost OBSTRUCTED    ; 8: Water
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                
; 12: Healer
                landEffectAndMovecost OBSTRUCTED    ; 0: Low Sky
                landEffectAndMovecost LE15|2        ; 1: Plains
                landEffectAndMovecost LE0|2         ; 2: Path
                landEffectAndMovecost LE30|3        ; 3: Grass
                landEffectAndMovecost LE30|4        ; 4: Forest
                landEffectAndMovecost LE30|3        ; 5: Hills
                landEffectAndMovecost LE30|3        ; 6: Desert
                landEffectAndMovecost OBSTRUCTED    ; 7: High Sky
                landEffectAndMovecost OBSTRUCTED    ; 8: Water
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                landEffectAndMovecost OBSTRUCTED
                
