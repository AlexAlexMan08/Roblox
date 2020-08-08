local previd = 0
local modulesScanned = 0
local function Scan(id, url, printAll)
    if not id then -- check if an asset id is passed
        rconsoleclear() 
        rconsoleerr("Error: No ID specified") 
    end
    
    for _,v in pairs(game:GetObjects("rbxassetid://" .. id)) do -- fetch the asset through game getobjects
        local id = tonumber(string.match(v.Source, "%d+")) -- return all numbers from the module bc why not
        
        if id > 10 then -- check if the id is more than 10
            rconsolewarn("Module Found: "..id)
            rconsolewarn("Scanned so far: "..modulesScanned.."")
            
            if printAll == true then -- check if printall argument is true
                if modulesScanned < 1 then -- makin it look op
                   rconsoleclear() 
                else
                    rconsoleprint("=-----------------------------=\n") -- looks cool
                end
                
                wait() -- also looks cooler 
            else
                rconsoleclear() -- clear bc console flood nasty
            end
            
            previd = id -- why not
            modulesScanned = modulesScanned + 1 -- increases every time the function is called
            
            Scan(id, url, printAll) -- call da function again bc hacking lol
        else
            if id == 0 and not modulesScanned == 0 then -- shit bc idk how else to detect this and im tired
                rconsoleclear() 
                rconsoleerr("Error: No linkers found!")
                return -- yep
            end
            
            if url or url == true then -- url argument
                rconsolewarn("Final ID: " .. previd)
                rconsolewarn("Copied module URL to clipboard!")
                rconsolewarn("Scanned IDs: " .. modulesScanned) -- number of linkers the bot went through
                setclipboard("https://roblox.com/library/" .. previd)
            else
                if previd == 4966675758 then local previd = 4966675758 .. " - T0PK3K (shitkek) Module" end -- funny easter egg, fuck topkek
                
                rconsolewarn("Final ID: " .. previd)
                rconsolewarn("Copied asset ID to clipboard!")
                rconsolewarn("Scanned IDs: " .. modulesScanned) -- ya
                setclipboard(previd)
            end
        end
    end
    
    return previd -- return the last successfully loaded module id
end
