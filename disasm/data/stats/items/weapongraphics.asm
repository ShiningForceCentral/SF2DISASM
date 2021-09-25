
; ASM FILE data\stats\items\weapongraphics.asm :
; 0x1F9E2..0x1FA8A : Weapon graphics table
tbl_WeaponGraphics:
                
; Syntax        weaponGraphics [WEAPONSPRITE_]enum, [WEAPONPALETTE_]enum
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    weaponGraphics NONE, SHORT_AXE ; 0: 
                    weaponGraphics NONE, SHORT_AXE ; 1: 
                    weaponGraphics NONE, SHORT_AXE ; 2: 
                    weaponGraphics NONE, SHORT_AXE ; 3: 
                    weaponGraphics NONE, SHORT_AXE ; 4: 
                    weaponGraphics NONE, SHORT_AXE ; 5: 
                    weaponGraphics NONE, SHORT_AXE ; 6: 
                    weaponGraphics NONE, SHORT_AXE ; 7: 
                    weaponGraphics NONE, SHORT_AXE ; 8: 
                    weaponGraphics NONE, SHORT_AXE ; 9: 
                    weaponGraphics NONE, SHORT_AXE ; 10: 
                    weaponGraphics NONE, SHORT_AXE ; 11: 
                    weaponGraphics NONE, SHORT_AXE ; 12: 
                    weaponGraphics NONE, SHORT_AXE ; 13: 
                    weaponGraphics NONE, SHORT_AXE ; 14: 
                    weaponGraphics NONE, SHORT_AXE ; 15: 
                    weaponGraphics NONE, SHORT_AXE ; 16: 
                    weaponGraphics NONE, SHORT_AXE ; 17: 
                    weaponGraphics NONE, SHORT_AXE ; 18: 
                    weaponGraphics NONE, SHORT_AXE ; 19: 
                    weaponGraphics NONE, SHORT_AXE ; 20: 
                    weaponGraphics NONE, SHORT_AXE ; 21: 
                    weaponGraphics NONE, SHORT_AXE ; 22: 
                    weaponGraphics NONE, SHORT_AXE ; 23: 
                    weaponGraphics NONE, SHORT_AXE ; 24: 
                    weaponGraphics NONE, SHORT_AXE ; 25: 
                endif
                weaponGraphics NONE, SHORT_AXE ; 26: Leather Glove
                weaponGraphics NONE, SHORT_AXE ; 27: Power Glove
                weaponGraphics NONE, SHORT_AXE ; 28: Brass Knuckles
                weaponGraphics NONE, SHORT_AXE ; 29: Iron Knuckles
                weaponGraphics NONE, SHORT_AXE ; 30: Misty Knuckles
                weaponGraphics NONE, SHORT_AXE ; 31: Giant Knuckles
                weaponGraphics NONE, SHORT_AXE ; 32: Evil Knuckles
                weaponGraphics SHORT_AXE, SHORT_AXE ; 33: Short Axe
                weaponGraphics SHORT_AXE, SHORT_AXE ; 34: Hand Axe
                weaponGraphics MIDDLE_AXE, MIDDLE_AXE ; 35: Middle Axe
                weaponGraphics MIDDLE_AXE, MIDDLE_AXE ; 36: Power Axe
                weaponGraphics MIDDLE_AXE, MIDDLE_AXE ; 37: Battle Axe
                weaponGraphics LARGE_AXE, LARGE_AXE ; 38: Large Axe
                weaponGraphics LARGE_AXE, LARGE_AXE ; 39: Great Axe
                weaponGraphics LARGE_AXE, HEAT_AXE ; 40: Heat Axe
                weaponGraphics MITHRIL_AXE, ATLAS_AXE ; 41: Atlas Axe
                weaponGraphics MITHRIL_AXE, GROUND_AXE ; 42: Ground Axe
                weaponGraphics MITHRIL_AXE, RUNE_AXE ; 43: Rune Axe
                weaponGraphics MITHRIL_AXE, EVIL_AXE ; 44: Evil Axe
                weaponGraphics NONE, SHORT_AXE ; 45: Wooden Arrow
                weaponGraphics NONE, SHORT_AXE ; 46: Iron Arrow
                weaponGraphics NONE, SHORT_AXE ; 47: Steel Arrow
                weaponGraphics NONE, SHORT_AXE ; 48: Robin Arrow
                weaponGraphics NONE, SHORT_AXE ; 49: Assault Shell
                weaponGraphics NONE, SHORT_AXE ; 50: Great Shot
                weaponGraphics NONE, SHORT_AXE ; 51: Nazca Cannon
                weaponGraphics NONE, SHORT_AXE ; 52: Buster Shot
                weaponGraphics NONE, SHORT_AXE ; 53: Hyper Cannon
                weaponGraphics NONE, SHORT_AXE ; 54: Grand Cannon
                weaponGraphics NONE, SHORT_AXE ; 55: Evil Shot
                weaponGraphics BRONZE_LANCE, WOODEN_STICK ; 56: Wooden Stick
                weaponGraphics SHORT_SWORD, SHORT_SWORD ; 57: Short Sword
                weaponGraphics SHORT_SWORD, SHORT_SWORD ; 58: Middle Sword
                weaponGraphics LONG_SWORD, LONG_SWORD ; 59: Long Sword
                weaponGraphics LONG_SWORD, LONG_SWORD ; 60: Steel Sword
                weaponGraphics LONG_SWORD, ACHILLES_SWORD ; 61: Achilles Sword
                weaponGraphics LONG_SWORD, LONG_SWORD ; 62: Broad Sword
                weaponGraphics GREAT_SWORD, GREAT_SWORD ; 63: Buster Sword
                weaponGraphics GREAT_SWORD, GREAT_SWORD ; 64: Great Sword
                weaponGraphics KATANA, CRITICAL_SWORD ; 65: Critical Sword
                weaponGraphics GREAT_SWORD, GREAT_SWORD ; 66: Battle Sword
                weaponGraphics FORCE_SWORD, FORCE_SWORD ; 67: Force Sword
                weaponGraphics LONG_SWORD, COUNTER_SWORD ; 68: Counter Sword
                weaponGraphics GREAT_SWORD, LEVANTER ; 69: Levanter
                weaponGraphics KATANA, DARK_SWORD ; 70: Dark Sword
                weaponGraphics WOODEN_SWORD, WOODEN_SWORD ; 71: Wooden Sword
                weaponGraphics SPEAR, SPEAR ; 72: Short Spear
                weaponGraphics BRONZE_LANCE, BRONZE_LANCE ; 73: Bronze Lance
                weaponGraphics SPEAR, SPEAR ; 74: Spear
                weaponGraphics BRONZE_LANCE, STEEL_LANCE ; 75: Steel Lance
                weaponGraphics SPEAR, SPEAR ; 76: Power Spear
                weaponGraphics BRONZE_LANCE, HEAVY_LANCE ; 77: Heavy Lance
                weaponGraphics JAVELIN, JAVELIN ; 78: Javelin
                weaponGraphics CHROME_LANCE, CHROME_LANCE ; 79: Chrome Lance
                weaponGraphics JAVELIN, VALKYRIE ; 80: Valkyrie
                weaponGraphics CHROME_LANCE, HOLY_LANCE ; 81: Holy Lance
                weaponGraphics JAVELIN, JAVELIN ; 82: Mist Javelin
                weaponGraphics HALBERD, HALBERD ; 83: Halberd
                weaponGraphics CHROME_LANCE, EVIL_LANCE ; 84: Evil Lance
                weaponGraphics WOODEN_ROD, WOODEN_ROD ; 85: Wooden Rod
                weaponGraphics SHORT_ROD, SHORT_ROD ; 86: Short Rod
                weaponGraphics SHORT_ROD, SHORT_ROD ; 87: Bronze Rod
                weaponGraphics SHORT_ROD, SHORT_ROD ; 88: Iron Rod
                weaponGraphics POWER_STICK, POWER_STICK ; 89: Power Stick
                weaponGraphics POWER_STICK, POWER_STICK ; 90: Flail
                weaponGraphics GUARDIAN_STAFF, GUARDIAN_STAFF ; 91: Guardian Staff
                weaponGraphics GUARDIAN_STAFF, GUARDIAN_STAFF ; 92: Indra Staff
                weaponGraphics GUARDIAN_STAFF, GUARDIAN_STAFF ; 93: Mage Staff
                weaponGraphics GUARDIAN_STAFF, GUARDIAN_STAFF ; 94: Wish Staff
                weaponGraphics GREAT_ROD, GREAT_ROD ; 95: Great Rod
                weaponGraphics HOLY_STAFF, SUPPLY_STAFF ; 96: Supply Staff
                weaponGraphics HOLY_STAFF, HOLY_STAFF ; 97: Holy Staff
                weaponGraphics HOLY_STAFF, FREEZE_STAFF ; 98: Freeze Staff
                weaponGraphics HOLY_STAFF, GODDESS_STAFF ; 99: Goddess Staff
                weaponGraphics HOLY_STAFF, MYSTERY_STAFF ; 100: Mystery Staff
                weaponGraphics GREAT_ROD, GREAT_ROD ; 101: Demon Rod
                weaponGraphics GREAT_ROD, GREAT_ROD ; 102: Iron Ball
                weaponGraphics KNIFE, KNIFE ; 103: Short Knife
                weaponGraphics DAGGER, DAGGER ; 104: Dagger
                weaponGraphics KNIFE, KNIFE ; 105: Knife
                weaponGraphics DAGGER, DAGGER ; 106: Thieve's Dagger
                weaponGraphics KATANA, KATANA ; 107: Katana
                weaponGraphics KATANA, KATANA ; 108: Ninja Katana
                weaponGraphics KATANA, KATANA ; 109: Gisarme
                if (EXPANDED_ROM&ITEMS_AND_SPELLS_EXPANSION=1)
                    weaponGraphics NONE, SHORT_AXE ; 110: 
                    weaponGraphics NONE, SHORT_AXE ; 111: 
                    weaponGraphics NONE, SHORT_AXE ; 112: 
                    weaponGraphics NONE, SHORT_AXE ; 113: 
                    weaponGraphics NONE, SHORT_AXE ; 114: 
                    weaponGraphics NONE, SHORT_AXE ; 115: 
                    weaponGraphics NONE, SHORT_AXE ; 116: 
                    weaponGraphics NONE, SHORT_AXE ; 117: 
                    weaponGraphics NONE, SHORT_AXE ; 118: 
                    weaponGraphics NONE, SHORT_AXE ; 119: 
                    weaponGraphics NONE, SHORT_AXE ; 120: 
                    weaponGraphics NONE, SHORT_AXE ; 121: 
                    weaponGraphics NONE, SHORT_AXE ; 122: 
                    weaponGraphics NONE, SHORT_AXE ; 123: 
                    weaponGraphics NONE, SHORT_AXE ; 124: 
                    weaponGraphics NONE, SHORT_AXE ; 125: 
                    weaponGraphics NONE, SHORT_AXE ; 126: 
                    weaponGraphics NONE, SHORT_AXE ; 127: 
                    weaponGraphics NONE, SHORT_AXE ; 128: 
                    weaponGraphics NONE, SHORT_AXE ; 129: 
                    weaponGraphics NONE, SHORT_AXE ; 130: 
                    weaponGraphics NONE, SHORT_AXE ; 131: 
                    weaponGraphics NONE, SHORT_AXE ; 132: 
                    weaponGraphics NONE, SHORT_AXE ; 133: 
                    weaponGraphics NONE, SHORT_AXE ; 134: 
                    weaponGraphics NONE, SHORT_AXE ; 135: 
                    weaponGraphics NONE, SHORT_AXE ; 136: 
                    weaponGraphics NONE, SHORT_AXE ; 137: 
                    weaponGraphics NONE, SHORT_AXE ; 138: 
                    weaponGraphics NONE, SHORT_AXE ; 139: 
                    weaponGraphics NONE, SHORT_AXE ; 140: 
                    weaponGraphics NONE, SHORT_AXE ; 141: 
                    weaponGraphics NONE, SHORT_AXE ; 142: 
                    weaponGraphics NONE, SHORT_AXE ; 143: 
                    weaponGraphics NONE, SHORT_AXE ; 144: 
                    weaponGraphics NONE, SHORT_AXE ; 145: 
                    weaponGraphics NONE, SHORT_AXE ; 146: 
                    weaponGraphics NONE, SHORT_AXE ; 147: 
                    weaponGraphics NONE, SHORT_AXE ; 148: 
                    weaponGraphics NONE, SHORT_AXE ; 149: 
                    weaponGraphics NONE, SHORT_AXE ; 150: 
                    weaponGraphics NONE, SHORT_AXE ; 151: 
                    weaponGraphics NONE, SHORT_AXE ; 152: 
                    weaponGraphics NONE, SHORT_AXE ; 153: 
                    weaponGraphics NONE, SHORT_AXE ; 154: 
                    weaponGraphics NONE, SHORT_AXE ; 155: 
                    weaponGraphics NONE, SHORT_AXE ; 156: 
                    weaponGraphics NONE, SHORT_AXE ; 157: 
                    weaponGraphics NONE, SHORT_AXE ; 158: 
                    weaponGraphics NONE, SHORT_AXE ; 159: 
                    weaponGraphics NONE, SHORT_AXE ; 160: 
                    weaponGraphics NONE, SHORT_AXE ; 161: 
                    weaponGraphics NONE, SHORT_AXE ; 162: 
                    weaponGraphics NONE, SHORT_AXE ; 163: 
                    weaponGraphics NONE, SHORT_AXE ; 164: 
                    weaponGraphics NONE, SHORT_AXE ; 165: 
                    weaponGraphics NONE, SHORT_AXE ; 166: 
                    weaponGraphics NONE, SHORT_AXE ; 167: 
                    weaponGraphics NONE, SHORT_AXE ; 168: 
                    weaponGraphics NONE, SHORT_AXE ; 169: 
                    weaponGraphics NONE, SHORT_AXE ; 170: 
                    weaponGraphics NONE, SHORT_AXE ; 171: 
                    weaponGraphics NONE, SHORT_AXE ; 172: 
                    weaponGraphics NONE, SHORT_AXE ; 173: 
                    weaponGraphics NONE, SHORT_AXE ; 174: 
                    weaponGraphics NONE, SHORT_AXE ; 175: 
                    weaponGraphics NONE, SHORT_AXE ; 176: 
                    weaponGraphics NONE, SHORT_AXE ; 177: 
                    weaponGraphics NONE, SHORT_AXE ; 178: 
                    weaponGraphics NONE, SHORT_AXE ; 179: 
                    weaponGraphics NONE, SHORT_AXE ; 180: 
                    weaponGraphics NONE, SHORT_AXE ; 181: 
                    weaponGraphics NONE, SHORT_AXE ; 182: 
                    weaponGraphics NONE, SHORT_AXE ; 183: 
                    weaponGraphics NONE, SHORT_AXE ; 184: 
                    weaponGraphics NONE, SHORT_AXE ; 185: 
                    weaponGraphics NONE, SHORT_AXE ; 186: 
                    weaponGraphics NONE, SHORT_AXE ; 187: 
                    weaponGraphics NONE, SHORT_AXE ; 188: 
                    weaponGraphics NONE, SHORT_AXE ; 189: 
                    weaponGraphics NONE, SHORT_AXE ; 190: 
                    weaponGraphics NONE, SHORT_AXE ; 191: 
                    weaponGraphics NONE, SHORT_AXE ; 192: 
                    weaponGraphics NONE, SHORT_AXE ; 193: 
                    weaponGraphics NONE, SHORT_AXE ; 194: 
                    weaponGraphics NONE, SHORT_AXE ; 195: 
                    weaponGraphics NONE, SHORT_AXE ; 196: 
                    weaponGraphics NONE, SHORT_AXE ; 197: 
                    weaponGraphics NONE, SHORT_AXE ; 198: 
                    weaponGraphics NONE, SHORT_AXE ; 199: 
                    weaponGraphics NONE, SHORT_AXE ; 200: 
                    weaponGraphics NONE, SHORT_AXE ; 201: 
                    weaponGraphics NONE, SHORT_AXE ; 202: 
                    weaponGraphics NONE, SHORT_AXE ; 203: 
                    weaponGraphics NONE, SHORT_AXE ; 204: 
                    weaponGraphics NONE, SHORT_AXE ; 205: 
                    weaponGraphics NONE, SHORT_AXE ; 206: 
                    weaponGraphics NONE, SHORT_AXE ; 207: 
                    weaponGraphics NONE, SHORT_AXE ; 208: 
                    weaponGraphics NONE, SHORT_AXE ; 209: 
                    weaponGraphics NONE, SHORT_AXE ; 210: 
                    weaponGraphics NONE, SHORT_AXE ; 211: 
                    weaponGraphics NONE, SHORT_AXE ; 212: 
                    weaponGraphics NONE, SHORT_AXE ; 213: 
                    weaponGraphics NONE, SHORT_AXE ; 214: 
                    weaponGraphics NONE, SHORT_AXE ; 215: 
                    weaponGraphics NONE, SHORT_AXE ; 216: 
                    weaponGraphics NONE, SHORT_AXE ; 217: 
                    weaponGraphics NONE, SHORT_AXE ; 218: 
                    weaponGraphics NONE, SHORT_AXE ; 219: 
                    weaponGraphics NONE, SHORT_AXE ; 220: 
                    weaponGraphics NONE, SHORT_AXE ; 221: 
                    weaponGraphics NONE, SHORT_AXE ; 222: 
                    weaponGraphics NONE, SHORT_AXE ; 223: 
                    weaponGraphics NONE, SHORT_AXE ; 224: 
                    weaponGraphics NONE, SHORT_AXE ; 225: 
                    weaponGraphics NONE, SHORT_AXE ; 226: 
                    weaponGraphics NONE, SHORT_AXE ; 227: 
                    weaponGraphics NONE, SHORT_AXE ; 228: 
                    weaponGraphics NONE, SHORT_AXE ; 229: 
                    weaponGraphics NONE, SHORT_AXE ; 230: 
                    weaponGraphics NONE, SHORT_AXE ; 231: 
                    weaponGraphics NONE, SHORT_AXE ; 232: 
                    weaponGraphics NONE, SHORT_AXE ; 233: 
                    weaponGraphics NONE, SHORT_AXE ; 234: 
                    weaponGraphics NONE, SHORT_AXE ; 235: 
                    weaponGraphics NONE, SHORT_AXE ; 236: 
                    weaponGraphics NONE, SHORT_AXE ; 237: 
                    weaponGraphics NONE, SHORT_AXE ; 238: 
                    weaponGraphics NONE, SHORT_AXE ; 239: 
                    weaponGraphics NONE, SHORT_AXE ; 240: 
                    weaponGraphics NONE, SHORT_AXE ; 241: 
                    weaponGraphics NONE, SHORT_AXE ; 242: 
                    weaponGraphics NONE, SHORT_AXE ; 243: 
                    weaponGraphics NONE, SHORT_AXE ; 244: 
                    weaponGraphics NONE, SHORT_AXE ; 245: 
                    weaponGraphics NONE, SHORT_AXE ; 246: 
                    weaponGraphics NONE, SHORT_AXE ; 247: 
                    weaponGraphics NONE, SHORT_AXE ; 248: 
                    weaponGraphics NONE, SHORT_AXE ; 249: 
                    weaponGraphics NONE, SHORT_AXE ; 250: 
                    weaponGraphics NONE, SHORT_AXE ; 251: 
                    weaponGraphics NONE, SHORT_AXE ; 252: 
                    weaponGraphics NONE, SHORT_AXE ; 253: 
                    weaponGraphics NONE, SHORT_AXE ; 254: 
                endif
