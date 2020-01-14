library(ggmap)
library(ggplot2)


register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')


names <- c("우리집")
home <- c("수원시 팔달구 경수대로 672")


myHome <- geocode(enc2utf8(home))



#구글지도  37.2853228,127.0258947

dfHome <- as.data.frame(myHome)
vecHome = c(dfHome$lon, dfHome$lat)

# dfHome <- c(lon =127.0, lat = 37.3)



home <- get_map(center = vecHome, maptype = 'satellite', zoom = 13, marker=myHome)
ggmap(home)






names <- c("우리집")
addr <- c("수원시 팔달구 경수대로 672")


gc <- geocode(enc2utf8(addr))
gc

#마커 아큐먼트
df <- data.frame(name=names,
                 lon=gc$lon,
                 lat=gc$lat)

#center/location 아규먼트 : 평균지점으로 설정하겠다. 
cen <- c(mean(df$lon),mean(df$lat))


map <- get_googlemap(center=cen,
                     maptype="roadmap",
                     zoom=17,
                     size=c(640,640),
                     marker=gc)


ggmap(map) 
















#2
getwd()
df<-read.csv('data/지역별장애인도서관정보.csv')
df[2]
View(df)

df2<-df[,c(9,10)]

class(df2[1,1])



cen <- c(lon=mean(df2[,2]), lat=mean(df2[,1]))

df2
df3 <- cbind(df2[2],df2[1])

df4 <- cbind(df[2],df2[2],df2[1])
View(df4)



df$도서관명
row.names(df3) <- df$도서관명
df3
View(df3)


cen


map <- get_googlemap(center=cen,
                     maptype = 'roadmap',
                     zoom=10,
                     size=c(640,640),
                     marker = df3)
ggmap(map)+
        geom_point(data=df3,aes(x=LON,y=LAT),alpha=0.5, size =2, color ='red')+
        geom_text(data=df3,aes(x=LON,y=LAT,label = row.names(df3),vjust=0, hjust=0))


ggmap(map)+
        geom_point(data=df3,aes(x=LON,y=LAT),alpha=0.5, size =2, color ='red')+
        geom_text(data=df4,aes(x=LON,y=LAT,label = df4$도서관명,vjust=0, hjust=0))

