home=geocode('경기도 덕양구 화랑로44', source = 'google')
content <- paste('<b>정재원의 집</b>','<hr>','제법 오래 자취하고 있는 곳')

leaflet(home) %>% 
  setView(lng = home$lon, lat = home$lat, zoom = 16) %>% 
  addTiles() %>% 
  addCircles(lng = home$lon, lat=home$lat, popup = ~content, color = 'red')