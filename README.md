# ProcessingJS-Terrain-Generation
2d birds-eye terrain generation with ProcessingJS.

you can run the code [here](https://www.openprocessing.org/sketch/736065) if you can't be bothered to ctrl c it to somewhere.

![Terrain-Generator](https://user-images.githubusercontent.com/50847107/61155398-f2b7c600-a544-11e9-9793-473b121add6a.png)

## Notes
ProcessingJS's noiseSeed() and randomSeed() functions don't change anything (I think this may be a bug) so the noise() seed is always the same. to counter this, I just added a random number to the variables that cycle noise loops.

### Biomes
(this is a biome map)


| Name | Moisture | Height |
|------|----------|--------|
| `water` | any | <.475 |
| `sand` | any | >.475 <.5 |
| `mountain` | any | <.575 |
| `desert` | <.45 | <.575 |
| `grassland` | >.45 <.6 | <.575 |
| `forest` | >.6 | <.575 |
