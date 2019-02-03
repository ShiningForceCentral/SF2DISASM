
; ASM FILE data\graphics\battles\spells\invocations\entries.asm :
; 0x12A2F8..0x12FADE : Invocation sprites
pt_InvocationSprites:
                dc.l InvocationSpriteDao
                dc.l InvocationSpriteApollo
                dc.l InvocationSpriteNeptun
                dc.l InvocationSpriteAtlas
InvocationSpriteDao:
                incbin "data/graphics/battles/spells/invocations/dao.bin"
InvocationSpriteApollo:
                incbin "data/graphics/battles/spells/invocations/apollo.bin"
InvocationSpriteNeptun:
                incbin "data/graphics/battles/spells/invocations/neptun.bin"
InvocationSpriteAtlas:
                incbin "data/graphics/battles/spells/invocations/atlas.bin"
