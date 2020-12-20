local _radial_warning="---\nWARNING: Test before applying!\n- Goes through same material\n- Can easily ruin things when not careful\n- Heavy on performance\n- But really fun to use when you get the hang of it!"

BRUSHES = {
  {
    name="1px brush",
    desc="---\nWorks badly with solids, try other material types!",
    offset_x=1,
    offset_y=0,
    reticle_file="mods/raksa/files/wands/matwand/brushes/1_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/1_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/1_icon.png",
  },
  {
    name="2px brush",
    offset_x=1,
    offset_y=1,
    reticle_file="mods/raksa/files/wands/matwand/brushes/2_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/2_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/2_icon.png",
  },
  {
    name="5px brush",
    offset_x=3,
    offset_y=2,
    reticle_file="mods/raksa/files/wands/matwand/brushes/5_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/5_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/5_icon.png",
  },
  {
    name="10px brush",
    offset_x=5,
    offset_y=5,
    reticle_file="mods/raksa/files/wands/matwand/brushes/10_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/10_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/10_icon.png",
  },
  {
    name="20px brush",
    offset_x=10,
    offset_y=10,
    reticle_file="mods/raksa/files/wands/matwand/brushes/20_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/20_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/20_icon.png",
  },
  {
    name="40px brush",
    offset_x=20,
    offset_y=20,
    reticle_file="mods/raksa/files/wands/matwand/brushes/40_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/40_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/40_icon.png",
  },
  {
    name="80px brush",
    offset_x=40,
    offset_y=40,
    reticle_file="mods/raksa/files/wands/matwand/brushes/80_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/80_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/80_icon.png",
  },
  {
    name="40px long horizontal",
    offset_x=20,
    offset_y=1,
    reticle_file="mods/raksa/files/wands/matwand/brushes/40_lh_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/40_lh_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/40_lh_icon.png",
  },
  {
    name="40px long vertical",
    offset_x=1,
    offset_y=20,
    reticle_file="mods/raksa/files/wands/matwand/brushes/40_lv_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/40_lv_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/40_lv_icon.png",
  },
  {
    name="40px diagonal brush 1",
    offset_x=20,
    offset_y=20,
    reticle_file="mods/raksa/files/wands/matwand/brushes/40_d1_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/40_d1_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/40_d1_icon.png",
  },
  {
    name="40px diagonal brush 2",
    offset_x=20,
    offset_y=20,
    reticle_file="mods/raksa/files/wands/matwand/brushes/40_d2_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/40_d2_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/40_d2_icon.png",
  },
  {
    name="40px hollow box brush",
    offset_x=20,
    offset_y=20,
    reticle_file="mods/raksa/files/wands/matwand/brushes/40_box_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/40_box_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/40_box_icon.png",
  },
  {
    name="40px triangle-up brush",
    offset_x=20,
    offset_y=20,
    reticle_file="mods/raksa/files/wands/matwand/brushes/40_tri_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/40_tri_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/40_tri_icon.png",
  },
  {
    name="40px triangle-right brush",
    offset_x=20,
    offset_y=20,
    reticle_file="mods/raksa/files/wands/matwand/brushes/40_trir_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/40_trir_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/40_trir_icon.png",
  },
  {
    name="40px triangle-down brush",
    offset_x=20,
    offset_y=20,
    reticle_file="mods/raksa/files/wands/matwand/brushes/40_trid_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/40_trid_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/40_trid_icon.png",
  },
  {
    name="40px triangle-left brush",
    offset_x=20,
    offset_y=20,
    reticle_file="mods/raksa/files/wands/matwand/brushes/40_tril_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/40_tril_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/40_tril_icon.png",
  },
  {
    name="40px circular brush",
    offset_x=20,
    offset_y=20,
    reticle_file="mods/raksa/files/wands/matwand/brushes/40_cir_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/40_cir_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/40_cir_icon.png",
  },
  {
    name="Cauldron",
    offset_x=12,
    offset_y=13,
    reticle_file="mods/raksa/files/wands/matwand/brushes/cauldron_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/cauldron_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/cauldron_icon.png",
  },
  {
    name="Small Radial Expander",
    desc=_radial_warning,
    offset_x=5,
    offset_y=5,
    reticle_file="mods/raksa/files/wands/matwand/brushes/radial_xs_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/radial_xs_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/radial_xs_icon.png",
    is_filler_tool=true,
  },
  {
    name="Medium Radial Expander",
    desc=_radial_warning,
    offset_x=5,
    offset_y=5,
    reticle_file="mods/raksa/files/wands/matwand/brushes/radial_s_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/radial_s_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/radial_s_icon.png",
    is_filler_tool=true,
  },
  {
    name="Large Radial Expander",
    desc=_radial_warning,
    offset_x=5,
    offset_y=5,
    reticle_file="mods/raksa/files/wands/matwand/brushes/radial_m_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/radial_m_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/radial_m_icon.png",
    is_filler_tool=true,
  },
  {
    name="Huge Radial Expander",
    desc=_radial_warning,
    offset_x=5,
    offset_y=5,
    reticle_file="mods/raksa/files/wands/matwand/brushes/radial_l_reticle.png",
    brush_file="mods/raksa/files/wands/matwand/brushes/radial_l_brush.png",
    icon_file="mods/raksa/files/wands/matwand/brushes/radial_l_icon.png",
    is_filler_tool=true,
  },
}