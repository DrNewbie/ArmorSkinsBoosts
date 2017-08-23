dofile("mods/Armor Skins Boosts/Load.lua")

function PlayerManager:body_armor_value(category, override_value, default)
	local armor_data = tweak_data.blackmarket.armors[managers.blackmarket:equipped_armor(true, true)]
	local armor_skins_data = Get_Current_ArmorSkinsBoosts()
	local _ans = self:upgrade_value_by_level("player", "body_armor", category, {})[override_value or armor_data.upgrade_level] or default or 0
	if armor_skins_data and armor_skins_data.body_armor then
		override_value = override_value or 1
		if armor_skins_data.body_armor[category] and armor_skins_data.body_armor[category][override_value] then
			_ans = _ans + armor_skins_data.body_armor[category][override_value]
		end
	end
	return _ans
end