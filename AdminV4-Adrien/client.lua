ESX = nil
local PlayerData = {}
local colors = {"~p~", "~r~","~o~","~y~","~c~","~g~","~b~"}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
end)

godmode, visible, gamerTags, freeze = false, false, false, {}, false




---------------------------------------------------------------- Menus ----------------------------------------------------------------

RMenu.Add('MenuAdminAdrien', 'main', RageUI.CreateMenu("Menu Admin", " "))
RMenu:Get('MenuAdminAdrien', 'main'):SetSubtitle("Connecté en tant que ~b~".. GetPlayerName(PlayerId()) .. '')
RMenu.Add('MenuAdminAdrien', 'main3', RageUI.CreateSubMenu(RMenu:Get('MenuAdminAdrien', 'main'), "Actions Personelles", " "))
RMenu.Add('menu', 'gestion', RageUI.CreateSubMenu(RMenu:Get('MenuAdminAdrien', 'main'), "Joueurs", " "))
RMenu.Add('menu', 'options', RageUI.CreateSubMenu(RMenu:Get('menu', 'gestion'), "Gestion du Joueur", "Actions Disponibles"))
RMenu.Add('MenuAdminAdrien', 'main4', RageUI.CreateSubMenu(RMenu:Get('MenuAdminAdrien', 'main'), "Actions Véhicules", " "))
RMenu.Add('MenuAdminAdrien', 'main5', RageUI.CreateSubMenu(RMenu:Get('MenuAdminAdrien', 'main'), "Give d'Armes", " "))
RMenu.Add('ped', 'main', RageUI.CreateSubMenu(RMenu:Get('MenuAdminAdrien', 'main'), "Peds", "Menu peds"))
RMenu.Add('MenuAdminAdrien', 'main6', RageUI.CreateSubMenu(RMenu:Get('MenuAdminAdrien', 'main'), "Menu Touches", " "))
RMenu.Add('MenuAdminAdrien', 'main7', RageUI.CreateSubMenu(RMenu:Get('MenuAdminAdrien', 'main'), "Actions Staf2f", " "))
RMenu.Add('MenuAdminAdrien', 'main7', RageUI.CreateSubMenu(RMenu:Get('MenuAdminAdrien', 'main'), "Actions Staff", " "))
RMenu.Add('MenuAdminAdrien', 'apparence', RageUI.CreateSubMenu(RMenu:Get('MenuAdminAdrien', 'main'), "111", " "))
RMenu.Add('MenuAdminAdrien', 'temps', RageUI.CreateSubMenu(RMenu:Get('MenuAdminAdrien', 'main'), "Temps", " "))
RMenu.Add('MenuAdminAdrien', 'infos', RageUI.CreateSubMenu(RMenu:Get('MenuAdminAdrien', 'main'), "Vos Informations", " "))

---------------------------------------------------------------- RageUI Liste ----------------------------------------------------------------

local affichername = false
local ShowName = false
local gamerTags = {}
local SelectedPlayer = nil
local Freeze = false
local Spectating = false
local cinematique = false





local Menu = {

    action = {

        '~b~Argent Liquide',
        '~b~Argent en Banque',
        '~b~Argent Sale',
    },


    list = 1
}


local Menu2 = {

    action = {

        'Mitraillette',
        'Mitraillette légère',
        'Pistolet mitrailleur',
        'Mitraillette d\'assaut',
        'ADP De Combat',
        'Sulfateuse Gusenberg',
    },


    list = 1
}


local Menu3 = {

    action = {

        'Pistolet',
        'Pistolet de Combat',
        'Pistolet Calibre 50',
        'Pistolet Perforant',
        'Pistolet Paralysant',
        'Pistolet de Détresse',
        'Revolver',
        'Pétoire',
    },


    list = 1
}


local Menu4 = {

    action = {

        'Fusil d\'Assault',
        'Carabine',
        'Fusil Amélioré',
        'Carabine Spéciale',
        'Fusil d\'Assault Bullpup',
        'Fusil Compact',
    },


    list = 1
}

local Menu5 = {

    action = {

        'Fusil à Pompe',
        'Fusil à Canon Scié',
        'Fusil à Pompe d\'Assault', 
        'Fusil à Pompe Bullup',        
        'Mousquet',
        'Fusil à Pompe Lourd',
        'Fusil à Double Canon',
        'Fusil à Pompe Compact',
    },


    list = 1
}


local Menu6 = {

    action = {

        'Couteau',
        'Batte de Baseball',
        'Cran d\'Arrêt ',
        'Machette',
        'Poing Americain',     
        'Matraque',
        'Lampe de Poche',
        'Pied de Biche',
        'Dague Antique',
        'Tesson de Bouteille',
        'Club de Golf',
        'Marteau',
        'Hachette',
        'Clé Anglaise',
        'Queue de Billard',
    },


    list = 1
}

local Menu7 = {

    action = {

        'Fusil de Précision',
        'Fusil de Précision Lourd',
        'Fusil à Lunette',
    },


    list = 1
}

local Menu8 = {

    action = {

        'Singe',
        'Aigle',
        'Chat',
        'Coyotte',
        'Sanglier',
        'Porc',
        'Biche',
    },


    list = 1
}

local Menu9 = {

    action = {

        '~b~Policier (LSPD)',
        '~b~Policier (Sheriff)',
        '~b~Agent de Sécurité',
        '~b~Policier (SWAT)',
        '~b~Militaire',
        '~r~Chirurgien',
        '~r~Ambulancier',
        '~m~Armurier',

    },


    list = 1
}

local Menu10 = {

    action = {

        '~b~Policier (LSPD)',
        '~b~Policier (Sheriff)',
        '~r~Infirmière',
        'Danseuse',
    },


    list = 1
}


local Menu11 = {

    action = {

        '~p~Ballas 1',
        '~p~Ballas 2',
        '~p~Ballas 3',
        '~g~Famillies 1',
        '~g~Famillies 2',
        '~g~Famillies 3',
        '~y~Vagos 1',
        '~y~Vagos 2',
        '~y~Vagos 3',
        '~m~Lost MC 1',
        '~m~Lost MC 2',
        '~m~Lost MC 3',
        '~b~Marabunta 1',
        '~b~Marabunta 2',
        '~b~Marabunta 3',
        '~c~Coréen',
    },


    list = 1
}



local Menu12 = {

    action = {

        '~p~Ballas',
        '~g~Famillies',
        '~y~Vagos',
        '~m~Lost MC',

    },


    list = 1
}

local Menu13 = {

    action = {

        'Franklin',
        'Michael',
        'Trevor',
        'Lester',
        'Tonya',



    },


    list = 1
}

---------------------------------------------------------------- Fonctions ----------------------------------------------------------------

local noclip = false
local noclip_speed = 1.0
local ServersIdSession = {}

Citizen.CreateThread(function()
    while true do
        Wait(500)
        for k,v in pairs(GetActivePlayers()) do
            local found = false
            for _,j in pairs(ServersIdSession) do
                if GetPlayerServerId(v) == j then
                    found = true
                end
            end
            if not found then
                table.insert(ServersIdSession, GetPlayerServerId(v))
            end
        end
    end
end)


Citizen.CreateThread( function()
    while true do
        Citizen.Wait(0)
        if drawInfo then
            local text = {}
            -- cheat checks
            local targetPed = GetPlayerPed(drawTarget)
            
            table.insert(text,"E pour stop spectate")
            
            for i,theText in pairs(text) do
                SetTextFont(0)
                SetTextProportional(1)
                SetTextScale(0.0, 0.30)
                SetTextDropshadow(0, 0, 0, 0, 255)
                SetTextEdge(1, 0, 0, 0, 255)
                SetTextDropShadow()
                SetTextOutline()
                SetTextEntry("STRING")
                AddTextComponentString(theText)
                EndTextCommandDisplayText(0.3, 0.7+(i/30))
            end
            
            if IsControlJustPressed(0,103) then
                local targetPed = PlayerPedId()
                local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))
    
                RequestCollisionAtCoord(targetx,targety,targetz)
                NetworkSetInSpectatorMode(false, targetPed)
    
                StopDrawPlayerInfo()
                
            end
            
        end
    end
end)

local hasCinematic = true
function openCinematique()
	hasCinematic = not hasCinematic
    if not hasCinematic then -- montrer
        TriggerEvent("ez_cinematique:cinematique", false)
        TriggerEvent("ui:off")
        TriggerEvent('ui:refresh')
		ESX.UI.HUD.SetDisplay(0.0)
		TriggerEvent('es:setMoneyDisplay', 0.0)
		TriggerEvent('esx_status:setDisplay', 0.0)
		DisplayRadar(false)
	elseif hasCinematic then -- cacher
		ESX.UI.HUD.SetDisplay(1.0)
		TriggerEvent('es:setMoneyDisplay', 1.0)
		TriggerEvent('esx_status:setDisplay', 1.0)
		DisplayRadar(true)
        TriggerEvent("ez_cinematique:cinematique", true)
        TriggerEvent("ui:on")
        TriggerEvent('ui:refresh')
	end
end

Citizen.CreateThread(function()
    while true do
        Config.GetPlayerMoney()
        Wait(2500)
    end
end)

RegisterNetEvent("solde:argent")
AddEventHandler("solde:argent", function(money, cash)
    PlayerMoney = tonumber(money)
end)




Citizen.CreateThread(function()
	
	while true do
		Citizen.Wait(4000)
		
		TriggerEvent('esx_status:getStatus', 'hunger', function(status)
			VM.Faim = status.val/1000000*100

		end)
		TriggerEvent('esx_status:getStatus', 'thirst', function(status)
			VM.Soif = status.val/1000000*100

		end)
		
	end

end)

VM = {
    ItemSelected = {},
    ItemSelected2 = {},
    WeaponData = {},
    Menu = false,
    Ped = PlayerPedId(),
    bank = nil,
    sale = nil,
    Faim = 0,
    Soif= 0,
    map = true,
    billing = {},
    visual = false,
    visual2 = false,
    visual3 = false,
    visual4 = false,
    visual5 = false,
    visual6 = false,
    visual7 = false,
    visual8 = false,
    visual9 = false,
    visual10 = false,
}


function SpectatePlayer(targetPed,target,name)
    local playerPed = PlayerPedId() -- yourself
    enable = true
    if targetPed == playerPed then enable = false end

    if(enable)then

        local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))

        RequestCollisionAtCoord(targetx,targety,targetz)
        NetworkSetInSpectatorMode(true, targetPed)
        DrawPlayerInfo(target)
        ESX.ShowNotification('~g~Mode spectateur en cours')
    else

        local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))

        RequestCollisionAtCoord(targetx,targety,targetz)
        NetworkSetInSpectatorMode(false, targetPed)
        StopDrawPlayerInfo()
        ESX.ShowNotification('~b~Mode spectateur arrêtée')
    end
end

function FullVehicleBoost()
	if IsPedInAnyVehicle(PlayerPedId(), false) then
		local vehicle = GetVehiclePedIsIn(PlayerPedId(), true)
		SetVehicleModKit(vehicle, 0)
		SetVehicleMod(vehicle, 14, 0, true)
		SetVehicleNumberPlateTextIndex(vehicle, 5)
		ToggleVehicleMod(vehicle, 18, true)
		SetVehicleColours(vehicle, 0, 0)
		SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
		SetVehicleModColor_2(vehicle, 5, 0)
		SetVehicleExtraColours(vehicle, 111, 111)
		SetVehicleWindowTint(vehicle, 2)
		ToggleVehicleMod(vehicle, 22, true)
		SetVehicleMod(vehicle, 23, 11, false)
		SetVehicleMod(vehicle, 24, 11, false)
		SetVehicleWheelType(vehicle, 12) 
		SetVehicleWindowTint(vehicle, 3)
		ToggleVehicleMod(vehicle, 20, true)
		SetVehicleTyreSmokeColor(vehicle, 0, 0, 0)
		LowerConvertibleRoof(vehicle, true)
		SetVehicleIsStolen(vehicle, false)
		SetVehicleIsWanted(vehicle, false)
		SetVehicleHasBeenOwnedByPlayer(vehicle, true)
		SetVehicleNeedsToBeHotwired(vehicle, false)
		SetCanResprayVehicle(vehicle, true)
		SetPlayersLastVehicle(vehicle)
		SetVehicleFixed(vehicle)
		SetVehicleDeformationFixed(vehicle)
		SetVehicleTyresCanBurst(vehicle, false)
		SetVehicleWheelsCanBreak(vehicle, false)
		SetVehicleCanBeTargetted(vehicle, false)
		SetVehicleExplodesOnHighExplosionDamage(vehicle, false)
		SetVehicleHasStrongAxles(vehicle, true)
		SetVehicleDirtLevel(vehicle, 0)
		SetVehicleCanBeVisiblyDamaged(vehicle, false)
		IsVehicleDriveable(vehicle, true)
		SetVehicleEngineOn(vehicle, true, true)
		SetVehicleStrong(vehicle, true)
		RollDownWindow(vehicle, 0)
		RollDownWindow(vehicle, 1)
		SetVehicleNeonLightEnabled(vehicle, 0, true)
		SetVehicleNeonLightEnabled(vehicle, 1, true)
		SetVehicleNeonLightEnabled(vehicle, 2, true)
		SetVehicleNeonLightEnabled(vehicle, 3, true)
		SetVehicleNeonLightsColour(vehicle, 0, 0, 255)
		SetPedCanBeDraggedOut(PlayerPedId(), false)
		SetPedStayInVehicleWhenJacked(PlayerPedId(), true)
		SetPedRagdollOnCollision(PlayerPedId(), false)
		ResetPedVisibleDamage(PlayerPedId())
		ClearPedDecorations(PlayerPedId())
		SetIgnoreLowPriorityShockingEvents(PlayerPedId(), true)
		for i = 0,14 do
			SetVehicleExtra(veh, i, 0)
		end
		SetVehicleModKit(veh, 0)
		for i = 0,49 do
			local custom = GetNumVehicleMods(veh, i)
			for j = 1,custom do
				SetVehicleMod(veh, i, math.random(1,j), 1)
			end
		end
	end
end

function no_clip()
    noclip = not noclip
    local ped = GetPlayerPed(-1)
    if noclip then -- activé
      SetEntityInvincible(ped, true)
      SetEntityVisible(ped, false, false)
      ESX.ShowAdvancedNotification("Administration", "", "NoClip : ~g~activé", "CHAR_STRETCH", 1) 
    else -- désactivé
      SetEntityInvincible(ped, false)
      SetEntityVisible(ped, true, false)
      ESX.ShowAdvancedNotification("Administration", "", "NoClip : ~r~désactivé", "CHAR_STRETCH", 1) 
    end
  end

  function ShowMarker()
	local ply = GetPlayerPed(-1)
	local pCoords = GetEntityCoords(ply, true)
    local veh = GetTargetedVehicle(pCoords, ply)
    if veh ~= 0 and GetEntityType(veh) == 2 then
        local coords = GetEntityCoords(veh)
        local x,y,z = table.unpack(coords)
        DrawMarker(2, x, y, z+1.5, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 0, 0, 255, 120, true, true, p19, true)
    end
end

function GetVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end

function StopDrawPlayerInfo()
    drawInfo = false
    drawTarget = 0
end


function GetTargetedVehicle(pCoords, ply)
    for i = 1, 200 do
        coordB = GetOffsetFromEntityInWorldCoords(ply, 0.0, (6.281)/i, 0.0)
        targetedVehicle = GetVehicleInDirection(pCoords, coordB)
        if(targetedVehicle ~= nil and targetedVehicle ~= 0)then
            return targetedVehicle
        end
    end
    return
end


   function Keyboardput(TextEntry, ExampleText, MaxStringLength)

	AddTextEntry('FMMC_KEY_TIP1', TextEntry .. ':')
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
	blockinput = true

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Citizen.Wait(0)
	end

	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Citizen.Wait(500)
		blockinput = false
		return result
	else
		Citizen.Wait(500)
		blockinput = false
		return nil
	end
end
  
  function getPosition()
    local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1),true))
    return x,y,z
  end
  
  function getCamDirection()
    local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(GetPlayerPed(-1))
    local pitch = GetGameplayCamRelativePitch()
  
    local x = -math.sin(heading*math.pi/180.0)
    local y = math.cos(heading*math.pi/180.0)
    local z = math.sin(pitch*math.pi/180.0)
  
    local len = math.sqrt(x*x+y*y+z*z)
    if len ~= 0 then
      x = x/len
      y = y/len
      z = z/len
    end
  
    return x,y,z
  end
  
  function isNoclip()
    return noclip
  end

  function KeyboardInput(TextEntry, ExampleText, MaxStringLength)

    AddTextEntry('FMMC_KEY_TIP1', TextEntry .. ':')
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLength)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end

function Notify(text)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(text)
	DrawNotification(false, true)
end

RegisterNetEvent("admin:Freeze")
AddEventHandler("admin:Freeze",function()

    FreezeEntityPosition(GetPlayerPed(-1), not Freeze)
    Freeze = not Freeze
end)


function admin_tp_marker()
    
    local playerPed = GetPlayerPed(-1)
    local WaypointHandle = GetFirstBlipInfoId(8)
    if DoesBlipExist(WaypointHandle) then
        local coord = Citizen.InvokeNative(0xFA7C7F0AADF25D09, WaypointHandle, Citizen.ResultAsVector())
        SetEntityCoordsNoOffset(playerPed, coord.x, coord.y, -199.5, false, false, false, true)
  ESX.ShowAdvancedNotification("Administration", "", "TP sur Marqueur : ~g~Réussi !", "CHAR_STRETCH", 1)                 
    else
  ESX.ShowAdvancedNotification("Administration", "", "~r~Aucun Marqueur !", "CHAR_STRETCH", 1)                  
    end
end

  function GiveCash()
    local amount = KeyboardInput("Somme", "", 8)

    if amount ~= nil then
        amount = tonumber(amount)
        
        if type(amount) == 'number' then
            TriggerServerEvent('Administration:GiveCash', amount)
        end
    end
end


function GiveBanque()
    local amount = KeyboardInput("Somme", "", 8)

    if amount ~= nil then
        amount = tonumber(amount)
        
        if type(amount) == 'number' then
            TriggerServerEvent('Administration:GiveBanque', amount)
        end
    end
end


function GiveND()
    local amount = KeyboardInput("Somme", "", 8)

    if amount ~= nil then
        amount = tonumber(amount)
        
        if type(amount) == 'number' then
            TriggerServerEvent('Administration:GiveND', amount)
        end
    end
end


function changer_skin()
    TriggerEvent('esx_skin:openSaveableMenu', source)
end



function admin_mode_fantome()
    invisible = not invisible
    local ped = GetPlayerPed(-1)
    
    if invisible then 
          SetEntityVisible(ped, false, false)
          ESX.ShowAdvancedNotification("Administration", "", "Invisibilité : ~g~activé", "CHAR_STRETCH", 1) 
      else
          SetEntityVisible(ped, true, false)
          ESX.ShowAdvancedNotification("Administration", "", "Invisibilité : ~r~désactivé", "CHAR_STRETCH", 1) 
    end
  end



  function admin_vehicle_flip()

    local player = GetPlayerPed(-1)
    posdepmenu = GetEntityCoords(player)
    carTargetDep = GetClosestVehicle(posdepmenu['x'], posdepmenu['y'], posdepmenu['z'], 10.0,0,70)
    if carTargetDep ~= nil then
            platecarTargetDep = GetVehicleNumberPlateText(carTargetDep)
    end
    local playerCoords = GetEntityCoords(GetPlayerPed(-1))
    playerCoords = playerCoords + vector3(0, 2, 0)
    
    SetEntityCoords(carTargetDep, playerCoords)
    
    ESX.ShowAdvancedNotification("Administration", "", "~g~Véhicule retourné", "CHAR_STRETCH", 1) 

end


function admin_godmode()
    godmode = not godmode
    local ped = GetPlayerPed(-1)
    
    if godmode then -- activé
          SetEntityInvincible(ped, true)
    ESX.ShowAdvancedNotification("Administration", "", "Invincibilité : ~g~activé", "CHAR_STRETCH", 1) 
      else
          SetEntityInvincible(ped, false)
    ESX.ShowAdvancedNotification("Administration", "", "Invincibilité : ~r~désactivé", "CHAR_STRETCH", 1) 
    end
  end
  local invincible = false

  function admin_tp_toplayer()
	local plyId = KeyboardInput("ID", "", "", 8)

	if plyId ~= nil then
		plyId = tonumber(plyId)
		
		if type(plyId) == 'number' then
			local targetPlyCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(plyId)))
			SetEntityCoords(plyPed, targetPlyCoords)
		end
	end
end

function admin_tp_playertome()
	local plyId = KeyboardInput("ID :", "", "", 8)

	if plyId ~= nil then
		plyId = tonumber(plyId)
		
		if type(plyId) == 'number' then
			local plyPedCoords = GetEntityCoords(plyPed)
			print(plyId)
			TriggerServerEvent('KorioZ-PersonalMenu:Admin_BringS', plyId, plyPedCoords)
		end
	end
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if service then


    
            if ShowName then
                local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
                for _, v in pairs(GetActivePlayers()) do
                    local otherPed = GetPlayerPed(v)
                
                    if otherPed ~= pPed then
                        if #(pCoords - GetEntityCoords(otherPed, false)) < 250.0 then
                            gamerTags[v] = CreateFakeMpGamerTag(otherPed, ('[%s] %s'):format(GetPlayerServerId(v), GetPlayerName(v)), false, false, '', 0)
                            SetMpGamerTagVisibility(gamerTags[v], 4, 1)
                        else
                            RemoveMpGamerTag(gamerTags[v])
                            gamerTags[v] = nil
                        end
                    end
                end
            else
                for _, v in pairs(GetActivePlayers()) do
                    RemoveMpGamerTag(gamerTags[v])
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if service then

            if ShowName then
                local pCoords = GetEntityCoords(GetPlayerPed(-1), false)
                for _, v in pairs(GetActivePlayers()) do
                    local otherPed = GetPlayerPed(v)
                
                    if otherPed ~= pPed then
                        if #(pCoords - GetEntityCoords(otherPed, false)) < 250.0 then
                            gamerTags[v] = CreateFakeMpGamerTag(otherPed, ('[%s] %s'):format(GetPlayerServerId(v), GetPlayerName(v)), false, false, '', 0)
                            SetMpGamerTagVisibility(gamerTags[v], 4, 1)
                        else
                            RemoveMpGamerTag(gamerTags[v])
                            gamerTags[v] = nil
                        end
                    end
                end
            else
                for _, v in pairs(GetActivePlayers()) do
                    RemoveMpGamerTag(gamerTags[v])
                end
            end

            for k,v in pairs(GetActivePlayers()) do
                if NetworkIsPlayerTalking(v) then
                    local pPed = GetPlayerPed(v)
                    local pCoords = GetEntityCoords(pPed)
                    DrawMarker(32, pCoords.x, pCoords.y, pCoords.z+1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 1, 2, 0, nil, nil, 0)
                end
            end
        end
    end
end)



  --------------------------------------------------------------------------------------------------------------------------------------------------------------

  
  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      if noclip then
        local ped = GetPlayerPed(-1)
        local x,y,z = getPosition()
        local dx,dy,dz = getCamDirection()
        local speed = noclip_speed
  
        SetEntityVelocity(ped, 0.0001, 0.0001, 0.0001)
  
        if IsControlPressed(0,32) then 
          x = x+speed*dx
          y = y+speed*dy
          z = z+speed*dz
        end
  
  
        if IsControlPressed(0,269) then 
          x = x-speed*dx
          y = y-speed*dy
          z = z-speed*dz
        end
  
        SetEntityCoordsNoOffset(ped,x,y,z,true,true,true)
      end
    end
  end)


---------------------------------------------------------------- Tenue Admin ----------------------------------------------------------------

  function aTenue()
    local model = GetEntityModel(GetPlayerPed(-1))
    TriggerEvent('skinchanger:getSkin', function(skin)
        if model == GetHashKey("mp_m_freemode_01") then
            clothesSkin = {
                ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                ['torso_1'] = 178,   ['torso_2'] = 9,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 31,
                ['pants_1'] = 77,   ['pants_2'] = 9,
                ['shoes_1'] = 55,   ['shoes_2'] = 9,
                ['helmet_1'] = 91,  ['helmet_2'] = 9,
                ['chain_1'] = 1,    ['chain_2'] = 0,
                ['mask_1'] = -1,  ['mask_2'] = 0,
                ['ears_1'] = 2,     ['ears_2'] = 0
            }
        else
            clothesSkin = {
                ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                ['torso_1'] = 178,   ['torso_2'] = 9,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['arms'] = 31,
                ['pants_1'] = 77,   ['pants_2'] = 9,
                ['shoes_1'] = 55,   ['shoes_2'] = 9,
                ['helmet_1'] = 91,  ['helmet_2'] = 9,
                ['chain_1'] = 1,    ['chain_2'] = 0,
                ['mask_1'] = -1,  ['mask_2'] = 0,
                ['ears_1'] = 2,     ['ears_2'] = 0
            }
        end
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
    end)
end




---------------------------------------------------------------- Menu Home ----------------------------------------------------------------


Citizen.CreateThread(function()
    while true do

                   RageUI.IsVisible(RMenu:Get('MenuAdminAdrien', 'main'), true, true, true, function()
                    RageUI.Checkbox("Activer le Mode Staff",nil, service,{},function(Hovered,Ative,Selected,Checked)
                        if (Selected) then
        
                            service = Checked
        
        
                            if Checked then
                                onservice = true
                                local head = RegisterPedheadshot(PlayerPedId())
                                while not IsPedheadshotReady(head) or not IsPedheadshotValid(head) do
                                    Wait(1)
                                end
                                headshot = GetPedheadshotTxdString(head)
                                aTenue()
                                RageUI.Text({
                                message = "~o~• Headway Roleplay •~s~ \nMode Staff Activé",
                                    time_display = 4555555555555
                                })        
                                
                            else
                                onservice = false
                                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                TriggerEvent('skinchanger:loadSkin', skin)
                                end)
                                RageUI.Text({
                                message = "~r~Mode Staff Désactivé",
                                    time_display = 2500
                                })          
                            end
                        end
                    end)
        
                    if onservice then

---------------------------------------------------------------- Check Box Activé - Menu Home ----------------------------------------------------------------

players = {}
for _, player in ipairs(GetActivePlayers()) do
    local ped = GetPlayerPed(player)
    table.insert( players, player )
end
RageUI.Separator(CouleurRandom.."- Il y a actuellement "..#players.." joueur(s) en ligne -")

                        RageUI.Button(CouleurRandom.."→~s~ Ouvrir le Panel Staff", nil, {RightLabel = CouleurRandom.."→→~s~"},true, function()
                        end, RMenu:Get('MenuAdminAdrien', 'main7'))

                        RageUI.Button(CouleurRandom.."→~s~ Ouvrir le Panel Personnel", nil, {RightLabel = CouleurRandom.."→→~s~"},true, function()
                        end, RMenu:Get('MenuAdminAdrien', 'main3'))

                        RageUI.Button(CouleurRandom.."→~s~ Ouvrir le Panel Véhicule", nil, {RightLabel = CouleurRandom.."→→~s~"},true, function()
                        end, RMenu:Get('MenuAdminAdrien', 'main4'))

                        RageUI.Button(CouleurRandom.."→~s~ Ouvrir le panel d'Informations", nil, {RightLabel = CouleurRandom.."→→~s~"},true, function()
                        end, RMenu:Get('MenuAdminAdrien', 'main6'))



                                                          

                    end


    end, function()
	end)

---------------------------------------------------------------- Gestions Joueurs ----------------------------------------------------------------

RageUI.IsVisible(RMenu:Get('menu', 'gestion'), true, true, true, function()
    for k,v in ipairs(ServersIdSession) do
        if GetPlayerName(GetPlayerFromServerId(v)) == "**Invalid**" then table.remove(ServersIdSession, k) end
        RageUI.Button(v.." - " ..GetPlayerName(GetPlayerFromServerId(v)), nil, {}, true, function(Hovered, Active, Selected)
            if (Selected) then
                IdSelected = v
            end
        end, RMenu:Get('menu', 'options'))
    end
end, function()
end)

RageUI.IsVisible(RMenu:Get('menu', 'options'), true, true, true, function()

    RageUI.Separator(CouleurRandom.."- Headway Roleplay - Action Administration -")
    if superadmin then
        RageUI.Button(CouleurRandom.."→~s~ Setjob le Joueur ", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
            if (Selected) then
                local job = KeyboardInput("Job ", "", 10)
                local grade = KeyboardInput("Grade ", "", 10)
                if job and grade then
                    ExecuteCommand("setjob "..IdSelected.. " " ..job.. " " ..grade)
                    ESX.ShowNotification("Vous avez setjob : ~g~"..job.. " " .. grade .. " ~b~" .. GetPlayerName(GetPlayerFromServerId(IdSelected)))
                else
                    ESX.ShowNotification("~r~Champ invalide, veuillez réessayer.")
                    RageUI.CloseAll()	
                end	
            end
        end)
    end

	RageUI.Checkbox(CouleurRandom.."→~s~ Freeze le Joueur", description, Frigo,{},function(Hovered,Ative,Selected,Checked)
        if Selected then
            Frigo = Checked
            if Checked then
                ESX.ShowNotification("Le Joueur à ~b~bien été Freeze~s~ ("..GetPlayerName(GetPlayerFromServerId(IdSelected))..")")
                TriggerEvent("admin:Freeze", IdSelected)
            else
                ESX.ShowNotification("Le joueur à ~b~bien été Unfreeze~s~ ("..GetPlayerName(GetPlayerFromServerId(IdSelected))..")")
                TriggerEvent("admin:Freeze", IdSelected)
            end
        end
    end)

    RageUI.Button(CouleurRandom.."→~s~ Se téléporter au Joueur", nil, {}, true, function(Hovered, Active, Selected)
        if (Selected) then
            SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(IdSelected))))
            ESX.ShowAdvancedNotification("Administration", "", '~b~Vous venez de vous téléporter à~s~ '.. GetPlayerName(GetPlayerFromServerId(IdSelected)) ..'', "CHAR_STRETCH", 1) 

        end
    end)
    RageUI.Button(CouleurRandom.."→~s~ Téléporter le Joueur à vous", nil, {}, true, function(Hovered, Active, Selected, target)
        if (Selected) then
            ExecuteCommand("bring "..IdSelected)
            ESX.ShowAdvancedNotification("Administration", "", '~b~Vous venez de téléporter ~s~ '.. GetPlayerName(GetPlayerFromServerId(IdSelected)) ..' ~b~à vous~s~ !', "CHAR_STRETCH", 1) 
        end
    end)

    RageUI.Button(CouleurRandom.."→~s~ Regarder le joueur", nil, {}, true, function(Hovered, Active, Selected)
        if (Selected) then
        local playerId = GetPlayerFromServerId(IdSelected)
            SpectatePlayer(GetPlayerPed(playerId),playerId,GetPlayerName(playerId))
        end
    end)

    RageUI.Button(CouleurRandom.."→~s~ Heal le Joueur", "", {RightLabel = nilt}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ExecuteCommand("heal "..IdSelected)
            ESX.ShowAdvancedNotification("Administration", "", '~g~Heal de '.. GetPlayerName(GetPlayerFromServerId(IdSelected)) ..' ~g~effectué~s~ !', "CHAR_STRETCH", 1) 
        end
    end)

    RageUI.Button(CouleurRandom.."→~s~ Revive le Joueur",description, {RightLabel = nil}, true, function(Hovered, Active, Selected)
        if (Selected) then
            Frigo3 = Checked
            if Checked then
                ExecuteCommand("revive "..IdSelected)
                ESX.ShowNotification("~b~Vous venez de revive l'ID : ~s~" ..IdSelected)
            else
                ExecuteCommand("revive "..IdSelected)
                ESX.ShowNotification("~b~Vous venez de revive l'ID : ~s~" ..IdSelected)
            end
        end
    end)


    RageUI.Separator(CouleurRandom.."- Headway Roleplay - Appliquer Sanctions -")

    RageUI.Button(CouleurRandom.."→~s~ Kick le Joueur du serveur", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
        if (Selected) then
            local kick = KeyboardInput("Raison du kick :", "", 100)
            TriggerServerEvent('Administration:KickPerso', kick)
        end
    end)

    RageUI.Button(CouleurRandom.."→~s~ Bannir le joueur du serveur", nil, {RightLabel = nil}, true, function(Hovered, Active, Selected)
        if (Selected) then
            local quelid = Keyboardput("ID", "", 3)
            local day = Keyboardput("Jours", "", 100)
            local raison = Keyboardput("Raison du kick", "", 100)
            if quelid and day and raison then
                ExecuteCommand("sqlban "..quelid.. " " ..day.. " " ..raison)
                ESX.ShowNotification("Vous venez de ban l\'ID :"..quelid.. " " ..day.. " pour la raison suivante : " ..raison)
            else
                RageUI.CloseAll()	
            end
        end
    end)

    RageUI.Separator(CouleurRandom.."- Heaway Roleplay - Wipes et Gives -")

    if superadmin then
        RageUI.Button(CouleurRandom.."→~s~ Wipe l'inventaire du Joueur", "", {RightLabel = nil}, true, function(Hovered, Active, Selected)
            if (Selected) then
                ExecuteCommand("clearinventory "..IdSelected)
            ESX.ShowAdvancedNotification("Administration", "", "Vous venez de WIPE les items de ~b~".. GetPlayerName(GetPlayerFromServerId(IdSelected)) .."~s~ !", "CHAR_STRETCH", 1) 																
            end
        end)
    end
    if superadmin then
        RageUI.Button(CouleurRandom.."→~s~ Wipe les Armes du Joueur", "", {RightLabel = nil}, true, function(Hovered, Active, Selected)
            if (Selected) then
                ExecuteCommand("clearloadout "..IdSelected)
            ESX.ShowAdvancedNotification("Administration", "", "Vous venez de WIPE les armes de ~b~".. GetPlayerName(GetPlayerFromServerId(IdSelected)) .."~s~ !", "CHAR_STRETCH", 1) 								
            end
        end)
    end
    RageUI.Button(CouleurRandom.."→~s~ Donner un Item au Joueur", "", {RightLabel = nil}, true, function(Hovered, Active, Selected)
        if (Selected) then
            local item = KeyboardInput("Item", "", 10)
            local amount = KeyboardInput("Nombre", "", 10)
            if item and amount then
                ExecuteCommand("giveitem "..IdSelected.. " " ..item.. " " ..amount)
                ESX.ShowNotification("Vous venez de donner ~g~"..amount.. " " .. item .. " ~w~à " .. GetPlayerName(GetPlayerFromServerId(IdSelected)))	
            else
                    ESX.ShowNotification("~r~Champ incorrect !")
                RageUI.CloseAll()	
            end			
        end
    end)
    if superadmin then
        RageUI.Button(CouleurRandom.."→~s~ Donner une Arme au Joueur", "", {RightLabel = nil}, true, function(Hovered, Active, Selected)
            if (Selected) then
                local weapon = KeyboardInput("Nom de l'Arme", "weapon_", 100)
                local ammo = KeyboardInput("Munitions", "", 100)
                if weapon and ammo then
                    ExecuteCommand("giveweapon "..IdSelected.. " " ..weapon.. " " ..ammo)
                    ESX.ShowNotification("Vous venez de donner ~g~"..weapon.. " avec " .. ammo .. " munitions ~w~à " .. GetPlayerName(GetPlayerFromServerId(IdSelected)))
                else
                    ESX.ShowNotification("~r~Champ incorrect !")
                    RageUI.CloseAll()	
                end
            end
        end)
    end


end, function()
end)


RageUI.IsVisible(RMenu:Get('MenuAdminAdrien', 'main6'), true, true, true, function() 

    RageUI.Button(CouleurRandom.."→~s~ Utiliser le NoClip", "Activer/Désactiver le NoClip", {RightLabel = CouleurRandom.."F9"},true, function()
    end, RMenu:Get('menu', 'gestion'))

    RageUI.Button(CouleurRandom.."→~s~ Supprimer un véhicule", "Supprimer le véhicule dans lequel vous êtes.", {RightLabel = CouleurRandom.."F11"},true, function()
    end, RMenu:Get('menu', 'gestion'))

    RageUI.Button(CouleurRandom.."→~s~ Se téléporter sur le Marqueur", "Se téléporter sur le marqueur (sur la minimap)", {RightLabel = CouleurRandom.."ALT"},true, function()
    end, RMenu:Get('menu', 'gestion'))     

end, function()
end)


RageUI.IsVisible(RMenu:Get('MenuAdminAdrien', 'temps'), true, true, true, function()

    RageUI.Button(CouleurRandom.."→~s~ Selectionner une heure personnalisée", "Heures ~b~ESPACE~s~ Minutes", {RightLabel = "→"}, true, function(Hovered, Active, Selected)
        if (Selected) then
        local heure = Keyboardput('Exemple pour 19h00', '19 00', 5)
            ExecuteCommand("time "..heure)
        end
    end)

    RageUI.Checkbox(CouleurRandom.."→~s~ Figer la météo et l'heure",nil, checkbox2,{},function(Hovered,Active,Selected,Checked)
        if Selected then
            checkbox2 = Checked
            if Checked then
                Checked = true
                ExecuteCommand("freezetime")
                ESX.ShowNotification("| - ~b~Temps Figé")
            else
                ExecuteCommand("freezetime")
                ESX.ShowNotification("| - ~b~Temps Défigé")
            end
        end
    end)


    RageUI.Button(CouleurRandom.."→~s~ Temps Ensoleillé ", nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ExecuteCommand("weather EXTRASUNNY")
            ESX.ShowNotification("~g~Temps Changé avec succès !")
        end
    end)

    RageUI.Button(CouleurRandom.."→~s~ Temps Peu Nuageux ", nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ExecuteCommand("weather CLEAR")
            ESX.ShowNotification("~g~Temps Changé avec succès !")
        end
    end)

    RageUI.Button(CouleurRandom.."→~s~ Temps Nuageux", nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ExecuteCommand("weather CLOUDS")
            ESX.ShowNotification("~g~Temps Changé avec succès !")
        end
    end)

    RageUI.Button(CouleurRandom.."→~s~ Temps Pluvieux", nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ExecuteCommand("weather RAIN")
            ESX.ShowNotification("~g~Temps Changé avec succès !")
        end
    end)

    RageUI.Button(CouleurRandom.."→~s~ Temps Neigeux", nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ExecuteCommand("weather XMAS")
            ESX.ShowNotification("~g~Temps Changé avec succès !")
        end
    end)

    RageUI.Button(CouleurRandom.."→~s~ Temps d'Halloween", nil, {RightLabel = ""}, true, function(Hovered, Active, Selected)
        if (Selected) then
            ExecuteCommand("weather HALLOWEEN")
            ESX.ShowNotification("~g~Temps Changé avec succès !")
        end
    end)




end, function()
end)



RageUI.IsVisible(RMenu:Get('MenuAdminAdrien', 'main7'), true, true, true, function()

    RageUI.Separator(CouleurRandom.."- Headway Roleplay - Actions Modération -")

    RageUI.Button(CouleurRandom.."→~s~ Gestion des Joueurs", "Gérer les joueurs connectés sur le serveur.", {RightLabel = CouleurRandom..""},true, function()
    end, RMenu:Get('menu', 'gestion'))

    RageUI.Button(CouleurRandom.."→~s~ Gestion Météo et Heures", "Gérer la météo générale du serveur.", {RightLabel = ""},true, function()
    end, RMenu:Get('MenuAdminAdrien', 'temps'))

    RageUI.Checkbox(CouleurRandom.."→~s~ No Clip", "Activer et désactiver son No-Clip", checkbox,{},function(Hovered,Active,Selected,Checked)
        if Selected then
            checkbox = Checked
            if Checked then
                Checked = true
                no_clip()
            else
                no_clip()
            end
        end
    end)

    RageUI.Checkbox(CouleurRandom.."→~s~ Afficher les Noms", description, affichername,{},function(Hovered,Ative,Selected,Checked)
        if Selected then
            affichername = Checked
            if Checked then
                ShowName = true
                ESX.ShowNotification("Les noms sont ~g~affichés")
            else
                ShowName = false
                ESX.ShowNotification("Les noms ne sont plus ~r~affichés")
            end
        end
    end)


    RageUI.Button(CouleurRandom.."→~s~ Heal un Joueur", "Heal un joueur via son ID", {RightBadge = RageUI.BadgeStyle.Heart}, true, function(Hovered, Active, Selected)
        if (Selected) then
        local quelid = KeyboardInput("ID", "", 100)
        if quelid then
        ExecuteCommand("heal "..quelid)
        ESX.ShowNotification("Vous Venez d\'Heal l'ID : ~b~ " ..quelid)
    else
        ESX.ShowNotification("~r~ERROR 404\nChamp Invalide")
        RageUI.CloseAll()	
            end
        end
    end)
    
    

    RageUI.Button(CouleurRandom.."→~s~ Revive un Joueur", "Réanimer un joueur via son ID", {RightBadge = RageUI.BadgeStyle.Heart}, true, function(Hovered, Active, Selected)
        if (Selected) then
            local quelid = KeyboardInput("ID", "", 100)
            if quelid then
                ExecuteCommand("revive "..quelid)
                ESX.ShowNotification("Vous venez de revive l'ID : ~b~ " ..quelid)
            else
                ESX.ShowNotification("~r~ERROR 404\nChamp Invalide")
                RageUI.CloseAll()	
            end
        end
    end)


    RageUI.Separator(CouleurRandom.."- Headway Roleplay - Actions Développement -")

                RageUI.Checkbox(CouleurRandom.."→~s~ Afficher les Coordonnées",description, affichagecoords,{},function(Hovered,Ative,Selected,Checked)
                    if Selected then
                        local affichagecoords = true
                        while affichagecoords do
                            Wait(0)
                            local x,y,z = table.unpack(GetEntityCoords(GetPlayerPed(-1)))
                            local h = GetEntityHeading(GetPlayerPed(-1)) 
                            local r = GetEntityRotation(GetPlayerPed(-1))
                    --        DrawText3D(x+0.1,y,z+0.5,"~r~Coords:  ~w~"..x.." ~o~| ~w~" ..y.. " ~o~| ~w~"..z.. " ~o~| ~w~"..h, 0.4)
                            print("Coords:  ^1X: "..x.." | ^3Y: " ..y.. " | ^4Z: "..z.. " | ^7H: "..h)
                            ESX.ShowNotification("~b~Pour voir les coordonnées faite F8.")
                            ESX.ShowNotification("~r~Appuyez sur E pour enlever les coordonnées.")
                            if IsControlJustPressed(0, 51) then
                                affichagecoords = false
                            end
                        end
                    end
                end)

                RageUI.Button(CouleurRandom.."→~s~ TP sur le Marqueur", "Se téléporter sur son marqueur.", {RightBadge = RageUI.BadgeStyle.Tick}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        admin_tp_marker()
                    end
                            end)


end, function()
end)



---------------------------------------------------------------- Action Divers ----------------------------------------------------------------

                        RageUI.IsVisible(RMenu:Get('MenuAdminAdrien', 'main3'), true, true, true, function()

                            RageUI.Separator(CouleurRandom.."- Headway Roleplay - Actions Personelles -")
        
                            RageUI.Button(CouleurRandom.."→~s~ Vos Informations", "Consultez vos informations personnelles.", {RightLabel = CouleurRandom.."→→~s~"},true, function()
                            end, RMenu:Get('MenuAdminAdrien', 'infos'))

                            RageUI.Checkbox(CouleurRandom.."→~s~ Activer son Invincibilité","Devenir invincible.", checkbox2,{},function(Hovered,Active,Selected,Checked)
                                if Selected then
                                    checkbox2 = Checked
                                    if Checked then
                                        Checked = true
                                        admin_godmode()
                                    else
                                        admin_godmode()
                                    end
                                end
                            end)

                            RageUI.Checkbox(CouleurRandom.."→~s~ Activer son Invisibilité","Devenir invisible.", checkbox3,{},function(Hovered,Active,Selected,Checked)
                                if Selected then
                                    checkbox3 = Checked
                                    if Checked then
                                        Checked = true
                                        admin_mode_fantome()
                                    else
                                        admin_mode_fantome()
                                    end
                                end
                            end)


                            RageUI.Checkbox(CouleurRandom.."→~s~ Désactiver l'HUD de la minimap", description, Frigo,{},function(Hovered,Ative,Selected,Checked)
                                if Selected then
                                    Frigo = Checked
                                    if Checked then
                                        openCinematique()
                                    else
                                        openCinematique()                                    end
                                end
                            end)

                            RageUI.Separator(CouleurRandom.."- Headway Roleplay - Actions de Gives -")

                            RageUI.Button(CouleurRandom.."→~s~ Se donner de l'Armure",description, {RightBadge = RageUI.BadgeStyle.Armour}, true, function(Hovered, Active, Selected)
                                if (Selected) then
                                    SetPedArmour(GetPlayerPed(-1), 200)
                                    Notify("✅ Armure renouvelé avec succès !~w~")
                                end
                            end)

                            RageUI.Button(CouleurRandom.."→~s~ Se Soigner",description, {RightBadge = RageUI.BadgeStyle.Heart}, true, function(Hovered, Active, Selected)
                                if (Selected) then
                                    SetEntityHealth(GetPlayerPed(-1), 200)
                                    Notify("✅ Heal effectué avec succès !  ")
                                end
                            end)

                            RageUI.Button(CouleurRandom.."→~s~ Give d'Armes", "Se donner des armes.", {RightBadge = RageUI.BadgeStyle.Gun},true, function()
                            end, RMenu:Get('MenuAdminAdrien', 'main5'))

                            
                            RageUI.Button(CouleurRandom.."→~s~ Changer d'Apparence", "Changer votre personnage.", {RightBadge = RageUI.BadgeStyle.Clothes},true, function()
                            end, RMenu:Get('MenuAdminAdrien', 'apparence'))

                            RageUI.List('~b~→~s~ Give', Menu.action, Menu.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)
                                if (Selected) then 
                                    if Index == 1 then
                                        GiveCash()
                                elseif Index == 2 then
                                    GiveBanque()
                                elseif Index == 3 then
                                    GiveND()
                                end
                            end
                               Menu.list = Index;              
                            end)


                            


                        end, function()
                        end)


                        RageUI.IsVisible(RMenu:Get('MenuAdminAdrien', 'infos'), true, true, true, function()


                            TriggerEvent("updateStatus",VM.Faim,VM.Soif)
                            RageUI.SliderProgress(CouleurRandom.."→~s~ Votre barre de Faim ", VM.Faim, 100, nil, {ProgressColor = {R = 254, G = 143, B = 0, A = 200},ProgressBackgroundColor = {R = 255, G = 255, B = 255, A = 200} }, true, function(Hovered, Active, Selected, Index)
                            end)
        
                            RageUI.SliderProgress(CouleurRandom.."→~s~ Votre barre de Soif :", VM.Soif, 100, nil, {ProgressColor = {R = 0, G = 119, B = 254, A = 200},ProgressBackgroundColor = {R = 255, G = 255, B = 255, A = 200} }, true, function(Hovered, Active, Selected, Index)
                            end)

                            RageUI.Button(CouleurRandom..'→~s~ Solde de compte en banque                    $'.. PlayerMoney ..'', nil, {RightLabel = "" }, true, function(Hovered, Active, Selected)
                            end)

                             if VM.Faim < 0 or VM.Soif < 0 then
                                    SetEntityHealth(GetPlayerPed(-1),0)
                                end


                        end, function()
                        end)
---------------------------------------------------------------- PEDS ----------------------------------------------------------------

RageUI.IsVisible(RMenu:Get('ped', 'main'), true, true, true, function()


    RageUI.List('Métier (Homme)', Menu9.action, Menu9.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)
        if (Selected) then 
            if Index == 1 then
                local j1 = PlayerId()
                local p1 = GetHashKey('s_m_y_cop_01')
                RequestModel(p1)
                while not HasModelLoaded(p1) do
                    Wait(100)
                    end
                    SetPlayerModel(j1, p1)
                    SetModelAsNoLongerNeeded(p1)
                    ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                elseif Index == 2 then
                        local j1 = PlayerId()
                        local p1 = GetHashKey('csb_cop')
                        RequestModel(p1)
                        while not HasModelLoaded(p1) do
                            Wait(100)
                            end
                            SetPlayerModel(j1, p1)
                            SetModelAsNoLongerNeeded(p1)
                            ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                        elseif Index == 3 then
                            local j1 = PlayerId()
                            local p1 = GetHashKey('s_m_m_security_01')
                            RequestModel(p1)
                            while not HasModelLoaded(p1) do
                                Wait(100)
                                end
                                SetPlayerModel(j1, p1)
                                SetModelAsNoLongerNeeded(p1)
                                ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                elseif Index == 4 then
                                    local j1 = PlayerId()
                                    local p1 = GetHashKey('s_m_y_swat_01')
                                    RequestModel(p1)
                                    while not HasModelLoaded(p1) do
                                        Wait(100)
                                        end
                                        SetPlayerModel(j1, p1)
                                        SetModelAsNoLongerNeeded(p1)
                                        ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                    elseif Index == 5 then
                                        local j1 = PlayerId()
                                        local p1 = GetHashKey('s_m_y_marine_03')
                                        RequestModel(p1)
                                        while not HasModelLoaded(p1) do
                                            Wait(100)
                                            end
                                            SetPlayerModel(j1, p1)
                                            SetModelAsNoLongerNeeded(p1)
                                            ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                        elseif Index == 6 then
                                            local j1 = PlayerId()
                                            local p1 = GetHashKey('s_m_y_autopsy_01')
                                            RequestModel(p1)
                                            while not HasModelLoaded(p1) do
                                                Wait(100)
                                                end
                                                SetPlayerModel(j1, p1)
                                                SetModelAsNoLongerNeeded(p1)
                                                ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                            elseif Index == 7 then
                                                local j1 = PlayerId()
                                                local p1 = GetHashKey('s_m_m_paramedic_01')
                                                RequestModel(p1)
                                                while not HasModelLoaded(p1) do
                                                    Wait(100)
                                                    end
                                                    SetPlayerModel(j1, p1)
                                                    SetModelAsNoLongerNeeded(p1)
                                                    ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                elseif Index == 8 then
                                                    local j1 = PlayerId()
                                                    local p1 = GetHashKey('s_m_y_ammucity_01')
                                                    RequestModel(p1)
                                                    while not HasModelLoaded(p1) do
                                                        Wait(100)
                                                        end
                                                        SetPlayerModel(j1, p1)
                                                        SetModelAsNoLongerNeeded(p1)
                                                        ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                    


                end
            end
               Menu9.list = Index;              
            end)




            RageUI.List('Métier (Femme)', Menu10.action, Menu10.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)
                if (Selected) then 
                    if Index == 1 then
                        local j1 = PlayerId()
                        local p1 = GetHashKey('s_f_y_cop_01')
                        RequestModel(p1)
                        while not HasModelLoaded(p1) do
                            Wait(100)
                            end
                            SetPlayerModel(j1, p1)
                            SetModelAsNoLongerNeeded(p1)
                            ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                        elseif Index == 2 then
                                local j1 = PlayerId()
                                local p1 = GetHashKey('s_f_y_sheriff_01')
                                RequestModel(p1)
                                while not HasModelLoaded(p1) do
                                    Wait(100)
                                    end
                                    SetPlayerModel(j1, p1)
                                    SetModelAsNoLongerNeeded(p1)
                                    ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                elseif Index == 3 then
                                    local j1 = PlayerId()
                                    local p1 = GetHashKey('s_f_y_scrubs_01')
                                    RequestModel(p1)
                                    while not HasModelLoaded(p1) do
                                        Wait(100)
                                        end
                                        SetPlayerModel(j1, p1)
                                        SetModelAsNoLongerNeeded(p1)
                                        ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                    elseif Index == 4 then
                                        local j1 = PlayerId()
                                        local p1 = GetHashKey('csb_stripper_01')
                                        RequestModel(p1)
                                        while not HasModelLoaded(p1) do
                                            Wait(100)
                                            end
                                            SetPlayerModel(j1, p1)
                                            SetModelAsNoLongerNeeded(p1)
                                            ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')


                                end
                            end
                               Menu10.list = Index;              
                            end)




                            RageUI.List('Gang (Homme)', Menu11.action, Menu11.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)
                                if (Selected) then 
                                    if Index == 1 then
                                        local j1 = PlayerId()
                                        local p1 = GetHashKey('g_m_y_ballaorig_01')
                                        RequestModel(p1)
                                        while not HasModelLoaded(p1) do
                                            Wait(100)
                                            end
                                            SetPlayerModel(j1, p1)
                                            SetModelAsNoLongerNeeded(p1)
                                            ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                        elseif Index == 2 then
                                                local j1 = PlayerId()
                                                local p1 = GetHashKey('g_m_y_ballaeast_01')
                                                RequestModel(p1)
                                                while not HasModelLoaded(p1) do
                                                    Wait(100)
                                                    end
                                                    SetPlayerModel(j1, p1)
                                                    SetModelAsNoLongerNeeded(p1)
                                                    ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                elseif Index == 3 then
                                                    local j1 = PlayerId()
                                                    local p1 = GetHashKey('g_m_y_ballasout_01')
                                                    RequestModel(p1)
                                                    while not HasModelLoaded(p1) do
                                                        Wait(100)
                                                        end
                                                        SetPlayerModel(j1, p1)
                                                        SetModelAsNoLongerNeeded(p1)
                                                        ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                    elseif Index == 4 then
                                                        local j1 = PlayerId()
                                                        local p1 = GetHashKey('g_m_y_famca_01')
                                                        RequestModel(p1)
                                                        while not HasModelLoaded(p1) do
                                                            Wait(100)
                                                            end
                                                            SetPlayerModel(j1, p1)
                                                            SetModelAsNoLongerNeeded(p1)
                                                            ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                        elseif Index == 5 then
                                                            local j1 = PlayerId()
                                                            local p1 = GetHashKey('g_m_y_famdnf_01')
                                                            RequestModel(p1)
                                                            while not HasModelLoaded(p1) do
                                                                Wait(100)
                                                                end
                                                                SetPlayerModel(j1, p1)
                                                                SetModelAsNoLongerNeeded(p1)
                                                                ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                            elseif Index == 6 then
                                                                local j1 = PlayerId()
                                                                local p1 = GetHashKey('g_m_y_famfor_01')
                                                                RequestModel(p1)
                                                                while not HasModelLoaded(p1) do
                                                                    Wait(100)
                                                                    end
                                                                    SetPlayerModel(j1, p1)
                                                                    SetModelAsNoLongerNeeded(p1)
                                                                    ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                                elseif Index == 7 then
                                                                    local j1 = PlayerId()
                                                                    local p1 = GetHashKey('g_m_y_mexgoon_01')
                                                                    RequestModel(p1)
                                                                    while not HasModelLoaded(p1) do
                                                                        Wait(100)
                                                                        end
                                                                        SetPlayerModel(j1, p1)
                                                                        SetModelAsNoLongerNeeded(p1)
                                                                        ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                                    elseif Index == 8 then
                                                                        local j1 = PlayerId()
                                                                        local p1 = GetHashKey('g_m_y_mexgoon_02')
                                                                        RequestModel(p1)
                                                                        while not HasModelLoaded(p1) do
                                                                            Wait(100)
                                                                            end
                                                                            SetPlayerModel(j1, p1)
                                                                            SetModelAsNoLongerNeeded(p1)
                                                                            ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                                        elseif Index == 9 then
                                                                            local j1 = PlayerId()
                                                                            local p1 = GetHashKey('g_m_y_mexgoon_03')
                                                                            RequestModel(p1)
                                                                            while not HasModelLoaded(p1) do
                                                                                Wait(100)
                                                                                end
                                                                                SetPlayerModel(j1, p1)
                                                                                SetModelAsNoLongerNeeded(p1)
                                                                                ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                                            elseif Index == 10 then
                                                                                local j1 = PlayerId()
                                                                                local p1 = GetHashKey('g_m_y_lost_01')
                                                                                RequestModel(p1)
                                                                                while not HasModelLoaded(p1) do
                                                                                    Wait(100)
                                                                                    end
                                                                                    SetPlayerModel(j1, p1)
                                                                                    SetModelAsNoLongerNeeded(p1)
                                                                                    ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                                                elseif Index == 11 then
                                                                                    local j1 = PlayerId()
                                                                                    local p1 = GetHashKey('g_m_y_lost_02')
                                                                                    RequestModel(p1)
                                                                                    while not HasModelLoaded(p1) do
                                                                                        Wait(100)
                                                                                        end
                                                                                        SetPlayerModel(j1, p1)
                                                                                        SetModelAsNoLongerNeeded(p1)
                                                                                        ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                                                    elseif Index == 12 then
                                                                                        local j1 = PlayerId()
                                                                                        local p1 = GetHashKey('g_m_y_lost_03')
                                                                                        RequestModel(p1)
                                                                                        while not HasModelLoaded(p1) do
                                                                                            Wait(100)
                                                                                            end
                                                                                            SetPlayerModel(j1, p1)
                                                                                            SetModelAsNoLongerNeeded(p1)
                                                                                            ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                                                        elseif Index == 13 then
                                                                                            local j1 = PlayerId()
                                                                                            local p1 = GetHashKey('g_m_y_salvaboss_01')
                                                                                            RequestModel(p1)
                                                                                            while not HasModelLoaded(p1) do
                                                                                                Wait(100)
                                                                                                end
                                                                                                SetPlayerModel(j1, p1)
                                                                                                SetModelAsNoLongerNeeded(p1)
                                                                                                ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                                                            elseif Index == 14 then
                                                                                                local j1 = PlayerId()
                                                                                                local p1 = GetHashKey('g_m_y_salvagoon_01')
                                                                                                RequestModel(p1)
                                                                                                while not HasModelLoaded(p1) do
                                                                                                    Wait(100)
                                                                                                    end
                                                                                                    SetPlayerModel(j1, p1)
                                                                                                    SetModelAsNoLongerNeeded(p1)
                                                                                                    ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                                                                elseif Index == 15 then
                                                                                                    local j1 = PlayerId()
                                                                                                    local p1 = GetHashKey('g_m_y_salvagoon_02')
                                                                                                    RequestModel(p1)
                                                                                                    while not HasModelLoaded(p1) do
                                                                                                        Wait(100)
                                                                                                        end
                                                                                                        SetPlayerModel(j1, p1)
                                                                                                        SetModelAsNoLongerNeeded(p1)
                                                                                                        ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                                                                    elseif Index == 16 then
                                                                                                        local j1 = PlayerId()
                                                                                                        local p1 = GetHashKey('g_m_y_korean_01')
                                                                                                        RequestModel(p1)
                                                                                                        while not HasModelLoaded(p1) do
                                                                                                            Wait(100)
                                                                                                            end
                                                                                                            SetPlayerModel(j1, p1)
                                                                                                            SetModelAsNoLongerNeeded(p1)
                                                                                                            ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                                                                                        elseif Index == 17 then
                                                                                                            local j1 = PlayerId()
                                                                                                            local p1 = GetHashKey('g_m_y_korean_01')
                                                                                                            RequestModel(p1)
                                                                                                            while not HasModelLoaded(p1) do
                                                                                                                Wait(100)
                                                                                                                end
                                                                                                                SetPlayerModel(j1, p1)
                                                                                                                SetModelAsNoLongerNeeded(p1)
                                                                                                                ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')


                        end
                    end
                       Menu11.list = Index;              
                    end)



                    RageUI.List('Gang (Femme)', Menu12.action, Menu12.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)
                        if (Selected) then 
                            if Index == 1 then
                                local j1 = PlayerId()
                                local p1 = GetHashKey('g_f_y_ballas_01')
                                RequestModel(p1)
                                while not HasModelLoaded(p1) do
                                    Wait(100)
                                    end
                                    SetPlayerModel(j1, p1)
                                    SetModelAsNoLongerNeeded(p1)
                                    ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                elseif Index == 2 then
                                        local j1 = PlayerId()
                                        local p1 = GetHashKey('g_f_y_families_01')
                                        RequestModel(p1)
                                        while not HasModelLoaded(p1) do
                                            Wait(100)
                                            end
                                            SetPlayerModel(j1, p1)
                                            SetModelAsNoLongerNeeded(p1)
                                            ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                        elseif Index == 3 then
                                            local j1 = PlayerId()
                                            local p1 = GetHashKey('g_f_y_vagos_01')
                                            RequestModel(p1)
                                            while not HasModelLoaded(p1) do
                                                Wait(100)
                                                end
                                                SetPlayerModel(j1, p1)
                                                SetModelAsNoLongerNeeded(p1)
                                                ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                            elseif Index == 4 then
                                                local j1 = PlayerId()
                                                local p1 = GetHashKey('g_f_y_lost_01')
                                                RequestModel(p1)
                                                while not HasModelLoaded(p1) do
                                                    Wait(100)
                                                    end
                                                    SetPlayerModel(j1, p1)
                                                    SetModelAsNoLongerNeeded(p1)
                                                    ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')

                end
            end
               Menu12.list = Index;              
            end)

            RageUI.List('Animaux', Menu8.action, Menu8.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)
                if (Selected) then 
                    if Index == 1 then
                        local j1 = PlayerId()
                        local p1 = GetHashKey('a_c_chimp')
                        RequestModel(p1)
                        while not HasModelLoaded(p1) do
                            Wait(100)
                            end
                            SetPlayerModel(j1, p1)
                            SetModelAsNoLongerNeeded(p1)
                            ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                elseif Index == 2 then
                    local j1 = PlayerId()
                    local p1 = GetHashKey('a_c_chickenhawk')
                    RequestModel(p1)
                    while not HasModelLoaded(p1) do
                        Wait(100)
                        end
                        SetPlayerModel(j1, p1)
                        SetModelAsNoLongerNeeded(p1)
                        ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                    elseif Index == 3 then
                        local j1 = PlayerId()
                        local p1 = GetHashKey('a_c_cat_01')
                        RequestModel(p1)
                        while not HasModelLoaded(p1) do
                            Wait(100)
                            end
                            SetPlayerModel(j1, p1)
                            SetModelAsNoLongerNeeded(p1)
                            ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                        elseif Index == 4 then
                            local j1 = PlayerId()
                            local p1 = GetHashKey('a_c_coyote')
                            RequestModel(p1)
                            while not HasModelLoaded(p1) do
                                Wait(100)
                                end
                                SetPlayerModel(j1, p1)
                                SetModelAsNoLongerNeeded(p1)
                                ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                elseif Index == 5 then
                                    local j1 = PlayerId()
                                    local p1 = GetHashKey('a_c_boar')
                                    RequestModel(p1)
                                    while not HasModelLoaded(p1) do
                                        Wait(100)
                                        end
                                        SetPlayerModel(j1, p1)
                                        SetModelAsNoLongerNeeded(p1)
                                        ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                    elseif Index == 6 then
                                        local j1 = PlayerId()
                                        local p1 = GetHashKey('a_c_pig')
                                        RequestModel(p1)
                                        while not HasModelLoaded(p1) do
                                            Wait(100)
                                            end
                                            SetPlayerModel(j1, p1)
                                            SetModelAsNoLongerNeeded(p1)
                                            ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                        elseif Index == 7 then
                                            local j1 = PlayerId()
                                            local p1 = GetHashKey('a_c_deer')
                                            RequestModel(p1)
                                            while not HasModelLoaded(p1) do
                                                Wait(100)
                                                end
                                                SetPlayerModel(j1, p1)
                                                SetModelAsNoLongerNeeded(p1)
                                                ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
        
                end
            end
               Menu8.list = Index;              
            end)


            RageUI.List('Personnage', Menu13.action, Menu13.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)
                if (Selected) then 
                    if Index == 1 then
                        local j1 = PlayerId()
                        local p1 = GetHashKey('player_one')
                        RequestModel(p1)
                        while not HasModelLoaded(p1) do
                            Wait(100)
                            end
                            SetPlayerModel(j1, p1)
                            SetModelAsNoLongerNeeded(p1)
                            ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                        elseif Index == 2 then
                            local j1 = PlayerId()
                            local p1 = GetHashKey('player_zero')
                            RequestModel(p1)
                            while not HasModelLoaded(p1) do
                                Wait(100)
                                end
                                SetPlayerModel(j1, p1)
                                SetModelAsNoLongerNeeded(p1)
                                ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                            elseif Index == 3 then
                                local j1 = PlayerId()
                                local p1 = GetHashKey('player_two')
                                RequestModel(p1)
                                while not HasModelLoaded(p1) do
                                    Wait(100)
                                    end
                                    SetPlayerModel(j1, p1)
                                    SetModelAsNoLongerNeeded(p1)
                                    ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                elseif Index == 4 then
                                    local j1 = PlayerId()
                                    local p1 = GetHashKey('ig_lestercrest_2')
                                    RequestModel(p1)
                                    while not HasModelLoaded(p1) do
                                        Wait(100)
                                        end
                                        SetPlayerModel(j1, p1)
                                        SetModelAsNoLongerNeeded(p1)
                                        ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')
                                    elseif Index == 5 then
                                        local j1 = PlayerId()
                                        local p1 = GetHashKey('csb_tonya')
                                        RequestModel(p1)
                                        while not HasModelLoaded(p1) do
                                            Wait(100)
                                            end
                                            SetPlayerModel(j1, p1)
                                            SetModelAsNoLongerNeeded(p1)
                                            ESX.ShowNotification('✅ Changement en PED Effectué Avec Succès !')



        end
    end
       Menu13.list = Index;              
    end)

    RageUI.Separator("↓                        ↓")



    RageUI.Button("~g~                            Revenir à la Normal", "", {RightLabel = ""}, true, function(Hovered, Active, Selected)
        if (Selected) then   
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            local isMale = skin.sex == 0


            TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
                    TriggerEvent('esx:restoreLoadout')
            end)
            end)
            end)
    end
    end)


end, function()
end)





---------------------------------------------------------------- Give d'Armes ----------------------------------------------------------------


                        RageUI.IsVisible(RMenu:Get('MenuAdminAdrien', 'main5'), true, true, true, function()



                            RageUI.Separator(CouleurRandom.."- Headway Roleplay - Catégorie D'arme -")


                            RageUI.List(CouleurRandom..'→~s~ Armes de Mêlée', Menu6.action, Menu6.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)
                                if (Selected) then 
                                    if Index == 1 then
                                        TriggerServerEvent('adrien:knife')
                                    elseif Index == 2 then
                                        TriggerServerEvent('adrien:bat')
                                elseif Index == 3 then
                                    TriggerServerEvent('adrien:switchblade')
                                elseif Index == 4 then
                                    TriggerServerEvent('adrien:machete')
                                elseif Index == 5 then
                                    TriggerServerEvent('adrien:knuckle')
                                elseif Index == 6 then
                                    TriggerServerEvent('adrien:nightstick')
                                elseif Index == 7 then
                                    TriggerServerEvent('adrien:flashlight')
                                elseif Index == 8 then
                                    TriggerServerEvent('adrien:crowbar')
                                elseif Index == 9 then
                                    TriggerServerEvent('adrien:dagger')
                                elseif Index == 10 then
                                    TriggerServerEvent('adrien:bottle')
                                elseif Index == 11 then
                                    TriggerServerEvent('adrien:golfclub')
                                elseif Index == 12 then
                                    TriggerServerEvent('adrien:hammer')
                                elseif Index == 13 then
                                    TriggerServerEvent('adrien:hatchet')
                                elseif Index == 14 then
                                    TriggerServerEvent('adrien:wrench')
                                elseif Index == 15 then
                                    TriggerServerEvent('adrien:poolcue')
                            end
                        end
                               Menu6.list = Index;              
                            end)


                            RageUI.List(CouleurRandom..'→~s~ Pistolets', Menu3.action, Menu3.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)
                                if (Selected) then 
                                    if Index == 1 then
                                        TriggerServerEvent('adrien:pistol')
                                    elseif Index == 2 then
                                        TriggerServerEvent('adrien:combatpistol')
                                elseif Index == 3 then
                                    TriggerServerEvent('adrien:pistol50')
                                elseif Index == 4 then
                                    TriggerServerEvent('adrien:appistol')
                                elseif Index == 5 then
                                    TriggerServerEvent('adrien:stungun')
                                elseif Index == 6 then
                                    TriggerServerEvent('adrien:flaregun')
                                elseif Index == 7 then
                                    TriggerServerEvent('adrien:revolver')
                                elseif Index == 8 then
                                    TriggerServerEvent('adrien:snspistol')
                                end
                            end
                               Menu3.list = Index;              
                            end)

                            
                            RageUI.List(CouleurRandom..'→~s~ Mitraillettes', Menu2.action, Menu2.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)
                                if (Selected) then 
                                    if Index == 1 then
                                        TriggerServerEvent('adrien:smg')
                                    elseif Index == 2 then
                                        TriggerServerEvent('adrien:minismg')
                                elseif Index == 3 then
                                    TriggerServerEvent('adrien:microsmg')
                                elseif Index == 4 then
                                    TriggerServerEvent('adrien:assaultsmg')
                                elseif Index == 5 then
                                    TriggerServerEvent('adrien:combatpdw')
                                elseif Index == 6 then
                                    TriggerServerEvent('adrien:gusenberg')
                                end
                            end
                               Menu2.list = Index;              
                            end)



                            RageUI.List(CouleurRandom..'→~s~ Fusils d\'Assaults', Menu4.action, Menu4.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)
                                if (Selected) then 
                                    if Index == 1 then
                                        TriggerServerEvent('adrien:assaultrifle')
                                    elseif Index == 2 then
                                        TriggerServerEvent('adrien:carbinerifle')
                                elseif Index == 3 then
                                    TriggerServerEvent('adrien:advancedrifle')
                                elseif Index == 4 then
                                    TriggerServerEvent('adrien:specialcarbine')
                                elseif Index == 5 then
                                    TriggerServerEvent('adrien:bullpuprifle')
                                elseif Index == 6 then
                                    TriggerServerEvent('adrien:compactrifle')
                            end
                        end
                               Menu4.list = Index;              
                            end)


                            
                            RageUI.List(CouleurRandom..'→~s~ Fusils à Pompe', Menu5.action, Menu5.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)
                                if (Selected) then 
                                    if Index == 1 then
                                        TriggerServerEvent('adrien:pumpshotgun')
                                    elseif Index == 2 then
                                        TriggerServerEvent('adrien:sawnoffshotgun')
                                elseif Index == 3 then
                                    TriggerServerEvent('adrien:assaultshotgun')
                                elseif Index == 4 then
                                    TriggerServerEvent('adrien:bullpupshotgun')
                                elseif Index == 5 then
                                    TriggerServerEvent('adrien:musket')
                                elseif Index == 6 then
                                    TriggerServerEvent('adrien:heavyshotgun')
                                elseif Index == 7 then
                                    TriggerServerEvent('adrien:dbshotgun')
                                elseif Index == 8 then
                                    TriggerServerEvent('adrien:autoshotgun')
                            end
                        end
                               Menu5.list = Index;              
                            end)


                            RageUI.List(CouleurRandom..'→~s~ Fusils de Sniper', Menu7.action, Menu7.list, nil, {RightLabel = ""}, true, function(Hovered, Active, Selected, Index)
                                if (Selected) then 
                                    if Index == 1 then
                                        TriggerServerEvent('adrien:sniperrifle')
                                    elseif Index == 2 then
                                        TriggerServerEvent('adrien:heavysniper')
                                elseif Index == 3 then
                                    TriggerServerEvent('adrien:marksmanrifle')
                            end
                        end
                               Menu7.list = Index;              
                            end)

                            RageUI.Separator(CouleurRandom.."Headway Roleplay - Options Diverses -")



                            RageUI.Button(CouleurRandom.."→~s~ Obtenir toutes les armes", "", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                                if (Selected) then
                                TriggerServerEvent('adrien:weapon')
                                end
                            end)
                        
                            RageUI.Button(CouleurRandom.."→~s~ Supprimer toutes les armes", "", {RightLabel = ""}, true, function(Hovered, Active, Selected)
                                if (Selected) then
                                    RemoveAllPedWeapons(GetPlayerPed(-1), true)
                                    ESX.ShowNotification("| - Supression de toutes les armes ~b~effectué avec succès~s~ !")
                                end
                            end)

                                    end, function()
                                    end)


---------------------------------------------------------------- Action Véhicule ----------------------------------------------------------------

                                        RageUI.IsVisible(RMenu:Get('MenuAdminAdrien', 'main4'), true, true, true, function()

                                            RageUI.Separator(CouleurRandom.."- Headway Roleplay - Actions sur véhicules -")


                                            RageUI.Button(CouleurRandom.."→~s~ Réparer le Véhicule", "Réparer le véhicule dans lequel vous êtes.", {RightBadge = RageUI.BadgeStyle.Heart}, true, function(Hovered, Active, Selected)                                                                                                                   
                                                if Selected then
                                                            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                                                            vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                                                            if DoesEntityExist(vehicle) then
                                                            SetVehicleFixed(vehicle)
                                                            SetVehicleDeformationFixed(vehicle)
                                                         end
                                                      end
                                                   end
                                               end)

                                               RageUI.Button(CouleurRandom.."→~s~ Retourner le Véhicule", "Retourner le véhicule dans lequel vous êtes.", {RightBadge = RageUI.BadgeStyle.Heart}, true, function(Hovered, Active, Selected)
                                                if (Selected) then
                                                    admin_vehicle_flip()
                                                end
                                            end)   
                                            RageUI.Button(CouleurRandom.."→~s~ Spawn un Véhicule", "Faire apparaitre un véhicule.", {RightBadge = RageUI.BadgeStyle.Car}, true, function(_, _, Selected)
                                                if Selected then                                                                
                                                   local ped = GetPlayerPed(tgt)
                                                   local ModelName = KeyboardInput("Véhicule", "", 100)
                                                 if ModelName and IsModelValid(ModelName) and IsModelAVehicle(ModelName) then
                                                   RequestModel(ModelName)
                                                   while not HasModelLoaded(ModelName) do
                                                   Citizen.Wait(0)
                                                end
                                                local veh = CreateVehicle(GetHashKey(ModelName), GetEntityCoords(GetPlayerPed(-1)), GetEntityHeading(GetPlayerPed(-1)), true, true)
                                                    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                                                    Wait(50)
                                                else
                                                ESX.ShowNotification("~r~Vehicule invalide !")
                                                end
                                            end
                                        end)

                                        RageUI.Button(CouleurRandom.."→~s~ Supprimer le Véhicule", "Supprimer le véhicule dans lequel vous êtes.", {RightBadge = RageUI.BadgeStyle.Car}, true, function(_, Active, Selected)
                                            if Active then
                                                ShowMarker()
                                            end
                                            if Selected then
                                                TriggerEvent("esx:deleteVehicle")
                                            end
                                            end)

                                            RageUI.Button(CouleurRandom.."→~s~ Customiser au Max le Véhicule", "Customiser au maximum le véhicule dans lequel vous êtes.", {RightBadge = RageUI.BadgeStyle.Car}, true, function(Hovered, Active, Selected)
                                                if (Selected) then
                                                    FullVehicleBoost()
                                                end
                                            end)


                                        RageUI.Button(CouleurRandom.."→~s~ Changer la Plaque", "Changer la plaque du véhicule dans lequel vous êtes.", {RightBadge = RageUI.BadgeStyle.Car}, true, function(_, Active, Selected)
                                            if Selected then
                                                if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
                                                    local plaqueVehicule = Keyboardput("Plaque", "", 8)
                                                    SetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(-1), false) , plaqueVehicule)
                                                    ESX.ShowNotification("Plaque changée en : ~g~"..plaqueVehicule)
                                                else
                                                    ESX.ShowNotification("~r~Erreur\n~s~Vous n'êtes pas dans un véhicule !")
                                                end
                                            end
                                            end)


                                   
                                        end, function()
                                        end)

                                        RageUI.IsVisible(RMenu:Get('MenuAdminAdrien', 'apparence'), true, true, true, function()


                                            RageUI.Button("Changer d'Habits", "", {RightBadge = RageUI.BadgeStyle.Clothes}, true, function(Hovered, Active, Selected)
                                                if (Selected) then
                                                    changer_skin()
                                                    RageUI.CloseAll()
                                                end
                                            end)

                                            RageUI.Button("Menu PEDS", nil, {RightLabel = "→"},true, function()
                                            end, RMenu:Get('ped', 'main'))

                                        end, function()
                                        end)

                        Citizen.Wait(0)
                        end
                        end)

                        


            
---------------------------------------------------------------- Menu réservé aux SuperAdmin ----------------------------------------------------------------

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1,57) then
                ESX.TriggerServerCallback('Adrien:getUsergroup', function(group)
                    playergroup = group
                    if playergroup == 'superadmin' then
                        superadmin = true
                    RageUI.Visible(RMenu:Get('MenuAdminAdrien', 'main'), not RageUI.Visible(RMenu:Get('menu', 'main')))
                    else
                        superadmin = false
                    end
                end)
            end 
        end
    end)


        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)
                if IsControlJustPressed(1,19) then
                        ESX.TriggerServerCallback('Adrien:getUsergroup', function(group)
                            playergroup = group
                            if playergroup == 'superadmin' then
                                superadmin = true
                                        admin_tp_marker()
                            else
                                superadmin = false
                            end
                        end)
                    end 
                end
            end)


            Citizen.CreateThread(function()
                while true do
                    Citizen.Wait(0)
                    if IsControlJustPressed(1,56) then
                            ESX.TriggerServerCallback('Adrien:getUsergroup', function(group)
                                playergroup = group
                                if playergroup == 'superadmin' then
                                    superadmin = true
                                    no_clip()

                                else
                                    superadmin = false
                                end
                            end)
                        end 
                    end
                end)


                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(0)
                        if IsControlJustPressed(1,344) then
                                ESX.TriggerServerCallback('Adrien:getUsergroup', function(group)
                                    playergroup = group
                                    if playergroup == 'superadmin' then
                                        superadmin = true
                                        TriggerEvent("esx:deleteVehicle")    
                                    else
                                        superadmin = false
                                    end
                                end)
                            end 
                        end
                    end)

                    Citizen.CreateThread(function()
                        while true do 
                           Citizen.Wait(400)
                           if CouleurRandom == "~b~" then CouleurRandom = "~o~" else CouleurRandom = "~b~" end 
                       end 
                    end)