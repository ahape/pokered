; try to initiate a wild pokemon encounter
; returns success in Z
TryDoWildEncounter:
	ld a, [wNPCMovementScriptPointerTableNum]
	and a
	ret nz
	ld a, [wd736]
	and a
	ret nz
	callfar IsPlayerStandingOnDoorTileOrWarpTile
	jr nc, .notStandingOnDoorOrWarpTile
.CantEncounter
	ld a, $1
	and a
	ret
.notStandingOnDoorOrWarpTile
	callfar IsPlayerJustOutsideMap
	jr z, .CantEncounter
	ld a, [wRepelRemainingSteps]
	and a
	jr z, .next
	dec a
	jr z, .lastRepelStep
	ld [wRepelRemainingSteps], a
.next
; determine if wild pokemon can appear in the half-block we're standing in
; is the bottom right tile (9,9) of the half-block we're standing in a grass/water tile?
	hlcoord 9, 9
	ld c, [hl]
	ld a, [wGrassTile]
	cp c
	ld a, [wGrassRate]
	jr z, .CanEncounter
	ld a, $14 ; in all tilesets with a water tile, this is its id
	cp c
	ld a, [wWaterRate]
	jr z, .CanEncounter
; even if not in grass/water, standing anywhere we can encounter pokemon
; so long as the map is "indoor" and has wild pokemon defined.
; ...as long as it's not Viridian Forest or Safari Zone.
	ld a, [wCurMap]
	cp FIRST_INDOOR_MAP ; is this an indoor map?
	jr c, .CantEncounter2
	ld a, [wCurMapTileset]
	cp FOREST ; Viridian Forest/Safari Zone
	jr z, .CantEncounter2
	ld a, [wGrassRate]
.CanEncounter
; compare encounter chance with a random number to determine if there will be an encounter
	ld b, a
	ldh a, [hRandomAdd]
	cp b
	jr nc, .CantEncounter2
	ldh a, [hRandomSub]
	ld b, a
	ld hl, WildMonEncounterSlotChances
.determineEncounterSlot
	ld a, [hli]
	cp b
	jr nc, .gotEncounterSlot
	inc hl
	jr .determineEncounterSlot
.gotEncounterSlot
; determine which wild pokemon (grass or water) can appear in the half-block we're standing in
	ld c, [hl]
	ld hl, wGrassMons
	lda_coord 8, 9
	cp $14 ; is the bottom left tile (8,9) of the half-block we're standing in a water tile?
	jr nz, .gotWildEncounterType ; else, it's treated as a grass tile by default
	ld hl, wWaterMons
; since the bottom right tile of a "left shore" half-block is $14 but the bottom left tile is not,
; "left shore" half-blocks (such as the one in the east coast of Cinnabar) load grass encounters.
.gotWildEncounterType
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld [wCurEnemyLVL], a
        call GetRandomPokemon
	;ld a, [hl] ; I think this is the place we need to randomize the encounter
	ld [wcf91], a
	ld [wEnemyMonSpecies2], a
	ld a, [wRepelRemainingSteps]
	and a
	jr z, .willEncounter
	ld a, [wPartyMon1Level]
	ld b, a
	ld a, [wCurEnemyLVL]
	cp b
	jr c, .CantEncounter2 ; repel prevents encounters if the leading party mon's level is higher than the wild mon
	jr .willEncounter
.lastRepelStep
	ld [wRepelRemainingSteps], a
	ld a, TEXT_REPEL_WORE_OFF
	ldh [hSpriteIndexOrTextID], a
	call EnableAutoTextBoxDrawing
	call DisplayTextID
.CantEncounter2
	ld a, $1
	and a
	ret
.willEncounter
	xor a
	ret

; get random number, assign it to `a`
; check to see if that number is on the black list, or outside the bounds of pkmn ids
; if yes, rerun
; if no, return number
GetRandomPokemon:
        call Random
        cp $00
        call z, GetRandomPokemon
        cp $1f
        call z, GetRandomPokemon
        cp $20
        call z, GetRandomPokemon
        cp $32
        call z, GetRandomPokemon
        cp $38
        call z, GetRandomPokemon
        cp $3d
        call z, GetRandomPokemon
        cp $3e
        call z, GetRandomPokemon
        cp $3f
        call z, GetRandomPokemon
        cp $43
        call z, GetRandomPokemon
        cp $44
        call z, GetRandomPokemon
        cp $45
        call z, GetRandomPokemon
        cp $4f
        call z, GetRandomPokemon
        cp $50
        call z, GetRandomPokemon
        cp $51
        call z, GetRandomPokemon
        cp $56
        call z, GetRandomPokemon
        cp $57
        call z, GetRandomPokemon
        cp $5e
        call z, GetRandomPokemon
        cp $5f
        call z, GetRandomPokemon
        cp $73
        call z, GetRandomPokemon
        cp $79
        call z, GetRandomPokemon
        cp $7a
        call z, GetRandomPokemon
        cp $7f
        call z, GetRandomPokemon
        cp $86
        call z, GetRandomPokemon
        cp $87
        call z, GetRandomPokemon
        cp $89
        call z, GetRandomPokemon
        cp $8c
        call z, GetRandomPokemon
        cp $92
        call z, GetRandomPokemon
        cp $9c
        call z, GetRandomPokemon
        cp $9f
        call z, GetRandomPokemon
        cp $a0
        call z, GetRandomPokemon
        cp $a1
        call z, GetRandomPokemon
        cp $a2
        call z, GetRandomPokemon
        cp $ac
        call z, GetRandomPokemon
        cp $ae
        call z, GetRandomPokemon
        cp $af
        call z, GetRandomPokemon
        cp $b5
        call z, GetRandomPokemon
        cp $b6
        call z, GetRandomPokemon
        cp $b7
        call z, GetRandomPokemon
        cp $b8
        call z, GetRandomPokemon
        cp $bf ; If the random number is greater than the largest pokemon id
        call nc, GetRandomPokemon
        ret

INCLUDE "data/wild/probabilities.asm"
