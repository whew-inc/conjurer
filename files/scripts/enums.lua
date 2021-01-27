-- Synced with magic numbers. Location for respawn & tower return.
-- Note: not the same as Noita's default mountain spawn location.
CONJURER_SPAWN_X = MagicNumbersGetValue("DESIGN_PLAYER_START_POS_X")
CONJURER_SPAWN_Y = MagicNumbersGetValue("DESIGN_PLAYER_START_POS_Y")

-- Ninepiece Backgrounds
NPBG_DEFAULT = 0
NPBG_GOLD = 1
NPBG_TAB = 2
NPBG_BLUE = 3
NPBG_BLUE_TAB = 4
NPBG_BROWN = 5
NPBG_BROWN_TAB = 6
NPBG_PURPLE = 7

NPBG_STYLES = {
  [NPBG_DEFAULT]="data/ui_gfx/decorations/9piece0_gray.png",
  [NPBG_GOLD]="data/ui_gfx/decorations/9piece0.png",
  [NPBG_TAB]="mods/raksa/files/gfx/9piece_tab.png",
  [NPBG_BLUE]="mods/raksa/files/gfx/9piece_blue.png",
  [NPBG_BLUE_TAB]="mods/raksa/files/gfx/9piece_blue_tab.png",
  [NPBG_BROWN]="mods/raksa/files/gfx/9piece_brown.png",
  [NPBG_BROWN_TAB]="mods/raksa/files/gfx/9piece_brown_tab.png",
  [NPBG_BROWN_TAB]="mods/raksa/files/gfx/9piece_brown_tab.png",
  [NPBG_PURPLE]="mods/raksa/files/gfx/9piece_purple.png",
}


ICON_MOUSE_LEFT = "mods/raksa/files/gfx/mouse_left.png"
ICON_MOUSE_RIGHT = "mods/raksa/files/gfx/mouse_right.png"

-- TIME OF DAY
DAWN = 0.73
NOON = 0
DUSK = 0.47
MIDNIGHT = 0.6


GLOBAL_UNDEFINED = "nil"

--
-- MATWAND
--
-- NOTE: The reticle entity file has the actual default brush image defined
-- TODO: Dynamic first load?
SELECTED_BRUSH = "RAKSA_SELECTED_BRUSH"
SELECTED_MATERIAL = "RAKSA_SELECTED_MATERIAL"
SELECTED_MATERIAL_ICON = "RAKSA_SELECTED_MATERIAL_ICON"
BRUSH_GRID_SIZE = "RAKSA_BRUSH_GRID_SIZE"

ERASER_MODE = "RAKSA_ERASER_MODE"
ERASER_MODE_ALL = "ALL"
ERASER_MODE_SELECTED = "SELECTED"
ERASER_MODE_SOLIDS = "[solid]"
ERASER_MODE_LIQUIDS = "[liquid]"
ERASER_MODE_SANDS = "[sand_ground]"
ERASER_MODE_GASES = "[gas]"
ERASER_MODE_FIRE = "[fire]"

ERASER_REPLACE = "RAKSA_ERASER_REPLACE"
ERASER_SHARED_GRID = "RAKSA_ERASER_SHARED_GRID"
ERASER_GRID_SIZE = "RAKSA_ERASER_GRID_SIZE"
ERASER_SIZE = "RAKSA_ERASER_SIZE"

ERASER_PIXEL = "mods/raksa/files/gfx/eraser_pixel.png"
REPLACER_PIXEL = "mods/raksa/files/gfx/replacer_pixel.png"


--
-- ENTWAND
--
SELECTED_ENTITY_INDEX = "RAKSA_SELECTED_ENTITY_INDEX"
SELECTED_ENTITY_TYPE = "RAKSA_SELECTED_ENTITY_TYPE"

ENTWAND_GRID_SIZE = "RAKSA_ENTWAND_GRID_SIZE"
ENTWAND_ROWS = "RAKSA_ENTWAND_ROWS"
ENTWAND_COLS = "RAKSA_ENTWAND_COLS"

ENTWAND_HOLD_TO_SPAWN  = "RAKSA_ENTWAND_HOLD_TO_SPAWN"
ENTWAND_HOLD_TO_DELETE = "RAKSA_ENTWAND_HOLD_TO_DELETE"
ENTWAND_DELETE_ALL  = "RAKSA_ENTWAND_DELETE_ALL"

ENTWAND_IGNORE_BACKGROUNDS  = "RAKSA_IGNORE_BACKGROUNDS"
BG_NAME = "raksa_background"


--
-- POWERS
--
KALMA_IS_IMMORTAL = "RAKSA_IMMORTALITY"
BINOCULARS_ACTIVE = "RAKSA_BINOCULARS_ACTIVE"

RAIN_ENABLED = "RAKSA_RAIN_ENABLED"
RAIN_COUNT = "RAKSA_RAIN_COUNT"
RAIN_WIDTH = "RAKSA_RAIN_WIDTH"
RAIN_VELOCITY_MIN = "RAKSA_RAIN_VELOCITY_MIN"
RAIN_VELOCITY_MAX = "RAKSA_RAIN_VELOCITY_MAX"
RAIN_GRAVITY = "RAKSA_RAIN_GRAVITY"
RAIN_BOUNCE = "RAKSA_RAIN_BOUNCE"
RAIN_DRAW_LONG = "RAKSA_RAIN_DRAW_AS_LONG"
RAIN_MATERIAL = "RAKSA_RAIN_MATERIAL"
RAIN_MATERIAL_ICON = "RAKSA_RAIN_MATERIAL_ICON"

WIND_OVERRIDE_ENABLED = "RAKSA_WIND_OVERRIDE_ENABLED"
WIND_SPEED = "RAKSA_WIND_SPEED"

FOG_AMOUNT = "RAKSA_FOG_AMOUNT"
CLOUD_AMOUNT = "RAKSA_CLOUD_AMOUNT"


--
-- OTHER
--
PLAYER_HAS_DIED = "RAKSA_PLAYER_HAS_DIED"
FIRST_LOAD_DONE = "RAKSA_FIRST_LOAD_DONE"


-- World file locations
BIOME_MAP_NOITA = "data/biome_impl/biome_map.png"
BIOME_MAP_NOITA_NG = "data/biome_impl/biome_map_newgame_plus.lua"
BIOME_MAP_CONJURER = "mods/raksa/files/biomes/biome_map.png"
BIOME_MAP_CONJURER_GENERATED = "mods/raksa/files/biomes/biome_map.lua"
PIXEL_SCENES_NOITA = "mods/raksa/files/overrides/original_pixel_scenes.xml"
PIXEL_SCENES_DEFAULT = "data/biome/_pixel_scenes.xml"
PIXEL_SCENES_NOITA_NG = "data/biome/_pixel_scenes_newgame_plus.xml"

-- World selection values for Globals
BIOME_CURRENT_WORLD = "RAKSA_CURRENT_WORLD"
BIOME_SELECTION = "RAKSA_BIOME_SELECTION"
BIOME_DESERT = "desert"
BIOME_FOREST = "forest"
BIOME_WINTER = "winter"
BIOME_WATER = "lake"
BIOME_HELL = "hell"
-- Not real biomes, just worlds:
BIOME_NOITA = "noita"
BIOME_CONJURER = "conjurer"

BIOME_SELECTION_SCENE_FILE = "RAKSA_BIOME_SELECTION_FILE"
BIOME_SELECTION_FILE = "RAKSA_BIOME_FILE"


DEFAULTS = {
  -- Matwand
  [SELECTED_BRUSH] = "4", -- 10px brush
  [SELECTED_MATERIAL] = "soil",
  [SELECTED_MATERIAL_ICON] = "mods/raksa/files/gfx/material_icons/soil.png",
  [BRUSH_GRID_SIZE] = "1",
  [ERASER_MODE] = ERASER_MODE_ALL,
  [ERASER_REPLACE] = "0",
  [ERASER_SHARED_GRID] = "1",
  [ERASER_GRID_SIZE] = "1",
  [ERASER_SIZE] = "2",
  -- Entwand
  [SELECTED_ENTITY_INDEX] = "93",  -- Sheep.
  [SELECTED_ENTITY_TYPE] = 1, -- Animals / Creatures
  [ENTWAND_GRID_SIZE] = 1,
  [ENTWAND_ROWS] = 1,
  [ENTWAND_COLS] = 1,
  [ENTWAND_HOLD_TO_SPAWN] = "0",
  [ENTWAND_HOLD_TO_DELETE] = "0",
  [ENTWAND_DELETE_ALL] = "0",
  [ENTWAND_IGNORE_BACKGROUNDS] = "0",
  -- Powers
  [BINOCULARS_ACTIVE] = "0",
  [KALMA_IS_IMMORTAL] = "0",
  [RAIN_ENABLED] = "0",
  [RAIN_COUNT] = 10,
  [RAIN_WIDTH] = 1280,
  [RAIN_VELOCITY_MIN] = "30",
  [RAIN_VELOCITY_MAX] = "60",
  [RAIN_GRAVITY] = "10",
  [RAIN_BOUNCE] = "1",
  [RAIN_DRAW_LONG] = "1",
  [RAIN_MATERIAL] = "water",
  [RAIN_MATERIAL_ICON] = "mods/raksa/files/gfx/material_icons/water_colorgen.png",
  [WIND_OVERRIDE_ENABLED] = "0",
  [WIND_SPEED] = "2",
  [FOG_AMOUNT] = 0,
  [CLOUD_AMOUNT] = 0,
  -- Other
  [PLAYER_HAS_DIED] = "0",
  [FIRST_LOAD_DONE] = "0",
  [BIOME_CURRENT_WORLD] = BIOME_CONJURER,
  [BIOME_SELECTION] = BIOME_CONJURER,
  [BIOME_SELECTION_FILE] = BIOME_MAP_CONJURER_GENERATED,
  [BIOME_SELECTION_SCENE_FILE] = PIXEL_SCENES_DEFAULT, -- Overridden as Conjurer's
}
