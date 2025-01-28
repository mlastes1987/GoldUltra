; Functions dealing with palettes.

UpdatePalsIfCGB::
; update bgp data from wBGPals2
; update obp data from wOBPals2
; return carry if successful

; check cgb
	ldh a, [hCGB]
	and a
	ret z

UpdateCGBPals::
; return carry if successful
; any pals to update?
	ldh a, [hCGBPalUpdate]
	and a
	ret z

	ld hl, wBGPals2

; copy 8 pals to bgpd
	ld a, 1 << rBGPI_AUTO_INCREMENT
	ldh [rBGPI], a
	ld c, 8 / 2
.bgp
rept (1 palettes) * 2
	ld a, [hli]
	ldh [rBGPD], a
endr

	dec c
	jr nz, .bgp

; hl is now wOBPals2

; copy 8 pals to obpd
	ld a, 1 << rOBPI_AUTO_INCREMENT
	ldh [rOBPI], a
	ld c, 8 / 2
.obp
rept (1 palettes) * 2
	ld a, [hli]
	ldh [rOBPD], a
endr

	dec c
	jr nz, .obp

; clear pal update queue
	xor a
	ldh [hCGBPalUpdate], a

	scf
	ret

DmgToCgbBGPals::
; exists to forego reinserting cgb-converted image data

; input: a -> bgp

	ldh [rBGP], a
	push af

; Don't need to be here if DMG
	ldh a, [hCGB]
	and a
	jr z, .end

	push hl
	push de
	push bc

; copy & reorder bg pal buffer
	ld hl, wBGPals2 ; to
	ld de, wBGPals1 ; from
; order
	ldh a, [rBGP]
	ld b, a
; all pals
	ld c, 8
	call CopyPals
; request pal update
	ld a, TRUE
	ldh [hCGBPalUpdate], a

	pop bc
	pop de
	pop hl
.end
	pop af
	ret

DmgToCgbObjPals::
; exists to forego reinserting cgb-converted image data

; input: d -> obp1
;        e -> obp2

	ld a, e
	ldh [rOBP0], a
	ld a, d
	ldh [rOBP1], a

	ldh a, [hCGB]
	and a
	ret z

	push hl
	push de
	push bc

; copy & reorder obj pal buffer
	ld hl, wOBPals2 ; to
	ld de, wOBPals1 ; from
; order
	ldh a, [rOBP0]
	ld b, a
; all pals
	ld c, 8
	call CopyPals
; request pal update
	ld a, TRUE
	ldh [hCGBPalUpdate], a

	pop bc
	pop de
	pop hl
	ret

DmgToCgbObjPal0::
	ldh [rOBP0], a
	push af

; Don't need to be here if not CGB
	ldh a, [hCGB]
	and a
	jr z, .dmg

	push hl
	push de
	push bc

	ld hl, wOBPals2 palette 0
	ld de, wOBPals1 palette 0
	ldh a, [rOBP0]
	ld b, a
	ld c, 1
	call CopyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a

	pop bc
	pop de
	pop hl

.dmg
	pop af
	ret

DmgToCgbObjPal1::
	ldh [rOBP1], a
	push af

	ldh a, [hCGB]
	and a
	jr z, .dmg

	push hl
	push de
	push bc

	ld hl, wOBPals2 palette 1
	ld de, wOBPals1 palette 1
	ldh a, [rOBP1]
	ld b, a
	ld c, 1
	call CopyPals
	ld a, TRUE
	ldh [hCGBPalUpdate], a

	pop bc
	pop de
	pop hl

.dmg
	pop af
	ret

CopyPals::
; copy c palettes in order b from de to hl

	push bc
	ld c, NUM_PAL_COLORS
.loop
	push de
	push hl

; get pal color
	ld a, b
	maskbits 1 << PAL_COLOR_SIZE
; 2 bytes per color
	add a
	ld l, a
	ld h, 0
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]

; dest
	pop hl
; write color
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
; next pal color
rept PAL_COLOR_SIZE
	srl b
endr
; source
	pop de
; done pal?
	dec c
	jr nz, .loop

; de += 8 (next pal)
	ld a, PALETTE_SIZE
	add e
	jr nc, .ok
	inc d
.ok
	ld e, a

; how many more pals?
	pop bc
	dec c
	jr nz, CopyPals
	ret

ClearVBank1::
	ldh a, [hCGB]
	and a
	ret z

	ld a, 1
	ldh [rVBK], a

	ld hl, VRAM_Begin
	ld bc, VRAM_End - VRAM_Begin
	xor a
	call ByteFill

	ld a, 0
	ldh [rVBK], a
	ret

ReloadPalettes::
	hlcoord 0, 0
	decoord 0, 0, wAttrmap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
.loop
	ld a, [hli]
	cp " "
	jr c, .skip
	ld a, PAL_BG_TEXT
	ld [de], a
.skip
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

ReloadSpritesNoPalettes::
	ldh a, [hCGB]
	and a
	ret z
	ld hl, wBGPals2
	ld bc, (8 palettes) + (2 palettes)
	xor a
	call ByteFill
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	call DelayFrame
	ret

LoadOverworldAttrmapPals::
	homecall _LoadOverworldAttrmapPals
	ret

ScrollBGMapPalettes::
	homecall _ScrollBGMapPalettes
	ret
