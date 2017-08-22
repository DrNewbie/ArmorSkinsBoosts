if not ModCore then
	log("[ERROR] BeardLib is not installed!")
	return
end

ModCore:new(ModPath .. "Config.xml", false, true):init_modules()

Announcer:AddHostMod('Armor Skins Boosts, (http://modwork.shop/20721)')