addEventHandler("onResourceStart", resourceRoot,
	function()
		resetMapInfo()
		for i,player in ipairs(getElementsByType("player")) do
			spawn(player)
		end
	end
)

function spawn(player)
	if not isElement(player) then return end
	repeat until spawnPlayer ( player, -4383.12891+math.random(1,5), -3043.74829+math.random(5,9), 1.30625, 180, 46, 0, 0)
	fadeCamera(player, true)
	setCameraTarget(player, player)
	showChat(player, true)
end

addEventHandler("onPlayerJoin", root,
	function()
		spawn(source)
	end
)

addEventHandler("onPlayerWasted", root,
	function()
		setTimer(spawn, 1800, 1, source)
	end
)