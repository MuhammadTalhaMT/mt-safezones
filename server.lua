
function sendToDiscord(color, name, message, footer)
    local embed = {
              {
                  ["color"] = color,
                  ["title"] =  name,
                  ["description"] = message,
                  ["footer"] = {
                      ["text"] = footer,
                  },
              }
          }
      
        PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("mt-safezone:log")
AddEventHandler("mt-safezone:log", function(status, name)
    local idJ = source
 if status then 
    sendToDiscord(16753920, "Entered SafeZone at "..name, "**Player Name: **" ..GetPlayerName(idJ), "MT-SAFEZONES")
else 
    sendToDiscord(16753920, "Exited SafeZone at "..name, "**Player Name: **" ..GetPlayerName(idJ), "MT-SAFEZONES")
end
end)

RegisterServerEvent("mt-safezone:AFKkick")
AddEventHandler("mt-safezone:AFKkick", function(status)
    local idJ = source
    sendToDiscord(16753920, "AFK Kick", "**Player Name: **" ..GetPlayerName(idJ), "MT-SAFEZONES")
    DropPlayer(source, Config.AFKMessage)
end)
