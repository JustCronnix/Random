local originyCL = 0
local originyFC = 0
local originyHS = 0
--woodstock origin y
local originyWS = 0

--snoopy origin y
local originySP = 0
--bf origin y
local originyBF = 0

function onCreate()

	makeLuaSprite('BlackScreen','',-900,-900)
	makeGraphic('BlackScreen',4000,4000,'000000')
	addLuaSprite('BlackScreen',false)
	scaleObject('BlackScreen', 2.0, 2.0 )
	setObjectCamera('BlackScreen','hud')
end

function onStepHit()
	if curStep == 144 then
		doTweenAlpha('introFade', 'BlackScreen', 0.0001, 0.5, 'linear')
	end
end
