
; SCRIPT SECTION graphics\battles\spells\invocations\entries :
; Invocation sprites
pt_InvocationSprites:
										dc.l InvocationSpriteDao
										dc.l InvocationSpriteApollo
										dc.l InvocationSpriteNeptun
										dc.l InvocationSpriteAtlas
InvocationSpriteDao:incbin "graphics/battles/spells/invocations/dao.bin"
InvocationSpriteApollo:
										incbin "graphics/battles/spells/invocations/apollo.bin"
InvocationSpriteNeptun:
										incbin "graphics/battles/spells/invocations/neptun.bin"
InvocationSpriteAtlas:
										incbin "graphics/battles/spells/invocations/atlas.bin"
