register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

my_home = mk <- geocode(enc2utf8("경기도 군포시 고산로643번길 9"), source = "google")
cen = c(my_home$lon, my_home$lat)

my_map = function(maptype) {
  map = get_googlemap(center=cen, maptype=maptype ,zoom=16)
  ggmap(map) +
    geom_point(aes(x=my_home$lon, y=my_home$lat), alpha=0.8, size=5, color="red") +
    labs(title = "이정환의 집", x = "경도", y = "위도")
}

mtype = NULL

if ((as.numeric(format(Sys.time(), "%S")) >= 0) & (as.numeric(format(Sys.time(), "%S")) <= 14)) {
  print(Sys.time())
  mtype = "terrain"
  my_map(mtype)
} else if ((as.numeric(format(Sys.time(), "%S")) >= 15) & (as.numeric(format(Sys.time(), "%S")) <= 29)) {
  print(Sys.time())
  mtype = "satellite"
  my_map(mtype)
} else if ((as.numeric(format(Sys.time(), "%S")) >= 30) & (as.numeric(format(Sys.time(), "%S")) <= 44)) {
  print(Sys.time())
  mtype = "roadmap"
  my_map(mtype)
} else {
  print(Sys.time())
  mtype = "hybrid"
  my_map(mtype)
}
ggsave("mymap.png")