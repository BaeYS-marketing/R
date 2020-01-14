install.packages("ggmap")
library(ggmap)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

yjhome = geocode(enc2utf8("월드컵북로38길54"), source = "google")
mk <- yjhome
cen <- c(mk$lon, mk$lat)

t<-Sys.time()
sec = format(t,"%S")

maptp = function(sec){
  if(sec>=0 & sec<=14){
  print("terrain")
  }
  else if(sec>=15 & sec<=29){
  print("satellite")
  }
  else if(sec>=30 & sec<=44){
  print("roadmap")
  } 
  else if(sec>=45 & sec<=59){
  print("hybrid")
  }
}

map <- get_googlemap(center=cen, maptype = maptp(sec),zoom=17, marker=mk)
ggmap(map) + labs(title="용진 집", x="경도", y="위도")+
  geom_text(aes(x=mk$lon, y=mk$lat, label="권용진동네", vjust=0, hjust=0))


