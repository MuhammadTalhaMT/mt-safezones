
local ped = PlayerPedId()

for k, v in pairs(Config.Zones) do 


local point = lib.points.new({
    coords = v.Pos,
    radius = v.Radius,
})

function point:onEnter()
if v.Notification then 
    lib.showTextUI(v.Title, {
        position = "top-center",
        icon = 'shield',
        style = {
            borderRadius = 0,
            backgroundColor = '#48BB78',
            color = 'white'
        }
    })
end
if Config.Discord then
    TriggerServerEvent("mt-safezone:log", true, k)
end
end
 
function point:onExit()

    local vehicle = GetVehiclePedIsIn(ped, false)
 if v.Notification then 
    lib.hideTextUI()
 end
    TriggerServerEvent("mt-safezone:log", false, k)
    SetVehicleMaxSpeed(vehicle, 1000.0)
end
 
function point:inside()

    local vehicle = GetVehiclePedIsIn(ped, false)

if v.DisableWeapons then 
    NetworkSetFriendlyFireOption(false)
    SetEntityCanBeDamaged(vehicle, false)
    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
    DisablePlayerFiring(ped, true)
    SetPlayerCanDoDriveBy(ped, false)
    DisableControlAction(2, 37, true)
    DisableControlAction(0, 106, true)
    DisableControlAction(0, 24, true)
    DisableControlAction(0, 69, true)
    DisableControlAction(0, 70, true)
    DisableControlAction(0, 92, true)
    DisableControlAction(0, 45, true)
    DisableControlAction(0, 80, true)
    DisableControlAction(0, 140, true)
    DisableControlAction(0, 250, true)
    DisableControlAction(0, 263, true)
    DisableControlAction(0, 114, true)
    DisableControlAction(0, 257, true)
    DisableControlAction(0, 331, true)
    DisableControlAction(0, 68, true)
    DisableControlAction(0, 257, true)
    DisableControlAction(0, 263, true)
    DisableControlAction(0, 264, true)
    if IsDisabledControlJustPressed(2, 37) then
        SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
    end
    if IsDisabledControlJustPressed(0, 106) then 
        SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
    end
end

if v.SpeedLimit then
    local val = 2.237
    local limit = v.MaxSpeed/val
    SetVehicleMaxSpeed(vehicle, limit)
end 

if v.AFK then 
    currentPos = GetEntityCoords(ped, true)

    if currentPos == prevPos then
        if time > 0 then

            time = time - 1
        else
            TriggerServerEvent("mt-safezone:AFKkick")
        end
    else
        time = v.AFKTimer
    end

    prevPos = currentPos
    Wait(1000)
end 

end 

end
