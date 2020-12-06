Citizen.CreateThread(function()
    local blip1 = AddBlipForCoord(-1384.3, -2837.99, 13.94)
    SetBlipSprite(blip1, 153)
end)

local markers = {
    {-1384.3, -2837.99, 13.94}
}

Citizen.CreateThread(function() 
    while true do 
        Citizen.Wait(1)
        for k, v in pairs(markers) do 
            local v1 = vector3(table.unpack(v))
            DrawMarker(25, v1.x,v1.y,v1.z -0.95, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 2.5, 255, 0, 0, 150, 0, 0, 2, 0, 0, 0, false)
            if Vdist2(GetEntityCoords(PlayerPedId()), v1) <= 1.4 then 
                alert('Press ~INPUT_VEH_HORN~ get medical help')
                if IsControlJustPressed(0, 51) then 
                    SetEntityHealth(PlayerPedId(), 200)
                    notify('~g~You have been healed')
                end
            end
        end
    end
end)

function alert(msg) 
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0,0,1,-1)
end

function notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end