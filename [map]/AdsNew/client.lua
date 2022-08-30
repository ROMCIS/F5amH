Photo = 1


local screenW, screenH = guiGetScreenSize()
        AdsColor = guiCreateStaticImage(0.29, 0.71, 0.44, 0.19, "Img/Bg.png", true)
		guiSetVisible(AdsColor,false)
        AdsWnd = guiCreateStaticImage(0.03, 0.01, 0.966, 0.98, "Img/"..Photo..".png",true,AdsColor)    
        Ads = guiCreateLabel(0.51, 0.04, 0.49, 0.15, "الأعلان :", true, AdsWnd)
        guiSetFont(Ads, "default-bold-small")
        guiLabelSetColor(Ads, 255, 254, 254)
        guiLabelSetHorizontalAlign(Ads, "right", false)    
        LblName = guiCreateLabel(0.85, 0.62, 0.15, 0.15, "المرسل : ", true, AdsWnd)
        guiSetFont(LblName, "default-bold-small")
        guiLabelSetColor(LblName, 255, 254, 254)
        guiLabelSetHorizontalAlign(LblName, "right", false)    
        LblGroup = guiCreateLabel(0.36, 0.62, 0.15, 0.15, "العصابة : ", true, AdsWnd)
        guiSetFont(LblGroup, "default-bold-small")
        guiLabelSetColor(LblGroup, 255, 254, 254)   
        guiLabelSetHorizontalAlign(LblGroup, "right", false)    
        AdsText = guiCreateLabel(0.03, 0.20, 0.95, 0.38, "", true, AdsWnd)
        guiSetFont(AdsText, "default-bold-small")
        guiLabelSetHorizontalAlign(AdsText, "right", true)
		guiLabelSetColor(AdsText, 253, 215, 0)
        AdsBy = guiCreateLabel(0.51, 0.62, 0.34, 0.15, "", true, AdsWnd)
        guiSetFont(AdsBy, "default-bold-small")
        guiLabelSetColor(AdsBy, 253, 215, 0)
        guiLabelSetHorizontalAlign(AdsBy, "right", false)
        AdsGroup = guiCreateLabel(0.02, 0.62, 0.34, 0.15, "", true, AdsWnd)
        guiSetFont(AdsGroup, "default-bold-small")
        guiLabelSetColor(AdsGroup, 253, 215, 0)
        guiLabelSetHorizontalAlign(AdsGroup, "right", false)
        HideIn = guiCreateLabel(0.21, 0.82, 0.59, 0.15, "يختفي بعد : [5]", true, AdsWnd)
        guiSetFont(HideIn, "default-bold-small")
        guiLabelSetColor(HideIn, 255, 254, 254)
        guiLabelSetHorizontalAlign(HideIn, "center", false)
------------------
        SendNew = guiCreateWindow((screenW - 246) / 2, (screenH - 355) / 2, 246, 355, "أرسال أعلان", false)
        guiWindowSetSizable(SendNew, false)
        guiSetProperty(SendNew, "CaptionColour", "FFFDD700")
		guiSetVisible(SendNew,false)

        LBL1 = guiCreateLabel(8, 21, 228, 18, "النص :", false, SendNew)
        guiSetFont(LBL1, "default-bold-small")
        guiLabelSetColor(LBL1, 253, 215, 0)
        guiLabelSetHorizontalAlign(LBL1, "right", false)
        LBL2 = guiCreateLabel(9, 96, 227, 18, "موسيقى الاعلان (اختياري) ", false, SendNew)
        guiSetFont(LBL2, "default-bold-small")
        guiLabelSetColor(LBL2, 253, 215, 0)
        guiLabelSetHorizontalAlign(LBL2, "right", false)
        TextEdit = guiCreateMemo(9, 39, 225, 57, "", false, SendNew)
		guiSetProperty(TextEdit, "MaxTextLength", "70")
        GroupEdit = guiCreateComboBox(10, 114, 224, 100, "", false, SendNew)
        Send = guiCreateButton(9, 142, 116, 20, "أرسال بـ 250.000$", false, SendNew)
        guiSetFont(Send, "default-bold-small")
        guiSetProperty(Send, "NormalTextColour", "FFFEA800")
        Close = guiCreateButton(134, 142, 100, 20, "أغلاق", false, SendNew)
        guiSetFont(Close, "default-bold-small")
        guiSetProperty(Close, "NormalTextColour", "FFFF7171")
        LBL3 = guiCreateLabel(10, 166, 226, 18, "خلفية الأعلان :", false, SendNew)
        guiSetFont(LBL3, "default-bold-small")
        guiLabelSetColor(LBL3, 253, 215, 0)
        guiLabelSetHorizontalAlign(LBL3, "right", false)
        Back = guiCreateButton(131, 283, 105, 19, "السابق", false, SendNew)
        guiSetFont(Back, "default-bold-small")
        guiSetProperty(Back, "NormalTextColour", "FEFE0505")
        Next = guiCreateButton(10, 283, 111, 19, "التالي", false, SendNew)
        guiSetFont(Next, "default-bold-small")
        guiSetProperty(Next, "NormalTextColour", "FF0DFE0D")
        Wallpaper = guiCreateStaticImage(10, 188, 224, 87, "Img/"..Photo..".png", false, SendNew)    
        LBL4 = guiCreateLabel(10, 306, 226, 18, "اعدادات شخصية :", false, SendNew)
        guiSetFont(LBL4, "default-bold-small")
        guiLabelSetColor(LBL4, 253, 215, 0)
        guiLabelSetHorizontalAlign(LBL4, "right", false)
        ActiveAD = guiCreateCheckBox(9, 325, 225, 16, "أظهار الاعلانات تلقائياً", false, false, SendNew)
        guiSetFont(ActiveAD, "default-bold-small")    

SS = {
	{"OnePice.mp3"},
	{"War_Music.mp3"},
	{"War_Music2.mp3"},
}

for i,Wat in ipairs(SS) do
	guiComboBoxAddItem(GroupEdit, Wat[1]) 
end


addEventHandler("onClientGUIClick",root,function()
local Text = guiGetText(TextEdit)
local Music = guiComboBoxGetItemText(GroupEdit, guiComboBoxGetSelected(GroupEdit))
if source == ActiveAD then
if ( guiCheckBoxGetSelected(ActiveAD) == true ) then
setElementData(localPlayer,"ActiveAD",true)
outputChatBox("#ffFFFF[ #0040FFAdvertising#FFFFFF ] : تم تفعيل ظهور الاعلانات تلقائياً",255,255,255,true)
else
setElementData(localPlayer,"ActiveAD",false)
outputChatBox("#ffFFFF[ #0040FFAdvertising#FFFFFF ] : تم إلغاء تفعيل ظهور الاعلانات تلقائياً",255,255,255,true)
end
elseif source == Send then
if Text ~= "" or Text ~= " " then
triggerServerEvent("GetAds",localPlayer,Text,Music,Photo)
guiSetVisible(SendNew,false)
showCursor(false)
guiSetInputEnabled ( false )
end
elseif source == Close then
guiSetVisible(SendNew,false)
showCursor(false)
guiSetInputEnabled ( false )
elseif source == Back then
if Photo > 1 then
	Photo = Photo - 1
	guiStaticImageLoadImage(Wallpaper,"Img/"..Photo..".png")
end
elseif source == Next then
if Photo < 10 then
	Photo = Photo + 1
	guiStaticImageLoadImage(Wallpaper,"Img/"..Photo..".png")
end
end
end ) ;		

addEvent("ShowAd",true)
addEventHandler("ShowAd",root,function()
if ( getElementData(localPlayer,"ActiveAD") == true ) then
ShowAds()
else
bindKey("H","down",ShowAds)
end 
end ) ;

addEvent("RemvoeAd",true)
addEventHandler("RemvoeAd",root,function(Admin,For)
guiSetText(AdsText,"تم حذف هذا الاعلان..من قبل الأدمن : "..string.gsub(Admin,"#%x%x%x%x%x%x","").."\nالسبب : "..For)
end ) ;



function ShowAds()
if ( getElementData(resourceRoot,"Ads") == true ) then
unbindKey("H","down",ShowAds)
local tName,tText,tMusic,tPhoto,tGroup = unpack(getElementData(resourceRoot,"AdsInfo")) 
local R , G , B = math.random(55,200) , math.random(55,200) , math.random(55,200)
local color = string.format("%.2X%.2X%.2X%.2X",255, R , G , B)
guiLabelSetColor(AdsText,R , G , B)
guiLabelSetColor(AdsBy,R , G , B)
guiSetText(AdsText,tText)
guiSetText(AdsBy,string.gsub(tName,"#%x%x%x%x%x%x",""))
guiStaticImageLoadImage(AdsWnd,"Img/"..tPhoto..".png")
guiSetProperty(AdsColor, "ImageColours", "tl:"..color.." tr:"..color.." bl:"..color.." br:"..color.."")
guiSetVisible(AdsColor,true)
setTimer(guiSetVisible,1000+40*1000,1,AdsColor,false )
AdsTimer = setTimer(function() end, 1000, 40)
if tMusic == "" then
guiSetText(AdsGroup,"")
guiSetText(LblGroup,"العصابة : "..tGroup.."")
guiLabelSetColor(LblGroup,R , G , B)

else
guiSetText(LblGroup,"العصابة : "..tGroup.."")
Sound = playSound(tMusic,false)
setSoundVolume( Sound, 60 )

end
end
end


addEventHandler("onClientRender",root,function()
if guiGetVisible(AdsWnd) == true then
if isTimer(AdsTimer) then A, B, C = getTimerDetails(AdsTimer)
 guiSetText(HideIn,"يختفي بعد : ["..B.."]") 
 else
 if isElement( Sound ) then
 destroyElement( Sound )
 end
 guiSetText(HideIn,"يختفي بعد : [0]") end
end
end);

function Bins()
  if ( guiGetVisible(SendNew) == true ) then
	guiSetVisible(SendNew,false)
	showCursor(false)
	guiSetInputEnabled ( false )
  else
	guiSetVisible(SendNew,true)
	showCursor(true)
	guiSetInputEnabled ( true )
  end
end    
addCommandHandler ( "اعلان", Bins )