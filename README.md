# Kaendylaend
Auf Dietos herrscht Aufruhr. Zwischen Vegetania und Frutera herrscht ein Krieg um die Vorherrschaft. Die Einwohner der Protein-Inseln überfallen die Küsten der Molke-Föderation und die Insignie des Zuckerkönigs, das Kandiszucker Zepter, wurde gestohlen und es obliegt einem unerfahrenen Abenteurer dies seinem Eigentümer zurückzubringen, um einen kontinentweiten Krieg zu verhindern.

## Implementation notes

### Animation
- Add your animation SpriteSheed
- put it in an AnimationPlayer
- for code, refer to Player.gd

### Collision: TileMap
Multiple Layers exist on the TileMap:

#### Ground
To be used for terrains\
visually behind everything else\
no collision

#### Ground Objects Background
Appear behind Larry\
Should have collision; details: see section [Collision](#collision)

#### Ground Objects Foreground\
Appear over Larry; note that for large objects (i.e. houses), it may be necessary to split an objects between Background and Foreground Levels\
Larry should always (at least partially) be visible!

#### Air Objects
tba

#### Collision
needs to be mapped:
- selects TileMap object
- bottom menu: TileSet -> Tiles -> Select -> scroll down to Physics
- add your mapping: using snap to grid (16) is recommended