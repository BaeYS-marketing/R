
rm(list=ls())

library(Kormaps)

# 1인 가구 정보 불러오기
DONG<-read.csv('c:/Rstudy/data/one.csv')
colnames(DONG)<-c('구별','name','일인가구')
gangnam <- DONG %>% filter(구별=='노원구')


# 동별 단계 구분도
Encoding(names(korpopmap3))<-'UTF-8'
Encoding(korpopmap3@data$name_eng)<-'UTF-8'
Encoding(korpopmap3@data$name)<-'UTF-8'
Encoding(korpopmap3@data$행정구역별_읍면동)<-'UTF-8'
korpopmap3@data$name = gsub('·','',korpopmap3@data$name)

idx = which(korpopmap3@data$name %in% gangnam$name)

korpopmap3@data = korpopmap3@data[idx,]
korpopmap3@data = merge(korpopmap3@data, gangnam, by.x='name', sort=FALSE)
korpopmap3@polygons<-korpopmap3@polygons[idx] 

mymap <- korpopmap3@data
mypalette <- colorNumeric(palette ='RdYlBu' , domain = mymap$'일인가구')
mypopup <- paste0(mymap$name,'<br> 1인가구: ',mymap$'일인가구')

map7 <- NULL
map7<-leaflet(korpopmap3) %>% 
  addTiles() %>% 
  setView(lat=37.52711, lng=126.987517, zoom=12) %>%
  addPolygons(stroke =FALSE,
              smoothFactor = 0.2,
              fillOpacity = .8,
              popup = mypopup,
              color = ~mypalette(mymap$일인가구)) %>% 
  addLegend(values = ~mymap$일인가구,
            pal = mypalette,
            title = '인구수',
            opacity = 1)

map7	







####################해보기##############


# # RStudio 를 재기동한 후에 설치한다.(안하면 재앙이 따를거임!!)
library(Kormaps)

DONG<-read.csv('c:/RStudy/data/one.csv')
colnames(DONG) <- c('구별','name','일인가구')
dong <- DONG %>% filter(구별=='강남구')
dong

data(korpopmap3)
Encoding(names(korpopmap3))<-'UTF-8'    # 한글 문제 해결
Encoding(korpopmap3@data$name_eng)<-'UTF-8'
Encoding(korpopmap3@data$name)<-'UTF-8'
Encoding(korpopmap3@data$행정구역별_읍면동)<-'UTF-8'
korpopmap3@data$name <- gsub('·','',korpopmap3@data$name)

# 노원구의 ID 값 찾기위해서  <= View 에서 일일히 찾기 힘드니까
idx = which(korpopmap3@data$name %in% dong$name)[-1]
korpopmap3@data = korpopmap3@data[idx, ]
korpopmap3@polygons = korpopmap3@polygons[idx]
korpopmap3@data <- merge(korpopmap3@data, dong, by.x='name', sort=FALSE)

# korpopmap3@polygons<-korpopmap3@polygons[c(159:177)] 

mypalette <- colorNumeric(palette ='RdYlBu' , domain = dong$'일인가구')
mypopup <- paste0(dong$name,'<br> 1인가구: ',dong$'일인가구')

map <- NULL
map<-leaflet(korpopmap3) %>% 
  addTiles() %>% 
  setView(lat=37.650652, lng=127.076968, zoom=12) %>%
  addPolygons(stroke =FALSE,
              smoothFactor = 0.2,
              fillOpacity = .9,
              popup = mypopup,
              color = ~mypalette(dong$일인가구)) %>% 
  addLegend( values = ~dong$일인가구,
             pal =mypalette ,
             title = '1인가구수',
             opacity = 1)
map

saveWidget(map, file="c:/Rstudy/oneMap.html")


