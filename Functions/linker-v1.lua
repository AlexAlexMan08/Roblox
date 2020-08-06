-- Thanks teefus for string match shit xoxo
function Scan(Id)
    if not Id then return error("No asset ID specified.") end
    for _, Asset in next, game:GetObjects("rbxassetid://" .. Id) do
        if not Asset:IsA("ModuleScript") or not Asset.Name == "MainModule" then return print("Invalid asset required, Is there a ModuleScript named MainModule?") end
        
        local Id = tonumber(string.match(Asset.Source, "[%d]+"))
        
        if Id > 10 then
            rconsoleprint("\nhttps://roblox.com/library/" .. Id)
            setclipboard(Id)
            
            wait(0.01)
            Scan(Id)
        end
    end
end
