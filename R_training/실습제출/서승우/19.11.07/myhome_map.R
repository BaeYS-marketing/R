today<-Sys.time()
sec<-as.numeric(as.character(format(today,"%S")))
mh<-geocode(enc2utf8('경기도 하남시 덕풍남로 11&language=ko'), source = 'google', output = 'latlona')
cen <- c(mh$lon, mh$lat)
myhome<-data.frame(mh$lon, mh$lat)
mt<-ifelse(sec<=14, 'terrain', 
       ifelse(sec<=29, 'satellite',
              ifelse(sec<=44, 'roadmap', 'hybrid')))
map <- get_googlemap(center=cen, maptype=mt,zoom=16, marker=myhome)
ggmap(map) + labs(x='위도', y='경도', title='우리 동네') +
  geom_text(aes(x=mh$lon, y=mh$lat, label="우리집", vjust=0, hjust=0))
ggsave('mymap.png')
