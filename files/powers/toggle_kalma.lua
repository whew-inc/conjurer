dofile_once("mods/raksa/files/scripts/enums.lua")


function toggle_kalma()
  local player = get_player()
  if GlobalsGetBool(KALMA_IS_IMMORTAL) then
	damagecomponent = EntityGetFirstComponent(player, "DamageModelComponent")
	ComponentSetValue(damagecomponent, "invincibility_frames", 0)
	ComponentSetValue(damagecomponent, "fire_probability_of_ignition", 1)
	EntityRemoveTag(player, "polymorphable_NOT")
	
    GamePrint("You feel small and frail once again.")
  else
	damagecomponent = EntityGetFirstComponent(player, "DamageModelComponent")
	ComponentSetValue(damagecomponent, "invincibility_frames", 999999999)
	ComponentSetValue(damagecomponent, "fire_probability_of_ignition", 0)
	EntityAddTag(player, "polymorphable_NOT")
	
    GamePrint("You're feeling indestructible!")
  end

  GlobalsToggleBool(KALMA_IS_IMMORTAL)
end
