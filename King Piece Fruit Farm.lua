
print("Started")

wait()

game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/CrimsonicDemon/Scripts/main/King%20Piece%20Fruit%20Farm.lua', true))()")
    end
end)

local Found = false
local Things = game.Workspace.AllspawnDF:GetChildren()

for i, Thing in ipairs(Things) do
    if Thing:IsA("Tool") then
        local ThingDescendants = Thing:GetDescendants()
        for i, Child in ipairs(ThingDescendants) do
            if Child:IsA("Part") or Child:IsA("MeshPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.Position = Child.Position
                print("FRUIT FOUND!!!")
                Found = true
                break
            end
        end
    end
end

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

mouse.KeyDown:connect(function(key)
    if key:lower() == "e" or key:upper() == "E" then
        while wait() do
            local Potential = {}
            local HttpService = game:GetService("HttpService")
            for I,V in ipairs(HttpService:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
                if type(V) == "table" and V.maxPlayers > V.playing and V.id ~= game.JobId then
                    table.insert(Potential, V.id)
                end
            end
            if #Potential > 0 then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Potential[math.random(1, #Potential)])
            else
                error("No Server Found")      
            end
        end
    end
end)

if Found == false then 
    while wait() do
        local Potential = {}
        local HttpService = game:GetService("HttpService")
        for I,V in ipairs(HttpService:JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
            if type(V) == "table" and V.maxPlayers > V.playing and V.id ~= game.JobId then
                table.insert(Potential, V.id)
            end
        end
        if #Potential > 0 then
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, Potential[math.random(1, #Potential)])
        else
            error("No Server Found")      
        end
    end
end
