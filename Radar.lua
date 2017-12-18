local mm = Minimap

local f = CreateFrame("Frame")

local update = function()
	local mods = IsShiftKeyDown() and IsControlKeyDown()
	
	mm:EnableMouse(mods)
	mm:EnableMouseWheel(mods)
	-- if mods then mm:Show() else mm:Hide() end
end

local init = function()
	for i = 1, mm:GetNumChildren() do
	  local child = select(i, mm:GetChildren())
	  if child then
		  local from, anchor, to, x, y = child:GetPoint()
		  child:SetPoint(from, Minimap:GetParent(), to, x, y)
		  child:SetParent(Minimap:GetParent())
		  child:Hide()
		end
	end
	mm:GetParent():Hide()

	mm:SetParent(UIParent)
	mm:SetPoint("CENTER", UIParent, "CENTER", 0, -40)
	mm:SetAlpha(0)
	mm:SetSize(350, 350)
	mm:EnableMouse(false)
	mm:EnableMouseWheel(false)


	mm:SetArchBlobRingScalar(0)
	mm:SetArchBlobRingAlpha(0)
	mm:SetQuestBlobRingScalar(0)
	mm:SetQuestBlobRingAlpha(0)

	f:SetScript("OnUpdate", update)
end

f:SetScript("OnUpdate", init)
