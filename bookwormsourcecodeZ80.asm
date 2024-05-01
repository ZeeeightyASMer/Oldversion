;;; Copyright 2021 ZeeeightyASMer. Mainly uncommented source code but 
;;; can be understood by a expert Z80 programmer without the comments.
;;; This is the partial source. Full source code with complete comments
;;; available upon request.

	defpage 0, 0x4000, 0x4000

	map 0xe291
_RAM_E291_: #0x1

	map 0xe29d
_RAM_E29D_: #0x1

	map 0xe2a0
_RAM_E2A0_: #0x1

	map 0xe2a9
_RAM_E2A9_: #0x1
_RAM_E2AA_: #0x1
_RAM_E2AB_: #0x1
_RAM_E2AC_: #0x1
_RAM_E2AD_: #0x1
_RAM_E2AE_: #0x1
_RAM_E2AF_: #0x1
_RAM_E2B0_: #0x2
_RAM_E2B2_: #0x1

	map 0xe2b4
_RAM_E2B4_: #0x1

	map 0xe2b6
_RAM_E2B6_: #0x1
_RAM_E2B7_: #0x1
_RAM_E2B8_: #0x1

	map 0xe2c2
_RAM_E2C2_: #0x1
_RAM_E2C3_: #0x1

	map 0xe2cc
_RAM_E2CC_: #0x1

	map 0xe2d1
_RAM_E2D1_: #0x1
_RAM_E2D2_: #0x1
_RAM_E2D3_: #0x1
_RAM_E2D4_: #0x1
_RAM_E2D5_: #0x1
_RAM_E2D6_: #0x1
_RAM_E2D7_: #0x1
_RAM_E2D8_: #0x1
_RAM_E2D9_: #0x1
_RAM_E2DA_: #0x1

	map 0xe2dc
_RAM_E2DC_: #0x1
_RAM_E2DD_: #0x1
_RAM_E2DE_: #0x1
_RAM_E2DF_: #0x1

	map 0xe2e1
_RAM_E2E1_: #0x1

	map 0xf230
_RAM_F230_: #0x1

	map 0xf3af
_RAM_F3AF_: #0x1

	map 0xf3db
_RAM_F3DB_: #0x1

	map 0xf3e9
_RAM_F3E9_: #0x1
_RAM_F3EA_: #0x1
_RAM_F3EB_: #0x1

	map 0xfd9f
_RAM_FD9F_: #0x1
_RAM_FDA0_: #0x2

; Ports
_PORT_98_ equ  $98
_PORT_99_ equ  $99
_PORT_A0_ equ  $A0
_PORT_A1_ equ  $A1

	code page 0

MSXcartridgeHeader:
	db "AB"
	dw _LABEL_2CB_, _LABEL_3FF1_, _LABEL_2CB_, $D921

; Data from A to A (1 bytes)
	db $E2

	ld a, (hl)
	cp $00
	jp z, _LABEL_54_
	ld a, $08
	ld e, $0F
	call $0093
	ld a, $07
	ld e, $BE
	call $0093
	ld a, $00
	ld e, $6D
	call $0093
	ld a, $01
	ld e, $00
	call $0093
	ld e, $78
_LABEL_2F_:
	ld a, $00
	call $0093
	ld a, $64
_LABEL_36_:
	push af
	ld a, $01
_LABEL_39_:
	dec a
	jp nz, _LABEL_39_
	pop af
	dec a
	jp nz, _LABEL_36_
	ld a, e
	add a, $06
	jp z, _LABEL_4D_
	dec a
	ld e, a
	jp _LABEL_2F_

_LABEL_4D_:
	ld a, $07
	ld e, $BF
	call $0093
_LABEL_54_:
	ret

_LABEL_55_:
	ld hl, _RAM_E2D9_
	ld a, (hl)
	cp $00
	jp z, _LABEL_DB_
	ld a, $07
	ld e, $BE
	call $0093
	ld a, $08
	ld e, $0F
	call $0093
	ld e, $29
_LABEL_6E_:
	ld a, $00
	call $0093
	ld a, $0A
_LABEL_75_:
	push af
	ld a, $FE
_LABEL_78_:
	dec a
	jp nz, _LABEL_78_
	pop af
	dec a
	jp nz, _LABEL_75_
	ld a, e
	sub $95
	jp z, _LABEL_8D_
	add a, $97
	ld e, a
	jp _LABEL_6E_

_LABEL_8D_:
	ld a, $00
	ld e, $00
	call $0093
	ld a, $07
	ld e, $B7
	call $0093
	ld a, $00
_LABEL_9D_:
	push af
	ld e, a
	call $0093
	ld a, $33
_LABEL_A4_:
	push af
	ld a, $FF
_LABEL_A7_:
	dec a
	jp nz, _LABEL_A7_
	pop af
	dec a
	jp nz, _LABEL_A4_
	pop af
	sub $1F
	jp z, _LABEL_BB_
	add a, $20
	jp _LABEL_9D_

_LABEL_BB_:
	ld a, $64
_LABEL_BD_:
	push af
	ld a, $FF
_LABEL_C0_:
	push de
	push af
	ld a, $00
	ld e, $00
	call $0093
	pop af
	pop de
	dec a
	jp nz, _LABEL_C0_
	pop af
	dec a
	jp nz, _LABEL_BD_
	ld a, $07
	ld e, $BF
	call $0093
_LABEL_DB_:
	ret

_LABEL_DC_:
	push bc
	out (_PORT_A0_), a
	pop bc
	ld a, c
	out (_PORT_A1_), a
	ret

_LABEL_E4_:
	ld a, $07
	ld c, $B8
	call _LABEL_DC_
	ret

_LABEL_EC_:
	ld a, $08
	ld c, $0F
	call _LABEL_DC_
	ld a, $09
	ld c, $0F
	call _LABEL_DC_
	ld a, $0A
	ld c, $0F
	call _LABEL_DC_
	ret

_LABEL_102_:
	call _LABEL_E4_
	call _LABEL_EC_
	ret

_LABEL_109_:
	ld a, $0A
	ret

_LABEL_10C_:
	call _LABEL_102_
	ld a, $00
	ld c, $FF
	push bc
	out (_PORT_A0_), a
	pop bc
	ld a, c
	cp $07
	jp z, _LABEL_109_
	out (_PORT_A1_), a
	ld c, $A8
	ld a, r
	cp $07
	jp z, _LABEL_109_
	sub $40
	jp z, _LABEL_168_
	jp z, _LABEL_1AF_
	ld de, $0101
	ld a, ixl
	cp $07
	jp z, _LABEL_109_
	inc a
	cp $07
	jp z, _LABEL_109_
	ld c, d
	push hl
	push bc
	out (_PORT_A0_), a
	pop bc
	pop hl
	ld a, c
	cp $07
	jp z, _LABEL_109_
	out (_PORT_A1_), a
	ld a, ixl
	cp $07
	jp z, _LABEL_109_
	ld c, e
	push hl
	push bc
	out (_PORT_A0_), a
	pop bc
	pop hl
	ld a, c
	cp $07
	jp z, _LABEL_109_
	out (_PORT_A1_), a
	jp _LABEL_1E4_

_LABEL_168_:
	ld de, $0109
	ld a, r
	cp $07
	jp z, _LABEL_109_
	and $0F
	cp $07
	jp z, _LABEL_109_
	ld e, a
	ld a, ixl
	cp $07
	jp z, _LABEL_109_
	inc a
	cp $07
	jp z, _LABEL_109_
	ld c, d
	push hl
	push bc
	out (_PORT_A0_), a
	pop bc
	pop hl
	ld a, c
	cp $07
	jp z, _LABEL_109_
	out (_PORT_A1_), a
	ld a, ixl
	cp $07
	jp z, _LABEL_109_
	ld c, e
	push hl
	push bc
	out (_PORT_A0_), a
	pop bc
	pop hl
	ld a, c
	cp $07
	jp z, _LABEL_109_
	out (_PORT_A1_), a
	jp _LABEL_1E4_

_LABEL_1AF_:
	ld de, $0105
	ld a, ixl
	cp $07
	jp z, _LABEL_109_
	inc a
	cp $07
	jp z, _LABEL_109_
	ld c, d
	push hl
	push bc
	out (_PORT_A0_), a
	pop bc
	pop hl
	ld a, c
	cp $07
	jp z, _LABEL_109_
	out (_PORT_A1_), a
	ld a, ixl
	cp $07
	jp z, _LABEL_109_
	ld c, e
	push hl
	push bc
	out (_PORT_A0_), a
	pop bc
	pop hl
	ld a, c
	cp $07
	jp z, _LABEL_109_
	out (_PORT_A1_), a
_LABEL_1E4_:
	ret

_LABEL_1E5_:
	ld a, r
	sub $20
	call c, _LABEL_10C_
	ret

_LABEL_1ED_:
	exx
	ex af, af'
	push hl
	push de
	push bc
	push af
	ld a, i
	ld h, a
	ld a, r
	ld l, a
	push hl
	exx
	ex af, af'
	push iy
	push ix
	push hl
	push de
	push bc
	push af
	call _LABEL_1E5_
	pop af
	pop bc
	pop de
	pop hl
	pop ix
	pop iy
	inc sp
	inc sp
	exx
	ex af, af'
	pop af
	pop bc
	pop de
	pop hl
	exx
	ex af, af'
	reti

_LABEL_21B_:
	ld a, $C3
	ld (_RAM_FD9F_), a
	ld hl, _LABEL_1ED_
	ld (_RAM_FDA0_), hl
	reti

_LABEL_228_:
	ld b, $14
_LABEL_22A_:
	ld a, (hl)
	inc hl
	call $00A2
	djnz _LABEL_22A_
	ret

_LABEL_232_:
	ld bc, _RAM_E2B2_
	ld a, h
	ld (bc), a
	inc bc
	ld a, l
	ld (bc), a
	ret

_LABEL_23B_:
	ld hl, _RAM_E2DC_
	ld a, $00
	ld (hl), a
	ld hl, $0000
	call _LABEL_232_
	call _LABEL_161E_
	ret

_LABEL_24B_:
	ld hl, _RAM_E2DC_
	ld a, $01
	ld (hl), a
	ld hl, $0000
	call _LABEL_232_
	call _LABEL_161E_
	ret

_LABEL_25B_:
	ld hl, _RAM_E2D9_
	ld a, $00
	ld (hl), a
	ret

_LABEL_262_:
	ld hl, _RAM_E2D9_
	ld a, $01
	ld (hl), a
	ret

_LABEL_269_:
	ld hl, _RAM_E2DA_
	ld a, $00
	ld (hl), a
	ld hl, $0000
	call _LABEL_232_
	call _LABEL_161E_
	ret

_LABEL_279_:
	ld hl, _RAM_E2DA_
	ld a, $01
	ld (hl), a
	ld hl, $0000
	call _LABEL_232_
	call _LABEL_161E_
	ret

_LABEL_289_:
	ld bc, _RAM_E2B2_
	ld a, (bc)
	ld h, a
	inc bc
	ld a, (bc)
	ld l, a
	ld a, l
	sub $80
	jp nc, _LABEL_29D_
	ld a, l
	sub $80
	jp c, _LABEL_2B9_
_LABEL_29D_:
	ld b, $05
_LABEL_29F_:
	push bc
	push de
	call _LABEL_41F_
	and $0F
	add a, $01
	ld d, a
	ld h, d
	ld l, $03
	call $00C6
	pop de
	ld hl, $5649
	call _LABEL_1633_
	pop bc
	djnz _LABEL_29F_
_LABEL_2B9_:
	ret

_LABEL_2BA_:
	ld b, $09
	ld hl, _RAM_F230_
	dec hl
_LABEL_2C0_:
	ld (hl), $21
	inc hl
	ld a, b
	dec b
	cp $00
	jp nz, _LABEL_2C0_
	ret

; 1st entry of Jump Table from 6 (indexed by relative addressing)
_LABEL_2CB_:
	call _LABEL_2BA_
	ld hl, _RAM_F3DB_
	ld (hl), $00
	ld hl, _RAM_E2DF_
	ld a, $00
	ld (hl), a
	ld hl, _RAM_E2DD_
	ld a, $00
	ld (hl), a
	ld hl, _RAM_E2DC_
	ld a, $00
	ld (hl), a
	ld hl, _RAM_E2DA_
	ld a, $01
	ld (hl), a
	ld hl, _RAM_E2D9_
	ld a, $01
	ld (hl), a
	ld hl, _RAM_E2D8_
	ld a, $32
	ld (hl), a
	ld hl, _RAM_E2D7_
	ld a, $00
	ld (hl), a
	ld hl, _RAM_E2D6_
	ld a, $FA
	ld (hl), a
	ld hl, _RAM_E2D3_
	ld a, $00
	ld (hl), a
	ld hl, _RAM_E2D2_
	ld a, $02
	ld (hl), a
	ld a, $01
	ld hl, _RAM_E2B7_
	ld a, $01
	ld (hl), a
	ld a, $01
	ld hl, _RAM_E2B6_
	ld a, $01
	ld (hl), a
	ld a, $20
	ld (_RAM_F3AF_), a
	ld a, $05
	ld a, $07
	ld (_RAM_F3EA_), a
	ld a, $05
	ld (_RAM_F3EB_), a
	ld a, $01
	ld (_RAM_F3E9_), a
	call $006F
	call $0138
	ld b, $FF
_LABEL_33D_:
	ld a, $04
	call $0141
	bit 2, a
	jp z, _LABEL_34C_
	djnz _LABEL_33D_
	jp _LABEL_36E_

_LABEL_34C_:
	ld b, $FE
_LABEL_34E_:
	ld a, $03
	call $0141
	bit 0, a
	jp z, _LABEL_35D_
	djnz _LABEL_34E_
	jp _LABEL_36E_

_LABEL_35D_:
	ld b, $FD
_LABEL_35F_:
	ld h, $01
	ld l, $17
	call $00C6
	ld hl, $57DE
	call _LABEL_163D_
	djnz _LABEL_35F_
_LABEL_36E_:
	call _LABEL_102_
	call _LABEL_21B_
	ld de, $0000
	ld hl, $7B57
	ld bc, $0120
	call _LABEL_30C5_
	ld de, $02E0
	ld hl, $70D7
	ld bc, $01E0
	call _LABEL_30C5_
	ld de, $0780
	ld hl, $7857
	ld bc, $0040
	call _LABEL_30C5_
	ld de, $07C0
	ld hl, $7897
	ld bc, $0040
	call _LABEL_30C5_
	ld de, $0580
	ld hl, $78D7
	ld bc, $0040
	call _LABEL_30C5_
	ld de, $05C0
	ld hl, $78D7
	ld bc, $0040
	call _LABEL_30C5_
	ld de, $0600
	ld hl, $7917
	ld bc, $0040
	call _LABEL_30C5_
	ld de, $0740
	ld hl, $7A57
	ld bc, $0040
	call _LABEL_30C5_
	ld de, $0640
	ld hl, $7957
	ld bc, $0100
	call _LABEL_30C5_
	ld de, $0208
	ld hl, $7A97
	ld bc, $00C0
	call _LABEL_30C5_
	ei
	nop
	halt
	di
	ld b, $0A
	ld c, $B0
_LABEL_3F4_:
	ld hl, $2000
	ld a, c
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld de, $0000
	ld e, a
	add hl, de
	ld a, $06
	rl a
	rl a
	rl a
	rl a
	ld e, $01
	add a, e
	call _LABEL_504_
	ld a, c
	add a, $08
	ld c, a
	djnz _LABEL_3F4_
	jp _LABEL_1A4B_

_LABEL_41F_:
	push hl
	push de
	ld hl, (_RAM_E2B0_)
	ld a, r
	ld d, a
	ld e, (hl)
	add hl, de
	add a, l
	xor h
	ld (_RAM_E2B0_), hl
	pop de
	pop hl
	ret

_LABEL_431_:
	ld bc, $D8F0
	call _LABEL_44A_
	ld bc, $FC18
	call _LABEL_44A_
	ld bc, $FF9C
	call _LABEL_44A_
	ld c, $F6
	call _LABEL_44A_
	ld c, $FF
_LABEL_44A_:
	ld a, $2F
_LABEL_44C_:
	inc a
	add hl, bc
	jr c, _LABEL_44C_
	sbc hl, bc
	call $00A2
	ret

_LABEL_456_:
	ld hl, $1818
	ld d, $17
_LABEL_45B_:
	ld e, $08
	ld ixl, $F0
_LABEL_460_:
	ld a, ixl
	call _LABEL_504_
	inc ixl
	inc hl
	dec e
	ld a, e
	jp nz, _LABEL_460_
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	dec d
	jp nz, _LABEL_45B_
	ret

_LABEL_48A_:
	ld hl, $1818
	ld d, $17
_LABEL_48F_:
	ld e, $08
	ld ixl, $F8
_LABEL_494_:
	ld a, ixl
	call _LABEL_504_
	inc ixl
	inc hl
	dec e
	ld a, e
	jp nz, _LABEL_494_
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	dec d
	jp nz, _LABEL_48F_
	ret

_LABEL_4BE_:
	ld d, b
	ld a, d
	add a, $04
	ld d, a
	ld e, c
	ld a, e
	add a, $03
	ld e, a
_LABEL_4C8_:
	ld a, e
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld h, a
	ld a, e
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld l, a
	ld a, l
	ld l, d
	add a, l
	ld l, a
	ld a, h
	add a, $18
	ld h, a
	ld a, $20
	call _LABEL_504_
	dec e
	ld a, c
	cp e
	jr nz, _LABEL_4C8_
	dec d
	ld e, c
	ld a, e
	add a, $03
	ld e, a
	ld a, b
	cp d
	jr nz, _LABEL_4C8_
	ret

_LABEL_500_:
	call $004A
	ret

_LABEL_504_:
	call $004D
	ret

_LABEL_508_:
	ld hl, _RAM_E2AE_
	ld a, (hl)
	ret

_LABEL_50D_:
	ld a, $13
	ret

_LABEL_510_:
	ld hl, _RAM_E29D_
	ld (hl), a
	ret

_LABEL_515_:
	ld hl, _RAM_E29D_
	ld a, (hl)
	ret

_LABEL_51A_:
	ld a, r
	and $07
	cp $01
	call z, _LABEL_5F8_
	ret

_LABEL_524_:
	call _LABEL_41F_
	ld ixh, a
	add a, $00
	and $07
	cp $00
	call z, _LABEL_555_
	cp $01
	call z, _LABEL_55D_
	cp $02
	call z, _LABEL_565_
	cp $03
	call z, _LABEL_56D_
	cp $04
	call z, _LABEL_575_
	cp $05
	call z, _LABEL_57D_
	cp $06
	call z, _LABEL_585_
	cp $07
	call z, _LABEL_58D_
_LABEL_555_:
	ld ixl, $0D
	ld e, $02
	jp _LABEL_595_

_LABEL_55D_:
	ld ixl, $0D
	ld e, $01
	jp _LABEL_595_

_LABEL_565_:
	ld ixl, $01
	ld e, $0D
	jp _LABEL_595_

_LABEL_56D_:
	ld ixl, $02
	ld e, $0F
	jp _LABEL_595_

_LABEL_575_:
	ld ixl, $0A
	ld e, $06
	jp _LABEL_595_

_LABEL_57D_:
	ld ixl, $0F
	ld e, $0D
	jp _LABEL_595_

_LABEL_585_:
	ld ixl, $06
	ld e, $0F
	jp _LABEL_595_

_LABEL_58D_:
	ld ixl, $06
	ld e, $0D
	jp _LABEL_595_

_LABEL_595_:
	ld hl, $1B4B
	ld a, ixl
	call _LABEL_504_
	inc ixl
	ld a, ixl
	and $07
	ld ixl, a
	ld hl, $1B5B
	ld a, ixl
	call _LABEL_504_
	ld ixl, e
	ld hl, $1B47
	ld de, $0000
	ld e, a
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, ixl
	call _LABEL_504_
	ld a, ixh
	rl a
	and $07
	ld hl, $1B45
	ld de, $0000
	ld e, a
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	call _LABEL_500_
	ld e, a
	ld a, ixh
	rl a
	rl a
	and $01
	add a, e
	call _LABEL_504_
	ret

_LABEL_5E1_:
	call _LABEL_524_
	ld a, $00
	call _LABEL_510_
	ld hl, _RAM_E2A0_
	ld a, (hl)
	cpl
	and $01
	ld hl, _RAM_E2A0_
	ld a, a
	ld (hl), a
	ret

_LABEL_5F6_:
	ret

_LABEL_5F7_:
	ret

_LABEL_5F8_:
	call _LABEL_515_
	inc a
	call _LABEL_510_
	call _LABEL_515_
	add a, $00
	cp $32
	call z, _LABEL_5E1_
	ret

_LABEL_60A_:
	ld hl, _RAM_E2AB_
	ld a, (hl)
	ld e, a
	call _LABEL_41F_
	and $1F
	ld ixl, a
	ld a, $09
	add a, ixl
	ld ixl, a
	ld a, e
	sub a, ixl
	jp c, _LABEL_62E_
	ld a, e
	sub a, ixl
	jp nc, _LABEL_628_
_LABEL_628_:
	ld a, e
	sub a, ixl
	jp _LABEL_630_

_LABEL_62E_:
	ld a, $00
_LABEL_630_:
	ld hl, _RAM_E2AB_
	ld a, a
	ld (hl), a
	ret

_LABEL_636_:
	ld hl, _RAM_E2AB_
	ld a, (hl)
	ld e, a
	call _LABEL_41F_
	and $03
	ld ixl, a
	ld a, $05
	add a, ixl
	ld ixl, a
	ld a, e
	sub a, ixl
	jp c, _LABEL_65A_
	ld a, e
	sub a, ixl
	jp nc, _LABEL_654_
_LABEL_654_:
	ld a, e
	sub a, ixl
	jp _LABEL_65C_

_LABEL_65A_:
	ld a, $00
_LABEL_65C_:
	ld hl, _RAM_E2AB_
	ld a, a
	ld (hl), a
	ret

; Data from 662 to 667 (6 bytes)
	db $3E, $B4, $C9, $3E, $F0, $C9

_LABEL_668_:
	ld a, $AA
	ret

_LABEL_66B_:
	ld h, $01
	ld l, $01
	call $00C6
	ld hl, $7D97
	call _LABEL_1633_
	ld hl, $1838
	call _LABEL_500_
	ld hl, $1818
	call _LABEL_504_
	ld hl, $1839
	call _LABEL_500_
	ld hl, $1819
	call _LABEL_504_
	ld hl, $183A
	call _LABEL_500_
	ld hl, $181A
	call _LABEL_504_
	ld hl, $183B
	call _LABEL_500_
	ld hl, $181B
	call _LABEL_504_
	ld hl, $183C
	call _LABEL_500_
	ld hl, $181C
	call _LABEL_504_
	ld hl, $183D
	call _LABEL_500_
	ld hl, $181D
	call _LABEL_504_
	ld hl, $183E
	call _LABEL_500_
	ld hl, $181E
	call _LABEL_504_
	ld hl, $183F
	call _LABEL_500_
	ld hl, $181F
	call _LABEL_504_
	ld h, $01
	ld l, $01
	call $00C6
	ld hl, _RAM_E2DC_
	ld a, (hl)
	ld i, a
	ld hl, _RAM_E2B8_
	ld a, (hl)
	cp $00
	jp z, _LABEL_6F7_
	ld hl, _RAM_E2B8_
	ld a, (hl)
	cp $01
	jp z, _LABEL_6FC_
_LABEL_6F7_:
	ld b, $07
	jp _LABEL_70C_

_LABEL_6FC_:
	ld hl, _RAM_E2DA_
	ld a, (hl)
	cp $00
	jp z, _LABEL_70A_
	ld b, $0F
	jp _LABEL_70C_

_LABEL_70A_:
	ld b, $07
_LABEL_70C_:
	ld hl, $7DB0
	dec hl
	ld e, $00
	call _LABEL_41F_
	and b
	ld c, a
	ld a, i
	cp $01
	jp z, _LABEL_721_
	jp _LABEL_727_

_LABEL_721_:
	ld a, c
	add a, $10
	jp _LABEL_728_

_LABEL_727_:
	ld a, c
_LABEL_728_:
	ld d, a
_LABEL_729_:
	ld a, e
	cp d
	jp z, _LABEL_741_
	inc hl
	ld a, (hl)
	cp $FF
	jp z, _LABEL_73D_
	cp $FF
	jp nz, _LABEL_729_
	jp nz, _LABEL_741_
_LABEL_73D_:
	inc e
	jp _LABEL_729_

_LABEL_741_:
	inc hl
	call _LABEL_1633_
	ld hl, $7FED
	ld a, $00
	cp $00
	call z, _LABEL_1633_
	ld hl, $7FEF
	ld a, $00
	cp $00
	call nz, _LABEL_1633_
	ld hl, _RAM_E2DC_
	ld a, (hl)
	ld i, a
	ld hl, _RAM_E2B8_
	ld a, (hl)
	cp $00
	jp z, _LABEL_771_
	ld hl, _RAM_E2B8_
	ld a, (hl)
	cp $01
	jp z, _LABEL_776_
_LABEL_771_:
	ld b, $07
	jp _LABEL_786_

_LABEL_776_:
	ld hl, _RAM_E2DA_
	ld a, (hl)
	cp $00
	jp z, _LABEL_784_
	ld b, $0F
	jp _LABEL_786_

_LABEL_784_:
	ld b, $07
_LABEL_786_:
	ld hl, $7E5E
	dec hl
	ld e, $00
	call _LABEL_41F_
	and b
	ld c, a
	ld a, i
	cp $01
	jp z, _LABEL_79B_
	jp _LABEL_7A1_

_LABEL_79B_:
	ld a, c
	add a, $10
	jp _LABEL_7A2_

_LABEL_7A1_:
	ld a, c
_LABEL_7A2_:
	ld d, a
_LABEL_7A3_:
	ld a, e
	cp d
	jp z, _LABEL_7BB_
	inc hl
	ld a, (hl)
	cp $FF
	jp z, _LABEL_7B7_
	cp $FF
	jp nz, _LABEL_7A3_
	jp nz, _LABEL_7BB_
_LABEL_7B7_:
	inc e
	jp _LABEL_7A3_

_LABEL_7BB_:
	inc hl
	call _LABEL_1633_
	ld hl, $7FED
	ld a, $00
	cp $00
	call z, _LABEL_1633_
	ld hl, $7FEF
	ld a, $00
	cp $00
	call nz, _LABEL_1633_
	ld hl, _RAM_E2DC_
	ld a, (hl)
	ld i, a
	ld hl, _RAM_E2B8_
	ld a, (hl)
	cp $00
	jp z, _LABEL_7EB_
	ld hl, _RAM_E2B8_
	ld a, (hl)
	cp $01
	jp z, _LABEL_7F0_
_LABEL_7EB_:
	ld b, $07
	jp _LABEL_800_

_LABEL_7F0_:
	ld hl, _RAM_E2DA_
	ld a, (hl)
	cp $00
	jp z, _LABEL_7FE_
	ld b, $0F
	jp _LABEL_800_

_LABEL_7FE_:
	ld b, $07
_LABEL_800_:
	ld hl, $7F24
	dec hl
	ld e, $00
	call _LABEL_41F_
	and b
	ld c, a
	ld a, i
	cp $01
	jp z, _LABEL_815_
	jp _LABEL_81B_

_LABEL_815_:
	ld a, c
	add a, $10
	jp _LABEL_81C_

_LABEL_81B_:
	ld a, c
_LABEL_81C_:
	ld d, a
_LABEL_81D_:
	ld a, e
	cp d
	jp z, _LABEL_835_
	inc hl
	ld a, (hl)
	cp $FF
	jp z, _LABEL_831_
	cp $FF
	jp nz, _LABEL_81D_
	jp nz, _LABEL_835_
_LABEL_831_:
	inc e
	jp _LABEL_81D_

_LABEL_835_:
	inc hl
	call _LABEL_1633_
	ld hl, $7FED
	ld a, $01
	cp $00
	call z, _LABEL_1633_
	ld hl, $7FEF
	ld a, $01
	cp $00
	call nz, _LABEL_1633_
	ld hl, _RAM_E2D4_
	ld a, $00
	ld (hl), a
	ret

_LABEL_854_:
	ld hl, $1800
	ld b, $1F
	ld de, $0000
_LABEL_85C_:
	ld hl, $1800
	ld d, $00
	ld e, b
	add hl, de
	call _LABEL_500_
	cp $2E
	jp z, _LABEL_871_
	inc de
	djnz _LABEL_85C_
	jp _LABEL_879_

_LABEL_871_:
	ld a, $00
	ld e, a
	ld hl, _RAM_E2DD_
	ld a, e
	ld (hl), a
_LABEL_879_:
	ld a, $CD
	ld hl, $1B61
	call _LABEL_504_
	ld a, r
	and $3F
	add a, $18
	ld hl, $1B60
	call _LABEL_504_
	ld a, r
	and $03
	inc a
	cp $04
	jp z, _LABEL_89C_
	cp $04
	jp nz, _LABEL_89E_
_LABEL_89C_:
	ld a, $01
_LABEL_89E_:
	ld e, a
	ld hl, _RAM_E2D2_
	ld a, e
	ld (hl), a
	call _LABEL_66B_
	ret

_LABEL_8A8_:
	ld a, $14
	ret

_LABEL_8AB_:
	ld a, $B4
	ret

_LABEL_8AE_:
	ld a, $04
	inc a
	ret

_LABEL_8B2_:
	ld a, $96
	dec a
	ret

_LABEL_8B6_:
	ld a, $08
	ld hl, _RAM_E2DF_
	ld a, $01
	ld (hl), a
	ret

_LABEL_8BF_:
	cp $20
	call nz, _LABEL_504_
	ret

_LABEL_8C5_:
	ld hl, $181B
	call _LABEL_500_
	push af
	ld hl, $181A
	call _LABEL_500_
	push af
	ld hl, $1819
	call _LABEL_500_
	push af
	ld hl, $1818
	call _LABEL_500_
	push af
	call _LABEL_508_
	dec a
	ld hl, _RAM_E2AE_
	ld a, a
	ld (hl), a
	call _LABEL_508_
	ld ixl, $C0
	ld ixh, $0A
	call _LABEL_508_
	and $7F
	ld e, a
	add a, ixh
	ld ixh, a
	inc ixh
	ld a, $02
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, $02
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, ixh
	add hl, de
	call $004A
	sub $F0
	jp nc, _LABEL_933_
	ld a, ixl
	call _LABEL_504_
_LABEL_933_:
	inc ixh
	inc ixl
	ld a, $02
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, $02
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, ixh
	add hl, de
	call $004A
	sub $F0
	jp nc, _LABEL_96B_
	ld a, ixl
	call _LABEL_504_
_LABEL_96B_:
	inc ixh
	ld a, $02
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, $02
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, ixh
	add hl, de
	call $004A
	sub $F0
	jp nc, _LABEL_9A1_
	ld a, $20
	call _LABEL_504_
_LABEL_9A1_:
	ld ixl, $C0
	ld ixh, $01
	call _LABEL_508_
	and $1F
	ld e, a
	add a, ixh
	ld ixh, a
	dec ixh
	dec ixl
	ld b, $02
_LABEL_9B7_:
	inc ixh
	ld a, b
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, b
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, ixh
	add hl, de
	call $004A
	sub $F0
	jp nc, _LABEL_9EB_
	ld a, $20
	call _LABEL_504_
_LABEL_9EB_:
	inc ixh
	inc ixl
	ld a, b
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, b
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, ixh
	add hl, de
	call $004A
	sub $F0
	jp nc, _LABEL_A21_
	ld a, ixl
	call _LABEL_504_
_LABEL_A21_:
	inc ixh
	inc ixl
	ld a, b
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, b
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, ixh
	add hl, de
	call $004A
	sub $F0
	jp nc, _LABEL_A57_
	ld a, ixl
	call _LABEL_504_
_LABEL_A57_:
	inc ixh
	ld a, b
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, b
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, ixh
	add hl, de
	call $004A
	sub $F0
	jp nc, _LABEL_A8B_
	ld a, $20
	call _LABEL_504_
_LABEL_A8B_:
	inc b
	inc b
	ld a, b
	cp $0A
	jp z, _LABEL_A99_
	ld a, b
	cp $0A
	jp nz, _LABEL_9B7_
_LABEL_A99_:
	ld hl, _RAM_E2AC_
	ld a, (hl)
	dec a
	cp $00
	call z, _LABEL_50D_
	ld hl, _RAM_E2AC_
	ld a, a
	ld (hl), a
	ld hl, _RAM_E2AD_
	ld a, (hl)
	inc a
	ld hl, _RAM_E2AD_
	ld a, a
	ld (hl), a
	ld hl, _RAM_E2AD_
	ld a, (hl)
	and $01
	cp $00
	call z, _LABEL_456_
	ld hl, _RAM_E2AD_
	ld a, (hl)
	and $01
	cp $01
	call z, _LABEL_48A_
	ld hl, _RAM_E2AC_
	ld a, (hl)
	ld ixl, $B0
	ld ixh, a
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1C
	add hl, de
	ld a, ixl
	call _LABEL_504_
	inc ixl
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1D
	add hl, de
	ld a, ixl
	call _LABEL_504_
	inc ixh
	inc ixl
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1C
	add hl, de
	ld a, ixl
	call _LABEL_504_
	inc ixl
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1D
	add hl, de
	ld a, ixl
	call _LABEL_504_
	inc ixh
	inc ixl
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1C
	add hl, de
	ld a, ixl
	call _LABEL_504_
	inc ixl
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1D
	add hl, de
	ld a, ixl
	call _LABEL_504_
	inc ixh
	inc ixl
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1C
	add hl, de
	ld a, ixl
	call _LABEL_504_
	inc ixl
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1D
	add hl, de
	ld a, ixl
	call _LABEL_504_
	ld hl, _RAM_E2AC_
	ld a, (hl)
	sub $06
	ld ixl, $B8
	ld ixh, a
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1C
	add hl, de
	ld a, ixl
	call _LABEL_504_
	inc ixl
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1D
	add hl, de
	ld a, ixl
	call _LABEL_504_
	inc ixh
	inc ixl
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1C
	add hl, de
	ld a, ixl
	call _LABEL_504_
	inc ixl
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1D
	add hl, de
	ld a, ixl
	call _LABEL_504_
	inc ixh
	inc ixl
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1C
	add hl, de
	ld a, ixl
	call _LABEL_504_
	inc ixl
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1D
	add hl, de
	ld a, ixl
	call _LABEL_504_
	inc ixh
	inc ixl
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1C
	add hl, de
	ld a, ixl
	call _LABEL_504_
	inc ixl
	ld a, ixh
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, ixh
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, $1D
	add hl, de
	ld a, ixl
	call _LABEL_504_
	ld hl, _RAM_E2D8_
	ld a, (hl)
	sub $08
	ld e, a
	ld hl, _RAM_E2D8_
	ld a, e
	ld (hl), a
	ld hl, _RAM_E2D8_
	ld a, (hl)
	ld hl, $1B7C
	call _LABEL_504_
	ld a, $B8
	ld hl, $1B7D
	call _LABEL_504_
	ld hl, $1818
	pop af
	call _LABEL_8BF_
	ld hl, $1819
	pop af
	call _LABEL_8BF_
	ld hl, $181A
	pop af
	call _LABEL_8BF_
	ld hl, $181B
	pop af
	call _LABEL_8BF_
	ret

_LABEL_DFF_:
	ld hl, $1B64
	call _LABEL_500_
	inc a
	cp $64
	call z, _LABEL_8B6_
	ld hl, $1B64
	call _LABEL_504_
	ld hl, $1B68
	call _LABEL_504_
	ld hl, $1B6C
	call _LABEL_504_
	ld hl, $1B65
	call _LABEL_500_
	cp $96
	call z, _LABEL_8B2_
	ld hl, $1B65
	call _LABEL_504_
	ld hl, $1B65
	call _LABEL_500_
	add a, $08
	ld hl, $1B69
	call _LABEL_504_
	ld hl, $1B65
	call _LABEL_500_
	add a, $10
	ld hl, $1B6D
	call _LABEL_504_
	ld hl, $1B64
	call _LABEL_500_
	and $07
	cp $06
	jp z, _LABEL_8C5_
	ld hl, _RAM_E2A9_
	ld a, (hl)
	ld b, a
	ld hl, _RAM_E2AA_
	ld a, (hl)
	ld c, a
	dec b
	ld d, b
	ld a, d
	add a, $06
	ld d, a
	ld e, c
	ld a, e
	add a, $0A
	ld e, a
_LABEL_E6C_:
	ld a, e
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld h, a
	ld a, e
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld l, a
	ld a, l
	ld l, d
	add a, l
	ld l, a
	ld a, h
	add a, $18
	ld h, a
	ld a, $20
	call _LABEL_504_
	dec e
	ld a, c
	cp e
	jr nz, _LABEL_E6C_
	dec d
	ld e, c
	ld a, e
	add a, $0A
	ld e, a
	ld a, b
	cp d
	jr nz, _LABEL_E6C_
	inc b
	ld hl, $1B65
	call _LABEL_500_
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld b, a
	ld hl, $1B64
	call _LABEL_500_
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld c, a
	dec b
	ld d, b
	ld a, d
	add a, $06
	ld d, a
	ld e, c
	ld a, e
	add a, $0A
	ld e, a
	ld ixl, $97
_LABEL_ED2_:
	ld a, e
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld h, a
	ld a, e
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld l, a
	ld a, l
	ld l, d
	add a, l
	ld l, a
	ld a, h
	add a, $18
	ld h, a
	ld a, ixl
	call _LABEL_504_
	dec ixl
	dec d
	ld a, b
	cp d
	jr nz, _LABEL_ED2_
	dec e
	ld d, b
	ld a, d
	add a, $06
	ld d, a
	ld a, c
	cp e
	jr nz, _LABEL_ED2_
	inc b
	ld a, b
	ld hl, _RAM_E2A9_
	ld a, a
	ld (hl), a
	ld a, c
	ld hl, _RAM_E2AA_
	ld a, a
	ld (hl), a
	ld hl, _RAM_E2DF_
	ld a, (hl)
	cp $01
	call z, _LABEL_2D26_
	ld hl, _RAM_E2DF_
	ld a, $00
	ld (hl), a
	ret

_LABEL_F28_:
	ld a, ixl
	dec a
	ld ixl, a
	ret

_LABEL_F2E_:
	ld a, ixl
	inc a
	ld ixl, a
	ret

_LABEL_F34_:
	ld hl, _RAM_E2D6_
	ld a, (hl)
	cp $00
	jp nz, _LABEL_F46_
	ld hl, _RAM_E2D6_
	ld a, (hl)
	cp $00
	jp z, _LABEL_1079_
_LABEL_F46_:
	ld hl, _RAM_E2D6_
	ld a, (hl)
	dec a
	ld e, a
	ld hl, _RAM_E2D6_
	ld a, e
	ld (hl), a
	ld hl, $1B64
	call _LABEL_500_
	inc a
	cp $64
	call z, _LABEL_8B6_
	ld hl, $1B64
	call _LABEL_504_
	ld hl, $1B68
	call _LABEL_504_
	ld hl, $1B6C
	call _LABEL_504_
	ld hl, $1B65
	call _LABEL_500_
	cp $96
	call z, _LABEL_8B2_
	ld hl, $1B65
	call _LABEL_504_
	ld hl, $1B65
	call _LABEL_500_
	add a, $08
	ld hl, $1B69
	call _LABEL_504_
	ld hl, $1B65
	call _LABEL_500_
	add a, $10
	ld hl, $1B6D
	call _LABEL_504_
	ld hl, $1B64
	call _LABEL_500_
	and $07
	cp $06
	jp z, _LABEL_8C5_
	ld hl, _RAM_E2A9_
	ld a, (hl)
	ld b, a
	ld hl, _RAM_E2AA_
	ld a, (hl)
	ld c, a
	dec b
	ld d, b
	ld a, d
	add a, $06
	ld d, a
	ld e, c
	ld a, e
	add a, $0A
	ld e, a
_LABEL_FBE_:
	ld a, e
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld h, a
	ld a, e
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld l, a
	ld a, l
	ld l, d
	add a, l
	ld l, a
	ld a, h
	add a, $18
	ld h, a
	ld a, $20
	call _LABEL_504_
	dec e
	ld a, c
	cp e
	jr nz, _LABEL_FBE_
	dec d
	ld e, c
	ld a, e
	add a, $0A
	ld e, a
	ld a, b
	cp d
	jr nz, _LABEL_FBE_
	inc b
	ld hl, $1B65
	call _LABEL_500_
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld b, a
	ld hl, $1B64
	call _LABEL_500_
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld c, a
	dec b
	ld d, b
	ld a, d
	add a, $06
	ld d, a
	ld e, c
	ld a, e
	add a, $0A
	ld e, a
	ld ixl, $97
_LABEL_1024_:
	ld a, e
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld h, a
	ld a, e
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld l, a
	ld a, l
	ld l, d
	add a, l
	ld l, a
	ld a, h
	add a, $18
	ld h, a
	ld a, ixl
	call _LABEL_504_
	dec ixl
	dec d
	ld a, b
	cp d
	jr nz, _LABEL_1024_
	dec e
	ld d, b
	ld a, d
	add a, $06
	ld d, a
	ld a, c
	cp e
	jr nz, _LABEL_1024_
	inc b
	ld a, b
	ld hl, _RAM_E2A9_
	ld a, a
	ld (hl), a
	ld a, c
	ld hl, _RAM_E2AA_
	ld a, a
	ld (hl), a
	ld hl, _RAM_E2DF_
	ld a, (hl)
	cp $01
	call z, _LABEL_2D26_
	ld hl, _RAM_E2DF_
	ld a, $00
	ld (hl), a
_LABEL_1079_:
	ret

_LABEL_107A_:
	ld hl, $1B65
	call _LABEL_500_
	dec a
	cp $04
	call z, _LABEL_8AE_
	cp $01
	call z, _LABEL_8AE_
	cp $00
	call z, _LABEL_8AE_
	ld hl, $1B65
	call _LABEL_504_
	ld hl, $1B65
	call _LABEL_500_
	add a, $08
	ld hl, $1B69
	call _LABEL_504_
	ld hl, $1B65
	call _LABEL_500_
	add a, $10
	ld hl, $1B6D
	call _LABEL_504_
	ld hl, $1B65
	call _LABEL_500_
	and $08
	jp nz, _LABEL_117D_
	ld hl, _RAM_E2A9_
	ld a, (hl)
	ld b, a
	ld hl, _RAM_E2AA_
	ld a, (hl)
	ld c, a
	dec b
	ld d, b
	ld a, d
	add a, $06
	ld d, a
	ld e, c
	ld a, e
	add a, $0A
	ld e, a
_LABEL_10D2_:
	ld a, e
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld h, a
	ld a, e
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld l, a
	ld a, l
	ld l, d
	add a, l
	ld l, a
	ld a, h
	add a, $18
	ld h, a
	ld a, $20
	call _LABEL_504_
	dec e
	ld a, c
	cp e
	jr nz, _LABEL_10D2_
	dec d
	ld e, c
	ld a, e
	add a, $0A
	ld e, a
	ld a, b
	cp d
	jr nz, _LABEL_10D2_
	inc b
	ld hl, $1B65
	call _LABEL_500_
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld b, a
	ld hl, $1B64
	call _LABEL_500_
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld c, a
	dec b
	ld d, b
	ld a, d
	add a, $06
	ld d, a
	ld e, c
	ld a, e
	add a, $0A
	ld e, a
	ld ixl, $97
_LABEL_1138_:
	ld a, e
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld h, a
	ld a, e
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld l, a
	ld a, l
	ld l, d
	add a, l
	ld l, a
	ld a, h
	add a, $18
	ld h, a
	ld a, ixl
	call _LABEL_504_
	dec ixl
	dec d
	ld a, b
	cp d
	jr nz, _LABEL_1138_
	dec e
	ld d, b
	ld a, d
	add a, $06
	ld d, a
	ld a, c
	cp e
	jr nz, _LABEL_1138_
	inc b
	ld a, b
	ld hl, _RAM_E2A9_
	ld a, a
	ld (hl), a
	ld hl, _RAM_E2AA_
	ld a, c
	ld (hl), a
_LABEL_117D_:
	ret

_LABEL_117E_:
	ld hl, $1B65
	call _LABEL_500_
	inc a
	cp $96
	call z, _LABEL_8B2_
	ld hl, $1B65
	call _LABEL_504_
	ld hl, $1B65
	call _LABEL_500_
	add a, $08
	ld hl, $1B69
	call _LABEL_504_
	ld hl, $1B65
	call _LABEL_500_
	add a, $10
	ld hl, $1B6D
	call _LABEL_504_
	ld hl, $1B65
	call _LABEL_500_
	and $08
	jp nz, _LABEL_1278_
	ld hl, _RAM_E2A9_
	ld a, (hl)
	ld b, a
	ld hl, _RAM_E2AA_
	ld a, (hl)
	ld c, a
	dec b
	ld d, b
	ld a, d
	add a, $06
	ld d, a
	ld e, c
	ld a, e
	add a, $0A
	ld e, a
_LABEL_11CC_:
	ld a, e
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld h, a
	ld a, e
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld l, a
	ld a, l
	ld l, d
	add a, l
	ld l, a
	ld a, h
	add a, $18
	ld h, a
	ld a, $20
	call _LABEL_504_
	dec e
	ld a, c
	cp e
	jr nz, _LABEL_11CC_
	dec d
	ld e, c
	ld a, e
	add a, $0A
	ld e, a
	ld a, b
	cp d
	jr nz, _LABEL_11CC_
	inc b
	ld hl, $1B65
	call _LABEL_500_
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld b, a
	ld hl, $1B64
	call _LABEL_500_
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld c, a
	dec b
	ld d, b
	ld a, d
	add a, $06
	ld d, a
	ld e, c
	ld a, e
	add a, $0A
	ld e, a
	ld ixl, $97
_LABEL_1232_:
	ld a, e
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld h, a
	ld a, e
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld l, a
	ld a, l
	ld l, d
	add a, l
	ld l, a
	ld a, h
	add a, $18
	ld h, a
	ld a, ixl
	call _LABEL_504_
	dec ixl
	dec d
	ld a, b
	cp d
	jr nz, _LABEL_1232_
	dec e
	ld d, b
	ld a, d
	add a, $06
	ld d, a
	ld a, c
	cp e
	jr nz, _LABEL_1232_
	inc b
	ld a, b
	ld hl, _RAM_E2A9_
	ld a, a
	ld (hl), a
	ld a, c
	ld hl, _RAM_E2AA_
	ld a, a
	ld (hl), a
_LABEL_1278_:
	ret

_LABEL_1279_:
	ld hl, $1B41
	ld a, $B8
	call _LABEL_504_
	ld hl, $1B40
	call _LABEL_500_
	sub $40
	call _LABEL_504_
	ret

_LABEL_128D_:
	ld hl, $1B40
	call _LABEL_500_
	cp $D2
	jp z, _LABEL_129D_
	cp $D2
	jp nz, _LABEL_12AD_
_LABEL_129D_:
	ld a, $26
	ld hl, $1B40
	call _LABEL_504_
	ld a, $ED
	ld hl, $1B41
	call _LABEL_504_
_LABEL_12AD_:
	ld hl, $1B48
	call _LABEL_500_
	and $01
	ld e, a
	ld hl, $1B41
	call _LABEL_500_
	cp $08
	call c, _LABEL_1279_
	ld hl, $1B40
	call _LABEL_500_
	add a, e
	call _LABEL_504_
	ld hl, $1B43
	and $01
	add a, $08
	call _LABEL_504_
	ld hl, $1B41
	call _LABEL_500_
	dec a
	call _LABEL_504_
	ld hl, $1B41
	call _LABEL_500_
	push hl
	push af
	ld hl, _RAM_E2C2_
	ld a, (hl)
	ld e, a
	pop af
	pop hl
	sub e
	jp c, _LABEL_12F4_
	sub $06
_LABEL_12F4_:
	add a, e
	call _LABEL_504_
	ld hl, $1B40
	call _LABEL_500_
	sub $D2
	jp c, _LABEL_1320_
	ld a, $00
	ld hl, _RAM_E2AF_
	ld a, a
	ld (hl), a
	ld a, a
	cp $00
	jp z, _LABEL_1320_
	ld hl, $1B40
	ld a, $D2
	call _LABEL_504_
	ld hl, $1B41
	ld a, $D2
	call _LABEL_504_
_LABEL_1320_:
	ret

_LABEL_1321_:
	call _LABEL_41F_
	sub $E6
	rl a
	and $01
	ld hl, _RAM_E2AF_
	ld a, a
	ld (hl), a
	ld a, a
	cp $00
	jp z, _LABEL_1345_
	ld hl, $1B40
	ld a, $D2
	call _LABEL_504_
	ld hl, $1B41
	ld a, $D2
	call _LABEL_504_
_LABEL_1345_:
	call _LABEL_41F_
	and $7F
	ld e, a
	call _LABEL_41F_
	and $3F
	add a, e
	add a, $0A
	ld e, a
	ld hl, _RAM_E2C2_
	ld a, e
	ld (hl), a
	ret

_LABEL_135A_:
	ld c, $9C
	call _LABEL_1366_
	ld c, $F6
	call _LABEL_1366_
	ld c, $FF
_LABEL_1366_:
	ld b, $2F
_LABEL_1368_:
	inc b
	add a, c
	jr c, _LABEL_1368_
	sub c
	push af
	ld a, b
	call $00A2
	pop af
	ret

_LABEL_1374_:
	ld c, $FF
	ld b, $2F
_LABEL_1378_:
	inc b
	add a, c
	jr c, _LABEL_1378_
	sub c
	push af
	ld a, b
	call $00A2
	pop af
	ret

; Data from 1384 to 1388 (5 bytes)
	db $3E, $00, $16, $FE, $C9

_LABEL_1389_:
	ld a, $00
	ld d, $FE
	ret

_LABEL_138E_:
	call _LABEL_41F_
	and $03
	ld ixl, a
	ld hl, _RAM_E2AB_
	ld a, (hl)
	add a, $04
	add a, ixl
	ld hl, _RAM_E2AB_
	ld a, a
	ld (hl), a
	ld a, $FE
	ld bc, _RAM_E2CC_
	ld (bc), a
	ld a, $FA
	ret

_LABEL_13AB_:
	or a
	ret p
	neg
	ret

_LABEL_13B0_:
	ld h, d
	ld l, e
	ret

_LABEL_13B3_:
	ld a, d
	cp $FE
	call z, _LABEL_60A_
	call _LABEL_8_
	ret

; Data from 13BD to 13CA (14 bytes)
	db $06, $01, $06, $02, $3E, $FF, $3D, $20, $FD, $05, $78, $20, $F9, $C9

_LABEL_13CB_:
	ld bc, _RAM_E2B2_
	ld a, (bc)
	ld h, a
	inc bc
	ld a, (bc)
	ld l, a
	ld bc, _RAM_E2B4_
	ld a, h
	ld (bc), a
	inc bc
	ld a, l
	ld (bc), a
	ret

; Data from 13DC to 13E3 (8 bytes)
	db $1E, $00, $21, $DD, $E2, $7B, $77, $C9

_LABEL_13E4_:
	ld a, b
	cp $01
	jp z, _LABEL_1440_
	ld h, $06
	ld l, $16
	call $00C6
	ld hl, $569C
	call _LABEL_1633_
	ld hl, $1B50
	call _LABEL_500_
	ld hl, _RAM_E2B0_
	ld (hl), a
	push de
	push hl
	push af
	call _LABEL_55_
	pop af
	pop hl
	pop de
	ld hl, $1AE7
	ld a, $31
	call _LABEL_504_
	ld hl, $1AE9
	ld a, $30
	call _LABEL_504_
	ld hl, $1AE8
	ld a, $30
	call _LABEL_504_
_LABEL_1422_:
	ld a, $08
	call $0141
	bit 0, a
	jp z, _LABEL_1440_
	ld a, $00
	cp $00
	jp z, _LABEL_143D_
	ld a, $00
	call $0141
	bit 4, a
	jp z, _LABEL_1440_
_LABEL_143D_:
	jp _LABEL_1422_

_LABEL_1440_:
	call _LABEL_5F6_
	ld hl, $1AE7
	ld a, $30
	call _LABEL_504_
	ld hl, $1AE9
	ld a, $2F
	call _LABEL_504_
	ld hl, $1AE8
	ld a, $2F
	call _LABEL_504_
	ld b, $0F
_LABEL_145D_:
	ld hl, $1B38
	ld de, $0000
	ld e, b
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, $FF
	call _LABEL_504_
	inc hl
	ld a, $FF
	call _LABEL_504_
	dec hl
	djnz _LABEL_145D_
	ld bc, _RAM_E2C3_
	ld a, $00
	ld (bc), a
	inc bc
	ld a, $00
	ld (bc), a
	add a, $0F
	and $03
	add a, $0B
	rl a
	and $03
	add a, $0B
	ld ixh, $00
	ld ixl, $C8
_LABEL_1492_:
	ld a, ixl
	add a, ixh
	add a, ixh
	add a, ixh
	add a, ixh
	add a, ixh
	add a, ixh
	add a, ixh
	add a, ixh
	ld hl, $2000
	ld a, a
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld de, $0000
	ld e, a
	add hl, de
	ld a, a
	rl a
	rl a
	rl a
	rl a
	ld e, $01
	add a, e
	call _LABEL_504_
	ld a, ixh
	inc a
	ld ixh, a
	sub $00
	cp $04
	jp z, _LABEL_14D6_
	cp $04
	jp nz, _LABEL_1492_
_LABEL_14D6_:
	call _LABEL_30AA_
	ld a, $00
	sub $01
	ld c, a
	ld b, a
	ld a, $00
_LABEL_14E1_:
	ld d, b
	ld a, d
	add a, $08
	ld d, a
	ld e, c
	ld a, e
	add a, $04
	ld e, a
	ld ixl, $E7
_LABEL_14EE_:
	ld a, e
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld h, a
	ld a, e
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld l, a
	ld a, l
	ld l, d
	add a, l
	ld l, a
	ld a, h
	add a, $18
	ld h, a
	ld a, ixl
	call _LABEL_504_
	dec ixl
	dec d
	ld a, b
	cp d
	jr nz, _LABEL_14EE_
	dec e
	ld d, b
	ld a, d
	add a, $08
	ld d, a
	ld a, c
	cp e
	jr nz, _LABEL_14EE_
	ld a, c
	add a, $04
	ld c, a
	ld a, c
	sub $00
	cp $17
	jp nz, _LABEL_14E1_
	cp $17
	jp z, _LABEL_1538_
_LABEL_1538_:
	ld a, $00
	sub $01
	ld c, a
	ld a, b
	add a, $08
	ld b, a
	cp $FF
	jp nz, _LABEL_14E1_
	cp $1F
	jp z, _LABEL_154B_
_LABEL_154B_:
	ld h, $0E
	ld l, $17
	call $00C6
	ld hl, $5696
	call _LABEL_1633_
	ld hl, $1ACD
	ld a, $EB
	call _LABEL_504_
	ld hl, $1B6F
	ld a, $00
	call _LABEL_504_
_LABEL_1568_:
	ld hl, _RAM_E2DD_
	ld a, $00
	ld (hl), a
	ld hl, _RAM_E2D6_
	ld a, $FA
	ld (hl), a
	ld hl, $2000
	ld a, $59
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld de, $0000
	ld e, a
	add hl, de
	ld a, $01
	rl a
	rl a
	rl a
	rl a
	ld e, $05
	add a, e
	call _LABEL_504_
	ld bc, _RAM_E2C3_
	ld a, (bc)
	ld h, a
	inc bc
	ld a, (bc)
	ld l, a
	ld a, h
	cp $FF
	jp z, _LABEL_15A8_
	jp nz, _LABEL_15AE_
_LABEL_15A8_:
	ld hl, $0000
	jp _LABEL_15AE_

_LABEL_15AE_:
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	inc hl
	ld bc, _RAM_E2C3_
	ld a, h
	ld (bc), a
	inc bc
	ld a, l
	ld (bc), a
	ld a, h
	ld ixl, a
	ld h, $06
	ld l, $16
	call $00C6
	ld hl, $56B2
	ld de, $0000
	ld e, ixl
	add hl, de
	call _LABEL_228_
	ld a, $08
	call $0141
	bit 0, a
	jp z, _LABEL_15F2_
	ld a, $00
	cp $00
	jp z, _LABEL_15EF_
	ld a, $00
	call $0141
	bit 4, a
	jp z, _LABEL_15F2_
_LABEL_15EF_:
	jp _LABEL_1568_

_LABEL_15F2_:
	ret

_LABEL_15F3_:
	ld h, $1B
	ld l, $18
	call $00C6
	ld l, $F0
	ld h, $0A
	ld bc, _RAM_E2B4_
	ld a, h
	ld (bc), a
	inc bc
	ld a, l
	ld (bc), a
	ld bc, _RAM_E2B4_
	ld a, (bc)
	ld h, a
	inc bc
	ld a, (bc)
	ld l, a
	call _LABEL_431_
	ld e, $65
	ld hl, _RAM_E2AB_
	ld a, e
	ld (hl), a
	ld b, $01
	call _LABEL_13E4_
	ret

_LABEL_161E_:
	ld l, $F0
	ld h, $0A
	ld bc, _RAM_E2B4_
	ld a, h
	ld (bc), a
	inc bc
	ld a, l
	ld (bc), a
	ld bc, _RAM_E2B4_
	ld a, (bc)
	ld h, a
	inc bc
	ld a, (bc)
	ld l, a
	ret

_LABEL_1633_:
	ld a, (hl)
	cp $FF
	ret z
	inc hl
	call $00A2
	jr _LABEL_1633_

_LABEL_163D_:
	ld a, (hl)
	dec a
	dec a
	cp $FD
	ret z
	inc hl
	call $00A2
	jr _LABEL_163D_

; Data from 1649 to 1653 (11 bytes)
_DATA_1649_:
	db $57, $45, $4C, $4C, $CF, $44, $4F, $4E, $45, $CF, $FF

; Data from 1654 to 165B (8 bytes)
_DATA_1654_:
	db $45, $2E, $4C, $45, $56, $45, $4C, $FF

; Data from 165C to 1663 (8 bytes)
_DATA_165C_:
	db $4E, $2E, $4C, $45, $56, $45, $4C, $FF

; Data from 1664 to 1668 (5 bytes)
_DATA_1664_:
	db $52, $55, $4E, $20, $FF

; Data from 1669 to 166C (4 bytes)
_DATA_1669_:
	db $4D, $53, $EE, $FF

; Data from 166D to 1670 (4 bytes)
_DATA_166D_:
	db $20, $20, $20, $FF

; Data from 1671 to 167B (11 bytes)
_DATA_1671_:
	db $54, $55, $52, $42, $4F, $20, $44, $4F, $57, $4E, $FF

; Data from 167C to 1681 (6 bytes)
_DATA_167C_:
	db $53, $43, $4F, $52, $45, $FF

; Data from 1682 to 1684 (3 bytes)
_DATA_1682_:
	db $48, $49, $FF

; Data from 1685 to 168B (7 bytes)
_DATA_1685_:
	db $44, $41, $4D, $41, $47, $45, $FF

; Data from 168C to 168F (4 bytes)
_DATA_168C_:
	db $4F, $4C, $44, $FF

; Data from 1690 to 1695 (6 bytes)
_DATA_1690_:
	db $4E, $45, $57, $48, $49, $FF

; Data from 1696 to 169B (6 bytes)
_DATA_1696_:
	db $4B, $32, $30, $32, $31, $FF

; Data from 169C to 17DD (322 bytes)
_DATA_169C_:
	db $47, $41, $4D, $45, $20, $4F, $56, $45, $52, $2E, $50, $52, $45, $53, $53, $20
	db $53, $50, $41, $43, $45, $FF, $50, $52, $45, $53, $53, $20, $53, $50, $41, $43
	db $45, $20, $54, $4F, $20, $53, $54, $41, $52, $54, $2E, $41, $49, $4D, $20, $54
	db $4F, $20, $42, $45, $41, $54, $20, $54, $48, $45, $20, $43, $55, $52, $52, $45
	db $4E, $54, $20, $48, $49, $53, $43, $4F, $52, $45, $2E, $43, $4F, $4E, $54, $52
	db $4F, $4C, $53, $20, $41, $52, $45, $20, $44, $4F, $57, $4E, $4B, $4C, $45, $46
	db $54, $26, $52, $49, $47, $48, $54, $3B, $32, $4B, $33, $4B, $34, $4B, $35, $20
	db $53, $45, $54, $53, $20, $4D, $4F, $44, $45, $53, $2E, $45, $4E, $54, $45, $52
	db $20, $54, $48, $45, $20, $53, $45, $4E, $54, $45, $4E, $43, $45, $20, $43, $4F
	db $52, $52, $45, $43, $54, $4C, $59, $20, $49, $4E, $20, $54, $49, $4D, $45, $3B
	db $49, $4E, $43, $4C, $55, $44, $49, $4E, $47, $20, $46, $55, $4C, $4C, $20, $53
	db $54, $4F, $50, $2E, $54, $4F, $20, $47, $45, $54, $20, $54, $55, $52, $42, $4F
	db $20, $44, $4F, $57, $4E, $20, $49, $4E, $43, $52, $45, $41, $53, $45, $28, $55
	db $53, $45, $44, $20, $54, $4F, $20, $43, $4F, $4C, $4C, $45, $43, $54, $20, $48
	db $45, $41, $52, $54, $53, $20, $4D, $4F, $52, $45, $20, $45, $41, $53, $49, $4C
	db $59, $29, $2E, $43, $52, $45, $44, $49, $54, $53, $3A, $57, $48, $4F, $4C, $45
	db $20, $47, $41, $4D, $45, $20, $4D, $41, $44, $45, $20, $42, $51, $20, $5A, $38
	db $30, $20, $41, $53, $4D, $45, $52, $20, $49, $4E, $20, $31, $30, $30, $25, $20
	db $41, $53, $53, $45, $4D, $42, $4C, $51
	ds 25, $20
	db $FF

; Data from 17DE to 180E (49 bytes)
_DATA_17DE_:
	db $43, $4E, $4E, $22, $48, $4B, $4E, $47, $55, $22, $43, $56, $22, $4F, $55, $5A
	db $22, $46, $47, $58, $22, $55, $4B, $56, $47, $0D, $4F, $55, $5A, $22, $46, $47
	db $58, $22, $34, $33, $22, $45, $51, $4F, $52, $51, $22, $47, $50, $56, $54, $5B
	db $FF

; Data from 180F to 1813 (5 bytes)
_DATA_180F_:
	db $02, $03, $0C, $0A, $0B

; Data from 1814 to 1818 (5 bytes)
_DATA_1814_:
	db $04, $05, $04, $0D, $0D

; Data from 1819 to 181D (5 bytes)
_DATA_1819_:
	db $02, $03, $0C, $09, $08

; Data from 181E to 1822 (5 bytes)
_DATA_181E_:
	db $06, $08, $09, $0B, $0A

_LABEL_1823_:
	ld b, $05
	ld c, $00
	ld a, iyh
	cp $00
	jp z, _LABEL_183D_
	cp $01
	jp z, _LABEL_1843_
	cp $02
	jp z, _LABEL_1849_
	cp $03
	jp z, _LABEL_184F_
_LABEL_183D_:
	ld de, $580F
	jp _LABEL_1855_

_LABEL_1843_:
	ld de, $5814
	jp _LABEL_1855_

_LABEL_1849_:
	ld de, $5819
	jp _LABEL_1855_

_LABEL_184F_:
	ld de, $581E
	jp _LABEL_1855_

_LABEL_1855_:
	ld a, (de)
	ld iyl, a
	push de
	ld hl, $2000
	ld a, c
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld de, $0000
	ld e, a
	add hl, de
	ld a, iyl
	rl a
	rl a
	rl a
	rl a
	ld e, $07
	add a, e
	call _LABEL_504_
	pop de
	inc de
	ld a, c
	add a, $08
	ld c, a
	djnz _LABEL_1855_
	ret

_LABEL_1884_:
	ld a, $00
	call $0141
	bit 1, a
	call z, _LABEL_107A_
	ld a, $00
	call $0141
	bit 2, a
	call z, _LABEL_117E_
	ld a, $00
	call $0141
	bit 3, a
	call z, _LABEL_F34_
	ret

_LABEL_18A3_:
	ld a, $08
	call $0141
	bit 4, a
	call z, _LABEL_107A_
	ld a, $08
	call $0141
	bit 7, a
	call z, _LABEL_117E_
	ld a, $08
	call $0141
	bit 6, a
	call z, _LABEL_F34_
	ld a, $00
	cp $01
	call z, _LABEL_1884_
	ret

_LABEL_18C9_:
	ld a, $00
	call $0141
	bit 4, a
	jp z, _LABEL_1A4B_
	ret

_LABEL_18D4_:
	ld a, $08
	call $0141
	bit 0, a
	jp z, _LABEL_1A4B_
	ld a, $00
	cp $01
	call z, _LABEL_18C9_
	ret

_LABEL_18E6_:
	call _LABEL_18A3_
	ret

_LABEL_18EA_:
	ld a, e
	cp $01
	jp z, _LABEL_1900_
	ld hl, $1B64
	ld a, $00
	call _LABEL_504_
	ld hl, $1B65
	ld a, $69
	call _LABEL_504_
_LABEL_1900_:
	ld hl, $1B66
	ld a, $0A
	call _LABEL_504_
	ld hl, $1B67
	ld a, $02
	call _LABEL_504_
	ld hl, $3850
	ld a, $03
	call _LABEL_504_
	inc hl
	ld a, $0F
	call _LABEL_504_
	inc hl
	ld a, $7F
	call _LABEL_504_
	inc hl
	ld a, $FF
	call _LABEL_504_
	inc hl
	ld a, $7B
	call _LABEL_504_
	inc hl
	ld a, $3D
	call _LABEL_504_
	inc hl
	ld a, $06
	call _LABEL_504_
	inc hl
	ld a, $03
	call _LABEL_504_
	ld a, e
	cp $01
	jp z, _LABEL_1958_
	ld hl, $1B68
	ld a, $00
	call _LABEL_504_
	ld hl, $1B69
	ld a, $71
	call _LABEL_504_
_LABEL_1958_:
	ld hl, $1B6A
	ld a, $0B
	call _LABEL_504_
	ld hl, $1B6B
	ld a, $02
	call _LABEL_504_
	ld hl, $3858
	ld a, $FD
	call _LABEL_504_
	inc hl
	ld a, $F3
	call _LABEL_504_
	inc hl
	ld a, $EF
	call _LABEL_504_
	inc hl
	ld a, $FF
	call _LABEL_504_
	inc hl
	ld a, $EF
	call _LABEL_504_
	inc hl
	ld a, $F7
	call _LABEL_504_
	inc hl
	ld a, $FB
	call _LABEL_504_
	inc hl
	ld a, $FF
	call _LABEL_504_
	ld a, e
	cp $01
	jp z, _LABEL_19B0_
	ld hl, $1B6C
	ld a, $00
	call _LABEL_504_
	ld hl, $1B6D
	ld a, $79
	call _LABEL_504_
_LABEL_19B0_:
	ld hl, $1B6E
	ld a, $0C
	call _LABEL_504_
	ld hl, $1B6F
	ld a, $02
	call _LABEL_504_
	ld hl, $3860
	ld a, $80
	call _LABEL_504_
	inc hl
	ld a, $F8
	call _LABEL_504_
	inc hl
	ld a, $F4
	call _LABEL_504_
	inc hl
	ld a, $EE
	call _LABEL_504_
	inc hl
	ld a, $DF
	call _LABEL_504_
	inc hl
	ld a, $FE
	call _LABEL_504_
	inc hl
	ld a, $F8
	call _LABEL_504_
	inc hl
	ld a, $C0
	call _LABEL_504_
	ld a, e
	cp $01
	jp z, _LABEL_1A08_
	ld hl, $1B7C
	ld a, $50
	call _LABEL_504_
	ld hl, $1B7D
	ld a, $50
	call _LABEL_504_
_LABEL_1A08_:
	ld hl, $1B7E
	ld a, $0E
	call _LABEL_504_
	ld hl, $1B7F
	ld a, $06
	call _LABEL_504_
	ld hl, $3870
	ld a, $C0
	call _LABEL_504_
	inc hl
	ld a, $E0
	call _LABEL_504_
	inc hl
	ld a, $71
	call _LABEL_504_
	inc hl
	ld a, $39
	call _LABEL_504_
	inc hl
	ld a, $1B
	call _LABEL_504_
	inc hl
	ld a, $0F
	call _LABEL_504_
	inc hl
	ld a, $07
	call _LABEL_504_
	inc hl
	ld a, $01
	call _LABEL_504_
	ret

_LABEL_1A4B_:
	ld a, $00
	ld hl, _RAM_E2AB_
	ld a, a
	ld (hl), a
	ld a, $00
	cp $01
	jp z, _LABEL_1A69_
	ld hl, $1B44
	ld a, $64
	call _LABEL_504_
	ld hl, $1B45
	ld a, $1E
	call _LABEL_504_
_LABEL_1A69_:
	ld hl, $1B46
	ld a, $02
	call _LABEL_504_
	ld hl, $1B47
	ld a, $0D
	call _LABEL_504_
	ld hl, $3810
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	ld a, $00
	cp $01
	jp z, _LABEL_1AC2_
	ld hl, $1B48
	ld a, $64
	call _LABEL_504_
	ld hl, $1B49
	ld a, $37
	call _LABEL_504_
_LABEL_1AC2_:
	ld hl, $1B4A
	ld a, $03
	call _LABEL_504_
	ld hl, $1B4B
	ld a, $0E
	call _LABEL_504_
	ld hl, $3818
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	ld a, $00
	cp $01
	jp z, _LABEL_1B1B_
	ld hl, $1B4C
	ld a, $64
	call _LABEL_504_
	ld hl, $1B4D
	ld a, $50
	call _LABEL_504_
_LABEL_1B1B_:
	ld hl, $1B4E
	ld a, $04
	call _LABEL_504_
	ld hl, $1B4F
	ld a, $02
	call _LABEL_504_
	ld hl, $3820
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	ld a, $00
	cp $01
	jp z, _LABEL_1B74_
	ld hl, $1B50
	ld a, $64
	call _LABEL_504_
	ld hl, $1B51
	ld a, $69
	call _LABEL_504_
_LABEL_1B74_:
	ld hl, $1B52
	ld a, $05
	call _LABEL_504_
	ld hl, $1B53
	ld a, $0A
	call _LABEL_504_
	ld hl, $3828
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	ld a, $00
	cp $01
	jp z, _LABEL_1BCD_
	ld hl, $1B54
	ld a, $82
	call _LABEL_504_
	ld hl, $1B55
	ld a, $82
	call _LABEL_504_
_LABEL_1BCD_:
	ld hl, $1B56
	ld a, $06
	call _LABEL_504_
	ld hl, $1B57
	ld a, $09
	call _LABEL_504_
	ld hl, $3830
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	ld a, $00
	cp $01
	jp z, _LABEL_1C26_
	ld hl, $1B58
	ld a, $82
	call _LABEL_504_
	ld hl, $1B59
	ld a, $9B
	call _LABEL_504_
_LABEL_1C26_:
	ld hl, $1B5A
	ld a, $07
	call _LABEL_504_
	ld hl, $1B5B
	ld a, $0F
	call _LABEL_504_
	ld hl, $3838
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	ld a, $00
	cp $01
	jp z, _LABEL_1C7F_
	ld hl, $1B5C
	ld a, $82
	call _LABEL_504_
	ld hl, $1B5D
	ld a, $B4
	call _LABEL_504_
_LABEL_1C7F_:
	ld hl, $1B5E
	ld a, $08
	call _LABEL_504_
	ld hl, $1B5F
	ld a, $0D
	call _LABEL_504_
	ld hl, $3840
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	ld a, $00
	cp $01
	jp z, _LABEL_1CD8_
	ld hl, $1B60
	ld a, $5A
	call _LABEL_504_
	ld hl, $1B61
	ld a, $5A
	call _LABEL_504_
_LABEL_1CD8_:
	ld hl, $1B62
	ld a, $09
	call _LABEL_504_
	ld hl, $1B63
	ld a, $01
	call _LABEL_504_
	ld hl, $3848
	ld a, $FF
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $FF
	call _LABEL_504_
	ld a, $00
	cp $01
	jp z, _LABEL_1D31_
	ld hl, $1B40
	ld a, $D2
	call _LABEL_504_
	ld hl, $1B41
	ld a, $E6
	call _LABEL_504_
_LABEL_1D31_:
	ld hl, $1B42
	ld a, $01
	call _LABEL_504_
	ld hl, $1B43
	ld a, $06
	call _LABEL_504_
	ld hl, $3808
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $42
	call _LABEL_504_
	inc hl
	ld a, $E7
	call _LABEL_504_
	inc hl
	ld a, $FF
	call _LABEL_504_
	inc hl
	ld a, $FF
	call _LABEL_504_
	inc hl
	ld a, $7E
	call _LABEL_504_
	inc hl
	ld a, $3C
	call _LABEL_504_
	inc hl
	ld a, $18
	call _LABEL_504_
	ld e, $00
	call _LABEL_18EA_
	ld a, $00
	ld hl, _RAM_E2AF_
	ld a, a
	ld (hl), a
	ld a, a
	cp $00
	jp z, _LABEL_1D95_
	ld hl, $1B40
	ld a, $D2
	call _LABEL_504_
	ld hl, $1B41
	ld a, $D2
	call _LABEL_504_
_LABEL_1D95_:
	ld a, $08
	ld hl, _RAM_E2A9_
	ld a, a
	ld (hl), a
	ld a, $00
	ld hl, _RAM_E2AA_
	ld a, a
	ld (hl), a
	ld d, $07
	ld a, d
	add a, $06
	ld d, a
	ld e, $00
	ld a, e
	add a, $0A
	ld e, a
	ld ixl, $97
_LABEL_1DB2_:
	ld a, e
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld h, a
	ld a, e
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld l, a
	ld a, l
	ld l, d
	add a, l
	ld l, a
	ld a, h
	add a, $18
	ld h, a
	ld a, ixl
	call _LABEL_504_
	dec ixl
	dec d
	ld a, $07
	cp d
	jr nz, _LABEL_1DB2_
	dec e
	ld d, $07
	ld a, d
	add a, $06
	ld d, a
	ld a, $00
	cp e
	jr nz, _LABEL_1DB2_
	ld a, r
	and $01
	ld hl, _RAM_E2A0_
	ld a, a
	ld (hl), a
	ld b, $04
	ld c, $41
_LABEL_1DFB_:
	ld hl, $2000
	ld a, c
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld de, $0000
	ld e, a
	add hl, de
	ld a, $01
	rl a
	rl a
	rl a
	rl a
	ld e, $05
	add a, e
	call _LABEL_504_
	ld a, c
	add a, $08
	ld c, a
	djnz _LABEL_1DFB_
	ld hl, $2000
	ld a, $30
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld de, $0000
	ld e, a
	add hl, de
	ld a, $0F
	rl a
	rl a
	rl a
	rl a
	ld e, $05
	add a, e
	call _LABEL_504_
	ld hl, $2000
	ld a, $38
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld de, $0000
	ld e, a
	add hl, de
	ld a, $0F
	rl a
	rl a
	rl a
	rl a
	ld e, $05
	add a, e
	call _LABEL_504_
	ld b, $08
	ld c, $5C
_LABEL_1E6D_:
	ld hl, $2000
	ld a, c
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld de, $0000
	ld e, a
	add hl, de
	ld a, $07
	rl a
	rl a
	rl a
	rl a
	ld e, $01
	add a, e
	call _LABEL_504_
	ld a, c
	add a, $08
	ld c, a
	djnz _LABEL_1E6D_
	ld a, $01
	ld iyh, $00
	call _LABEL_1823_
	ld hl, $2000
	ld a, $C0
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld de, $0000
	ld e, a
	add hl, de
	ld a, $07
	rl a
	rl a
	rl a
	rl a
	ld e, $0F
	add a, e
	call _LABEL_504_
	ld hl, _RAM_E2AE_
	ld a, $16
	ld (hl), a
	call _LABEL_508_
	dec a
	ld hl, _RAM_E2AE_
	ld a, a
	ld (hl), a
	call _LABEL_508_
	ld ixl, $C0
	ld ixh, $0A
	call _LABEL_508_
	and $7F
	ld e, a
	add a, ixh
	ld ixh, a
	inc ixh
	ld a, $02
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, $02
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, ixh
	add hl, de
	call $004A
	sub $F0
	jp nc, _LABEL_1F18_
	ld a, ixl
	call _LABEL_504_
_LABEL_1F18_:
	inc ixh
	inc ixl
	ld a, $02
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, $02
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, ixh
	add hl, de
	call $004A
	sub $F0
	jp nc, _LABEL_1F50_
	ld a, ixl
	call _LABEL_504_
_LABEL_1F50_:
	inc ixh
	ld a, $02
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, $02
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, ixh
	add hl, de
	call $004A
	sub $F0
	jp nc, _LABEL_1F86_
	ld a, $20
	call _LABEL_504_
_LABEL_1F86_:
	ld ixl, $C0
	ld ixh, $01
	call _LABEL_508_
	and $1F
	ld e, a
	add a, ixh
	ld ixh, a
	dec ixh
	dec ixl
	ld b, $02
_LABEL_1F9C_:
	inc ixh
	ld a, b
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, b
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, ixh
	add hl, de
	call $004A
	sub $F0
	jp nc, _LABEL_1FD0_
	ld a, $20
	call _LABEL_504_
_LABEL_1FD0_:
	inc ixh
	inc ixl
	ld a, b
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, b
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, ixh
	add hl, de
	call $004A
	sub $F0
	jp nc, _LABEL_2006_
	ld a, ixl
	call _LABEL_504_
_LABEL_2006_:
	inc ixh
	inc ixl
	ld a, b
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, b
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, ixh
	add hl, de
	call $004A
	sub $F0
	jp nc, _LABEL_203C_
	ld a, ixl
	call _LABEL_504_
_LABEL_203C_:
	inc ixh
	ld a, b
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld d, a
	ld a, b
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld e, a
	ld hl, $1800
	add hl, de
	ld de, $0000
	ld e, ixh
	add hl, de
	call $004A
	sub $F0
	jp nc, _LABEL_2070_
	ld a, $20
	call _LABEL_504_
_LABEL_2070_:
	inc b
	inc b
	ld a, b
	cp $0A
	jp z, _LABEL_207E_
	ld a, b
	cp $0A
	jp nz, _LABEL_1F9C_
_LABEL_207E_:
	ld hl, _RAM_E2AC_
	ld a, $12
	ld (hl), a
	ld hl, _RAM_E2AD_
	ld a, $00
	ld (hl), a
	ld de, $0000
_LABEL_208D_:
	ld hl, $1800
	add hl, de
	ld a, $20
	call _LABEL_504_
	inc de
	ld a, d
	cp $03
	jr nz, _LABEL_208D_
	call _LABEL_8C5_
	ld hl, _RAM_E2B0_
	ld a, $27
	ld (hl), a
	ld a, $01
	ld hl, _RAM_E2A0_
	ld a, a
	ld (hl), a
	ld hl, $0000
	ld bc, _RAM_E2B2_
	ld a, h
	ld (bc), a
	inc bc
	ld a, l
	ld (bc), a
	ld a, $00
	ld hl, _RAM_E2B6_
	ld a, $00
	ld (hl), a
	ld hl, _RAM_E2B6_
	ld a, (hl)
	cp $01
	ld h, $01
	ld l, $18
	call $00C6
	ld hl, $5685
	call _LABEL_1633_
	ld h, $19
	ld l, $18
	call $00C6
	ld hl, $5682
	call _LABEL_1633_
	ld h, $0D
	ld l, $18
	call $00C6
	ld hl, $567C
	call _LABEL_1633_
	ld h, $01
	ld l, $17
	call $00C6
	ld hl, $5671
	call _LABEL_1633_
	ld h, $17
	ld l, $17
	call $00C6
	ld hl, _RAM_E2DA_
	ld a, (hl)
	cp $01
	jp z, _LABEL_2112_
	ld hl, $5654
	call _LABEL_1633_
	jp _LABEL_2118_

_LABEL_2112_:
	ld hl, $565C
	call _LABEL_1633_
_LABEL_2118_:
	ld hl, _RAM_E2B8_
	ld a, $00
	ld (hl), a
	ld e, $C7
	ld hl, _RAM_E2C2_
	ld a, e
	ld (hl), a
	ld hl, $2000
	ld a, $E8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld de, $0000
	ld e, a
	add hl, de
	ld a, $01
	rl a
	rl a
	rl a
	rl a
	ld e, $05
	add a, e
	call _LABEL_504_
	ld hl, $1AEA
	ld a, $E9
	call _LABEL_504_
	ld hl, $0000
	ld de, $0000
	ld e, $4B
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $10
	call _LABEL_504_
	inc hl
	ld a, $20
	call _LABEL_504_
	inc hl
	ld a, $40
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	ld hl, $0000
	ld de, $0000
	ld e, $EB
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, $3C
	call _LABEL_504_
	inc hl
	ld a, $42
	call _LABEL_504_
	inc hl
	ld a, $99
	call _LABEL_504_
	inc hl
	ld a, $A1
	call _LABEL_504_
	inc hl
	ld a, $A1
	call _LABEL_504_
	inc hl
	ld a, $99
	call _LABEL_504_
	inc hl
	ld a, $42
	call _LABEL_504_
	inc hl
	ld a, $3C
	call _LABEL_504_
	ld hl, $0000
	ld de, $0000
	ld e, $56
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, $81
	call _LABEL_504_
	inc hl
	ld a, $42
	call _LABEL_504_
	inc hl
	ld a, $42
	call _LABEL_504_
	inc hl
	ld a, $22
	call _LABEL_504_
	inc hl
	ld a, $24
	call _LABEL_504_
	inc hl
	ld a, $14
	call _LABEL_504_
	inc hl
	ld a, $08
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	ld hl, $0000
	ld de, $0000
	ld e, $57
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, $44
	call _LABEL_504_
	inc hl
	ld a, $44
	call _LABEL_504_
	inc hl
	ld a, $44
	call _LABEL_504_
	inc hl
	ld a, $54
	call _LABEL_504_
	inc hl
	ld a, $54
	call _LABEL_504_
	inc hl
	ld a, $54
	call _LABEL_504_
	inc hl
	ld a, $7C
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	ld hl, $0000
	ld de, $0000
	ld e, $5A
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, $FE
	call _LABEL_504_
	inc hl
	ld a, $02
	call _LABEL_504_
	inc hl
	ld a, $04
	call _LABEL_504_
	inc hl
	ld a, $08
	call _LABEL_504_
	inc hl
	ld a, $FE
	call _LABEL_504_
	inc hl
	ld a, $20
	call _LABEL_504_
	inc hl
	ld a, $40
	call _LABEL_504_
	inc hl
	ld a, $FE
	call _LABEL_504_
	ld hl, $0000
	ld de, $0000
	ld e, $ED
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, $03
	call _LABEL_504_
	inc hl
	ld a, $06
	call _LABEL_504_
	inc hl
	ld a, $0C
	call _LABEL_504_
	inc hl
	ld a, $18
	call _LABEL_504_
	inc hl
	ld a, $B0
	call _LABEL_504_
	inc hl
	ld a, $F0
	call _LABEL_504_
	inc hl
	ld a, $60
	call _LABEL_504_
	inc hl
	ld a, $20
	call _LABEL_504_
	ld hl, $0000
	ld de, $0000
	ld e, $58
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, $C3
	call _LABEL_504_
	inc hl
	ld a, $42
	call _LABEL_504_
	inc hl
	ld a, $24
	call _LABEL_504_
	inc hl
	ld a, $18
	call _LABEL_504_
	inc hl
	ld a, $18
	call _LABEL_504_
	inc hl
	ld a, $2C
	call _LABEL_504_
	inc hl
	ld a, $42
	call _LABEL_504_
	inc hl
	ld a, $83
	call _LABEL_504_
	ld hl, $0000
	ld de, $0000
	ld e, $EE
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, $C3
	call _LABEL_504_
	inc hl
	ld a, $42
	call _LABEL_504_
	inc hl
	ld a, $24
	call _LABEL_504_
	inc hl
	ld a, $18
	call _LABEL_504_
	inc hl
	ld a, $18
	call _LABEL_504_
	inc hl
	ld a, $2C
	call _LABEL_504_
	inc hl
	ld a, $42
	call _LABEL_504_
	inc hl
	ld a, $83
	call _LABEL_504_
	ld hl, $0000
	ld de, $0000
	ld e, $EA
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	inc hl
	ld a, $00
	call _LABEL_504_
	ld hl, $1AFF
	ld a, $EA
	call _LABEL_504_
	ld hl, $1AE6
	call _LABEL_504_
	ld hl, $1AEB
	call _LABEL_504_
	ld hl, $1AF1
	call _LABEL_504_
	ld hl, $1AF7
	call _LABEL_504_
	ld a, $00
	ld h, $08
	ld l, $18
	call $00C6
	call _LABEL_135A_
	call _LABEL_5F7_
	ld a, $00
	ld hl, _RAM_E2B6_
	ld a, $00
	ld (hl), a
	call _LABEL_41F_
	and $1F
	ld hl, _RAM_E2D1_
	ld (hl), a
	call _LABEL_102_
	ld hl, $2000
	ld a, $59
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld de, $0000
	ld e, a
	add hl, de
	ld a, $01
	rl a
	rl a
	rl a
	rl a
	ld e, $07
	add a, e
	call _LABEL_504_
	ld hl, _RAM_E2B7_
	ld a, (hl)
	cp $01
	call z, _LABEL_15F3_
	call _LABEL_66B_
	jp _LABEL_2E3C_

_LABEL_23FC_:
	ld hl, _RAM_E2AF_
	ld a, (hl)
	cp $01
	jp z, _LABEL_2415_
	ld hl, $1B40
	ld a, $F7
	call _LABEL_504_
	ld hl, $1B41
	ld a, $F7
	call _LABEL_504_
_LABEL_2415_:
	ld hl, _RAM_E2AC_
	ld a, (hl)
	cp $03
	call z, _LABEL_1321_
	ld hl, _RAM_E2AF_
	ld a, (hl)
	cp $01
	call z, _LABEL_128D_
	ld a, r
	and $02
	cp $00
	call z, _LABEL_DFF_
	ld hl, _RAM_E2B6_
	ld a, (hl)
	cp $00
	call z, _LABEL_18E6_
	call _LABEL_51A_
	ld ixh, $00
_LABEL_243F_:
	ld hl, $1B40
	call _LABEL_500_
	ld d, a
	ld b, $00
	ld c, $00
	ld hl, $1B64
	call _LABEL_500_
	ld b, a
	ld hl, $1B40
	call _LABEL_500_
	sub b
	call _LABEL_13AB_
	ld hl, _RAM_E291_
	ld a, a
	ld (hl), a
	ld b, $00
	ld c, $00
	ld hl, $1B65
	call _LABEL_500_
	add a, ixh
	add a, ixh
	add a, ixh
	add a, ixh
	add a, ixh
	add a, ixh
	add a, ixh
	add a, ixh
	ld b, a
	ld hl, $1B41
	call _LABEL_500_
	sub b
	call _LABEL_13AB_
	ld c, a
	ld hl, _RAM_E291_
	ld a, (hl)
	add a, c
	sub $05
	call c, _LABEL_1389_
	add a, $01
	cp $01
	call z, _LABEL_13B3_
	ld hl, $1B40
	ld a, d
	call _LABEL_504_
	inc ixh
	ld a, ixh
	cp $03
	jp z, _LABEL_24AC_
	cp $03
	jp nz, _LABEL_243F_
_LABEL_24AC_:
	ld de, $1B40
_LABEL_24AF_:
	ld ixh, $00
_LABEL_24B2_:
	call _LABEL_13B0_
	call _LABEL_500_
	ld bc, _RAM_E2CC_
	ld (bc), a
	ld b, $00
	ld c, $00
	ld hl, $1B64
	call _LABEL_500_
	ld b, a
	call _LABEL_13B0_
	call _LABEL_500_
	sub b
	call _LABEL_13AB_
	ld hl, _RAM_E291_
	ld a, a
	ld (hl), a
	ld b, $00
	ld c, $00
	ld hl, $1B65
	call _LABEL_500_
	add a, ixh
	add a, ixh
	add a, ixh
	add a, ixh
	add a, ixh
	add a, ixh
	add a, ixh
	add a, ixh
	ld b, a
	inc de
	call _LABEL_13B0_
	call _LABEL_500_
	sub b
	call _LABEL_13AB_
	ld c, a
	ld hl, _RAM_E291_
	ld a, (hl)
	add a, c
	sub $05
	call c, _LABEL_138E_
	dec de
	call _LABEL_13B0_
	ld bc, _RAM_E2CC_
	ld a, (bc)
	call _LABEL_504_
	inc ixh
	ld a, ixh
	cp $03
	jp z, _LABEL_2520_
	cp $03
	jp nz, _LABEL_24B2_
_LABEL_2520_:
	inc de
	inc de
	inc de
	inc de
	ld a, e
	cp $64
	jp z, _LABEL_252D_
	jp _LABEL_24AF_

_LABEL_252D_:
	ld hl, $1B44
	call _LABEL_500_
	sub $03
	cp $0A
	call z, _LABEL_8AB_
	ld hl, $1B44
	call _LABEL_504_
	ld hl, $1B48
	call _LABEL_500_
	sub $01
	cp $0A
	call z, _LABEL_8AB_
	ld hl, $1B48
	call _LABEL_504_
	ld hl, $1B4C
	call _LABEL_500_
	sub $02
	cp $0A
	call z, _LABEL_8AB_
	ld hl, $1B4C
	call _LABEL_504_
	ld hl, $1B50
	call _LABEL_500_
	sub $04
	cp $0A
	call z, _LABEL_8AB_
	ld hl, $1B50
	call _LABEL_504_
	ld hl, $1B54
	call _LABEL_500_
	sub $03
	cp $0A
	call z, _LABEL_8AB_
	ld hl, $1B54
	call _LABEL_504_
	ld hl, $1B58
	call _LABEL_500_
	sub $02
	cp $0A
	call z, _LABEL_8AB_
	ld hl, $1B58
	call _LABEL_504_
	ld hl, $1B5C
	call _LABEL_500_
	sub $01
	cp $0A
	call z, _LABEL_8AB_
	ld hl, $1B5C
	call _LABEL_504_
	ld hl, $1B65
	call _LABEL_500_
	sub $48
	rl a
	and $01
	xor $01
	ld hl, _RAM_E2A0_
	ld a, a
	ld (hl), a
	ld hl, $1B45
	call _LABEL_500_
	cp $0A
	call z, _LABEL_668_
	cp $B4
	call z, _LABEL_8A8_
	ld ixl, a
	ld hl, _RAM_E2A0_
	ld a, (hl)
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F28_
	ld hl, $1B45
	ld a, ixl
	call _LABEL_504_
	ld hl, $1B49
	call _LABEL_500_
	cp $0A
	call z, _LABEL_668_
	cp $B4
	call z, _LABEL_8A8_
	ld ixl, a
	ld hl, _RAM_E2A0_
	ld a, (hl)
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F28_
	ld hl, $1B49
	ld a, ixl
	call _LABEL_504_
	ld hl, $1B4D
	call _LABEL_500_
	cp $0A
	call z, _LABEL_668_
	cp $B4
	call z, _LABEL_8A8_
	ld ixl, a
	ld hl, _RAM_E2A0_
	ld a, (hl)
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F28_
	ld hl, $1B4D
	ld a, ixl
	call _LABEL_504_
	ld hl, $1B51
	call _LABEL_500_
	cp $0A
	call z, _LABEL_668_
	cp $B4
	call z, _LABEL_8A8_
	ld ixl, a
	ld hl, _RAM_E2A0_
	ld a, (hl)
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F28_
	ld hl, $1B51
	ld a, ixl
	call _LABEL_504_
	ld hl, $1B55
	call _LABEL_500_
	cp $0A
	call z, _LABEL_668_
	cp $B4
	call z, _LABEL_8A8_
	ld ixl, a
	ld hl, _RAM_E2A0_
	ld a, (hl)
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F28_
	ld hl, $1B55
	ld a, ixl
	call _LABEL_504_
	ld hl, $1B59
	call _LABEL_500_
	cp $0A
	call z, _LABEL_668_
	cp $B4
	call z, _LABEL_8A8_
	ld ixl, a
	ld hl, _RAM_E2A0_
	ld a, (hl)
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F28_
	ld hl, $1B59
	ld a, ixl
	call _LABEL_504_
	ld hl, $1B5D
	call _LABEL_500_
	cp $0A
	call z, _LABEL_668_
	cp $B4
	call z, _LABEL_8A8_
	ld ixl, a
	ld hl, _RAM_E2A0_
	ld a, (hl)
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F28_
	cp $00
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F2E_
	cp $01
	call z, _LABEL_F28_
	ld hl, $1B5D
	ld a, ixl
	call _LABEL_504_
	ld hl, $1B60
	call _LABEL_500_
	sub $50
	jp nc, _LABEL_28C4_
	ld hl, $1B61
	call _LABEL_500_
	dec a
	cp $0A
	call z, _LABEL_854_
	cp $09
	call z, _LABEL_854_
	cp $08
	call z, _LABEL_854_
	cp $07
	call z, _LABEL_854_
	cp $05
	call z, _LABEL_854_
	ld hl, _RAM_E2D3_
	ld a, (hl)
	cp $10
	jp z, _LABEL_2872_
	jp _LABEL_2879_

_LABEL_2872_:
	ld e, $00
	ld hl, _RAM_E2D3_
	ld a, e
	ld (hl), a
_LABEL_2879_:
	ld hl, _RAM_E2D3_
	ld a, (hl)
	sub $08
	jp c, _LABEL_288B_
	ld hl, _RAM_E2D3_
	ld a, (hl)
	sub $08
	jp nc, _LABEL_2898_
_LABEL_288B_:
	ld hl, $1B60
	call _LABEL_500_
	inc a
	call _LABEL_504_
	jp _LABEL_28A5_

_LABEL_2898_:
	ld hl, $1B60
	call _LABEL_500_
	dec a
	call _LABEL_504_
	jp _LABEL_28A5_

_LABEL_28A5_:
	ld hl, _RAM_E2D3_
	ld a, (hl)
	inc a
	ld e, a
	ld hl, _RAM_E2D3_
	ld a, e
	ld (hl), a
	ld hl, _RAM_E2D2_
	ld a, (hl)
	ld b, a
_LABEL_28B5_:
	ld hl, $1B61
	call _LABEL_500_
	dec a
	call _LABEL_504_
	djnz _LABEL_28B5_
	jp _LABEL_28D7_

_LABEL_28C4_:
	ld hl, $1B60
	call _LABEL_500_
	sub $01
	cp $0A
	call z, _LABEL_8AB_
	ld hl, $1B60
	call _LABEL_504_
_LABEL_28D7_:
	ld hl, $1B64
	call _LABEL_500_
	ld ixl, a
	ld hl, $1B65
	call _LABEL_500_
	ld ixh, a
	ld hl, $1B49
	call _LABEL_500_
	sub a, ixl
	rl a
	xor $01
	and $01
	ld e, a
	ld hl, $1B49
	call _LABEL_500_
	sub e
	call _LABEL_504_
	ld hl, $1B49
	call _LABEL_500_
	sub a, ixh
	rl a
	and $01
	ld e, a
	ld hl, $1B49
	call _LABEL_500_
	add a, e
	add a, e
	call _LABEL_504_
	ld hl, $1B64
	call _LABEL_500_
	ld ixl, a
	ld hl, $1B65
	call _LABEL_500_
	ld ixh, a
	ld hl, $1B59
	call _LABEL_500_
	sub a, ixl
	rl a
	xor $01
	xor $01
	and $01
	ld e, a
	ld hl, $1B59
	call _LABEL_500_
	add a, e
	call _LABEL_504_
	ld hl, $1B59
	call _LABEL_500_
	sub a, ixh
	rl a
	and $01
	xor $01
	ld e, a
	ld hl, $1B59
	call _LABEL_500_
	sub e
	sub e
	call _LABEL_504_
	ld h, $13
	ld l, $18
	call $00C6
	ld bc, _RAM_E2B2_
	ld a, (bc)
	ld h, a
	inc bc
	ld a, (bc)
	ld l, a
	inc hl
	ld bc, _RAM_E2B2_
	ld a, h
	ld (bc), a
	inc bc
	ld a, l
	ld (bc), a
	ld bc, _RAM_E2B2_
	ld a, (bc)
	ld h, a
	inc bc
	ld a, (bc)
	ld l, a
	call _LABEL_431_
	ld bc, _RAM_E2B4_
	ld a, (bc)
	ld h, a
	inc bc
	ld a, (bc)
	ld l, a
	ld d, h
	ld e, l
	ld bc, _RAM_E2B2_
	ld a, (bc)
	ld h, a
	inc bc
	ld a, (bc)
	ld l, a
	ld a, $00
	sub $00
	sbc hl, de
	jp nc, _LABEL_299E_
	jp _LABEL_29BE_

_LABEL_299E_:
	ld h, $0D
	ld l, $18
	call $00C6
	ld hl, $5690
	call _LABEL_1633_
	ld h, $18
	ld l, $18
	call $00C6
	ld hl, $568C
	call _LABEL_1633_
	ld hl, _RAM_E2B8_
	ld a, $01
	ld (hl), a
_LABEL_29BE_:
	ld h, $1B
	ld l, $18
	call $00C6
	ld bc, _RAM_E2B4_
	ld a, (bc)
	ld h, a
	inc bc
	ld a, (bc)
	ld l, a
	call _LABEL_431_
	ld hl, _RAM_E2A0_
	ld a, (hl)
	ld d, a
	ld a, d
	cp $01
	jp z, _LABEL_2A6D_
	ld ixh, $00
_LABEL_29DE_:
	ld hl, $3810
	ld de, $0000
	ld e, ixh
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, $CE
	call _LABEL_504_
	inc hl
	ld a, $F1
	call _LABEL_504_
	inc hl
	ld a, $39
	call _LABEL_504_
	inc hl
	ld a, $25
	call _LABEL_504_
	inc hl
	ld a, $F2
	call _LABEL_504_
	inc hl
	ld a, $11
	call _LABEL_504_
	inc hl
	ld a, $29
	call _LABEL_504_
	inc hl
	ld a, $4F
	call _LABEL_504_
	inc ixh
	ld a, ixh
	cp $07
	jp z, _LABEL_2A2B_
	cp $07
	jp nz, _LABEL_29DE_
_LABEL_2A2B_:
	ld hl, $3810
	ld de, $0000
	ld e, ixh
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, $76
	call _LABEL_504_
	inc hl
	ld a, $8D
	call _LABEL_504_
	inc hl
	ld a, $59
	call _LABEL_504_
	inc hl
	ld a, $61
	call _LABEL_504_
	inc hl
	ld a, $C2
	call _LABEL_504_
	inc hl
	ld a, $FC
	call _LABEL_504_
	inc hl
	ld a, $54
	call _LABEL_504_
	inc hl
	ld a, $92
	call _LABEL_504_
	jp _LABEL_2AFC_

_LABEL_2A6D_:
	ld ixh, $00
_LABEL_2A70_:
	ld hl, $3810
	ld de, $0000
	ld e, ixh
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, $73
	call _LABEL_504_
	inc hl
	ld a, $8F
	call _LABEL_504_
	inc hl
	ld a, $9C
	call _LABEL_504_
	inc hl
	ld a, $A4
	call _LABEL_504_
	inc hl
	ld a, $4F
	call _LABEL_504_
	inc hl
	ld a, $88
	call _LABEL_504_
	inc hl
	ld a, $94
	call _LABEL_504_
	inc hl
	ld a, $F2
	call _LABEL_504_
	inc ixh
	ld a, ixh
	cp $07
	jp z, _LABEL_2ABD_
	cp $07
	jp nz, _LABEL_2A70_
_LABEL_2ABD_:
	ld hl, $3810
	ld de, $0000
	ld e, ixh
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ld a, $76
	call _LABEL_504_
	inc hl
	ld a, $8D
	call _LABEL_504_
	inc hl
	ld a, $59
	call _LABEL_504_
	inc hl
	ld a, $61
	call _LABEL_504_
	inc hl
	ld a, $C2
	call _LABEL_504_
	inc hl
	ld a, $FC
	call _LABEL_504_
	inc hl
	ld a, $54
	call _LABEL_504_
	inc hl
	ld a, $92
	call _LABEL_504_
_LABEL_2AFC_:
	ret

_LABEL_2AFD_:
	ld a, ixl
	sub $00
	rl a
	rl a
	rl a
	ld e, a
	ld a, ixl
	call $0141
	cp $FE
	jp z, _LABEL_2B3B_
	cp $FD
	jp z, _LABEL_2B40_
	cp $FB
	jp z, _LABEL_2B45_
	cp $F7
	jp z, _LABEL_2B4A_
	cp $EF
	jp z, _LABEL_2B4F_
	cp $DF
	jp z, _LABEL_2B54_
	cp $BF
	jp z, _LABEL_2B59_
	cp $7F
	jp z, _LABEL_2B5E_
	jp _LABEL_2B38_

_LABEL_2B38_:
	jp _LABEL_2B87_

_LABEL_2B3B_:
	ld a, $00
	jp _LABEL_2B63_

_LABEL_2B40_:
	ld a, $01
	jp _LABEL_2B63_

_LABEL_2B45_:
	ld a, $02
	jp _LABEL_2B63_

_LABEL_2B4A_:
	ld a, $03
	jp _LABEL_2B63_

_LABEL_2B4F_:
	ld a, $04
	jp _LABEL_2B63_

_LABEL_2B54_:
	ld a, $05
	jp _LABEL_2B63_

_LABEL_2B59_:
	ld a, $06
	jp _LABEL_2B63_

_LABEL_2B5E_:
	ld a, $07
	jp _LABEL_2B63_

_LABEL_2B63_:
	add a, e
	add a, $2B
	cp $6B
	jp z, _LABEL_2B73_
	cp $3E
	jp z, _LABEL_2B78_
	jp _LABEL_2B7D_

_LABEL_2B73_:
	ld a, $20
	jp _LABEL_2B7D_

_LABEL_2B78_:
	ld a, $2E
	jp _LABEL_2B7D_

_LABEL_2B7D_:
	ld e, a
	ld hl, _RAM_E2D5_
	ld a, e
	ld (hl), a
	ld hl, _RAM_E2D5_
	ld a, (hl)
_LABEL_2B87_:
	ret

_LABEL_2B88_:
	ld ixl, $02
	call _LABEL_2AFD_
	ld ixl, $03
	call _LABEL_2AFD_
	ld ixl, $04
	call _LABEL_2AFD_
	ld ixl, $05
	call _LABEL_2AFD_
	ld ixl, $08
	call _LABEL_2AFD_
	ret

_LABEL_2BA7_:
	ld h, $01
	ld l, $17
	call $00C6
	ld hl, $5671
	call _LABEL_1633_
	ld h, $13
	ld l, $17
	call $00C6
	ld hl, _RAM_E2DC_
	ld a, (hl)
	cp $00
	jp z, _LABEL_2BCD_
	ld hl, $5669
	call _LABEL_1633_
	jp _LABEL_2BD3_

_LABEL_2BCD_:
	ld hl, $566D
	call _LABEL_1633_
_LABEL_2BD3_:
	ld h, $0E
	ld l, $17
	call $00C6
	ld hl, $5664
	call _LABEL_1633_
	ld h, $11
	ld l, $17
	call $00C6
	ld hl, _RAM_E2DD_
	ld a, (hl)
	call _LABEL_1374_
	ret

_LABEL_2BEF_:
	ld a, ixh
	ld e, a
	ld hl, _RAM_E2E1_
	ld a, e
	ld (hl), a
	ld a, c
	and $0F
	ld iyl, a
	ld a, b
	sla a
	sla a
	sla a
	sla a
	and $F0
	add a, iyl
	ld hl, $F230
	ld b, ixh
_LABEL_2C0E_:
	inc hl
	djnz _LABEL_2C0E_
	ld (hl), a
	ld hl, _RAM_E2E1_
	ld a, (hl)
	ld ixh, a
	ld hl, $F230
	ld b, ixh
_LABEL_2C1D_:
	inc hl
	djnz _LABEL_2C1D_
	ld a, (hl)
	and $0F
	ld c, a
	ld a, (hl)
	and $F0
	rrca
	rrca
	rrca
	rrca
	ld b, a
	ld a, $00
	add a, b
	add a, c
	and $03
	ld ixh, a
	ld a, ixh
	cp $00
	jp z, _LABEL_2C50_
	ld a, ixh
	cp $01
	jp z, _LABEL_2C56_
	ld a, ixh
	cp $02
	jp z, _LABEL_2C5C_
	ld a, ixh
	cp $03
	jp z, _LABEL_2C62_
_LABEL_2C50_:
	ld ixl, $08
	jp _LABEL_2C68_

_LABEL_2C56_:
	ld ixl, $11
	jp _LABEL_2C68_

_LABEL_2C5C_:
	ld ixl, $1A
	jp _LABEL_2C68_

_LABEL_2C62_:
	ld ixl, $23
	jp _LABEL_2C68_

_LABEL_2C68_:
	ld d, b
	ld a, d
	add a, $03
	ld d, a
	ld e, c
	ld a, e
	add a, $03
	ld e, a
_LABEL_2C72_:
	ld a, e
	and $F8
	srl a
	or a
	srl a
	or a
	srl a
	or a
	ld h, a
	ld a, e
	and $07
	rl a
	rl a
	rl a
	rl a
	rl a
	ld l, a
	ld a, l
	ld l, d
	add a, l
	ld l, a
	ld a, h
	add a, $18
	ld h, a
	ld a, ixl
	call _LABEL_504_
	dec ixl
	dec d
	ld a, b
	cp d
	jr nz, _LABEL_2C72_
	dec e
	ld d, b
	ld a, d
	add a, $03
	ld d, a
	ld a, c
	cp e
	jr nz, _LABEL_2C72_
	ret

_LABEL_2CAC_:
	call _LABEL_41F_
	and $02
	add a, d
	ld b, a
	call _LABEL_41F_
	and $01
	add a, e
	ld c, a
	ret

_LABEL_2CBB_:
	ld a, c
	sub $09
	jp c, _LABEL_2D25_
	call _LABEL_4BE_
	ld a, b
	add a, c
	and $03
	ld hl, $0000
	cp $00
	jp z, _LABEL_2CE2_
	cp $01
	jp z, _LABEL_2CE8_
	cp $02
	jp z, _LABEL_2CEE_
	cp $03
	ld de, $0032
	jp _LABEL_2CF4_

_LABEL_2CE2_:
	ld de, $007D
	jp _LABEL_2CF4_

_LABEL_2CE8_:
	ld de, $0064
	jp _LABEL_2CF4_

_LABEL_2CEE_:
	ld de, $004B
	jp _LABEL_2CF4_

_LABEL_2CF4_:
	add hl, de
	ld e, l
	ld d, h
	ld bc, _RAM_E2B2_
	ld a, (bc)
	ld h, a
	inc bc
	ld a, (bc)
	ld l, a
	add hl, de
	ld bc, _RAM_E2B2_
	ld a, h
	ld (bc), a
	inc bc
	ld a, l
	ld (bc), a
	ld a, $11
	ld a, c
	and $0F
	ld iyl, a
	ld a, b
	sla a
	sla a
	sla a
	sla a
	and $F0
	add a, iyl
	ld hl, $F230
	ld b, iyh
_LABEL_2D21_:
	inc hl
	djnz _LABEL_2D21_
	ld (hl), a
_LABEL_2D25_:
	ret

_LABEL_2D26_:
	ld iyl, $05
_LABEL_2D29_:
	ld iyh, iyl
	ld hl, $F230
	ld b, iyh
_LABEL_2D30_:
	inc hl
	djnz _LABEL_2D30_
	ld a, (hl)
	and $0F
	ld c, a
	ld a, (hl)
	and $F0
	rrca
	rrca
	rrca
	rrca
	ld b, a
	call _LABEL_4BE_
	dec iyl
	ld a, iyl
	cp $FF
	jp nz, _LABEL_2D29_
	ld d, $01
	ld e, $0A
	call _LABEL_2CAC_
	ld ixh, $00
	call _LABEL_2BEF_
	ld d, $06
	ld e, $0A
	call _LABEL_2CAC_
	ld ixh, $01
	call _LABEL_2BEF_
	ld d, $0B
	ld e, $0A
	call _LABEL_2CAC_
	ld ixh, $02
	call _LABEL_2BEF_
	ld d, $03
	ld e, $0E
	call _LABEL_2CAC_
	ld ixh, $03
	call _LABEL_2BEF_
	ld d, $08
	ld e, $0E
	call _LABEL_2CAC_
	ld ixh, $04
	call _LABEL_2BEF_
	ld d, $0D
	ld e, $0E
	call _LABEL_2CAC_
	ld ixh, $05
	call _LABEL_2BEF_
	ld e, $01
	call _LABEL_18EA_
	call _LABEL_41F_
	and $03
	cp $00
	jp z, _LABEL_2DAD_
	cp $00
	jp nz, _LABEL_2DC5_
_LABEL_2DAD_:
	ld de, $0580
	ld hl, $78D7
	ld bc, $0040
	call _LABEL_30C5_
	ld de, $05C0
	ld hl, $78D7
	ld bc, $0040
	call _LABEL_30C5_
_LABEL_2DC5_:
	ret

_LABEL_2DC6_:
	ld hl, _RAM_E2A9_
	ld a, (hl)
	add a, ixh
	sub b
	call _LABEL_13AB_
	ld ixl, a
	ld a, i
	ld ixh, a
	ld hl, _RAM_E2AA_
	ld a, (hl)
	add a, ixh
	sub c
	call _LABEL_13AB_
	add a, ixl
	sub $03
	call c, _LABEL_2CBB_
	ret

_LABEL_2DE8_:
	ld ixl, $00
	ld iyl, $05
_LABEL_2DEE_:
	ld iyh, iyl
	ld hl, $F230
	ld b, iyh
_LABEL_2DF5_:
	inc hl
	djnz _LABEL_2DF5_
	ld a, (hl)
	and $0F
	ld c, a
	ld a, (hl)
	and $F0
	rrca
	rrca
	rrca
	rrca
	ld b, a
	ld ixh, $00
	ld a, $00
	ld i, a
	call _LABEL_2DC6_
	ld ixh, $00
	ld a, $09
	ld i, a
	call _LABEL_2DC6_
	ld ixh, $04
	ld a, $07
	ld i, a
	call _LABEL_2DC6_
	call c, _LABEL_2CBB_
	ld ixh, $04
	ld a, $00
	ld i, a
	call _LABEL_2DC6_
	dec iyl
	ld a, iyl
	cp $FF
	jp nz, _LABEL_2DEE_
	jp _LABEL_2E3B_

_LABEL_2E3B_:
	ret

_LABEL_2E3C_:
	ld bc, _RAM_E2B2_
	ld a, (bc)
	ld h, a
	inc bc
	ld a, (bc)
	ld l, a
	ld a, h
	cp $FF
	call z, _LABEL_289_
	ld hl, _RAM_E2DD_
	ld a, (hl)
	cp $05
	call z, _LABEL_636_
	ld hl, _RAM_E2DD_
	ld a, (hl)
	cp $05
	jp z, _LABEL_2E5F_
	jp _LABEL_2E67_

_LABEL_2E5F_:
	ld a, $00
	ld e, a
	ld hl, _RAM_E2DD_
	ld a, e
	ld (hl), a
_LABEL_2E67_:
	ld bc, _RAM_E2B2_
	ld a, (bc)
	ld h, a
	inc bc
	ld a, (bc)
	ld l, a
	ld a, h
	sub $0D
	jp nc, _LABEL_2E9D_
	ld a, $00
	call $0141
	bit 2, a
	call z, _LABEL_23B_
	ld a, $00
	call $0141
	bit 3, a
	call z, _LABEL_24B_
	ld a, $00
	call $0141
	bit 4, a
	call z, _LABEL_269_
	ld a, $00
	call $0141
	bit 5, a
	call z, _LABEL_279_
_LABEL_2E9D_:
	ld a, $00
	call $0141
	bit 6, a
	call z, _LABEL_25B_
	ld a, $00
	call $0141
	bit 7, a
	call z, _LABEL_262_
	ld a, r
	sub $04
	jp c, _LABEL_2EBB_
	jp _LABEL_2F6C_

_LABEL_2EBB_:
	ld hl, _RAM_E2D7_
	ld a, (hl)
	inc a
	ld e, a
	ld hl, _RAM_E2D7_
	ld a, e
	ld (hl), a
	ld hl, _RAM_E2D7_
	ld a, (hl)
	and $03
	ld e, a
	ld a, e
	cp $00
	jp z, _LABEL_2EE8_
	ld a, e
	cp $01
	jp z, _LABEL_2F09_
	ld a, e
	cp $02
	jp z, _LABEL_2F2A_
	ld a, e
	cp $03
	jp z, _LABEL_2F4B_
	jp _LABEL_2F6C_

_LABEL_2EE8_:
	ld de, $02E0
	ld hl, $70D7
	ld bc, $01E0
	call _LABEL_30C5_
	ld de, $0000
	ld hl, $7B57
	ld bc, $0120
 
	call _LABEL_1823_
	jp _LABEL_2F6C_

_LABEL_2F09_:
	ld de, $02E0
	ld hl, $72B7
	ld bc, $01E0
	call _LABEL_30C5_
	ld de, $0000
	ld hl, $7C77
	ld bc, $0120
	call _LABEL_30C5_
	ld iyh, $01
	call _LABEL_1823_
	jp _LABEL_2F6C_

_LABEL_2F2A_:
	ld de, $02E0
	ld hl, $7497
	ld bc, $01E0
	call _LABEL_30C5_
	ld de, $0000
	ld hl, $7B57
	ld bc, $0120
	call _LABEL_30C5_
	ld iyh, $02
	call _LABEL_1823_
	jp _LABEL_2F6C_

_LABEL_2F4B_:
	ld de, $02E0
	ld hl, $7677
	ld bc, $01E0
	call _LABEL_30C5_
	ld de, $0000
	ld hl, $7C77
	ld bc, $0120
	call _LABEL_30C5_
	ld iyh, $03
	call _LABEL_1823_
	jp _LABEL_2F6C_

_LABEL_2F6C_:
	ld h, $03
	ld l, $03
	call $00C6
	call _LABEL_2B88_
	ld hl, _RAM_E2D5_
	ld a, (hl)
	ld hl, _RAM_E2D4_
	ld a, (hl)
	ld c, a
	ld b, $00
	ld hl, $1800
	add hl, bc
	call _LABEL_500_
	ld e, a
	ld hl, _RAM_E2D5_
	ld a, (hl)
	cp e
	jp z, _LABEL_2F94_
	jp _LABEL_3004_

_LABEL_2F94_:
	ld hl, _RAM_E2D5_
	ld a, (hl)
	cp $2E
	jp z, _LABEL_2FBB_
	ld hl, _RAM_E2D4_
	ld a, (hl)
	ld c, a
	ld b, $00
	ld hl, $1800
	add hl, bc
	ld a, $ED
	call _LABEL_504_
	ld hl, _RAM_E2D4_
	ld a, (hl)
	inc a
	ld e, a
	ld hl, _RAM_E2D4_
	ld a, e
	ld (hl), a
	jp _LABEL_3004_

_LABEL_2FBB_:
	ld hl, _RAM_E2DD_
	ld a, (hl)
	inc a
	ld e, a
	ld hl, _RAM_E2DD_
	ld a, e
	ld (hl), a
	ld hl, _RAM_E2D4_
	ld a, (hl)
	ld c, a
	ld b, $00
	ld hl, $1800
	add hl, bc
	ld a, $ED
	call _LABEL_504_
	ld hl, _RAM_E2D4_
	ld a, (hl)
	inc a
	ld e, a
	ld hl, _RAM_E2D4_
	ld a, e
	ld (hl), a
	ld hl, _RAM_E2D6_
	ld a, (hl)
	sub $C8
	jp nc, _LABEL_2FF9_
	ld hl, _RAM_E2D6_
	ld a, (hl)
	add a, $32
	ld e, a
	ld hl, _RAM_E2D6_
	ld a, e
	ld (hl), a
	jp _LABEL_3004_

_LABEL_2FF9_:
	ld a, $FA
	ld e, a
	ld hl, _RAM_E2D6_
	ld a, e
	ld (hl), a
	jp _LABEL_3004_

_LABEL_3004_:
	ld hl, _RAM_E2DE_
	ld a, (hl)
	inc a
	ld hl, _RAM_E2DE_
	ld (hl), a
	and $1F
	cp $01
	call z, _LABEL_2BA7_
	ld hl, _RAM_E2DE_
	ld a, (hl)
	and $0F
	cp $01
	call z, _LABEL_2DE8_
	ld h, $17
	ld l, $17
	call $00C6
	ld hl, _RAM_E2DA_
	ld a, (hl)
	cp $01
	jp z, _LABEL_3038_
	ld hl, $5654
	call _LABEL_1633_
	jp _LABEL_303E_

_LABEL_3038_:
	ld hl, $565C
	call _LABEL_1633_
_LABEL_303E_:
	ld h, $0B
	ld l, $17
	call $00C6
	ld hl, _RAM_E2D6_
	ld a, (hl)
	call _LABEL_135A_
	ld h, $08
	ld l, $18
	call $00C6
	ld hl, _RAM_E2AB_
	ld a, (hl)
	call _LABEL_135A_
	ld hl, _RAM_E2B6_
	ld a, (hl)
	ld b, $00
	cp $01
	call z, _LABEL_13E4_
	ld hl, _RAM_E2B6_
	ld a, (hl)
	cp $00
	call z, _LABEL_23FC_
	ld hl, _RAM_E2AB_
	ld a, (hl)
	sub $64
	jp nc, _LABEL_307A_
	jp _LABEL_3095_

_LABEL_307A_:
	call _LABEL_102_
	ld a, $01
	ld hl, _RAM_E2B6_
	ld a, a
	ld (hl), a
	ld a, $00
	ld hl, _RAM_E2B7_
	ld a, $00
	ld (hl), a
	ld hl, _RAM_E2B8_
	ld a, (hl)
	cp $01
	call z, _LABEL_13CB_
_LABEL_3095_:
	ld hl, _RAM_E2B6_
	ld a, (hl)
	cp $01
	call z, _LABEL_18D4_
	ld hl, _RAM_E2B6_
	ld a, (hl)
	cp $01
	call z, _LABEL_30AA_
	jp _LABEL_2E3C_

_LABEL_30AA_:
	ld hl, $1B7C
	ld a, $F0
	call _LABEL_504_
	ld hl, $1B7D
	ld a, $F0
	call _LABEL_504_
	ret

_LABEL_30BB_:
	ld c, $40
	ld a, l
	out (_PORT_99_), a
	ld a, h
	or c
	out (_PORT_99_), a
	ret

_LABEL_30C5_:
	push bc
	ex de, hl
	call _LABEL_30BB_
	ex de, hl
	pop bc
_LABEL_30CC_:
	ld a, (hl)
	out (_PORT_98_), a
	inc hl
	dec bc
	ld a, b
	or c
	jp nz, _LABEL_30CC_
	ret

; Data from 30D7 to 32B6 (480 bytes)
_DATA_30D7_:
	ds 10, $00
	db $1E, $32, $22, $46, $CC, $88
	ds 16, $00
	ds 17, $FF
	db $FE, $FE, $FE, $FE, $FE, $FE, $FE, $6F, $CF, $DF, $DF, $DF, $DF, $DF, $9E, $FF
	db $FF, $FF, $FF, $FF, $FF, $C7, $10, $FF, $FF, $FF, $FF, $FF, $FF, $0F, $E3
	ds 16, $FF
	db $FE, $FE, $FC, $FD, $FD, $F9, $FB, $FB, $B1, $B7, $A7, $AF, $8E, $9C, $9D, $9B
	db $FF, $FF, $FF, $FF, $3F, $9F, $CF, $EF, $F9, $FC, $FE, $FF, $FF, $87, $31, $7D
	db $FF, $FF, $7F, $7F, $3F, $BF, $BF, $BF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $FB, $FB, $F7, $F7, $F7, $F7, $E6, $EE, $13, $53, $54, $56, $57, $57, $53, $D8
	db $F7, $F7, $77, $77, $E7, $EF, $DF, $1F, $7D, $7D, $66, $66, $7D, $7D, $BD, $BB
	db $9F, $DF, $CF, $EF, $EF, $EF, $E7, $F7, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $EE, $EE, $EE, $EF, $E7, $F3, $FC, $FE, $DF, $9F, $3F, $FF, $FF, $FF, $FF, $FF
	db $FF, $FF, $FF, $BF, $C0, $DF, $EF, $F0, $C7, $FF, $FF, $FF, $1F, $9F, $3F, $FF
	db $F7, $F7, $F7, $E7, $CF, $DF, $CF, $F7
	ds 16, $FF
	db $7F, $7F, $7F, $7F, $7B, $79, $9C, $CF, $FF, $FF, $FF, $FF, $FF, $FF, $7F, $03
	db $FF, $FF, $FF, $FF, $FF, $FF, $FE, $FE, $F9, $BC, $9E, $4E, $6E, $6E, $66, $F7
	db $FF, $FF, $FF, $FF, $FF, $FF, $7F, $7F, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $EF, $E7, $F7, $F7, $F7, $EF, $EF, $EF, $FF, $FF, $FF, $FF, $7F, $3E, $C1, $FF
	db $FC, $FD, $F9, $C3, $9B, $7B, $FB, $FB, $F7, $F3, $FB, $FB, $FB, $FB, $FB, $FB
	db $7F, $7F, $7F, $7F, $3F, $BF, $BF, $BF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $EF, $EF, $EF, $CF, $DF, $DF, $9F, $BF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $F7, $F7, $F7, $F7, $F7, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $00, $78, $6F, $6D
	db $3F, $7F, $7F, $7F, $01, $FD, $FD, $2D, $FF, $FF, $FF, $FF, $FE, $FE, $F8, $F6
	db $BD, $BE, $BF, $3F, $7F, $FF, $FF, $7F, $FF, $00, $FF, $FF, $FF, $FF, $FF, $DF
	db $1B, $7B, $F3, $F7, $F7, $E7, $EF, $EF, $6D, $65, $6D, $7F, $00, $7F, $79, $7D
	db $AD, $AD, $BD, $FD, $01, $FD, $FD, $4D, $F7, $F7, $E7, $EF, $EF, $E0, $FE, $FF
	db $80, $FF, $FF, $FF, $FF, $FC, $F9, $07, $3F, $FF, $FC, $E1, $CF, $3F, $FF, $FF
	db $DF, $9F, $7F, $FF, $FF, $FF, $FF, $FF, $6D, $4D, $4D, $5D, $5F, $7F, $00, $FF
	db $5D, $5D, $5D, $5D, $5D, $FD, $01, $FF

; Data from 32B7 to 3496 (480 bytes)
_DATA_32B7_:
	db $00, $00, $00, $00, $00, $00, $01, $01, $00, $00, $3C, $64, $44, $8C, $98, $10
	ds 16, $00
	ds 16, $FF
	db $FE, $FD, $FD, $FD, $FD, $FD, $FD, $FD, $DF, $9F, $BF, $BF, $BF, $BF, $BF, $3F
	db $FF, $FF, $FF, $FF, $FF, $FF, $E3, $08, $FF, $FF, $FF, $FF, $FF, $FF, $87, $71
	ds 16, $FF
	db $FD, $FD, $F9, $F7, $F7, $F7, $F7, $F7, $78, $7B, $73, $77, $47, $5E, $5E, $5D
	db $FF, $FF, $FF, $FF, $1F, $4F, $E7, $F7, $FC, $FE, $FF, $FF, $FF, $C3, $98, $BE
	db $FF, $7F, $3F, $BF, $9F, $DF, $DF, $DF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $F7, $F7, $F7, $F7, $F7, $F7, $E6, $EE, $59, $59, $5B, $5B, $5B, $5B, $59, $DC
	db $FB, $FB, $9B, $9B, $F3, $F7, $EF, $0F, $BE, $BE, $B9, $B9, $BE, $BE, $DE, $DD
	db $CF, $EF, $67, $77, $F7, $F7, $F3, $FB, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $EE, $EE, $EE, $EF, $E7, $F3, $FC, $FE, $DF, $9F, $3F, $FF, $FF, $FF, $FF, $FF
	db $FF, $FF, $FF, $DF, $E0, $EF, $F7, $F8, $E3, $FF, $FF, $F7, $07, $CF, $9F, $7F
	db $FB, $FB, $FB, $F3, $E7, $EF, $E7, $FB
	ds 16, $FF
	db $7F, $7F, $7F, $7F, $7B, $79, $9C, $CF, $FF, $FF, $FF, $FF, $FF, $FF, $7F, $03
	db $FF, $FF, $FF, $FF, $FF, $FF, $FE, $FE, $F9, $BD, $9D, $5D, $5D, $5D, $4C, $EE
	ds 16, $FF
	db $DF, $CF, $EF, $ED, $EE, $DE, $DF, $DF, $FF, $FF, $FF, $FF, $FF, $7C, $83, $FF
	db $FA, $F9, $F3, $87, $37, $F7, $F7, $F7, $EE, $E6, $F6, $F6, $F6, $F7, $F7, $F7
	db $FF, $FF, $FF, $FF, $7F, $7F, $7F, $7F, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $DF, $DF, $DF, $9F, $BF, $BF, $3F, $77, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $EF, $EF, $EF, $EF, $EE, $F6, $F6, $F6, $F6, $F6, $F6, $F6, $00, $F1, $DF, $DA
	db $7F, $FF, $FF, $FF, $03, $FB, $FB, $5B, $FF, $FF, $FF, $FE, $F8, $F7, $C7, $B3
	db $7B, $7C, $7F, $7F, $FF, $FF, $FF, $FF, $FE, $00, $FF, $FF, $FF, $FF, $EF, $9F
	db $36, $F6, $E6, $EE, $EE, $CE, $DE, $DE, $DB, $CB, $DB, $FF, $00, $FF, $F3, $FA
	db $5B, $5B, $7B, $FB, $03, $FB, $FB, $9B, $BC, $BF, $3F, $7F, $7F, $07, $F7, $F8
	db $30, $FF, $FF, $FF, $FF, $F8, $C3, $3F, $7F, $FF, $F8, $C3, $9F, $7F, $FF, $FF
	db $BE, $3E, $FE, $FE, $FE, $FE, $FE, $FF, $DA, $9A, $9A, $BA, $BE, $FF, $00, $FF
	db $BB, $BB, $BB, $BB, $BB, $FB, $03, $FF

; Data from 3497 to 3676 (480 bytes)
_DATA_3497_:
	db $00, $00, $00, $00, $00, $00, $01, $01, $00, $00, $3C, $64, $44, $8C, $98, $10
	ds 16, $00
	ds 16, $FF
	db $FE, $FD, $FD, $FD, $FD, $FD, $FD, $FA, $DF, $9F, $BF, $BF, $BF, $BF, $BF, $7F
	db $FF, $FF, $FF, $FF, $FF, $FE, $F9, $C3, $FF, $FF, $FF, $FF, $FF, $1F, $E1, $FC
	db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $7F, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $FA, $FA, $F2, $EE, $EE, $EE, $EE, $EE, $FE, $FE, $FC, $FD, $F1, $F7, $F7, $F7
	db $3F, $FF, $FF, $FF, $C7, $93, $B9, $65, $FF, $FF, $FF, $FF, $FF, $F0, $E6, $EF
	db $3F, $9F, $CF, $EF, $E7, $F7, $37, $B7, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $EE, $EE, $EE, $EE, $EE, $EE, $CC, $DD, $F6, $F6, $F6, $F6, $F6, $F6, $F6, $F7
	db $66, $7E, $FE, $FE, $FC, $FD, $7B, $03, $EC, $EC, $EF, $EF, $EF, $EF, $F7, $F7
	db $B3, $BB, $99, $DD, $BD, $BD, $B9, $7B, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF
	db $DD, $DD, $EE, $EF, $E7, $F3, $FC, $FE, $F7, $E7, $0F, $FF, $FF, $FF, $FF, $FF
	db $FF, $FF, $FF, $83, $D8, $CF, $F1, $FC, $F8, $FF, $FF, $FD, $01, $F3, $E7, $1F
	db $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
	ds 16, $FF
	db $7F, $7F, $7F, $7F, $7B, $79, $9C, $DF, $FF, $FF, $FF, $FF, $FF, $FF, $7E, $00
	db $FF, $FF, $FF, $FF, $FF, $FF, $7E, $FE, $F9, $FD, $FD, $3B, $3B, $3B, $19, $DD
	ds 16, $FF
	db $DF, $CF, $CF, $8D, $BE, $BE, $BF, $BF, $FF, $FF, $FF, $FF, $FF, $7C, $83, $FF
	db $FE, $FD, $F3, $97, $37, $F7, $F7, $F7, $DD, $CD, $ED, $ED, $EC, $EE, $EE, $EE
	ds 14, $FF
	db $FE, $FC, $BF, $3F, $7F, $7F, $7F, $BF, $3F, $77, $FF, $FF, $FF, $FF, $FF, $FF
	db $FF, $FF, $EF, $EF, $EF, $EF, $E8, $E9, $E1, $F1, $EC, $ED, $ED, $ED, $00, $E3
	db $BF, $B6, $FF, $FF, $FF, $FF, $0F, $EF, $EF, $EF, $F1, $EF, $8F, $67, $78, $7D
	db $7C, $7F, $FB, $FC, $FF, $FF, $FF, $FF, $FF, $3F, $FE, $00, $FF, $FF, $FF, $FF
	db $EF, $9F, $35, $F5, $E5, $ED, $EC, $CC, $DE, $DE, $BA, $DB, $DD, $FF, $00, $FF
	db $F7, $D7, $F7, $77, $F7, $F7, $17, $F7, $FB, $7B, $7F, $8F, $EF, $F0, $FC, $FE
	db $FF, $FF, $80, $FF, $FF, $FF, $FF, $78, $83, $FF, $7F, $FF, $F8, $C3, $9F, $7F
	db $FF, $FF, $BE, $3E, $FE, $FE, $FF, $FF, $FF, $FF, $DB, $DB, $EB, $6D, $6D, $7F
	db $00, $FF, $7B, $BB, $BB, $DB, $DD, $FD, $01, $FF

; Data from 3677 to 3856 (480 bytes)
_DATA_3677_:
	db $00, $00, $00, $00, $00, $00, $01, $01, $00, $00, $3C, $64, $44, $8C, $98, $10
	ds 16, $00
	ds 17, $FF
	db $FE, $FC, $FD, $FD, $FD, $FD, $F9, $5F, $DF, $DF, $DF, $DE, $DE, $DC, $3D, $FF
	db $FE, $F9, $C3, $3F, $FF, $C7, $93, $FF, $1F, $E1, $FC, $FF, $FF, $FF, $F0, $FF
	db $FF, $FF, $7F, $3F, $9F, $CF, $EF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FB
	db $FB, $FB, $E7, $EF, $EF, $EF, $EF, $71, $77, $77, $77, $76, $76, $76, $76, $B9
	db $7D, $7E, $7E, $FE, $FE, $FE, $E6, $E6, $EF, $EF, $CF, $DF, $DF, $DF, $DF, $27
	db $B7, $B7, $B7, $B3, $BB, $99, $DD, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $EF
	db $EF, $EF, $EF, $EF, $EF, $CE, $DD, $76, $76, $76, $77, $77, $77, $77, $E7, $E4
	db $FD, $7B, $03, $FF, $FF, $FF, $83, $EC, $EC, $F7, $F7, $F8, $FF, $FF, $FD, $BD
	db $BD, $B9, $7B, $FB, $FB, $E7, $EF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $DD
	db $DD, $EE, $EF, $E7, $F3, $FC, $FE, $EF, $EF, $0F, $FF, $FF, $FF, $FF, $FF, $D8
	db $CF, $F1, $FC, $FF, $FF, $FF, $FF, $01, $F3, $E7, $1F, $FF, $FF, $FF, $FF, $EF
	db $EF, $EF, $EF, $E7, $F7, $F7, $F7
	ds 16, $FF
	db $7F, $7F, $79, $7C, $7F, $7F, $9F, $DF, $FF, $FF, $FF, $7E, $00, $FF, $FF, $FF
	db $FF, $FF, $FF, $7F, $FF, $FF, $FE, $FE, $F7, $F7, $F7, $3B, $3B, $3B, $19, $DD
	ds 16, $FF
	db $DD, $CE, $CE, $8F, $BF, $BF, $BF, $DF, $FF, $FF, $7C, $83, $FF, $FF, $FF, $FF
	db $9E, $3D, $F3, $F7, $F7, $F7, $F7, $F7, $DD, $CD, $EC, $EC, $EE, $EE, $EC, $ED
	ds 12, $FF
	db $F0, $EF, $8F, $6F, $DF, $CF, $CF, $DF, $17, $FB, $FC, $FF, $FF, $FF, $FF, $FF
	db $FF, $FE, $00, $FF, $EF, $EF, $EC, $ED, $ED, $2D, $E5, $F6, $ED, $ED, $00, $E3
	db $FF, $FB, $FD, $ED, $FF, $FF, $07, $F7, $F7, $77, $77, $BB, $7F, $7F, $7F, $7F
	db $7F, $8F, $EF, $F0, $FF, $FF, $7F, $BF, $DF, $E7, $F0, $7F, $FF, $FF, $FF, $F3
	db $E7, $1F, $7F, $FF, $F6, $F6, $E6, $EE, $EE, $CE, $DE, $DE, $EE, $FF, $C0, $FF
	db $FB, $EB, $ED, $ED, $FB, $FB, $1B, $FB, $FB, $BB, $BB, $DB, $FC, $FE, $FF, $FF
	db $FF, $FF, $FF, $FF, $FF, $FF, $7F, $1F, $CF, $E6, $F0, $FF, $FF, $FF, $FC, $FB
	db $E3, $1F, $FF, $FF, $BF, $3F, $FF, $FF, $FF, $FF, $FF, $FF, $75, $76, $76, $7F
	db $00, $FF, $FF, $FF, $DD, $ED, $ED, $FD, $01, $FF, $FF, $FF

; Data from 3857 to 3896 (64 bytes)
_DATA_3857_:
	db $FE, $C7, $3E, $C3, $FF, $EC, $FB, $1F, $3F, $FF, $E0, $FF, $86, $73, $FD, $E3
	db $3E, $F3, $7D, $F8, $0F, $FE, $FC, $8F, $FF, $C7, $F9, $1F, $FE, $07, $FF, $FC
	db $F8, $C7, $DF, $FC, $FF, $81, $FF, $03, $3F, $FE, $EC, $07, $F8, $F3, $FB, $C7
	db $FF, $30, $FF, $E7, $7F, $F8, $FF, $01, $CF, $30, $FF, $FF, $01, $FF, $E6, $CF

; Data from 3897 to 38D6 (64 bytes)
_DATA_3897_:
	db $FF, $EC, $FB, $1F, $FE, $C7, $3E, $C3, $86, $73, $FD, $E3, $3F, $FF, $E0, $FF
	db $0F, $FE, $FC, $8F, $3E, $F3, $7D, $F8, $FE, $07, $FF, $FC, $FF, $C7, $F9, $1F
	db $FF, $81, $FF, $03, $F8, $C7, $DF, $FC, $F8, $F3, $FB, $C7, $3F, $FE, $EC, $07
	db $7F, $F8, $FF, $01, $FF, $30, $FF, $E7, $01, $FF, $E6, $CF, $CF, $30, $FF, $FF

; Data from 38D7 to 3916 (64 bytes)
_DATA_38D7_:
	db $FC, $FB, $83, $EF, $DF, $DE, $DC, $BC, $3F, $E7, $EF, $F7, $F7, $39, $1B, $05
	db $B0, $B8, $78, $70, $70, $70, $70, $F0, $0D, $0D, $0D, $06, $06, $06, $06, $06
	db $70, $70, $60, $60, $70, $78, $B8, $B8, $06, $06, $06, $02, $02, $05, $05, $0D
	db $BC, $DC, $DE, $FF, $8F, $F7, $FB, $FC, $1D, $1B, $3B, $F7, $F7, $E7, $C3, $3F

; Data from 3917 to 3956 (64 bytes)
_DATA_3917_:
	db $FE, $E2, $81, $19, $25, $E0, $F0, $FE, $5F, $27, $03, $01, $20, $23, $03, $8F
	db $FE, $FD, $D8, $88, $22, $00, $93, $DF, $7F, $9F, $0F, $03, $00, $91, $93, $4F
	db $FB, $F1, $D0, $00, $83, $A0, $E8, $FC, $FF, $FF, $5F, $CF, $87, $0F, $3F, $FF
	db $F9, $C8, $90, $0C, $90, $E8, $E4, $FF, $7F, $AF, $45, $04, $18, $61, $07, $3F

; Data from 3957 to 3A56 (256 bytes)
_DATA_3957_:
	db $FF, $C3, $8B, $13, $2B, $53, $2B, $53
	ds 16, $FF
	db $9F, $4F, $6F, $6F, $6F, $AF, $AF, $AE, $FF, $1F, $8F, $87, $E7, $F3, $13, $53
	db $FF, $E1, $E3, $E7, $E6, $E6, $E4, $E4, $F2, $F5, $F3, $F7, $73, $32, $3B, $39
	db $A9, $54, $FE, $76, $FE, $FA, $06, $FC, $2B, $57, $27, $57, $27, $54, $22, $57
	db $FF, $FF, $FF, $FF, $FC, $F9, $7B, $37, $FF, $FF, $F9, $F0, $76, $66, $6F, $6E
	db $AC, $AD, $AD, $AD, $B3, $97, $5E, $5C, $D3, $D3, $B3, $B3, $39, $79, $7D, $FC
	db $E4, $E4, $E5, $25, $25, $24, $2C, $0C, $3C, $1F, $98, $90, $93, $93, $92, $12
	db $01, $FF, $8F, $8F, $87, $83, $03, $03, $27, $57, $21, $54, $26, $56, $26, $56
	db $B7, $97, $D5, $D4, $D4, $D4, $D7, $D3, $6A, $6A, $AA, $AA, $AE, $AE, $AD, $A1
	db $DC, $DE, $DF, $D0, $D6, $96, $A7, $8F, $FC, $3E, $9E, $DE, $DF, $5F, $3F, $FF
	db $0C, $1C, $1C, $1C, $FE, $FF, $FF, $F0, $12, $12, $32, $32, $72, $F2, $FE, $07
	db $29, $29, $29, $29, $29, $79, $79, $F9, $26, $52, $28, $94, $AA, $95, $8A, $C0
	db $D9, $DC, $DF, $5C, $82, $55, $AA, $00, $A7, $3F, $F0, $05, $AA, $55, $AA, $00
	db $FC, $81, $2A, $55, $AA, $55, $AA, $00, $1F, $40, $AA, $55, $AA, $55, $AA, $00
	db $CA, $15, $AA, $55, $AA, $50, $87, $3F, $A8, $54, $AA, $55, $82, $79, $FA, $F9
	db $F9, $19, $AF, $57, $AB, $55, $AB, $55

; Data from 3A57 to 3A96 (64 bytes)
_DATA_3A57_:
	db $7F, $7F, $FE, $FE, $F8, $F8, $F0, $C0, $01, $62, $64, $08, $13, $23, $40, $80
	db $F0, $F0, $F8, $F8, $20, $20, $A0, $E0, $78, $78, $FC, $FC, $10, $10, $50, $70
	db $80, $E0, $F8, $F8, $FC, $FE, $7F, $7F, $3C, $3C, $7E, $7E, $08, $08, $28, $38
	db $7F, $55, $D5, $55, $D5, $55, $D5, $55, $1E, $1E, $3F, $3F, $04, $04, $14, $1C

; Data from 3A97 to 3B56 (192 bytes)
_DATA_3A97_:
	db $7C, $44, $44, $7C, $44, $44, $44, $00, $78, $48, $48, $7C, $44, $44, $7C, $00
	db $00, $7C, $40, $40, $40, $40, $40, $7C, $70, $48, $44, $44, $44, $44, $78, $00
	db $7C, $40, $40, $78, $40, $40, $7C, $00, $7C, $40, $40, $78, $40, $40, $40, $00
	db $3C, $20, $40, $5C, $44, $44, $3C, $00, $44, $44, $44, $7C, $44, $44, $44, $00
	db $7C, $10, $10, $10, $10, $10, $7C, $00, $7C, $10, $10, $10, $10, $10, $70, $00
	db $00, $00, $0C, $0C, $18, $30, $60, $00, $40, $40, $40, $40, $40, $40, $7C, $00
	db $00, $7C, $54, $54, $54, $44, $44, $44, $44, $64, $64, $54, $5C, $4C, $44, $00
	db $38, $44, $44, $44, $44, $44, $38, $00, $78, $44, $44, $44, $78, $40, $40, $00
	db $44, $44, $44, $7C, $10, $10, $10, $10, $7C, $44, $44, $7C, $78, $4C, $44, $44
	db $7C, $40, $40, $40, $7C, $04, $04, $7C, $7C, $10, $10, $10, $10, $10, $10, $10
	db $44, $44, $44, $44, $44, $44, $7C, $00, $44, $44, $44, $44, $54, $54, $54, $7C
	db $44, $44, $44, $44, $54, $54, $54, $38, $42, $66, $3C, $18, $18, $3C, $66, $42

; Data from 3B57 to 3C76 (288 bytes)
_DATA_3B57_:
	db $1E, $33, $E0, $A0, $A0, $AE, $A3, $A0, $00, $81, $C3, $76, $08, $09, $8B, $C8
	db $78, $CC, $07, $05, $E5, $85, $05, $65, $A0, $A8, $A7, $A1, $A0, $AC, $A7, $A1
	db $09, $0B, $0A, $C8, $49, $0B, $0A, $88, $C5, $05, $25, $E5, $85, $05, $05, $E5
	db $A0, $A0, $A0, $BF, $80, $FF, $01, $00, $89, $0B, $08, $08, $89, $C9, $FF, $3C
	db $85, $05, $05, $FD, $01, $FF, $80, $00, $0F, $0C, $07, $00, $1F, $31, $40, $40
	db $F0, $30, $98, $48, $6B, $AE, $68, $EE, $00, $00, $00, $C0, $78, $0E, $02, $02
	db $C0, $C0, $C0, $40, $40, $40, $20, $20, $38, $00, $66, $66, $66, $42, $00, $00
	db $02, $03, $01, $01, $01, $02, $02, $02, $20, $10, $10, $18, $08, $08, $0E, $03
	db $C1, $67, $3E, $00, $00, $3C, $66, $C3, $86, $04, $08, $08, $08, $18, $30, $E0
	db $01, $00, $00, $00, $00, $00, $03, $1C, $F0, $9E, $43, $21, $61, $C1, $80, $00
	db $00, $00, $00, $00, $00, $80, $E0, $30, $18, $18, $10, $30, $20, $20, $3F, $FF
	db $11, $33, $33, $00, $21, $1E, $00, $FF, $18, $0C, $04, $04, $04, $04, $1C, $FF
	db $FF, $60, $24, $34, $16, $12, $18, $0F, $FF, $00, $82, $C6, $44, $44, $00, $FF
	db $FF, $03, $22, $62, $44, $4C, $18, $F0, $80, $E0, $90, $48, $46, $41, $20, $20
	db $00, $00, $00, $03, $0C, $30, $C0, $01, $1C, $38, $D0, $20, $20, $40, $80, $00
	db $23, $13, $12, $10, $0B, $09, $04, $08, $31, $31, $12, $02, $1A, $F1, $01, $01
	db $00, $00, $00, $00, $00, $00, $00, $00, $10, $10, $20, $23, $4C, $70, $C0, $00
	db $01, $20, $F0, $0C, $03, $00, $00, $00, $00, $80, $40, $60, $10, $C8, $24, $1E

; Data from 3C77 to 3D96 (288 bytes)
_DATA_3C77_:
	db $0F, $19, $F0, $90, $90, $97, $91, $90, $00, $C1, $42, $36, $09, $09, $CA, $48
	db $F0, $98, $0F, $09, $C9, $09, $09, $C9, $90, $94, $93, $90, $90, $96, $93, $90
	db $09, $0A, $8A, $C9, $09, $0A, $8A, $C9, $89, $09, $49, $C9, $09, $09, $09, $C9
	db $90, $90, $90, $9F, $80, $FF, $01, $00, $49, $0A, $08, $89, $48, $C9, $FF, $3C
	db $09, $09, $09, $F9, $01, $FF, $80, $00, $0F, $0F, $04, $04, $1F, $31, $40, $40
	db $F0, $F0, $18, $48, $EB, $AE, $68, $EE, $00, $00, $00, $C0, $78, $0E, $02, $02
	db $C0, $C0, $C0, $40, $40, $40, $20, $22, $00, $00, $66, $66, $42, $00, $00, $00
	db $02, $03, $01, $01, $01, $02, $02, $22, $21, $10, $10, $18, $08, $08, $0E, $03
	db $C1, $67, $3E, $00, $00, $3C, $66, $C3, $C6, $04, $08, $08, $08, $18, $30, $E0
	db $00, $00, $00, $00, $00, $00, $03, $1C, $03, $1E, $30, $21, $21, $60, $C0, $00
	db $C0, $40, $80, $00, $80, $C0, $60, $30, $18, $18, $10, $30, $20, $20, $3F, $FF
	db $44, $66, $66, $00, $42, $3C, $00, $FF, $18, $0C, $04, $04, $04, $04, $1C, $FF
	db $FF, $60, $24, $34, $16, $12, $18, $0F, $FF, $00, $82, $C6, $44, $44, $00, $FF
	db $FF, $03, $22, $62, $44, $4C, $18, $F0, $80, $C0, $A0, $98, $86, $41, $20, $20
	db $00, $00, $01, $03, $0C, $30, $C0, $01, $1C, $68, $90, $60, $40, $40, $80, $00
	db $23, $13, $12, $10, $0B, $09, $04, $08, $31, $01, $02, $0A, $1A, $F1, $01, $01
	db $00, $00, $00, $00, $00, $00, $00, $00, $10, $20, $20, $43, $44, $88, $B0, $C0
	db $01, $20, $F0, $0C, $03, $00, $00, $00, $00, $80, $40, $20, $10, $88, $64, $1E

; Data from 3D97 to 3DAF (25 bytes)
_DATA_3D97_:
	ds 24, $20
	db $FF

; Data from 3DB0 to 3E5D (174 bytes)
_DATA_3DB0_:
	db $54, $48, $45, $FF, $54, $48, $45, $FF, $54, $48, $45, $FF, $49, $4E, $FF, $4F
	db $46, $FF, $4D, $41, $4E, $59, $FF, $47, $4F, $54, $FF, $54, $48, $45, $FF, $56
	db $41, $52, $49, $4F, $55, $53, $FF, $47, $52, $45, $41, $54, $FF, $54, $48, $45
	db $4D, $FF, $54, $48, $4F, $53, $45, $FF, $41, $53, $53, $4F, $52, $54, $45, $44
	db $FF, $44, $49, $46, $46, $45, $52, $45, $4E, $54, $FF, $50, $4F, $4C, $41, $52
	db $FF, $44, $49, $53, $54, $49, $4E, $43, $54, $FF, $4D, $53, $58, $FF, $44, $49
	db $FF, $4C, $44, $49, $FF, $45, $49, $FF, $4C, $44, $49, $52, $FF, $49, $4E, $44
	db $FF, $44, $41, $41, $FF, $45, $52, $52, $FF, $44, $45, $4C, $45, $54, $45, $FF
	db $52, $45, $53, $55, $4D, $45, $FF, $53, $50, $52, $49, $54, $45, $FF, $47, $4F
	db $53, $55, $42, $FF, $44, $45, $46, $53, $4E, $47, $FF, $44, $45, $46, $53, $54
	db $52, $FF, $45, $52, $41, $53, $45, $FF, $43, $4C, $45, $41, $52, $FF

; Data from 3E5E to 3F23 (198 bytes)
_DATA_3E5E_:
	db $4E, $49, $43, $45, $FF, $47, $52, $45, $41, $54, $FF, $48, $41, $50, $50, $59
	db $FF, $4D, $45, $52, $52, $59, $FF, $47, $4F, $4F, $44, $FF, $54, $4F, $50, $FF
	db $53, $57, $45, $45, $54, $FF, $4A, $4F, $4C, $4C, $59, $FF, $43, $4F, $4C, $4F
	db $52, $46, $55, $4C, $FF, $50, $4C, $45, $41, $53, $49, $4E, $47, $FF, $43, $48
	db $41, $52, $4D, $49, $4E, $47, $FF, $4A, $4F, $59, $46, $55, $4C, $FF, $53, $4D
	db $49, $4C, $49, $4E, $47, $FF, $49, $4E, $53, $50, $49, $52, $49, $4E, $47, $FF
	db $43, $48, $45, $45, $52, $46, $55, $4C, $FF, $4A, $4F, $59, $4F, $55, $53, $FF
	db $4E, $4F, $50, $FF, $55, $53, $52, $FF, $43, $43, $46, $FF, $52, $45, $54, $FF
	db $49, $4E, $49, $FF, $48, $41, $4C, $54, $FF, $45, $58, $58, $FF, $4F, $55, $54
	db $49, $FF, $53, $43, $52, $45, $45, $4E, $FF, $44, $45, $46, $49, $4E, $54, $FF
	db $52, $45, $4E, $55, $4D, $FF, $52, $45, $54, $55, $52, $4E, $FF, $42, $4C, $4F
	db $41, $44, $FF, $43, $4C, $4F, $41, $44, $FF, $50, $52, $45, $53, $45, $54, $FF
	db $50, $41, $49, $4E, $54, $FF

; Data from 3F24 to 3FEC (201 bytes)
_DATA_3F24_:
	db $54, $55, $4E, $45, $53, $FF, $53, $4F, $4E, $47, $53, $FF, $50, $4F, $45, $4D
	db $53, $FF, $57, $4F, $52, $44, $53, $FF, $50, $4C, $41, $43, $45, $53, $FF, $54
	db $49, $4D, $45, $53, $FF, $56, $45, $52, $53, $45, $FF, $59, $45, $41, $52, $53
	db $FF, $43, $4C, $4F, $55, $44, $53, $FF, $53, $54, $4F, $52, $49, $45, $53, $FF
	db $50, $45, $4E, $47, $55, $49, $4E, $53, $FF, $57, $4F, $4F, $44, $4C, $41, $4E
	db $44, $53, $FF, $53, $41, $56, $41, $4E, $4E, $41, $48, $53, $FF, $47, $41, $52
	db $44, $45, $4E, $53, $FF, $53, $49, $4E, $47, $49, $4E, $47, $FF, $4D, $45, $4D
	db $4F, $52, $49, $45, $53, $FF, $43, $50, $4C, $FF, $4C, $44, $44, $FF, $58, $4F
	db $52, $FF, $4F, $52, $FF, $4F, $54, $44, $52, $FF, $49, $4E, $54, $FF, $52, $4C
	db $43, $41, $FF, $52, $4C, $41, $FF, $43, $49, $52, $43, $4C, $45, $FF, $43, $4C
	db $4F, $53, $45, $FF, $50, $4F, $49, $4E, $54, $FF, $50, $4C, $41, $59, $FF, $53
 

; Data from 3FED to 3FF0 (4 bytes)
_DATA_3FED_:
	db $20, $FF, $2E, $FF

; 1st entry of Jump Table from 4 (indexed by relative addressing)
_LABEL_3FF1_:
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
