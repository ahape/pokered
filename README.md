# Pokémon Red and Blue [![Build Status][travis-badge]][travis]

This is a disassembly of Pokémon Red and Blue.

## Customizations made by me

### Bug fixes

-   Fixed [Badge boost
    glitch](http://wiki.pokemonspeedruns.com/index.php/Badge_Boosts).
-   Fixed 1/256 glitch. This glitch allowed for a 1-in-256 chance that a move
    with 100% accuracy would miss. The programming error was a matter of using a
    `<` comparison when it should have been a `<=` comparison (allowing one
    value to sneakily show up false) when checking `if (randomValue < moveAccuracy)`.
-   Fixed Focus Energy/Dire Hit glitch. This glitch made it so that the move
    Focus Energy and the item Dire Hit (which are virtually identical in their
    effects) decrease your chance of getting a critical hit, rather than
    boosting it.
-   Changed "critical hit" mechanics. In Pokemon Red/Blue, critical hits would
    not take into account any stat reductions or increases the defending Pokemon
    currently held, and instead would plug their base stats into the damage
    determination formula. So, for instance, if you used Harden multiple times,
    and then an enemy Pokemon scored a critical hit Tackle on you, it wouldn't
    take into account any of your defensive benefits from the Hardens. Another
    example: if you used Tail Whip on an enemy Pokemon multiple times and then
    you scored a critical hit Tackle on them, there's a chance that your
    critical hit would incur less damage than a normal hit since it's not
    taking into account any of their defense reductions.
-   Changed certain move types. This includes moves like Gust, which _should_
    have been type "Flying", and Karate Chop, which _should_ have been type
    "Fighting" (in my opinion?). I also changed the effects of Counter so that is
    works against more than just Normal and Fighting types. There are other
    moves and learnsets that I tweaked to make the game a little more
    interesting--and make certain Pokemon either suck less or less
    godly.
-   Patched a loophole that allowed the player to use a Poke Doll to get past
    the "Restless Soul" (Marowak) in the Pokemon Tower. This is a commonly
    exploited loophole in speedruns, as it allows the player to bypass the whole
    Rocket Hideout portion of the game.
-   Fixed the infamous [Old Man/Missingno
    glitch](https://bulbapedia.bulbagarden.net/wiki/Old_man_glitch) that allowed
    the player to get their 6th item duplicated multiple times, as well as the
    ability to catch the Pokemon "Missingno."

### Just for fun

-   Made it so all wild encounters and trainers consist of 100% **random** Pokemon. This
    means you can trudge through the grass just outside of Pallet Town and catch
    a level 3 Mewtwo (if you get lucky enough). This also means that Brock
    (along with every other trainer) will have random Pokemon. These
    Pokemon are not predetermined, either. So every time you go through the Elite
    Four, you will be fighting different Pokemon. Their levels will all be the
    same as they would be during normal gameplay (same goes to the wild
    Pokemon).
-   Player now starts with an option between Mew, Mew, and Mew. Mainly, because Mew
    makes an awesome Pokemon for piling HMs onto. This becomes greatly
    beneficial later on in the game when you are trying to figure out which
    Pokemon should learn a particular HM move. HM moves are necessary to get
    through certain portions of the game, but don't really come in handy when
    facing the Elite Four. Since HM moves can't be erased, it kind of sucks
    having to forever hamstring a Pokemon's moveset like this. Mew can learn
    **every** HM, so you can stick Surf, Cut, Strength, and Fly onto it and not
    have to worry about polluting your other Pokemon's moves. And then when you
    go to fight the Elite Four, you can just throw Mew into your PC in lieu of
    something better.
-   Professor Oak now gives you 99 Master Balls along with the Pokedex. This meshes
    really well with the "random encounters" customization. You're going to
    stumble across a lot of Pokemon you'll want to catch, and with this
    customization you won't have to waste any time dwindling down their HP
    (while they dwindle down yours) in order to catch them. It's all guaranteed now.
-   Made it so all Pokemon learn a move every 5 levels. I had to make this
    adjustment because some Pokemon were only meant to be encountered later in
    the game, and so the developers didn't bother giving them any new moves until
    way late (e.g. Moltres level 50, et al). Now it's normalized and more predictable.
    
I'd like to think that these customizations make the gameplay both harder _and_ easier. It's harder because you'll fight trainers with **far** stronger Pokemon, so you'll need to have a pretty well-rounded ensemble. It's easier because you'll be able to catch any Pokemon you want. Overall, I added these things so that the player could experience more of what these old school games has to offer.

---

This repo builds the following ROMs:

-   Pokemon Red (UE) [S][!].gb `sha1: ea9bcae617fdf159b045185467ae58b2e4a48b9a`
-   Pokemon Blue (UE) [S][!].gb `sha1: d7037c83e1ae5b39bde3c30787637ba1d4c48ce2`
-   BLUEMONS.GB (debug build) `sha1: 5b1456177671b79b263c614ea0e7cc9ac542e9c4`

To set up the repository, see [**INSTALL.md**](INSTALL.md).

## See also

-   **Discord:** [pret][discord]
-   **IRC:** [freenode#pret][irc]

Other disassembly projects:

-   [**Pokémon Yellow**][pokeyellow]
-   [**Pokémon Gold/Silver**][pokegold]
-   [**Pokémon Crystal**][pokecrystal]
-   [**Pokémon Pinball**][pokepinball]
-   [**Pokémon TCG**][poketcg]
-   [**Pokémon Ruby**][pokeruby]
-   [**Pokémon FireRed**][pokefirered]
-   [**Pokémon Emerald**][pokeemerald]

[pokeyellow]: https://github.com/pret/pokeyellow
[pokegold]: https://github.com/pret/pokegold
[pokecrystal]: https://github.com/pret/pokecrystal
[pokepinball]: https://github.com/pret/pokepinball
[poketcg]: https://github.com/pret/poketcg
[pokeruby]: https://github.com/pret/pokeruby
[pokefirered]: https://github.com/pret/pokefirered
[pokeemerald]: https://github.com/pret/pokeemerald
[discord]: https://discord.gg/d5dubZ3
[irc]: https://kiwiirc.com/client/irc.freenode.net/?#pret
[travis]: https://travis-ci.org/pret/pokered
[travis-badge]: https://travis-ci.org/pret/pokered.svg?branch=master
