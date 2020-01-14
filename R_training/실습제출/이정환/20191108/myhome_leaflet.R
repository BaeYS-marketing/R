my_home = geocode(enc2utf8("경기도 군포시 고산로643번길 9"), source = "google")
msg = '<strong><a style="text-decoration:none">XXX의 집</a></strong><hr>XXX(서른마흔다섯살) (이)가 살고 있는 곳'
my_map = leaflet() %>%
  setView(lng = my_home$lon, lat = my_home$lat, zoom = 16) %>%
  addTiles() %>%
  addCircles(lng = my_home$lon, lat = my_home$lat, color='deeppink', popup = msg )
my_map
saveWidget(my_map, "mymap.html")
