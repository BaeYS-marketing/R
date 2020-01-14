# Q.1

now_second = format(Sys.time(),"%S")
maptype_random = 
  if(now_second >=45){
    'hybrid'
  }else if(now_second >=30){
    'roadmap'                 
  }else if(now_second >=15){
    'satellite'
  }else{
    'terrain'
  }


mk = geocode(enc2utf8('망포역'), source = 'google')
cen <- c(mk$lon, mk$lat)


map <- get_googlemap(center=cen,
                     maptype=maptype_random,
                     zoom=17,
                     marker=mk)

ggmap(map)+labs(title = "우찬의 집", x="경도", y="위도")+
  geom_text(aes(x=mk$lon, y=mk$lat, label="동네", vjust=0, hjust=0))

ggsave('mymap.png')






