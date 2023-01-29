ITEM.name = "EMP"
ITEM.description = "Small EMP Device what can open forcefields and combine locks."
ITEM.model = "models/weapons/w_emptool.mdl"

function ITEM:OnInstanced(invID, x, y, item)
	if item then
		item:SetData("remaining", 4)
	end
end

if (CLIENT) then
	function ITEM:PopulateTooltip(tooltip)
		local panel = tooltip:AddRowAfter( "name", "remaining" )
		panel:SetText( "EMP Have " .. self:GetData("remaining", 4) .. " usage" )
		panel:SizeToContents()
	end
end

ITEM.functions.Use = {
	OnRun = function(itemTable)
		local client = itemTable.player
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector() * 96
			data.filter = client
		local target = util.TraceLine(data).Entity
		for _, v in ipairs(ents.FindByClass("ix_combinelock")) do
			if (target == v.door) then
				if (IsValid(target) and target:IsDoor() and target:IsLocked()) then
					local partner = target:GetDoorPartner()
					target:EmitSound("AlyxEMP.Discharge")
					target:Fire("open", "", 0)
					target:Fire("setanimation", "open", 0)
					target:Fire("unlock", "", 0)
					if IsValid(partner) then
						partner:Fire("open")
						partner:Fire("setanimation", "open", 0)
						partner:Fire("unlock", "", 0)
					end
					target:EmitSound("doors/latchunlocked1.wav")
					v:SetLocked(false)
					client:Notify("Success.")

					itemTable:SetData("remaining", itemTable:GetData("remaining", 4) - 1)
				else
					client:Notify("Can't hack this.")
				end

				if itemTable:GetData("remaining", 4) <= 0 then
					

					return true
				end

				return false
			end
		end

		for _, v in ipairs(ents.FindByClass("ix_unionlock")) do
			if (target == v.door) then
				if (IsValid(target) and target:IsDoor() and target:IsLocked()) then
					local partner = target:GetDoorPartner()
					target:EmitSound("AlyxEMP.Discharge")
					target:Fire("open", "", 0)
					target:Fire("setanimation", "open", 0)
					target:Fire("unlock", "", 0)
					if IsValid(partner) then
						partner:Fire("open")
						partner:Fire("setanimation", "open", 0)
						partner:Fire("unlock", "", 0)
					end
					target:EmitSound("doors/latchunlocked1.wav")
					v:SetLocked(false)
					client:Notify("Success.")

					itemTable:SetData("remaining", itemTable:GetData("remaining", 4) - 1)
				else
					client:Notify("Can't hack this.")
				end

				if itemTable:GetData("remaining", 4) <= 0 then
					return true
				end

				return false
			end
		end

		for _, v in ipairs(ents.FindByClass("ix_apartlock")) do
			if (target == v.door) then
				if (IsValid(target) and target:IsDoor() and target:IsLocked()) then
					local partner = target:GetDoorPartner()
					target:EmitSound("AlyxEMP.Discharge")
					target:Fire("open", "", 0)
					target:Fire("setanimation", "open", 0)
					target:Fire("unlock", "", 0)
					if IsValid(partner) then
						partner:Fire("open")
						partner:Fire("setanimation", "open", 0)
						partner:Fire("unlock", "", 0)
					end
					target:EmitSound("doors/latchunlocked1.wav")
					v:SetLocked(false)
					client:Notify("Success.")

					itemTable:SetData("remaining", itemTable:GetData("remaining", 4) - 1)
				else
					client:Notify("Can't hack this.")
				end

				if itemTable:GetData("remaining", 4) <= 0 then
					return true
				end

				return false
			end
		end

		if (IsValid(target) and target:IsDoor() and target:GetClass() == "func_door" and !target:HasSpawnFlags(256) and !target:HasSpawnFlags(1024)) then
			local partner = target:GetDoorPartner()
			target:EmitSound("AlyxEMP.Discharge")
			target:Fire("open", "", 0)
			target:Fire("setanimation", "open", 0)
			target:Fire("unlock", "", 0)
			if IsValid(partner) then
				partner:Fire("open")
				partner:Fire("setanimation", "open", 0)
				partner:Fire("unlock", "", 0)
			end
			client:Notify("Success.")

			itemTable:SetData("remaining", itemTable:GetData("remaining", 4) - 1)
		elseif (IsValid(target) and target:GetClass() == "ix_forcefield" and target:GetMode() != 1) then
			target:EmitSound("AlyxEMP.Discharge")
			target:SetMode(1)
			target:SetSkin(1)
			target.dummy:SetSkin(1)
			target:EmitSound("npc/turret_floor/die.wav")
			client:Notify("Success.")

			itemTable:SetData("remaining", itemTable:GetData("remaining", 4) - 1)
		else
			client:Notify("Can't hack this.")
		end

		if itemTable:GetData("remaining", 4) <= 0 then
			return true
		end

		return false
		end,
	OnCanRun = function(itemTable)
		return !IsValid(itemTable.entity)
	end
}