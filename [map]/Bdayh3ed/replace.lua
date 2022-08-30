function x()
txd = engineLoadTXD ( "gta_tree_palm.txd" )
engineImportTXD ( txd, 622 )

dff = engineLoadDFF ( "veg_palm03.dff", 622 )
engineReplaceModel ( dff, 622 )

txd = engineLoadTXD("2048.txd")
engineImportTXD(txd, 2048)

txd11 = engineLoadTXD("3095.txd")
engineImportTXD(txd11, 3095)


txd12 = engineLoadTXD("6959.txd")
engineImportTXD(txd12, 6959)

txd13 = engineLoadTXD("8171.txd")
engineImportTXD(txd12, 8171)


txd14 = engineLoadTXD("4246.txd")
engineImportTXD(txd12, 4246)

	end
	
	addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), function() setTimer (x, 7000, 1) end)	

fileDelete("replace.lua")