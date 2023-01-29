function PLUGIN:EntityTakeDamage(target, damageInfo)
	local targetIsPlayer = target:IsPlayer()
	local attacker = damageInfo:GetAttacker()

	if (attacker:IsPlayer() and (targetIsPlayer or target:IsNPC() or target:IsNextBot())) then
		local character = attacker:GetCharacter()

		if (character) then
			local weaponStats = WEAPON_STATS[attacker:GetActiveWeapon():GetClass()]

			if (weaponStats) then
				local rangePenalty = 0
				local range = weaponStats["range"] * 39.37
				local rangeSqr = range * range
				local attribGain = math.min(50, character:GetAttribute("wep", 0) - weaponStats["attrib"])
				local distance = (attacker:GetPos() - target:GetPos()):LengthSqr()
				
				if (distance > rangeSqr) then
					rangePenalty = math.max(-25, rangeSqr - distance)
				end

				local chance = math.random(0, 100) + attribGain + rangePenalty

				if (chance >= 50) then
					attacker:ChatNotifyLocalized("targetHit", targetIsPlayer and target:Name() or L(target:GetClass(), attacker))
					if (targetIsPlayer) then target:ChatNotifyLocalized("selfHit", attacker:GetName()) end

					damageInfo:SetDamage(weaponStats["damage"] - (distance * 0.000001))
				else
					return true
				end
			end
		end
	end
end
