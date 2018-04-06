local mm = Minimap

local f = CreateFrame("Frame")

local update = function()
	if IsShiftKeyDown() and IsControlKeyDown() then
		mm:EnableMouse(true)
		mm:EnableMouseWheel(true)
		-- mm:Show()
	else
		mm:EnableMouse(false)
		mm:EnableMouseWheel(false)
		-- mm:Hide()
	end
end

local init = function()
	for i = 1, mm:GetNumChildren() do
	  local child = select(i, mm:GetChildren())
	  if child then
		  local from, anchor, to, x, y = child:GetPoint()
		  child:SetParent(MinimapCluster)
		end
	end
	MinimapCluster:Hide()
	MinimapBackdrop:Hide()

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
