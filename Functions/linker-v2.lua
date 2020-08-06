local previd = 0
local function Scan(id, url)
    assert(id, "No ID specified.")
    
    for _,v in pairs(game:GetObjects("rbxassetid://" .. id)) do
        assert(v:IsA("ModuleScript"), "Invalid Module: "..id)
        
        local id = tonumber(string.match(v.Source, "%d+"))
        if id > 1 then
            rconsoleprint("Module Found: "..id.."\n")
            previd = id
            wait()
            rconsoleclear()
            Scan(id, url)
        else
            if url or url == true then
                rconsolewarn("Copied final Module URL to Clipboard!")
                setclipboard("https://roblox.com/library/" .. previd)
                return
            else
                rconsolewarn("Copied final Module asset id to Clipboard!")
                setclipboard(previd)
            end
        end
    end
end
