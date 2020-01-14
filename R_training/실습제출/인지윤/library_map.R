register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

un_lib <- read.csv("c:/Rstudy/data/지역별장애인도서관정보.csv")
df <- data.frame(name=un_lib$도서관명, lon=un_lib$LON, lat=un_lib$LAT)
head(df)
cen <- c(mean(df$lon),mean(df$lat))
cen
map <- get_googlemap(center=cen, maptype="roadmap", zoom=11)

ggmap(map) + geom_point(data=df, aes(x=lon, y=lat), alpha=0.7, size=5, color="red") + 
  geom_text(data=df, label=df$name, vjust=0, hjust=0)