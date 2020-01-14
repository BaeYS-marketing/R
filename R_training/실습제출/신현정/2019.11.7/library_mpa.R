#문제 2

df <- read.csv("지역별장애인도서관정보.csv", stringsAsFactors=F)   

map_seoul <- get_map(location="seoul", zoom=11, maptype="roadmap") 
ggmap(map_seoul)+
  geom_point(data=df, aes(x=df$LON, y=df$LAT), alpha=0.5, size=2, color="red")+
  geom_text(data=df, aes(x=df$LON, y=df$LAT, label= df$도서관명 , vjust=0, hjust=0))

ggsave("library.png")