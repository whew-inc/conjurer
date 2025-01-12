dofile("data/scripts/lib/utilities.lua")

dofile_once("mods/raksa/files/lib/gui.lua")
dofile_once("mods/raksa/files/scripts/utilities.lua")
dofile_once("mods/raksa/files/scripts/enums.lua")

dofile_once("mods/raksa/files/powers/toggle_speed.lua")
dofile_once("mods/raksa/files/powers/toggle_kalma.lua")
dofile_once("mods/raksa/files/powers/change_herd.lua")
dofile_once("mods/raksa/files/powers/control_happiness.lua")
dofile_once("mods/raksa/files/powers/grid_overlay.lua")
dofile_once("mods/raksa/files/powers/binoculars.lua")
dofile_once("mods/raksa/files/powers/waypoints.lua")


if ACTIVE_HERD == nil then
  local player = get_player()
  if player then
    ACTIVE_HERD = get_active_herd(EntityGetValue(player, "GenomeDataComponent", "herd_id"))
  end
end


function activate_weather_menu()
  toggle_active_overlay(render_weather_menu, 14, -44)
end

function create_dimensional_portal(biome, world, biome_file, scene_file)
  return function()
    -- Never ever let these *not* update when creating a new portal
    biome_file = biome_file or DEFAULTS[BIOME_SELECTION_FILE]
    scene_file = scene_file or DEFAULTS[BIOME_SELECTION_SCENE_FILE]
    biome = biome or DEFAULTS[BIOME_SELECTION]

    GlobalsSetValue(BIOME_SELECTION_FILE, biome_file)
    GlobalsSetValue(BIOME_SELECTION_SCENE_FILE, scene_file)
    GlobalsSetValue(BIOME_SELECTION, biome)
    GlobalsSetValue(WORLD_SELECTION, world)

    -- Kill any existing portals
    local portal = EntityGetWithName("dimension_portal")
    EntityKill(portal)

    -- Spawn the portal
    local player = get_player()
    local x, y = EntityGetTransform(player)
    EntityLoad("mods/raksa/files/powers/dimension_portal.xml", x, y-80)
  end
end


local main_menu_items = {
  {
    name="Trans-Dimensional Travel",
    image="mods/raksa/files/gfx/power_icons/dimension_portal.png",
    action = function() toggle_active_overlay(render_world_menu, 0, 4) end,
  },
  {
    name="Arcane Mind",
    image = "mods/raksa/files/gfx/power_icons/memorize.png",
    action = function() toggle_active_overlay(render_teleport_menu, 0, 8) end,
  },
  {
    name="Toggle Conscious Eye of Glass",
    image="mods/raksa/files/gfx/power_icons/glass_eye.png",
    action = toggle_camera_controls,
  },
  {
    -- TODO: This ugly tooltip & teaching the player
    name="Toggle Conjurer Eye   [shift to boost]",
    image="mods/raksa/files/gfx/power_icons/binoculars.png",
    action = toggle_binoculars,
  },
  {
    name="Toggle Gridular Monocle",
    image="mods/raksa/files/gfx/power_icons/grid.png",
    action = toggle_grid,
  },
  {
    name="Control World Happiness",
    image_func = function() return get_happiness_icon(ACTIVE_HAPPINESS_LEVEL) end,
    action = function() toggle_active_overlay(render_happiness_menu, 11, 0) end,
  },
  {
    name="Change Herd",
    image_func = function() return ACTIVE_HERD.image end,
    action = function() toggle_active_overlay(render_herd_menu, 11, 0) end,
  },
  {
    name="Toggle Kalma's Call",
    image = "mods/raksa/files/gfx/power_icons/kalma.png",
    action = toggle_kalma,
  },
  {
    name="Toggle Viima's Howl",
    image = "mods/raksa/files/gfx/power_icons/viima.png",
    action = toggle_speed,
  },
  {
    name="Control Weather",
    image="mods/raksa/files/gfx/power_icons/weather.png",
    action = activate_weather_menu,
  },
  {
    name="Control Planetary Rotation",
    image = "mods/raksa/files/gfx/power_icons/planetary_controls.png",
    action = function() toggle_active_overlay(render_time_menu, 17, -9) end,
  },
};


local BUTTON_WIDTH = 3

local main_menu_pos_x = 100 - BUTTON_WIDTH * #main_menu_items + 1
local main_menu_pos_y = 90
local sub_menu_pos_x_default = main_menu_pos_x
local sub_menu_pos_y_default = main_menu_pos_y-15
local sub_menu_pos_x = sub_menu_pos_x_default
local sub_menu_pos_y = sub_menu_pos_y_default

local render_active_powers_overlay = nil


function render_world_menu()
  local conjurer_dimensions = {
    {
      name="Tasamaa",
      image="mods/raksa/files/gfx/power_icons/worlds/flat.png",
      action=create_dimensional_portal(BIOME_CONJURER, WORLD_CONJURER, BIOME_MAP_CONJURER),
    },
    {
      name="Kukkulat",
      image="mods/raksa/files/gfx/power_icons/worlds/grass.png",
      action=create_dimensional_portal(BIOME_FOREST, WORLD_CONJURER, "mods/raksa/files/biomes/biome_map_green.png"),
    },
    {
      name="Aavikko",
      image="mods/raksa/files/gfx/power_icons/worlds/sand.png",
      action=create_dimensional_portal(BIOME_DESERT, WORLD_CONJURER, BIOME_MAP_CONJURER_GENERATED),
    },
    {
      name="Lumi",
      image="mods/raksa/files/gfx/power_icons/worlds/snow.png",
      action=create_dimensional_portal(BIOME_WINTER, WORLD_CONJURER, BIOME_MAP_CONJURER_GENERATED),
    },
    {
      name="Märkämeri",
      image="mods/raksa/files/gfx/power_icons/worlds/water.png",
      action=create_dimensional_portal(BIOME_WATER, WORLD_CONJURER, BIOME_MAP_CONJURER_GENERATED),
    },
    {
      name="Pahamaa",
      image="mods/raksa/files/gfx/power_icons/worlds/hell.png",
      action=create_dimensional_portal(BIOME_HELL, WORLD_CONJURER, "mods/raksa/files/biomes/biome_map_hellscape.png"),
    },
  }
  local noita_worlds = {
    {
      name="Peculiar Mountainside",
      image="mods/raksa/files/gfx/power_icons/worlds/noita.png",
      action=create_dimensional_portal(BIOME_NOITA, WORLD_NOITA, BIOME_MAP_NOITA, PIXEL_SCENES_NOITA)
    },
    {
      name='Cursed Realms of "NG the Plus"',
      image="mods/raksa/files/gfx/power_icons/worlds/noita_ng.png",
      action=create_dimensional_portal(BIOME_NOITA_NG, WORLD_NOITA, BIOME_MAP_NOITA_NG, PIXEL_SCENES_NOITA_NG),
    },
    {
      -- Yeah, I think that should be descriptive enough.
      name="???????",
      image="mods/raksa/files/gfx/power_icons/worlds/noita_metapeli.png",
      action=create_dimensional_portal(BIOME_NOITA, WORLD_NOITA, "data/scripts/biomes/biome_map_gen.lua", ""),
    },
    {
      name="Takalands of Niilo",
      image="mods/raksa/files/gfx/power_icons/worlds/noita_niilo.png",
      action=create_dimensional_portal(BIOME_NOITA, WORLD_NOITA, "data/biome_impl/biome_map_niilo.png", PIXEL_SCENES_NOITA),
    },
    {
      name="Bostrom Simulation",
      image="mods/raksa/files/gfx/power_icons/worlds/noita_trailer.png",
      action=create_dimensional_portal(BIOME_NOITA, WORLD_NOITA, "data/biome_impl/biome_map_trailer.png", ""),
    },
    {
      name="Endworld Hillplains",
      image="mods/raksa/files/gfx/power_icons/worlds/noita_end.png",
      action=create_dimensional_portal(BIOME_NOITA, WORLD_NOITA, "data/biome_impl/biome_map_the_end.png", ""),
    },
  }

  Grid({items=conjurer_dimensions, size=6, y=0}, function(dimension)
    Button(
      {style=NPBG_BLACK, tooltip=dimension.name, image=dimension.image},
      dimension.action
    )
  end)

  Grid({items=noita_worlds, size=6, y=0.5}, function(dimension)
    Button(
      {style=NPBG_BLACK, tooltip=dimension.name, image=dimension.image},
      dimension.action
    )
  end)
end


function render_happiness_menu()
  local relation_buttons = {
    {
      name="Nightfall Nakkikiska",
      desc="Turns brother on brother. Hiisi on hiisi.\nThere is no love in this world.",
      image=get_happiness_icon(HAPPINESS_HATE),
      action=function()
        GamePrint("You don't feel so safe anymore.")
        change_happiness(HAPPINESS_HATE)
      end,
    },
    {
      name="Status Quo",
      desc="You choose not to influence this world.\nAll relations stay intact.",
      image=get_happiness_icon(HAPPINESS_NEUTRAL),
      action=function()
        GamePrint("Back to normal.")
        change_happiness(HAPPINESS_NEUTRAL)
      end,
    },
    {
      name="Sonata Sauna",
      desc="Purges all hatred from the world.",
      image=get_happiness_icon(HAPPINESS_LOVE),
      action=function()
        GamePrint("You feel a sudden ease as love fills the world.")
        change_happiness(HAPPINESS_LOVE)
      end,
    },
  };

  Background({margin=1}, function()
    Grid({items=relation_buttons, size=3, y=8}, function(item)
      Button(
        {image=item.image, tooltip=item.name, tooltip_desc=item.desc},
        item.action
      )
    end)
  end)
end


function render_herd_menu()
  Background({margin=1}, function()
    Grid({items=HERDS, size=5, y=-17}, function(herd)
      Button(
        {tooltip=herd.display, image=herd.image},
        function()
            change_player_herd(herd.name)
            ACTIVE_HERD = herd
        end
      )
    end)
  end)
end


function render_teleport_menu()
  local teleport_buttons = {
    {
      name="Return to Tower",
      image = "mods/raksa/files/gfx/power_icons/tower.png",
      action = function()
        local x, y = get_spawn_position()
        teleport_player(x, y)
      end,
    },
    {
      name="Memorize Current Location",
      desc="Right-click memories to forget them",
      image = "mods/raksa/files/gfx/power_icons/plus.png",
      action = function()
        local player = get_player()
        local x, y = EntityGetTransform(player)
        set_waypoint(x, y)
      end,
    },
  };

  Background({style=NPBG_PURPLE, margin=0}, function()
    Grid({items=teleport_buttons, size=2}, function(item)
      Button({
          --style=NPBG_PURPLE, padding=-1,
        image=item.image, tooltip=item.name, tooltip_desc=item.desc
        },
        item.action
      )
    end)
  end)

    Grid({x=6, y=-5, items=LOCATION_MEMORY, reverse=true, size=8}, function(item, index)
      Button({
          style=NPBG_PURPLE,
          image=item.image,
          tooltip=item.name..": "..math.floor(item.x)..","..math.floor(item.y),
        },
        function() teleport_player(item.x, item.y) end,
        function() remove_waypoint(item, index) end
      )
    end)
end


function render_rain_material_picker()
  MaterialPicker({ignore_physics=true},
    function(material)
      return function()
        GlobalsSetValue(RAIN_MATERIAL, material.id)
        GlobalsSetValue(RAIN_MATERIAL_ICON, material.image or GLOBAL_UNDEFINED)
        activate_weather_menu()
      end
    end
  )
end


function render_weather_menu()
  local npbg_color = {red=14, green=13, blue=12, alpha=242}
  local min_width = 100

  Text("Rain", {color=npbg_color})
  VerticalSpacing(4)

  Background({margin=5, min_width=min_width}, function()
    Horizontal(0, 0, function()
      Button({
          image=GlobalsGet(RAIN_MATERIAL_ICON),
          image_letter_text=GlobalsGet(RAIN_MATERIAL),
          tooltip="Select rain material",
          tooltip_desc="["..GlobalsGet(RAIN_MATERIAL).."]",
        },
        function() toggle_active_overlay(render_rain_material_picker, 6, -55) end
      )

      local icon = "mods/raksa/files/gfx/icon_power_on.png"
      local icon_off = "mods/raksa/files/gfx/icon_power_off.png"
      local is_raining = GlobalsGetBool(RAIN_ENABLED)

      Button({
          image=is_raining and icon or icon_off,
          tooltip=is_raining and "End the rain" or "Make it rain!",
        },
        function() GlobalsToggleBool(RAIN_ENABLED) end
      )
    end)

    Slider({
        padding=32,
        min=1,
        max=200,
        default=DEFAULTS[RAIN_COUNT],
        value=GlobalsGetNumber(RAIN_COUNT),
        text="Droplets",
      },
      function(new_value)
        GlobalsSetValue(RAIN_COUNT, str(new_value))
      end
    )

    Slider({
        padding=32,
        min=1,
        max=100,
        default=DEFAULTS[RAIN_GRAVITY],
        value=GlobalsGetNumber(RAIN_GRAVITY),
        text="Gravity",
      },
      function(new_value)
        GlobalsSetValue(RAIN_GRAVITY, str(new_value))
      end
    )

    Slider({
        padding=47,
        min=0,
        max=300,
        default=DEFAULTS[RAIN_VELOCITY_MIN],
        value=GlobalsGetNumber(RAIN_VELOCITY_MIN),
        text="Velocity min",
      },
      function(new_value)
        GlobalsSetValue(RAIN_VELOCITY_MIN, str(new_value))
      end
    )

    Slider({
        padding=47,
        min=0,
        max=300,
        default=DEFAULTS[RAIN_VELOCITY_MAX],
        value=GlobalsGetNumber(RAIN_VELOCITY_MAX),
        text="Velocity max",
      },
      function(new_value)
        GlobalsSetValue(RAIN_VELOCITY_MAX, str(new_value))
      end
    )

    Slider({
        padding=47,
        min=128,
        max=2048,
        default=DEFAULTS[RAIN_WIDTH],
        value=GlobalsGetNumber(RAIN_WIDTH),
        text="Extra width",
        tooltip="How far to rain outside the camera. Might help with performance."
      },
      function(new_value)
        GlobalsSetValue(RAIN_WIDTH, str(new_value))
      end
    )


    Checkbox({
        is_active=GlobalsGetBool(RAIN_BOUNCE),
        text="Bouncy droplets",
      },
      function() GlobalsToggleBool(RAIN_BOUNCE) end
    )

    Checkbox({
        is_active=GlobalsGetBool(RAIN_DRAW_LONG),
        text="Long droplets",
      },
      function() GlobalsToggleBool(RAIN_DRAW_LONG) end
    )
  end)

  VerticalSpacing(10)

  Text("Air", {color=npbg_color})
  VerticalSpacing(4)

  Background({margin=5, min_width=min_width}, function()
    local world = GameGetWorldStateEntity()

    -- NOTICE:
    -- All of the following attributes have their own natural cycles, which
    -- requires overriding them every frame, we simply set globals here
    -- instead of the actual values.

    local wind_override = GlobalsGetBool(WIND_OVERRIDE_ENABLED)
    Checkbox({
        is_active=wind_override,
        text="Tame the Winds",
        tooltip="Overrule the natural wind, cloud & fog cycles.",
      },
      function() GlobalsToggleBool(WIND_OVERRIDE_ENABLED) end
    )
    Slider({
        value=GlobalsGetNumber(WIND_SPEED),
        disabled=not wind_override,
        default=0,
        min=-499,  -- Exclusive, actually goes to -500
        max=500,
        width=60,
        text="Wind",
      },
      function(new_value)
        GlobalsSetValue(WIND_SPEED, tostring(new_value))
      end
    )

    local value_multiplier = 100
    Slider({
        value=GlobalsGetNumber(CLOUD_AMOUNT) * value_multiplier,
        disabled=not wind_override,
        default=0,
        min=0,
        max=100,
        width=60,
        text="Clouds",
      },
      function(new_value)
        -- The target animation is kinda cool, but is it really worth it? Think not for now.
        GlobalsSetValue(CLOUD_AMOUNT, tostring(new_value / value_multiplier))
      end
    )

    -- NOTE: Lightning did not work nicely with sliders, due to automatically going to 0.
    -- See if you can figure any sort of fun UI for it.

    Slider({
        value=GlobalsGetNumber(FOG_AMOUNT) * value_multiplier,
        disabled=not wind_override,
        default=0,
        min=0,
        max=100,
        width=60,
        text="Fog",
      },
      function(new_value)
        GlobalsSetValue(FOG_AMOUNT, tostring(new_value / value_multiplier))
      end
    )
  end)
end


function render_time_menu()
  local time_of_day_buttons = {
    {
      name="Dawn",
      image = "mods/raksa/files/gfx/power_icons/dawn.png",
      action = function() set_time_of_day(DAWN) end,
    },
    {
      name="Noon",
      image = "mods/raksa/files/gfx/power_icons/noon.png",
      action = function() set_time_of_day(NOON) end,
    },
    {
      name="Dusk",
      image = "mods/raksa/files/gfx/power_icons/dusk.png",
      action = function() set_time_of_day(DUSK) end,
    },
    {
      name="Midnight",
      image = "mods/raksa/files/gfx/power_icons/midnight.png",
      action = function() set_time_of_day(MIDNIGHT) end,
    },
  };

  local npbg_color = {red=14, green=13, blue=12, alpha=242}
  Text("Planetary Adjustments", {color=npbg_color, x=-3})
  VerticalSpacing(4)

  Background({margin=5}, function()
    Grid({items=time_of_day_buttons, padding_x=1, size=4, x=-0.5}, function(item)
      Button(
        {image=item.image, tooltip=item.name},
        item.action
      )
    end)

    VerticalSpacing(4)

    -- time_dt slider
    local MULTIPLIER = 10

    function to_worldstate_value(val)
      if val <= 0.1 then return 0 end
      return math.max(10 ^ val / MULTIPLIER)
    end

    function to_slider_log_value(val)
      return math.max(math.log10(val*MULTIPLIER), 0)
    end

    local world = GameGetWorldStateEntity()
    local time_dt = to_slider_log_value(EntityGetValue(world, "WorldStateComponent", "time_dt"))

    Slider({
        max=3.5,
        decimals=true,
        default=to_slider_log_value(1),
        value=time_dt,
        formatting=string.format("%.2f", time_dt),
        text="Torque",
        tooltip="Right-click to bring back the natural order.",
        tooltip_desc="Note: This also acts as a multiplier to wind speeds.",
      },
      function(new_value)
        EntitySetValue(world, "WorldStateComponent", "time_dt", to_worldstate_value(new_value))
      end
    )

    Slider({
        value=EntityGetValue(world, "WorldStateComponent", "gradient_sky_alpha_target") * 100,
        default=0,
        min=0,
        max=100,
        text="Skytop",
        tooltip="Adjust the topmost sky gradient",
        decimals=false,
      },
      function(new_value)
        EntitySetValue(world, "WorldStateComponent", "gradient_sky_alpha_target", new_value/100)
      end
    )
    Slider({
        value=EntityGetValue(world, "WorldStateComponent", "sky_sunset_alpha_target") * 100,
        default=100,
        min=0,
        max=100,
        text="Sunset",
        tooltip="Adjust the bottom sky gradient",
        decimals=false,
      },
      function(new_value)
        EntitySetValue(world, "WorldStateComponent", "sky_sunset_alpha_target", new_value/100)
      end
    )
  end)

end


function render_power_buttons()
  -- Render picker buttons
  Background({margin=1, style=NPBG_GOLD}, function()
    for i, item in ipairs(main_menu_items) do
      Button(
        {image=item.image or item.image_func(), tooltip=item.name, tooltip_desc=item.desc},
        item.action
      )
    end
  end)
end


function toggle_active_overlay(func, offset_x, offset_y)
  offset_x = offset_x or 0
  offset_y = offset_y or 0

  sub_menu_pos_x = sub_menu_pos_x_default + offset_x
  sub_menu_pos_y = sub_menu_pos_y_default + offset_y

  render_active_powers_overlay = (render_active_powers_overlay ~= func) and func or nil
end


function render_powers()
  Horizontal(main_menu_pos_x, main_menu_pos_y, function()
    render_power_buttons()
  end)

  if render_active_powers_overlay ~= nil then
    Vertical(sub_menu_pos_x, sub_menu_pos_y, function()
      render_active_powers_overlay()
    end)
  end
end
