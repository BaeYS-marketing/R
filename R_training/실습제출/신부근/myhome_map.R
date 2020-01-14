신부근동네 <- geocode(enc2utf8("경기도 용인시 역북동 275"), source = "google")
mk <- 신부근동네
cen <- c(mk$lon, mk$lat)
a<-format(Sys.time(),"%S")
a
maptype<-ifelse(a<=14,"terrain", 
            ifelse (a<=29,"satellite",
                   ifelse(a<=44,"roadmap","hybrid")))
maptype
map <- get_googlemap(center=cen, maptype=maptype,zoom=16)
ggmap(map) + geom_point(aes(x=mk$lon, y=mk$lat), alpha=0.4, size=5, color="red") +
geom_text(aes(x=mk$lon, y=mk$lat), label="신부근동네", vjust=0, hjust=0)
ggsave("mymap.png")
