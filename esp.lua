local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LP = Players.LocalPlayer

local roles = {}
local Murder, Sheriff, Hero


local function IsAlive(player)
	local data = roles[player.Name]
	if data and not data.Killed and not data.Dead then
		return true
	end
	return false
end
local function CreateHighlight()
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LP and player.Character and not player.Character:FindFirstChild("Highlight") then
			local highlight = Instance.new("Highlight")
			highlight.Name = "Highlight"
			highlight.FillTransparency = 0.5
			highlight.OutlineTransparency = 1
			highlight.Parent = player.Character
		end
	end
end
local function UpdateHighlights()
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LP and player.Character then
			local highlight = player.Character:FindFirstChild("Highlight")
			if highlight then
				if player.Name == Sheriff and IsAlive(player) then
					highlight.FillColor = Color3.fromRGB(0, 0, 225)
				elseif player.Name == Murder and IsAlive(player) then
					highlight.FillColor = Color3.fromRGB(225, 0, 0)
				elseif player.Name == Hero and IsAlive(player) and not IsAlive(Players:FindFirstChild(Sheriff)) then
					highlight.FillColor = Color3.fromRGB(255, 250, 0)
				else
					highlight.FillColor = Color3.fromRGB(0, 225, 0)
				end
			end
		end
	end
end



RunService.RenderStepped:Connect(function()
	local roleData = ReplicatedStorage:FindFirstChild("GetPlayerData", true)
	if roleData then
		roles = roleData:InvokeServer()

		Murder, Sheriff, Hero = nil, nil, nil

		for name, data in pairs(roles) do
			if data.Role == "Murderer" then
				Murder = name
			elseif data.Role == "Sheriff" then
				Sheriff = name
			elseif data.Role == "Hero" then
				Hero = name
			end
		end

		CreateHighlight()
		UpdateHighlights()
	end
end)
