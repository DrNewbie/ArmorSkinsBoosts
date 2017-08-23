dofile("mods/Armor Skins Boosts/Load.lua")

function PlayerDamage:set_regenerate_timer_to_max()
	local armor_skins_data = Get_Current_ArmorSkinsBoosts()
	local mul = managers.player:body_armor_regen_multiplier(alive(self._unit) and self._unit:movement():current_state()._moving, self:health_ratio())
	self._regenerate_timer = tweak_data.player.damage.REGENERATE_TIME * mul
	self._regenerate_timer = self._regenerate_timer * managers.player:upgrade_value("player", "armor_regen_time_mul", 1)
	if armor_skins_data and armor_skins_data.body_armor then
		self._regenerate_timer = self._regenerate_timer * (1-(armor_skins_data.body_armor.armor_regen or 0))
	end
	self._regenerate_speed = self._regenerate_speed or 1
	self._current_state = self._update_regenerate_timer
end