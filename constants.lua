

PACKET_SEND_CODES = {
    ["AUTH"] = 0 
}

PACKET_RECEIVE_CODES = {
    ["0"] = function (rest)
        Isaac.ExecuteCommand(rest)
    end
}