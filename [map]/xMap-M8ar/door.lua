Door3 = createObject(980,2245.1000976563,-2958.5,15.300000190735,0,0,0)
markerDoor3 = createMarker(2244.8999023438,-2956.3000488281,12.10000038147,'cylinder',7,0,0,0,0)

addEventHandler('onMarkerHit',markerDoor3,
function ( hitElement )
     moveObject(Door3,500,2245.1000976563,-2958.5,20.200000762939)
end
)

addEventHandler('onMarkerLeave',markerDoor3,
function ( hitElement )
     moveObject(Door3,500,2245.1000976563,-2958.5,15.300000190735)
end
)