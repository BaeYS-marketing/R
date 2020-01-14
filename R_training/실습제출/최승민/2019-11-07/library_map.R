libinfo <- read.csv("지역별장애인도서관정보.csv", stringsAsFactors=F)       

str(df) 
head(libinfo)
lib_name <- libinfo[2]
lib_lonlat <- libinfo[9:10]
lib_ttl <- bind_cols(lib_name,lib_lonlat)

str(lib_ttl)

save(lib_ttl, file="lib_ttl.rda")
load("lib_ttl.rda")

qmap('seoul', zoom = 11)
qmap(seoul_lonlat, zoom = 11, source = 'google', maptype = 'roadmap')
seoul_map <- qmap('Seoul', zoom = 11, source = 'google', maptype = 'roadmap')
seoul_map + geom_point(data = lib_ttl, aes(x = lib_ttl$LON, y = lib_ttl$LAT), colour = 'red',
                       size = 4) 
  + geom_text(data = lib_ttl, aes(x = lib_ttl$LON, y = lib_ttl$LAT, label = lib_ttl$도서관명, vjust=0, hjust=0))
ggsave("library.png")
