function PLUGIN:InitializedPlugins()
	for k, v in pairs(ix.item.list) do
		local weaponStats = WEAPON_STATS[v.class]

		if (weaponStats) then
			v.PopulateTooltip = function(item, tooltip)
				if (item:GetData("equip")) then
					local name = tooltip:GetRow("name")
					name:SetBackgroundColor(derma.GetColor("Success", tooltip))
				end

				local stats = tooltip:AddRowAfter("description", "stats")
				stats:SetBackgroundColor(derma.GetColor("Info", tooltip))
				stats:SetText(L("weaponStats", weaponStats["range"],
					weaponStats["attrib"], weaponStats["damage"]))
				stats:SizeToContents()
			end
		end
	end
end
