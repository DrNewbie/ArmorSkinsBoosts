function Load_ArmorSkinsBoosts()
	local _DATA_PATH = "mods/Armor Skins Boosts/data/"
	local _files = file.GetFiles(_DATA_PATH) or {}
	for _, _file_name in pairs(_files) do
		local _file = io.open(_DATA_PATH .. _file_name, "r")
		local _data = {}
		if _file then
			_data = json.decode(_file:read("*all"))
			_file:close()
			tweak_data.economy.armor_skins[_file_name] = tweak_data.economy.armor_skins[_file_name] or {}
			tweak_data.economy.armor_skins[_file_name].body_armor = tweak_data.economy.armor_skins[_file_name].body_armor or {}
			tweak_data.economy.armor_skins[_file_name].body_armor = _data
		end
	end
end

if tweak_data and tweak_data.economy and tweak_data.economy.armor_skins then
	Load_ArmorSkinsBoosts()
end

log(tostring(json.encode({dodge = {0.03, 0.03, 0.04, 0.04, 0.05, 0.05, 0.06}})))