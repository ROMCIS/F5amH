function superman ()
cancelEvent ()
end

xCol = createColRectangle (-4531.98535,-3178.83228,350,250.6)
xRadar = createRadarArea (-3600,-3100.0693359375,450.00000000000,350,0,0,0,0,root)


function renderTime()
setTimer ( function()
local Time = { getTime() }  
if( Time[1] ~= 6 ) then
setTime(6,0)
end
end,4500,1)
end

addEventHandler("onColShapeHit",resourceRoot,function (element)
if ( getElementType(element) == "vehicle" ) then
destroyElement(element)
elseif ( getElementType(element) == "player" ) then
toggleControl (element,"fire",false)
toggleControl (element,"action",false)
toggleControl (element,"aim_weapon",false)
addEventHandler( "onClientRender" , root , renderTime )
addEventHandler("onPlayerDamage",root,superman)
addEventHandler("onClientPlayerDamage", localPlayer, cancelEvent)
end
end)

addEventHandler("onColShapeLeave",resourceRoot,function (element)
if ( getElementType(element) == "player" ) then
toggleControl (element,"fire",true)
toggleControl (element,"action",true)
toggleControl (element,"aim_weapon",true)
removeEventHandler( "onClientRender" , root , renderTime )
removeEventHandler("onPlayerDamage",root,superman)
removeEventHandler("onClientPlayerDamage", localPlayer, cancelEvent)
end
end)
