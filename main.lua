require("constants")
<<<<<<< HEAD
=======
require("config")
>>>>>>> 5618dbe08556b17383c8a2567158bdcd3fafbd50
local DiscordTBOI = RegisterMod("DiscordTBOI", 1)

local Socket = require("socket")
local tcp = Socket.tcp()
tcp:settimeout(0.0001)
<<<<<<< HEAD
tcp:connect("127.0.0.1", 100)
=======
tcp:connect(HOST, PORT)
>>>>>>> 5618dbe08556b17383c8a2567158bdcd3fafbd50
Isaac.ConsoleOutput("DiscordTBOI: Connected to server")

local rng = RNG()
rng:SetSeed(os.time(), 1)

local userId = rng:Next()

tcp:send(PACKET_SEND_CODES["AUTH"] .. userId)
Isaac.ConsoleOutput("DiscordTBOI: Your ID is" .. userId .. "\n")

function DiscordTBOI:Immortality(_mod)
    local player = Isaac.GetPlayer(0)
    player:SetFullHearts()
end

DiscordTBOI:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, DiscordTBOI.Immortality, EntityType.ENTITY_PLAYER)

function DiscordTBOI:EventListener(_mod)
    local packet, err = tcp:receive()
    if packet ~= nil then 
        Isaac.ExecuteCommand(packet)
    end
end

DiscordTBOI:AddCallback(ModCallbacks.MC_POST_UPDATE, DiscordTBOI.EventListener)

