register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

home <- geocode(enc2utf8("충청남도 당진시 원당동 1226"))
cen <- c(home$lon, home$lat)

as.POSIXlt(Sys.time())$sec
map_type<- ifelse(as.POSIXlt(Sys.time())$sec < 14, "terrain", 
                 ifelse(as.POSIXlt(Sys.time())$sec < 29, "satellite",
                        ifelse(as.POSIXlt(Sys.time())$sec < 44, "roadmap", "hybird")))
map_type
map <- get_googlemap(center=cen, maptype=map_type)
ggmap(map) + geom_point(aes(x=home$lon, y=home$lat), alpha=0.5, size=5, color="red") +
  geom_text(aes(x=home$lon, y=home$lat, label="인지윤의 집", vjust=1, hjust=0))

ggsave("c:/Rstudy/mymap.png")




#t <- Sys.time()
#lt <- as.POSIXlt(t)
#lt$sec

#t <- format(Sys.time(), "%s")
#t
