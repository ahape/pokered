GetRandomPokemon_::
        call Random
        cp $bf ; If the random number is greater than the largest pokemon id
        jr nc, GetRandomPokemon_
        cp $00
        jr z, GetRandomPokemon_
        cp $1f
        jr z, GetRandomPokemon_
        cp $20
        jr z, GetRandomPokemon_
        cp $32
        jr z, GetRandomPokemon_
        cp $38
        jr z, GetRandomPokemon_
        cp $3d
        jr z, GetRandomPokemon_
        cp $3e
        jr z, GetRandomPokemon_
        cp $3f
        jr z, GetRandomPokemon_
        cp $43
        jr z, GetRandomPokemon_
        cp $44
        jr z, GetRandomPokemon_
        cp $45
        jr z, GetRandomPokemon_
        cp $4f
        jr z, GetRandomPokemon_
        cp $50
        jr z, GetRandomPokemon_
        cp $51
        jr z, GetRandomPokemon_
        cp $56
        jr z, GetRandomPokemon_
        cp $57
        jr z, GetRandomPokemon_
        cp $5e
        jr z, GetRandomPokemon_
        cp $5f
        jr z, GetRandomPokemon_
        cp $73
        jr z, GetRandomPokemon_
        cp $79
        jr z, GetRandomPokemon_
        cp $7a
        jr z, GetRandomPokemon_
        cp $7f
        jr z, GetRandomPokemon_
        cp $86
        jr z, GetRandomPokemon_
        cp $87
        jr z, GetRandomPokemon_
        cp $89
        jr z, GetRandomPokemon_
        cp $8c
        jr z, GetRandomPokemon_
        cp $92
        jr z, GetRandomPokemon_
        cp $9c
        jr z, GetRandomPokemon_
        cp $9f
        jr z, GetRandomPokemon_
        cp $a0
        jr z, GetRandomPokemon_ ; Can't use relative jump beyond this point.
        cp $a1
        jp z, GetRandomPokemon_
        cp $a2
        jp z, GetRandomPokemon_
        cp $ac
        jp z, GetRandomPokemon_
        cp $ae
        jp z, GetRandomPokemon_
        cp $af
        jp z, GetRandomPokemon_
        cp $b5
        jp z, GetRandomPokemon_
        cp $b6
        jp z, GetRandomPokemon_
        cp $b7
        jp z, GetRandomPokemon_
        cp $b8
        jp z, GetRandomPokemon_
        ld e, a
        ret
