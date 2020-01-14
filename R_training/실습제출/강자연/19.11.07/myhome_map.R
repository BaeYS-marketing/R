#강자연의 집


a=format(Sys.time(),format='%S') 
a=as.numeric(a)
b=ifelse(a>=45,"hibrid",ifelse(a>=30,"roadmap",ifelse(a>=15,"satellite","terrain")))



library(ggmap)

register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')#
강자연 <- geocode(enc2utf8("용산구 한강대로 77길 15"), source = "google")
mk <- 강자연
print(mk)
cen <- c(mk$lon, mk$lat)
map <- get_googlemap(center=cen, maptype=b,zoom=16)
ggmap(map) + 
  geom_point(aes(x=mk$lon, y=mk$lat), alpha=0.4, size=5, color="red") +
  geom_text(aes(x=mk$lon, y=mk$lat, label="강자연의 집", vjust=0, hjust=0))

ggsave("mymap.png")
