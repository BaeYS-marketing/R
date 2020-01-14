myhome=geocode('경기도 덕양구 화랑로44', source = 'google')
cen=c(myhome$lon,myhome$lat)
mk <- data.frame(myhome)
map_type<-ifelse (format(Sys.time(), "%S")<15,1,
        ifelse(format(Sys.time(), "%S")<30,2,
               ifelse(format(format(Sys.time(), "%S")<45,3,
                             ifelse(format(Sys.time(), "%S")>45,4,"")))))
map<-switch(EXPR=map_type,
       map=get_googlemap(center=cen, maptype="terrain" ,zoom=16, marker=mk),
       map=get_googlemap(center=cen, maptype="satellite" ,zoom=16, marker=mk),
       map=get_googlemap(center=cen, maptype="roadmap" ,zoom=16, marker=mk),
       map=get_googlemap(center=cen, maptype="hybrid" ,zoom=16, marker=mk)
       )
ggmap(map) + 
  geom_text(aes(x=mk$lon, y=mk$lat, label=paste0("정재원의 집\n     위도 ",mk$lon,"\n     경도 ",mk$lat), vjust=0, hjust=0))