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

function DiscordTBOI:EventListener(_mod)
    local packet, err = tcp:receive()
    if packet ~= nil then 
        Isaac.ExecuteCommand(packet)
    end
end

DiscordTBOI:AddCallback(ModCallbacks.MC_POST_UPDATE, DiscordTBOI.EventListener)

