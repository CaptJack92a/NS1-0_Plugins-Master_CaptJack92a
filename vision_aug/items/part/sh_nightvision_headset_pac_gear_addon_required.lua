ITEM.name = "Thermal Vision and Target Finder Heatset [thermheadset]"
ITEM.partdata = { -- You can use PAC3 to setup the part.
	model = "models/warz/militnvg.mdl",
	bone = "ValveBiped.Bip01_Head1",
	position = Vector( -63, -13.35, 0 ),
	angle = Angle( -90, 0, -12 ),
	scale = Vector( 1, 1, 1 ),
	size = 1,
	--material = "",
	--skin = "",
	--bodygroup = ""
}
ITEM.model = Model("models/warz/militnvg.mdl")
ITEM.desc = "Heavy vision augmentation HEADSET."
ITEM.price = 4500

ITEM:Hook("Equip", function(itemTable, client, data, entity, index)



		function SCHEMA:HUDPaint()
		
local col = {}
col["$pp_colour_addr"] = 0.1
col["$pp_colour_addg"] = 0.15
col["$pp_colour_addb"] = 0.2
col["$pp_colour_brightness"] = 0.05
col["$pp_colour_contrast"] = 0.85
col["$pp_colour_colour"] = 0.75
col["$pp_colour_mulr"] = 0
col["$pp_colour_mulg"] = 0
col["$pp_colour_mulb"] = 0
DrawColorModify(col)
DrawSharpen(1,1)
surface.SetDrawColor(160,160,160,255)



		local client = LocalPlayer()

		for k, v in pairs(player.GetAll()) do
				if (v != client and v.character and v:GetPos():Distance(client:GetPos()) <= 2000) then
					local position = v:LocalToWorld(v:OBBCenter()):ToScreen()
					local x, y = position.x, position.y
					
					local mat = Material("models/wireframe")
					surface.SetDrawColor(255, 255, 255, 220)
					surface.SetMaterial(mat)
					surface.DrawTexturedRect(x - 10, y - 10, 20, 20)
					
				end
			end
		
	end
end)

ITEM:Hook("Unequip", function(itemTable, client, data, entity, index)
function SCHEMA:HUDPaint()
end
end)