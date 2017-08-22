dofile("mods/Armor Skins Boosts/Load.lua")

Hooks:Add("LocalizationManagerPostInit", "ArmorBoosts_loc", function(loc)
	local _INFO = {
		["armor_skins_boost_dodge"] = "- Dodge +%d%%",
		["armor_skins_boost_concealment"] = "- Concealment +%d%%",
		["armor_skins_boost_movement"] = "- Movement +%d%%",
		["armor_skins_boost_armor"] = "- Armor +%d%%",
		["armor_skins_boost_stamina"] = "- Stamina +%d%%",
		["armor_skins_boost_damage_shake"] = "- Shake +%d%%"
	}
	for skins_name, skins_datas in pairs(tweak_data.economy.armor_skins) do
		if skins_datas and skins_datas.body_armor then
			local _desc_data = loc:text(skins_datas.desc_id)
			for i = 1, 7 do
				_desc_data = _desc_data .. "\n(".. loc:text("bm_armor_level_" .. i) ..")" 
				for mod_name, mod_data in pairs(skins_datas.body_armor) do
					if skins_datas.body_armor[mod_name] then
						_desc_data = _desc_data .. " - " ..string.format(_INFO["armor_skins_boost_" .. mod_name], math.round(mod_data[i]*100))
					end
				end
				_desc_data = _desc_data .. "\n"
			end
			loc:add_localized_strings({
				[skins_datas.desc_id] = _desc_data
			})
		end
	end
end)