myHero = GetMyHero()

local ts


--updater


local version = 0.01
local AUTO_UPDATE = true
local UPDATE_HOST = "raw.github.com"
local UPDATE_PATH = "/syore/BoL/master/Olaf%20the%20viking.lua".."?rand="..math.random(1,10000)
local UPDATE_URL = "https://"..UPDATE_HOST..UPDATE_PATH

local function AutoupdaterMsg(msg) print("<font color=\"#6699ff\"><b>Olaf the viking</b></font> <font color=\"#FFFFFF\">"..msg..".</font>") end
if AUTO_UPDATE then
	local ServerData = GetWebResult(UPDATE_HOST, "/syore/BoL/master/olaf%20the%20viking.version")
	if ServerData then
		ServerVersion = type(tonumber(ServerData)) == "number" and tonumber(ServerData) or nil
		if ServerVersion then
			if tonumber(version) < ServerVersion then
				AutoupdaterMsg("New version available"..ServerVersion)
				AutoupdaterMsg("Updating, please don't press F9")
				DelayAction(function() DownloadFile(UPDATE_URL, UPDATE_FILE_PATH, function () AutoupdaterMsg("Successfully updated. ("..version.." => "..ServerVersion.."), press F9 twice to load the updated version.") end) end, 3)
			else
				AutoupdaterMsg("You have the latest version ("..ServerVersion..")")
			end
		end
	else
		AutoupdaterMsg("Error downloading version info")
	end
end



function OnLoad()
	ts = TargetSelector(TARGET_LOW_HP_PRIORITY,650)


if myHero.charName = "Olaf" then
	PrintChat "You are a viking."
		else
			PrintChat "You picked the wrong champion."
			return end
		end
	end
end


function menu()
	myConfig = scriptConfig("Olaf the viking","vikingg")
 
	myConfig:addSubMenu("Drawing Settings", "drawing")
	myConfig.drawing:addParam("qrange", "Draw Qrange", SCRIPT_PARAM_ONOFF, true)
    myConfig.dwawing:addParam("passive", "Shows passive attackspeed bonus", SCRIPT_PARAM_ONOFF, true)
end
 

function OnTick()
	ts:update()
end

function caniQ()
	if ts.target ~= nil and myHero.CanUseSpell(_Q) == READY then
		CastSpell(_Q, ts.target)
end

function OnDraw()
		if myConfig.drawing.qrange and myHero.CanUseSpell(_Q) == READY then	
		Qrange()
	end
end

function Qrange()
	Graphics.DrawCircle(myHero.x, myHero.y, myHero.z, 1000, 0x111111)
end
function Erange()
	graphics.Graphics.DrawCircle(myHero.x, myHero.y, myHero.z, 325, 0x111111)
end


local passive = math.round(myHero.Health - myHero.maxHealth * 100)

