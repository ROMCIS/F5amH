
function getTimeLeft( Timer )
	local Details = getTimerDetails( Timer ) 
    local DownDay, DownHours, DownMinutes, DownSeconds = math.floor( Details / 86400000 ), math.floor( Details / 3600000 ), math.floor( Details / 60000 ), math.floor( Details / 1000 ) 
	local Hours, Minutes, Seconds = math.floor( ( Details - DownDay * 86400000 ) / 3600000 ), math.floor( ( Details - DownHours * 3600000 ) / 60000 ), math.floor( ( Details - DownMinutes * 60000 ) / 1000 ) 
    return "("..tostring(Minutes)..":"..tostring(Seconds)..")"
end

addEvent("GetAds",true)
addEventHandler("GetAds",root,function(Text,Music,Photo)
if ( getElementData( resourceRoot,"Ads" ) == "Close" ) then return outputChatBox("#ffFFFF[ #FFFF00Advertising#FFFFFF ] :#ffffff الأعلانات في الوقت الحالي مغلقة",source,255,255,0,true) end
if ( isPlayerMuted(source) ) then return outputChatBox("#ffFFFF[ #FFFF00Advertising#FFFFFF ] :#ffffff لا تستطيع أرسال اعلان وأنت ميوت",source,255,255,0,true) end
if getPlayerMoney(source) >= 250000 then
if ( getElementData( resourceRoot,"Ads" ) == true ) then return outputChatBox("#ffFFFF[ #FFFF00Advertising#FFFFFF ] :#ffffff لأنشاء أعلان يرجى الأنتظار : "..getTimeLeft(TimerAds).."ِ",source,255,255,0,true) end
if ( Photo == 10 and not getTeamName(getPlayerTeam(source)) == "Police" ) then return outputChatBox("#ffFFFF[ #FFFF00Advertising#FFFFFF ] :#ffffff الخلفية خاصة لتيم الشرطة فقط",source,255,255,0,true) end
takePlayerMoney(source,250000)
local Gorup = getElementData(source,"Group") or ""..getPlayerName(source)..""
removeElementData(resourceRoot,"AdsInfo")
removeElementData(resourceRoot,"Ads")
exports.TopBarChat:sendClientMessage("#ffffff[ #126EF3Ads #FFFFFF]:#FFFFFF 'H' يوجد اعلان جديد لرؤيته اضغط #ffffff[ #126EF3"..Gorup.." #ffffff]",root, 0, 255, 40, true)
setElementData ( resourceRoot, "AdsInfo", {getPlayerName(source),Text,Music,Photo,Gorup} )
setElementData ( resourceRoot,"Ads", true)
triggerClientEvent(root,"ShowAd",root)
TimerAds = setTimer(function()
removeElementData(resourceRoot,"AdsInfo")
removeElementData(resourceRoot,"Ads")
end,4*60*1000,1)
else
outputChatBox("لا تملك مال كافي لأرسال أعلان",source,255,0,0)
end
end
)

addCommandHandler("dAds",function(p,_,...)
if isObjectInACLGroup ("user."..getAccountName(getPlayerAccount(p)),aclGetGroup("Console")) then 
if isTimer(TimerAds) then killTimer(TimerAds) end
local For = table.concat({...}, " ")
triggerClientEvent(root,"RemvoeAd",root,getPlayerName(p),For)
setTimer(function()
removeElementData(resourceRoot,"AdsInfo")
removeElementData(resourceRoot,"Ads")
end,45*1000,1)
end
end 
);

addCommandHandler("Ads",function(p)
if isObjectInACLGroup ("user."..getAccountName(getPlayerAccount(p)),aclGetGroup("Console")) then 
if getElementData ( resourceRoot,"Ads" ) ~= "Close" then
setElementData ( resourceRoot,"Ads", "Close" )
outputChatBox("#ffFFFF[ #FFFF00Advertising#FFFFFF ] :#ffffff لقد تم أغلاق الاعلانات",source,255,255,0,true)
else
removeElementData(resourceRoot,"Ads")
outputChatBox("#ffFFFF[ #FFFF00Advertising#FFFFFF ] :#ffffff لقد تم فتح الاعلانات",source,255,255,0,true)
end
end
end 
);
