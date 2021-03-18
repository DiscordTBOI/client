require("constants")

require("config")

local DiscordTBOI = RegisterMod("DiscordTBOI", 1)

local Socket = require("socket")
local tcp = Socket.tcp()
tcp:settimeout(0.0001)

tcp:connect(HOST, PORT)

local rng = RNG()
rng:SetSeed(os.time(), 1)

local userId = rng:Next()

tcp:send(PACKET_SEND_CODES["AUTH"] .. userId)
Isaac.ConsoleOutput("DiscordTBOI: Your token is " .. userId)


DiscordTBOI:AddCallback(ModCallbacks.MC_POST_UPDATE, function (_mod)
    local packet, err = tcp:receive(1)
    if packet ~= nil then 
        local rest = tcp:receive()
        if PACKET_RECEIVE_CODES[packet] == nil then return end
        PACKET_RECEIVE_CODES[packet](rest)
    end
end)

