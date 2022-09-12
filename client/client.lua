-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPS = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("dz_tunning",cRP)
vSERVER = Tunnel.getInterface("dz_tunning")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
-----------------------------------------------------------------------------------------------------------------------------------------
local nui = false;
-----------------------------------------------------------------------------------------------------------------------------------------
-- NUI
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback("Spoiler", function(number)
  SetVehicleModKit(veh, 0)
  SetVehicleMod(veh, 0, number, false)
end)
RegisterNUICallback("Bumper_F", function(number)
  SetVehicleModKit(veh, 0)
  SetVehicleMod(veh, 1, number, false)
end)
RegisterNUICallback("Bumper_R", function(number)
  SetVehicleModKit(veh, 0)
  SetVehicleMod(veh, 2, number, false)
end)
RegisterNUICallback("Skirt", function(number)
  SetVehicleModKit(veh, 0)
  SetVehicleMod(veh, 3, number, false)
end)
RegisterNUICallback("Exhaust", function(number)
  SetVehicleModKit(veh, 0)
  SetVehicleMod(veh, 4, number, false)
end)
RegisterNUICallback("Chassis", function(number)
  SetVehicleModKit(veh, 0)
  SetVehicleMod(veh, 5, number, false)
end)
RegisterNUICallback("Grill", function(number)
  SetVehicleModKit(veh, 0)
  SetVehicleMod(veh, 6, number, false)
end)
RegisterNUICallback("Bonnet", function(number)
  SetVehicleModKit(veh, 0)
  SetVehicleMod(veh, 7, number, false)
end)
RegisterNUICallback("Wing_L", function(number)
  SetVehicleModKit(veh, 0)
  SetVehicleMod(veh, 8, number, false)
end)
RegisterNUICallback("Wing_R", function(number)
  SetVehicleModKit(veh, 0)
  SetVehicleMod(veh, 9, number, false)
end)
RegisterNUICallback("Roof", function(number)
  SetVehicleModKit(veh, 0)
  SetVehicleMod(veh, 10, number, false)
end)
RegisterNUICallback("Engine", function(number)
end)
RegisterNUICallback("Brakes", function(number)
end)
RegisterNUICallback("Turbo", function(number)
end)
RegisterNUICallback("Suspension", function(number)
end)
RegisterNUICallback("Transmission", function(number)
end)
RegisterNUICallback("Armour", function(number)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- COMMANDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("car", function(sorce, args)
  local vehicle = args[2]
  local carPaint = colors.matte["Black"]
  local veh = spawnVeh(vehicle, true)
  SetVehicleColours(veh, carPaint, carPaint)
end)
RegisterCommand("tunning", function(sorce, args)
  local veh = GetVehiclePedIsIn(PlayerPedId(), false)
  if veh then
    SetVehicleModKit(veh, 0)
    ApplyVehicleMod(veh, 11, 2)
    ApplyVehicleMod(veh, 12, 2)
    ApplyVehicleMod(veh, 13, 2)
    ApplyVehicleMod(veh, 18, true)
  end
end)
RegisterCommand("fix",function(source,args)
  local veh = GetVehiclePedIsIn(PlayerPedId(), false)
  SetVehicleFixed(veh)
  SetVehicleEngineHealth(veh, 1000.0)
end)
RegisterCommand("extras",function(source,args)
  local veh = GetVehiclePedIsIn(PlayerPedId(), false)
  for id=0, 20 do
    if DoesExtraExist(veh, id) then
      SetVehicleExtra(veh, id, 1) -- p3 should be 0 for off or 1 for on
    end
  end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function NuiAction()
    nui = not nui
    if nui then
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = "showMenu"
        })
    else
        SetNuiFocus(false, false)
        SendNUIMessage({
            action = "hideMenu"
        })
    end
end
