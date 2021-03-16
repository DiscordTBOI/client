local DiscordTBOA = RegisterMod("DiscordTBOA", 1);
-- local Socket = require("socket");

function DiscordTBOA:Immortality(_mod)
    local player = Isaac.GetPlayer(0)
    player:SetFullHearts()
end


DiscordTBOA:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, DiscordTBOA.Immortality, EntityType.ENTITY_PLAYER)

