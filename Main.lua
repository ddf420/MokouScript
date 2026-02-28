---------------------------------
-- MokouScript Unified Version
-- SCRIPT DEVELOPED BY mokou_real
-- Version 0.1a
---------------------------------
util.require_natives("3407a")
---------------------------
-- VARIABLES 
---------------------------
-- VehicleBuff variables.
local local_ped = players.user_ped()
-- Default values of vehicle HPs.
local body_health = 1000
local body_multiplier = 1.0
local engine_multiplier = 1.0
local tuning_range = 200

-- Cinderella variables.
local laser_model = "vehicle_weapon_rctank_lazer"
-- TODO : Fix the laser PTFX initialization such that spawning the vehicle minitank is not required.
local laser_ptfx = "bullet_tracer_ch_tank_laser" 
local laser_id = util.joaat(laser_model)
local laser_id2 = util.joaat(laser_ptfx)
local firing_interval = 1
local explode = false
local anachiro = false

-- Rapunzel variables.
local min_hp = 100
local max_hp = 1000000
-- Standard player juggernaut HP, as references.
local default_hp = 3700
local step_hp = 100
local modified_hp = default_hp
local avoid_heal_enemy = false
local ally_table = {}

--------------------------
-- LABELS
--------------------------
Labels = {}
Labels.string_label_cinderella_anachiro = "Turns Cinderella mode into attack everyone."
Labels.string_label_cinderella_explosive = "Add explosion to Cinderella mode's attack effect."
Labels.string_label_cinderella_manual_mode = "Shoot from muzzle using Cinderella's ability."
Labels.string_label_cinderella_shoot = "Shoot once using Cinderella's ability."
Labels.string_label_cinderella_shoot_auto = "Shoot automatically using Cinderella's ability."
Labels.string_label_rapunzel_avoid_healing_enemies = ""
Labels.string_label_rapunzel_change_hp = ""
Labels.string_label_rapunzel_heal = ""
Labels.string_label_rapunzel_hp_amount = ""
Labels.string_label_rapunzel_make_ally = ""
Labels.string_label_rapunzel_revive_ped = ""
Labels.string_label_rapunzel_set_proofs = ""
Labels.string_desc_cinderella_anachiro = "Turns Cinderella mode into attack everyone."
Labels.string_desc_cinderella_explosive = "Add explosion to Cinderella mode's attack effect."
Labels.string_desc_cinderella_manual_mode = "Shoot from muzzle using Cinderella's ability."
Labels.string_desc_cinderella_shoot = "Shoot once using Cinderella's ability."
Labels.string_desc_cinderella_shoot_auto = "Shoot automatically using Cinderella's ability."
Labels.string_desc_cinderella_glass_slippers = ""
Labels.string_desc_rapunzel_avoid_healing_enemies = ""
Labels.string_desc_rapunzel_change_hp = ""
Labels.string_desc_rapunzel_heal = ""
Labels.string_desc_rapunzel_hp_amount = ""
Labels.string_desc_rapunzel_make_ally = ""
Labels.string_desc_rapunzel_revive_ped = ""
Labels.string_desc_rapunzel_set_proofs = ""
--------------------------
--------------------------
-- UTILITY FUNCTIONS
--------------------------
--------------------------	
Utils = {}

------------------------
-- DEBUGGING
------------------------
function Utils.LogDebug(msg)
    if SCRIPT_SILENT_START then
		s = "DEBUG: " .. msg
        util.toast(s, "TOAST_ALL")
    end
end

--------------------------
-- TIMER
--------------------------
---@class Timer
---@field elapsed fun(): integer
---@field reset fun()
---@field isEnabled fun(): boolean
---@field disable fun()
---@return Timer
function Utils.NewTimer()
	local self = {
		start = util.current_time_millis(),
		m_enabled = false,
	}

	local function reset()
		self.start = util.current_time_millis()
		self.m_enabled = true
	end

	local function elapsed()
		return util.current_time_millis() - self.start
	end

	local function disable() self.m_enabled = false end
	local function isEnabled() return self.m_enabled end

	return
	{
		isEnabled = isEnabled,
		reset = reset,
		elapsed = elapsed,
		disable = disable,
	}
end

local timer <const> = Utils.NewTimer()

--------------------------
-- MEMORY
--------------------------
---@param addr integer
---@param offsets integer[]
---@return integer
function Utils.AddressFromPointerChain(addr, offsets)
	if addr == 0 then return 0 end
	for k = 1, (#offsets - 1) do
		addr = memory.read_long(addr + offsets[k])
		if addr == 0 then return 0 end
	end
	addr = addr + offsets[#offsets]
	return addr
end

------------------------
-- GET PED
------------------------
---@param player Player
---@param radius number
---@return Entity[]
function Utils.GetPedsInPlayerRange(player, radius)
	local peds = {}
	local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player)
	local pos = players.get_position(player)
	for _, ped in ipairs(entities.get_all_peds_as_handles()) do
		if ped ~= playerPed then
			local pedPos = ENTITY.GET_ENTITY_COORDS(ped, true)
			if pos:distance(pedPos) <= radius then table.insert(peds, ped) end
		end
	end
	return peds
end

--------------------------
-- GET VEHICLES IN RANGE
--------------------------
---@param player Player
---@param radius number
---@param excludePlayer boolean
---@return Entity[]
function Utils.GetVehicleInPlayerRange(player, radius, excludePlayer)
	local vehs = {}
	local playerPed = PLAYER.GET_PLAYER_PED_SCRIPT_INDEX(player)
	local playerVeh = PED.GET_VEHICLE_PED_IS_IN(playerPed, false)
	local pos = players.get_position(player)
	
	for _, veh in ipairs(entities.get_all_vehicles_as_handles()) do
		if excludePlayer and veh == playerVeh then goto continue end
		local vehPos = ENTITY.GET_ENTITY_COORDS(veh, true)
		if pos:distance(vehPos) <= radius then
			table.insert(vehs, veh)
		end
		::continue::
	end
	
	return vehs
end

--------------------------
-- CAM
--------------------------
---@param dist number
---@return v3
function Utils.GetOffsetFromCamera(dist)
	local rot = CAM.GET_FINAL_RENDERED_CAM_ROT(2)
	local pos = CAM.GET_FINAL_RENDERED_CAM_COORD()
	local dir = rot:toDir()
	dir:mul(dist)
	local offset = v3.new(pos)
	offset:add(dir)
	return offset
end

--------------------------
-- RANGE CONVERTER
--------------------------
function Utils.ToPolarRange(number)
	local numberFloor = number * 0.5 * -1
	local numberCeiling = number * 0.5 * 1
	return numberFloor, numberCeiling
end


--------------------------
-- ASSET LOADER
--------------------------
Cinderella = {}
Cinderella.AssetLoading = {}
function Cinderella.AssetLoading.Load()
if not WEAPON.HAS_WEAPON_ASSET_LOADED(laser_id) then
	WEAPON.REQUEST_WEAPON_ASSET(laser_id, 31, 26)
	WEAPON.GIVE_WEAPON_TO_PED(local_ped, laser_id, 0, false, false)
end
	STREAMING.REQUEST_NAMED_PTFX_ASSET("muz_ch_tank_laser")
	STREAMING.REQUEST_NAMED_PTFX_ASSET("bullet_tracer_ch_tank_laser")
	local status = STREAMING.HAS_NAMED_PTFX_ASSET_LOADED("bullet_tracer_ch_tank_laser")
	local status2 = STREAMING.HAS_NAMED_PTFX_ASSET_LOADED("muz_ch_tank_laser")
	GRAPHICS.USE_PARTICLE_FX_ASSET("bullet_tracer_ch_tank_laser");
	Utils.LogDebug(status .. status2)
end

function Cinderella.AssetLoading.LoadWithWorkaround()
    util.create_thread(function()
        local hash = util.joaat("minitank")
        if STREAMING.IS_MODEL_A_VEHICLE(hash) then
            util.request_model(hash)
            util.yield(100)
            local playerPos = ENTITY.GET_ENTITY_COORDS(PLAYER.PLAYER_PED_ID(), true)
            local spawnPos = v3.new(playerPos.x, playerPos.y, playerPos.z - 1000)
            local veh = entities.create_vehicle(hash, spawnPos, 0)
            if veh and veh ~= 0 then
                entities.delete_by_handle(veh)
            end
            STREAMING.SET_MODEL_AS_NO_LONGER_NEEDED(hash)
        else
            local assetLoadingString = hash .. " is not a valid vehicle model name :/"
            Utils.LogDebug(assetLoadingString)
        end
    end)
end

Cinderella.AssetLoading.LoadWithWorkaround()
--------------------------
--------------------------
-- MAIN FUNCTION
--------------------------
--------------------------
---Wrapper for bullet shooting.
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param damage number
---@param weapon_id number
---@param origin Ped
---@param speed number
function Utils.FireShots(x1, y1, z1, x2, y2, z2, damage, weapon_id, origin, speed)
	MISC.SHOOT_SINGLE_BULLET_BETWEEN_COORDS_IGNORE_ENTITY(
	x1,
	y1,
	z1,
	x2,
	y2,
	z2,
	damage,
	true, 
	weapon_id, 
	origin, 
	true, 
	false, 
	speed, 
	local_ped, 
	0)
	if explode then
		FIRE.ADD_OWNED_EXPLOSION(origin, x2, y2, z2, 1, 1.0, true, false, 95)
	end
end

--------------------------
-- OPTIONS
--------------------------
Cinderella.Menu = menu.my_root():list("Cinderella")

Cinderella.Menu:divider("Options")

Cinderella.Menu:toggle("Anachiro", {"anachiro"}, Labels.string_desc_cinderella_anachiro, function(on) anachiro = on end)

Cinderella.Menu:toggle("Explosive", {"cindyexplosion"}, Labels.string_desc_cinderella_explosive, function(on) explode = on end)

--------------------------
-- MANUAL MODE
--------------------------

Cinderella.Menu:divider("Modes")

local function get_shot_interval()
	local CPed = entities.handle_to_pointer(players.user_ped())
	local addr = Utils.AddressFromPointerChain(CPed, {0x10B8, 0x20, 0x013C})
	return addr ~= 0 and memory.read_float(addr) * 1000 or -1.0
end

local function shoot_from_muzzle()
	local_ped = players.user_ped()
	if not WEAPON.IS_PED_ARMED(local_ped, 4) then
		return
	end
	PLAYER.DISABLE_PLAYER_FIRING(players.user(), true)
	if PAD.IS_DISABLED_CONTROL_PRESSED(0, 24) and
	PLAYER.IS_PLAYER_FREE_AIMING(players.user()) and timer.elapsed() > math.max(get_shot_interval(), 50.0) then
		local weapon = WEAPON.GET_CURRENT_PED_WEAPON_ENTITY_INDEX(local_ped, 0)
		local bone = ENTITY.GET_ENTITY_BONE_INDEX_BY_NAME(weapon, "gun_muzzle")
		local bonePos = ENTITY.GET_ENTITY_BONE_POSTION(weapon, bone)
		local offset = Utils.GetOffsetFromCamera(390.0)
		Utils.FireShots(
			bonePos.x, 
			bonePos.y, 
			bonePos.z,
			offset.x, 
			offset.y, 
			offset.z,
			200,
			laser_id,
			local_ped,
			2000
		)
		PAD.SET_CONTROL_SHAKE(0, 50, 100)
		timer.reset()

	elseif PAD.IS_DISABLED_CONTROL_JUST_RELEASED(0, 24) then
		PAD.STOP_CONTROL_SHAKE(0)
	end
end

Cinderella.Menu:toggle_loop("Cinderella Manual Mode", {"cindymanual"}, Labels.string_desc_cinderella_manual_mode, function() 
	shoot_from_muzzle()
end
)
--------------------------
-- AUTO MODE
--------------------------

local does_have_enemies_in_area = function(radius)
	local pos = players.get_position(players.user())
	return PED.COUNT_PEDS_IN_COMBAT_WITH_TARGET_WITHIN_RADIUS(players.user_ped(), pos.x, pos.y, pos.z, radius) > 0
end

local shoot_ped = function ()
	local nearbyPeds = Utils.GetPedsInPlayerRange(players.user(), 500.0)
	for _, ped in ipairs(nearbyPeds) do
		-- Early return to avoid targeting non-existent or dead peds.
		if not ENTITY.DOES_ENTITY_EXIST(ped) or ENTITY.IS_ENTITY_DEAD(ped, false) then
			goto continue
		end
		
		local rel = PED.GET_RELATIONSHIP_BETWEEN_PEDS(players.user_ped(), ped)
		local should_target = false
		local rndX, rndY, rndZ
		
		-- Acquires every ped when anachiro is enabled
		if anachiro == true then
			should_target = true
			rndX = math.random(-20, 20) 
			rndY = math.random(-20, 20) 
			rndZ = math.random(5, 50)
		-- Acquires only enemies when anachiro is disabled
		elseif PED.IS_PED_IN_COMBAT(ped, players.user_ped()) or (rel == 4 or rel == 5) then
			should_target = true
			rndX = math.random(-20, 20) 
			rndY = math.random(-20, 20) 
			rndZ = math.random(5, 20)
		end
		
		-- Fire if we should target this ped
		if should_target then
			local pos = ENTITY.GET_ENTITY_COORDS(ped, false)
			local pos2 = ENTITY.GET_ENTITY_COORDS(ped, false)
			pos2.x = pos2.x + rndX
			pos2.y = pos2.y + rndY
			-- If target is in air, change random Z such that it include negative values.
			pos2.z = pos2.z + rndZ
			Utils.FireShots(pos2.x,
			pos2.y,
			pos2.z,
			pos.x,
			pos.y,
			pos.z, 300,
			laser_id,
			players.user_ped()
		)
		end
		::continue::
	end
end
local shoot_veh = function()
	local nearbyVehs = Utils.GetVehicleInPlayerRange(players.user(), 500.0, true)
	for _, veh in ipairs(nearbyVehs) do
		if not ENTITY.DOES_ENTITY_EXIST(veh) or ENTITY.IS_ENTITY_DEAD(veh, false) or not VEHICLE.IS_VEHICLE_SEAT_FREE(veh, -1) then
			goto continue
		end
		if anachiro == true then
			local rndX = math.random(-20, 20) 
			local rndY = math.random(-20, 20)
			local rndZ  -- Declare it here
			if ENTITY.IS_ENTITY_IN_AIR(veh) == true then 
				rndZ = math.random(-30, 30)  -- No 'local' keyword
			else 
				rndZ = math.random(5, 50)  -- No 'local' keyword
			end
			local pos = ENTITY.GET_ENTITY_COORDS(veh, false)
			local pos2 = {
				x = pos.x + rndX,
				y = pos.y + rndY,
				z = pos.z + rndZ
			}	
			Utils.FireShots(pos2.x, pos2.y, pos2.z, pos.x, pos.y, pos.z, 500, laser_id, players.user_ped())
		end
		::continue::
	end
end
--------------------------
-- GLASS SLIPPERS (WIP)
--------------------------
-- Description: Spawn Oppressor Mk2s around the player left and right, and make the lasers fire from the Oppressor Mk2. 
local glass_slippers = {} -- Store vehicle handles

local function create_glass_slipper(ped, mk2_hash, boneID, z_offset ,x_offset, y_offset, pitch, yaw)
	local playerPos = players.get_position(players.user())
	playerPos.z = playerPos.z + 3
	local veh = entities.create_vehicle(mk2_hash, playerPos, 0)
	VEHICLE.SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(veh, true)
	VEHICLE.SET_VEHICLE_COLOURS(veh, 120, 0)
	VEHICLE.SET_VEHICLE_CUSTOM_SECONDARY_COLOUR(veh, 0, 255, 255)
	VEHICLE.SET_VEHICLE_DIRT_LEVEL(veh, 0)
	ENTITY.SET_ENTITY_COLLISION(veh, 0, 0)
	ENTITY.ATTACH_ENTITY_TO_ENTITY(veh, ped, PED.GET_PED_BONE_INDEX(ped, boneID), 
		z_offset, x_offset, y_offset, pitch, 0, yaw, 
		true, true, true, true, 1, true, 0)
	ENTITY.SET_ENTITY_INVINCIBLE(veh, true, true)
	ENTITY.SET_ENTITY_NO_COLLISION_ENTITY(veh, ped, false)
	VEHICLE.SET_VEHICLE_DISABLE_COLLISION_UPON_CREATION(veh, false)
	return veh
end

local function cleanup_glass_slippers()
	for _, veh in ipairs(glass_slippers) do
		if ENTITY.DOES_ENTITY_EXIST(veh) then
			entities.delete_by_handle(veh)
		end
	end
	glass_slippers = {}
end

local last_shot_time = 0

Cinderella.Menu:toggle_loop("Glass Slippers", {"cindyglass"}, Labels.string_desc_cinderella_glass_slippers, function()
	-- Spawn code...
	if #glass_slippers == 0 then
		local ped = players.user_ped()
		if not ENTITY.DOES_ENTITY_EXIST(ped) or ENTITY.IS_ENTITY_DEAD(ped) then
			return
		end
		
		local mk2_hash = util.joaat("oppressor2")
		util.request_model(mk2_hash, 2000)
		local boneID = 39317
		local positions = {
			{1, 1, 1, 0, -90},
			{1, 1, -1, 180, 90},
			{3, -5, 5, 0, -90},
			{3, -5, -5, 180, 90}
		}
		for _, pos in ipairs(positions) do
			table.insert(glass_slippers, create_glass_slipper(ped, mk2_hash, boneID, pos[1], pos[2], pos[3], pos[4], pos[5]))

		end
	end
	local_ped = players.user_ped()
	local gesture_state = memory.read_int(memory.script_global(4521801 + 932))
	
	-- Keep forcing the gesture state to stay active
	if gesture_state == 3 or PAD.IS_CONTROL_PRESSED(0, 25) then
		-- Force gesture to stay in state 3
		memory.write_int(memory.script_global(4521801 + 932), 3)
		
		local current_time = util.current_time_millis()
		if current_time - last_shot_time > 50 then
			last_shot_time = current_time
			local camRot = CAM.GET_FINAL_RENDERED_CAM_ROT(2)
			local camPos = CAM.GET_FINAL_RENDERED_CAM_COORD()
			local dir = camRot:toDir()
			dir:mul(math.random(20, 500))
			local finalTarget = v3.new(camPos)
			finalTarget:add(dir)
			for _, veh in ipairs(glass_slippers) do
				if ENTITY.DOES_ENTITY_EXIST(veh) then
					local vehPos = ENTITY.GET_ENTITY_COORDS(veh, true)
					Utils.FireShots(vehPos.x, 
					vehPos.y, 
					vehPos.z, 
					finalTarget.x, 
					finalTarget.y, 
					finalTarget.z, 
					1000, 
					laser_id, 
					veh, 
					1000)
				end
			end
		end
	end
end, function()
	cleanup_glass_slippers()
end)



Cinderella.Menu:action("Cinderella Shoot", {"cindyshoot"}, Labels.string_desc_cinderella_shoot, function()
	local timer = Utils.NewTimer()
	while (anachiro or does_have_enemies_in_area(15.0)) and timer.elapsed() < 500 do
		shoot_ped()
		util.yield_once()
	end
end
)


Cinderella.Menu:action("Cinderella Auto" , {"cindyauto"}, Labels.string_desc_cinderella_shoot_auto, function()
	if anachiro or does_have_enemies_in_area(1500.0) then
		shoot_ped()
		if anachiro then shoot_veh() end
	end
end
)

--------------------------
-- BURST MODE
--------------------------
local burst_count = 0
local square_length = 50

Cinderella.Menu:toggle_loop("Cinderella Burst Mode", {"cindyburst"}, "", function ()
	local pFloor, pCeiling = Utils.ToPolarRange(square_length)
	local playerPos = ENTITY.GET_ENTITY_COORDS(players.user_ped())
	if burst_count >= 500 then
		burst_count = 0
		return
	end
	-- Shoot 10 bullets per frame instead of all 500 at once
	for i = 1, 10 do
		local startX = playerPos.x + math.random(pFloor, pCeiling)
		local startY = playerPos.y + math.random(pFloor, pCeiling)
		local startZ = playerPos.z + math.random(10, 30)
		local endX = playerPos.x + math.random(pFloor, pCeiling)
		local endY = playerPos.y + math.random(pFloor, pCeiling)
		local endZ = playerPos.z + math.random(0, 1)
		Utils.FireShots(
			startX, 
			startY, 
			startZ,
			endX, 
			endY, 
			endZ,
			200, 
			laser_id, 
			players.user_ped()
		)
		burst_count = burst_count + 1
	end
end)

----------------------------
-- HOTKEYS (WIP)
----------------------------

--------------------------
--------------------------
-- VEHICLE BUFF
--------------------------
--------------------------

VehicleBuff = {}
VehicleBuff.BuffVehicle = function(veh)
    local currentHealth = VEHICLE.GET_VEHICLE_BODY_HEALTH(veh)
    util.toast("Stock health: " .. currentHealth)
    NETWORK.SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES(NETWORK.VEH_TO_NET(veh), true)
    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(veh, false, true)
    NETWORK.SET_NETWORK_ID_ALWAYS_EXISTS_FOR_PLAYER(NETWORK.VEH_TO_NET(veh), players.user(), true)
    ENTITY.SET_ENTITY_CAN_BE_DAMAGED(veh, true)
    ENTITY.SET_ENTITY_MAX_HEALTH(veh, (body_multiplier * body_health))
    ENTITY.SET_ENTITY_HEALTH(veh, (body_multiplier * body_health), 0, 0)
    VEHICLE.SET_VEHICLE_STRONG(veh, true)
    VEHICLE.SET_VEHICLE_CAN_BE_VISIBLY_DAMAGED(veh, false)
    VEHICLE.SET_VEHICLE_EXPLODES_ON_HIGH_EXPLOSION_DAMAGE(veh, false)
    VEHICLE.SET_VEHICLE_BODY_HEALTH(veh, body_multiplier * body_health)
    VEHICLE.SET_VEHICLE_ENGINE_HEALTH(veh, (engine_multiplier * 5000) - 4000)
    VEHICLE.SET_VEHICLE_ENGINE_CAN_DEGRADE(veh, false)

    local vehicleModel = ENTITY.GET_ENTITY_MODEL(veh)
    if VEHICLE.IS_THIS_MODEL_A_PLANE(vehicleModel) or VEHICLE.IS_THIS_MODEL_A_HELI(vehicleModel)
    then
        VEHICLE.SET_PLANE_ENGINE_HEALTH(veh, (engine_multiplier * 5000) - 4000) 
        VEHICLE.SET_PLANE_RESIST_TO_EXPLOSION(veh, true)
    end
    if VEHICLE.IS_THIS_MODEL_A_PLANE(vehicleModel) then
        VEHICLE.SET_PLANE_PROPELLER_HEALTH(veh, body_multiplier * body_health)
    elseif VEHICLE.IS_THIS_MODEL_A_HELI(vehicleModel) then
        VEHICLE.SET_HELI_MAIN_ROTOR_HEALTH(veh, body_multiplier * body_health)
        VEHICLE.SET_HELI_TAIL_ROTOR_HEALTH(veh, body_multiplier * body_health)
    end
end

VehicleBuff.BuffPV = function()
    local playerVeh = entities.get_user_vehicle_as_handle(true)
    VehicleBuff.BuffVehicle(playerVeh)
end

VehicleBuff.BuffVehicleInRange = function()
	local nearbyVehs = Utils.GetVehicleInPlayerRange(players.user(), tuning_range, false)
	for _, veh in ipairs(nearbyVehs) do
		if not ENTITY.DOES_ENTITY_EXIST(veh) or ENTITY.IS_ENTITY_DEAD(veh, false) then
			goto continue
		end
		VehicleBuff.BuffVehicle(veh)
        VEHICLE.SET_VEHICLE_LIVERY(veh, 0)
        VEHICLE.REMOVE_VEHICLE_MOD(veh, 48)
		::continue::
	end
end

--------------------------
-- OPTIONS
--------------------------
VehicleBuff.Menu = menu.my_root():list("Vehicle Buff")
VehicleBuff.Menu:slider("Buff Target Range", {"setbuffrange"}, "", 5, 500, 100, 10, function(value)
    tuning_range = value
end)

VehicleBuff.Menu:slider("Body Health Multiplier", {"vehbodymult"}, "", 1, 100, 1, 1, function(value)
    body_multiplier = value
end)

VehicleBuff.Menu:slider("Engine Health Multiplier", {"vehengmult"}, "", -4, 100, 1, 1, function(value)
    engine_multiplier = value
end)

VehicleBuff.Menu:action(
    "Buff Vehicle", 
    {"buffveh"}, 
    "Buff player vehicle in the specified range to the HP or HP multipliers toggled.", 
    function()
         VehicleBuff.BuffPV()
    end
)

VehicleBuff.Menu:action(
    "Buff Vehicle In Range", 
    {"Buffvehrange"}, 
    "Buff all vehicle in the specified range to the HP or HP multipliers toggled.", 
    function()
        VehicleBuff.BuffVehicleInRange()
    end
)
------------------------
-- PTFX
------------------------
local function initPTFX(nped)
    STREAMING.REQUEST_NAMED_PTFX_ASSET("scr_sum2_hal")
    while not STREAMING.HAS_NAMED_PTFX_ASSET_LOADED("scr_sum2_hal") do
        util.yield(0)
    end
    GRAPHICS.USE_PARTICLE_FX_ASSET("scr_sum2_hal")
    GRAPHICS.START_NETWORKED_PARTICLE_FX_LOOPED_ON_ENTITY_BONE(
        "scr_sum2_hal_rider_weak_green", nped,
        0, 0, 1, 0, 0, 0, 12844, 2.0, 1, 1, 1, 0, 255.0, 0, 255.0
    )
    util.yield(500)
    GRAPHICS.REMOVE_PARTICLE_FX_FROM_ENTITY(nped)
    STREAMING.REMOVE_NAMED_PTFX_ASSET("scr_sum2_hal")
end
------------------------
-- RAGDOLL BLOCKING (WIP)
------------------------

local function ragdollBlocker(ped)
    -- Do NOT call SET_RAGDOLL_BLOCKING_FLAGS multiple times individually
    -- R* passes a single bitmask value:
    PED.SET_RAGDOLL_BLOCKING_FLAGS(ped, 131071)  -- 0x1FFFF, all 17 flags
    -- PED.SET_RAGDOLL_BLOCKING_FLAGS(ped, 0x3F)  -- or just 1 | 2 | 4 if you want ultra-minimal
    -- Core "don't ragdoll from X" flags (these are the real heroes)

    PED.SET_PED_CAN_RAGDOLL_FROM_PLAYER_IMPACT(ped, 0)
    PED.SET_PED_CONFIG_FLAG(ped, 89, true)   -- DONT_ACTIVATE_RAGDOLL_FROM_ANY_PED_IMPACT
    PED.SET_PED_CONFIG_FLAG(ped, 106, true)   -- DONT_ACTIVATE_RAGDOLL_FROM_VEHICLE_IMPACT
    PED.SET_PED_CONFIG_FLAG(ped, 107, true)   -- DONT_ACTIVATE_RAGDOLL_FROM_BULLET_IMPACT
    PED.SET_PED_CONFIG_FLAG(ped, 108, true)   -- DONT_ACTIVATE_RAGDOLL_FROM_EXPLOSIONS          ← RPG blast
    PED.SET_PED_CONFIG_FLAG(ped, 109, true)   -- DONT_ACTIVATE_RAGDOLL_FROM_FIRE
    PED.SET_PED_CONFIG_FLAG(ped, 110, true)   -- DONT_ACTIVATE_RAGDOLL_FROM_ELECTROCUTION
    PED.SET_PED_CONFIG_FLAG(ped, 160, true)   -- DONT_ACTIVATE_RAGDOLL_FROM_IMPACT_OBJECT     ← crucial for the rocket projectile itself
    PED.SET_PED_CONFIG_FLAG(ped, 161, true)   -- DONT_ACTIVATE_RAGDOLL_FROM_MELEE
    PED.SET_PED_CONFIG_FLAG(ped, 306, true)   -- DONT_ACTIVATE_RAGDOLL_FROM_PLAYER_PED_IMPACT
    PED.SET_PED_CONFIG_FLAG(ped, 307, true)   -- DONT_ACTIVATE_RAGDOLL_FROM_AI_RAGDOLL_IMPACT
    PED.SET_PED_CONFIG_FLAG(ped, 308, true)   -- DONT_ACTIVATE_RAGDOLL_FROM_PLAYER_RAGDOLL_IMPACT
    PED.SET_PED_CONFIG_FLAG(ped, 336, true)   -- DONT_ACTIVATE_RAGDOLL_FOR_VEHICLE_GRAB
    PED.SET_PED_CONFIG_FLAG(ped, 208, true)   -- DISABLE_EXPLOSION_REACTIONS
    PED.SET_PED_CONFIG_FLAG(ped, 118, true)  -- don't run from fires/explosions
    PED.SET_PED_CONFIG_FLAG(ped, 430, true)   -- keep your existing one

    PED.SET_PED_RAGDOLL_ON_COLLISION(ped, 0)
    ENTITY.SET_ENTITY_LOAD_COLLISION_FLAG(ped, true, 1)
    Utils.LogDebug("Ped " .. util.reverse_joaat(ENTITY.GET_ENTITY_MODEL(ped)) .. " has applied combat attributes.")
end

------------------------
-- ATTRIBUTE SETTING
------------------------
local function setAttributes(ped)
    ragdollBlocker(ped)

    PED.SET_PED_SUFFERS_CRITICAL_HITS(ped, 0)

    PED.SET_PED_COMBAT_ATTRIBUTES(ped, 46, true)
    PED.SET_PED_COMBAT_ATTRIBUTES(ped, 0, 0)
    PED.SET_PED_COMBAT_ATTRIBUTES(ped, 5, true)
    PED.SET_PED_COMBAT_ATTRIBUTES(ped, 60, true)
    PED.SET_PED_COMBAT_ATTRIBUTES(ped, 38, true)
    PED.SET_PED_COMBAT_ATTRIBUTES(ped, 35, true)
    PED.SET_PED_COMBAT_ATTRIBUTES(ped, 36, true)
    PED.SET_PED_COMBAT_ATTRIBUTES(ped, 29, true)
    WEAPON.SET_PED_INFINITE_AMMO_CLIP(ped, 1)
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
    TASK.TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)  -- stops AI reactions that can force ragdoll
    PED.SET_PED_FIRING_PATTERN(ped, util.joaat("FIRING_PATTERN_FULL_AUTO"))
    Utils.LogDebug("Ped " .. util.reverse_joaat(ENTITY.GET_ENTITY_MODEL(ped)) .. " has applied combat attributes.")
end

------------------------
-- PROOFS SETTING
------------------------
Rapunzel = {}
Rapunzel.Menu = menu.my_root():list("Rapunzel")
proofMenu = Rapunzel.Menu:list("Ped Proofs", {"proofmenu"}, "")

local proofs = {
    bulletProof    = false,
    fireProof      = false,
    explosionProof = false,
    collisionProof = false,
    meleeProof     = false,
    steamProof     = false,
    waterProof     = false,
}

local proofTypes = {
    "bulletProof",
    "fireProof",
    "explosionProof",
    "collisionProof",
    "meleeProof",
    "steamProof",
    "waterProof",
}

local function setProof(ped)
    ENTITY.SET_ENTITY_PROOFS(ped,
        proofs.bulletProof,
        proofs.fireProof,
        proofs.explosionProof,
        proofs.collisionProof,
        proofs.meleeProof,
        proofs.steamProof,
        true,
        proofs.waterProof)
    Utils.LogDebug("Proofs applied to ped: " .. util.reverse_joaat(ENTITY.GET_ENTITY_MODEL(ped)))
end

local function debugProofStatus()
    Utils.LogDebug("=== Current Proof Status ===")
    for proofType, value in pairs(proofs) do
        Utils.LogDebug(proofType .. ": " .. tostring(value))
    end
    Utils.LogDebug("===========================")
end

local function testProofs(ped)
    Utils.LogDebug("=== Testing Proofs on Ped " .. ped .. " ===")
    local bulletProof    = memory.alloc(1)
    local fireProof      = memory.alloc(1)
    local explosionProof = memory.alloc(1)
    local collisionProof = memory.alloc(1)
    local meleeProof     = memory.alloc(1)
    local steamProof     = memory.alloc(1)
    local p7             = memory.alloc(1)
    local drownProof     = memory.alloc(1)

    ENTITY.GET_ENTITY_PROOFS(ped, bulletProof, fireProof, explosionProof, collisionProof, meleeProof, steamProof, p7, drownProof)

    Utils.LogDebug("Bullet Proof: "    .. tostring(memory.read_byte(bulletProof)    ~= 0))
    Utils.LogDebug("Fire Proof: "      .. tostring(memory.read_byte(fireProof)      ~= 0))
    Utils.LogDebug("Explosion Proof: " .. tostring(memory.read_byte(explosionProof) ~= 0))
    Utils.LogDebug("Collision Proof: " .. tostring(memory.read_byte(collisionProof) ~= 0))
    Utils.LogDebug("Melee Proof: "     .. tostring(memory.read_byte(meleeProof)     ~= 0))
    Utils.LogDebug("Steam Proof: "     .. tostring(memory.read_byte(steamProof)     ~= 0))
    Utils.LogDebug("p7: "              .. tostring(memory.read_byte(p7)             ~= 0))
    Utils.LogDebug("Drown Proof: "     .. tostring(memory.read_byte(drownProof)     ~= 0))

    memory.free(bulletProof)
    memory.free(fireProof)
    memory.free(explosionProof)
    memory.free(collisionProof)
    memory.free(meleeProof)
    memory.free(steamProof)
    memory.free(p7)
    memory.free(drownProof)
    Utils.LogDebug("===========================")
end

for _, proofType in ipairs(proofTypes) do
    local damageType = string.sub(proofType, 1, #proofType - 5)
    local helpText   = "Protection against " .. damageType .. " damage."
    local command    = damageType .. "proof"
    local label      = string.upper(string.sub(damageType, 1, 1)) .. string.sub(damageType, 2) .. " Proof"

    menu.toggle(proofMenu, label, {command}, helpText, function(toggle)
        proofs[proofType] = toggle
        Utils.LogDebug(proofType .. " toggled to: " .. tostring(toggle))
    end)
end

------------------------
-- MAKE ALLY
------------------------
-- WARNING: This is a jankier version of bodyguards, because they do the same thing but more unstable.

local function makeAlly(ped)
    PED.SET_PED_RELATIONSHIP_GROUP_HASH(ped, util.joaat("PLAYER"))
    PED.SET_PED_AS_GROUP_MEMBER(ped, PLAYER.GET_PLAYER_GROUP(players.user()))
    PED.SET_RELATIONSHIP_BETWEEN_GROUPS(0, util.joaat("PLAYER"), util.joaat("PLAYER"))
    PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("PLAYER"), util.joaat("COP"))
    PED.SET_RELATIONSHIP_BETWEEN_GROUPS(5, util.joaat("COP"), util.joaat("PLAYER"))
    PED.SET_PED_RELATIONSHIP_GROUP_DEFAULT_HASH(ped, util.joaat("PLAYER"))
    PED.SET_CAN_ATTACK_FRIENDLY(ped, false, false)
    PED.SET_PED_CONFIG_FLAG(ped, 17, false)   -- Disable friendly fire
    PED.SET_PED_CONFIG_FLAG(ped, 281, true)   -- Ignore player provocation
    ENTITY.SET_ENTITY_AS_MISSION_ENTITY(ped, true, true)
    ENTITY.SET_ENTITY_LOAD_COLLISION_FLAG(ped, true, 1)
    PED.SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(ped, true)
    PED.SET_PED_KEEP_TASK(ped, true)
    PED.SET_PED_COMBAT_ABILITY(ped, 100)
    PED.SET_PED_COMBAT_RANGE(ped, 2)
    PED.SET_PED_SEEING_RANGE(ped, 100.0)
    PED.SET_PED_HEARING_RANGE(ped, 100.0)
    PED.SET_PED_COMBAT_ATTRIBUTES(ped, 5, true)
    PED.SET_PED_COMBAT_ATTRIBUTES(ped, 46, true)
    PED.SET_PED_COMBAT_ATTRIBUTES(ped, 52, true)
    PED.SET_PED_COMBAT_ATTRIBUTES(ped, 2, false)
    PED.SET_PED_FLEE_ATTRIBUTES(ped, 0, false)
    TASK.CLEAR_PED_TASKS_IMMEDIATELY(ped)
    TASK.TASK_COMBAT_HATED_TARGETS_AROUND_PED(ped, 100.0, 0)
    table.insert(ally_table, ped)
end

util.create_tick_handler(function()
    for _, ped in ipairs(ally_table) do
        if ENTITY.DOES_ENTITY_EXIST(ped) and not ENTITY.IS_ENTITY_DEAD(ped) then
            if PED.GET_RELATIONSHIP_BETWEEN_PEDS(ped, PLAYER.PLAYER_PED_ID()) > 2 then
                PED.SET_PED_RELATIONSHIP_GROUP_HASH(ped, util.joaat("PLAYER"))
                PED.SET_CAN_ATTACK_FRIENDLY(ped, false, false)
            end
        end
    end
end)

------------------------
-- UNIFIED PED OPERATION
------------------------
---@param operation string: "heal", "change_hp", "revive", "make_ally", or "set_proofs"
local function performPedOperation(operation)
    local nearbyPeds = Utils.GetPedsInPlayerRange(players.user(), 25.0)
    for _, ped in ipairs(nearbyPeds) do
        local pedName = util.reverse_joaat(ENTITY.GET_ENTITY_MODEL(ped))

        if not ENTITY.DOES_ENTITY_EXIST(ped) then
            goto continue
        end

        if PED.IS_PED_IN_COMBAT(ped, players.user_ped()) and avoid_heal_enemy then
            Utils.LogDebug("Ped " .. pedName .. " is combatting  Skipping.")
            goto continue
        end

        setAttributes(ped)

        if operation ~= "revive" and ENTITY.IS_ENTITY_DEAD(ped, false) then
            goto continue
        end

        if operation == "revive" then
            if not (PED.IS_PED_FATALLY_INJURED(ped) or PED.IS_PED_DEAD_OR_DYING(ped)) then
                goto continue
            end
            PED.REVIVE_INJURED_PED(ped)
            PED.RESURRECT_PED(ped)
            local maxHealth = ENTITY.GET_ENTITY_MAX_HEALTH(ped)
            ENTITY.SET_ENTITY_HEALTH(ped, maxHealth, 0, 0)
            makeAlly(ped)
            Utils.LogDebug("Ped " .. pedName .. " revived and enlisted as soldier!")

        elseif operation == "make_ally" then
            makeAlly(ped)

        elseif operation == "heal" then
            local maxHealth = ENTITY.GET_ENTITY_MAX_HEALTH(ped)
            ENTITY.SET_ENTITY_HEALTH(ped, maxHealth, 0, 0)
            Utils.LogDebug("Ped " .. pedName .. " healed to max health: " .. maxHealth)

        elseif operation == "change_hp" then
            ENTITY.SET_ENTITY_MAX_HEALTH(ped, modified_hp)
            ENTITY.SET_ENTITY_HEALTH(ped, modified_hp, 0, 0)
            Utils.LogDebug("Ped " .. pedName .. "'s Max Health set to: " .. modified_hp)

        elseif operation == "set_proofs" then
            debugProofStatus()
            setProof(ped)
            testProofs(ped)
        end

        initPTFX(ped)
        PED.CLEAR_PED_BLOOD_DAMAGE(ped)
        ::continue::
    end
end

------------------------
-- MENU ITEMS
------------------------
Rapunzel.Menu:toggle_loop("Rapunzel Heal", {"rapunzelheal"}, Labels.string_desc_rapunzel_heal, function()
    performPedOperation("heal")
    util.yield(1)
end)

Rapunzel.Menu:toggle("Avoid Healing Enemy Combatants", {"avoidhealenemy"}, Labels.string_desc_rapunzel_avoid_healing_enemies, function(toggle)
    avoid_heal_enemy = toggle
end)

Rapunzel.Menu:slider("Modified HP", {"rapunzelHP"}, Labels.string_desc_rapunzel_hp_amount, min_hp, max_hp, default_hp, step_hp, function(value)
    modified_hp = value
end)

Rapunzel.Menu:action("Rapunzel Change HP", {"rapunzelchangehp"}, Labels.string_desc_rapunzel_change_hp, function()
    performPedOperation("change_hp")
end)

Rapunzel.Menu:action("Rapunzel Revive Ped", {"rapunzelrevive"}, Labels.string_desc_rapunzel_revive_ped, function()
    performPedOperation("revive")
end)

Rapunzel.Menu:action("Rapunzel Set Proofs", {"rapunzelsetproofs"}, Labels.string_desc_rapunzel_set_proofs, function()
    performPedOperation("set_proofs")
end)

Rapunzel.Menu:action("Rapunzel Make Ally", {"rapunzelmakeally"}, Labels.string_desc_rapunzel_make_ally, function()
    performPedOperation("make_ally")
end)

