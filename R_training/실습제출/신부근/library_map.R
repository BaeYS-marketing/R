a <- read.csv("지역별장애인도서관정보.csv", stringsAsFactors=F)
b <- as.data.frame(a[,c("도서관명","주소")])
names(b) <- c("name","address")
b$address <- as.character(b$address)    
b$address <- iconv(b$address, from="cp949", to="UTF-8")
c<-a[, c("LAT", "LON")]
c <- mutate_geocode(b, address, source="google")
map_seoul <- get_map(location="seoul", zoom=11, maptype="roadmap")    
ggmap(map_seoul)+geom_point(data=c, aes(x=lon, y=lat), alpha=0.5, size=5, color="red")+ 
  geom_text(data=c,label=c$name,vjust=0, hjust=0)
ggsave('library.png')