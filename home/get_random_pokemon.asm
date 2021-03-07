GetRandomPokemon::
        push hl
        push bc
        push de
        farcall GetRandomPokemon_
        ld a, e ; Since farcall destroys A
        pop de
        pop bc
        pop hl
        ret
