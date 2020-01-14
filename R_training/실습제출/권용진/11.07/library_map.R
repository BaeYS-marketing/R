library(dplyr)
library(xlsx)
install.packages("ggmap")
library(ggmap)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

df = read.csv("c:/Rstudy/지역별장애인도서관정보.csv", )
name = as.character(df$도서관명)
add = as.character(df$주소)

geoc <- geocode(enc2utf8(add))
geoc
View(dff)
dff <- data.frame(names=name,lon=df$LON,lat=df$LAT)

cen <- c(mean(dff$lon),mean(dff$lat))
map <- get_googlemap(center=cen, maptype="roadmap",zoom=11, size=c(640,640))
ggmap(map) + geom_point(data = dff, aes(x=lon, y=lat),alpha=0.3, size=2, color="red")+ geom_text(data = dff, aes(x=lon, y=lat), label=dff$names, size=2, vjust=1, hjust=0)



