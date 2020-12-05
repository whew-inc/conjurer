dofile("data/scripts/lib/coroutines.lua")
dofile("data/scripts/lib/utilities.lua")

dofile_once("mods/raksa/files/scripts/lists/materials.lua");
dofile_once("mods/raksa/files/wands/matwand/brushes/list.lua");
dofile_once("mods/raksa/files/wands/matwand/helpers.lua");

dofile_once("mods/raksa/files/lib/gui.lua")
dofile_once("mods/raksa/files/scripts/utilities.lua")
dofile_once("mods/raksa/files/scripts/enums.lua")


local render_active_overlay = nil
local GUI = GuiCreate()
local main_menu_pos_x = 1
local main_menu_pos_y = 18
local sub_menu_pos_x = main_menu_pos_x+3
local sub_menu_pos_y = main_menu_pos_y-5.3

local active_material_type = MATERIAL_TYPES[1]
local favorites = {}


function remove_from_favorites(i)
  return function()
    table.remove(favorites, i)
  end
end

function add_to_favorites(vars, click)
  return function()
    table.insert(favorites, { vars=vars, click=click })
  end
end


function render_material_picker()
  local bid = 200
  local active_materials = ALL_MATERIALS[active_material_type]

  -- Render material type buttons
  Horizontal(GUI, 1, 1, function()
    for i, cat in ipairs(MATERIAL_TYPES) do
      local is_selected = (cat == active_material_type)
      local image = get_material_type_icon(cat, is_selected)
      local y_override = -0.3
      local style = is_selected and NPBG_BROWN_TAB or NPBG_BROWN

      Background(GUI, 0, style, 100, function()
        bid = Button(GUI, bid, {tooltip=cat, image=image, y=y_override}, function()
          active_material_type = cat
        end)
      end)
      GuiLayoutAddHorizontalSpacing(GUI, 3)
    end
  end)

  -- Render material buttons
  Background(GUI, 3, NPBG_BROWN, 200, function()
    Grid(GUI, active_materials, function(material)
      local vars = { image=material.image, tooltip=material.name }
      local click = function() GlobalsSetValue(SELECTED_MATERIAL, material.id) end
      local right_click = add_to_favorites(vars, click)
      bid = Button(GUI, bid, vars, click, right_click)
    end, 1, 2)
  end)
end


function render_brush_picker()
  local bid = 300

  Horizontal(GUI, 1, 1, function()
    GuiText(GUI, 0, 0, "Select a brush shape")
  end)

  -- Render brushes
  Background(GUI, 3, NPBG_BROWN, 200, function()
    Grid(GUI, BRUSHES, function(brush, i)
      local vars = { image=brush.icon_file, tooltip=brush.name }
      local click = function() change_active_brush(brush, i) end
      local right_click = add_to_favorites(vars, click)
      bid = Button(GUI, bid, vars, click, right_click)
    end, 1, 2)
  end)
end


function render_eraser_picker()
  local bid = 400

  local eraser_buttons = {
    { text="Solids Eraser", mode=ERASER_MODE_SOLIDS, image=ERASER_ICONS[ERASER_MODE_SOLIDS] },
    { text="Liquids Sucker", mode=ERASER_MODE_LIQUIDS, image=ERASER_ICONS[ERASER_MODE_LIQUIDS] },
  }
  local current_eraser = GlobalsGetValue(ERASER_MODE, ERASER_MODE_DEFAULT)

  Horizontal(GUI, 1, 1, function()
    GuiText(GUI, 0, 0, "Eraser options")
  end)

  Background(GUI, 3, NPBG_BROWN, 200, function()
    Vertical(GUI, 1, 2, function()

      -- Render erasers
      Horizontal(GUI, 0, 0, function()
        for i, item in ipairs(eraser_buttons) do
          local vars = { tooltip=item.text, image=item.image }
          local click = function() GlobalsSetValue(ERASER_MODE, item.mode) end
          local right_click = add_to_favorites(vars, click)
          bid = Button(GUI, bid, vars, click, right_click)
        end
      end)

      -- Render extra slider for size, if using solids eraser.
      if current_eraser == ERASER_MODE_SOLIDS then
        GuiLayoutAddVerticalSpacing(GUI, 2)

        local value = GlobalsGetValue(ERASER_SIZE, ERASER_SIZE_DEFAULT)
        local repr = tostring(value)
        local default = tonumber(ERASER_SIZE_DEFAULT)

        local new_val = GuiSlider(GUI, bid, 2, 0, "Size", value, 1, 8, default, 1, repr, 30 )
        GuiTooltip(GUI, "Unfortunately this works only with the Solids Eraser", "")
        GlobalsSetValue(ERASER_SIZE, math.ceil(new_val))
      end
    end)
  end)
end


function render_main_buttons()
  local bid = 100

  local main_menu_items = {
    {
      name="Material Picker",
      image_func = get_active_material_image,
      action = function() toggle_active_overlay(render_material_picker) end
    },
    {
      name="Brush Picker",
      image_func = function() return get_active_brush().icon_file end,
      action = function() toggle_active_overlay(render_brush_picker) end,
    },
    {
      name="Eraser Picker",
      image_func = get_active_eraser_image,
      action = function() toggle_active_overlay(render_eraser_picker) end,
    },
  };

  -- Render picker buttons
  Background(GUI, 1, NPBG_BROWN, 100, function()
    for i, item in ipairs(main_menu_items) do
      bid = Button(
        GUI, bid,
        {image=item.image_func(), tooltip=item.name},
        item.action
      )
      GuiLayoutAddVerticalSpacing(GUI, 2)
    end
  end)

  GuiLayoutAddVerticalSpacing(GUI, 2)
  GuiText(GUI, 1, 0, "fav.")
  GuiTooltip(GUI, "Add favorites by right-clicking on individual mats/brushes/erasers", "")
  GuiLayoutAddVerticalSpacing(GUI, 1)

  Background(GUI, 1, NPBG_BROWN, 200, function()
    -- Render favorite buttons
    for i, fav in ipairs(favorites) do
      bid = Button(GUI, bid, fav.vars, fav.click, remove_from_favorites(i))
      GuiLayoutAddVerticalSpacing(GUI, 2)
    end
  end)
end


function toggle_active_overlay(func)
  render_active_overlay = (render_active_overlay ~= func) and func or nil
end


generate_all_materials()

async_loop(function()

  if GUI ~= nil then
    GuiStartFrame(GUI)
  end

  if GameIsInventoryOpen() == false then

    Vertical(GUI, main_menu_pos_x, main_menu_pos_y, function()
      render_main_buttons()
    end)

    if render_active_overlay ~= nil then
      Vertical(GUI, sub_menu_pos_x, sub_menu_pos_y, function()
        render_active_overlay()
      end)
    end
  end

  wait(0)
end)
