local ChatService = game:GetService("Chat");
local Players = game:GetService("Players");


local function getMinors()
    local minors = {};
    for _,v in pairs(Players:GetPlayers()) do
        if v ~= Players.LocalPlayer then
            local str = ChatService:FilterStringAsync("2647", Players.LocalPlayer, v);
            if str:find("#") then
                minors[#minors + 1] = v;
            end
            wait(1)
        end
    end
    return minors;
end
