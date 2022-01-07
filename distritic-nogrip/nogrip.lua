-- this is script edited by neptunium-dev!
-- show love: https://forum.cfx.re/u/distritic
startMsg = false -- client alert message, fasle by default.
local ragdoll_chance = 0.8 -- (50 = 0.5; 75 = 0.75; etc).

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local ped = PlayerPedId()
		if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
			local chance_result = math.random()
			if chance_result < ragdoll_chance then 
				Citizen.Wait(600)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
				SetPedToRagdoll(ped, 5000, 1, 2)
			else
				Citizen.Wait(1500)
			end
		end
	end
end)

if startMsg then
    print("nogrip is enabled for this server.")
else
    -- do nothing, no message required!
end