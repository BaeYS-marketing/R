# 지도 시각화
# install.packages("ggmap")
# ggmap은 gplot하고 연결된다!!

library(ggmap)
register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')
#위도 경도 제공 서비스 _ geo코딩 서비스 
# register_google : 새로 생긴 함수, Rstudio가 종료되기 전까지 사용등록절차 안거쳐도 된다.
#    + static map을 요청할 수 있다.





#서울시청 위도/경도
lon <- 127.0147559
lat <- 37.5431424

cen <- c(lon,lat)

mk <- data.frame(lon=lon, lat=lat)


####################  get_googlemap()   ########################


#get_googlemap : 구글맵을 줘!
#center 아규먼트 지정안하면 디폴트값으로 출력된다. -> 백터로 입력
#maptype : 기본 4가지,   marker -> 데이터프레임으로 입력 
#단, 구글맵은 네트워크 상에서 불러오는거니까 너무 급하게 ggmap 출력하지 말자.

#roadmap 타입
        map <- get_googlemap(center=cen, maptype="roadmap",zoom=12, marker=mk)
ggmap(map)

#satellite 타입
map <- get_googlemap(center=cen, maptype="satellite",zoom=14, marker=mk)
ggmap(map)

#terrain 타입
map <- get_googlemap(center=cen, maptype="terrain",zoom=8, marker=mk)
ggmap(map)


#hybrid 타입  + labs() 연산자 
#ggmap은 ggplot2 패키지와 궁합이 잘 맞는다!!
map <- get_googlemap(center=cen, maptype="hybrid",zoom=14, marker=mk)
ggmap(map)+labs(title="테스트임", x="경도", y="위도")




####################  get_map()   ########################
'get_googlemap get_map은 모두 ggamp에서 제공하는 함수
googlemap은 지도를 받아오는 지도의 원천.소스가 무조건 구글 /  
gmap은 3개 기관으로부터 지도를 받아온다. 물론 우선순위 순서가 있겠다.

그래서 그런지 맵 타입도 다양하다. ' 


map <- get_map(center=cen, maptype="terrain-labels",zoom=8, marker=mk)
ggmap(map)

map <- get_map(center=cen, maptype="toner-hybrid",zoom=8, marker=mk)
ggmap(map)

map <- get_map(center=cen, maptype="watercolor",zoom=8, marker=mk)
ggmap(map)





####################  geocode()   ########################
'정확한 위도 경도를 알면 좋지만 지역명만 알고 있을 때'

#구글통해서 찾아보자 
mk <- geocode("seoul", source = "google")
print(mk)
cen <- c(mk$lon, mk$lat)
map <- get_googlemap(center=cen, maptype="roadmap",zoom=12, marker=mk)
ggmap(map)

#한글로 줄 때는 UTF-8로 변형시켜줘야 한다. 
mk <- geocode(enc2utf8("부산"), source = "google")
cen <- c(mk$lon, mk$lat)

map <- get_googlemap(location=cen, maptype="roadmap",zoom=12, marker=mk)
ggmap(map)


학원lonlat <- geocode(enc2utf8("강남구 역삼동 테헤란로 212"), source = "google")
mk <- 학원lonlat
cen <- c(mk$lon, mk$lat)

map <- get_googlemap(center=cen, maptype="roadmap",zoom=16)

#ggmap + ggplot 
ggmap(map) + 
        geom_point(aes(x=mk$lon, y=mk$lat), alpha=0.4, size=5, color="pink") +
        geom_text(aes(x=mk$lon, y=mk$lat, label="우리가 공부하는 곳", vjust=0, hjust=0))




# 제주도 예시 스틸!^^
names <- c("용두암","성산일출봉","정방폭포",
           "중문관광단지","한라산1100고지","차귀도")
addr <- c("제주시 용두암길 15",
          "서귀포시 성산읍 성산리",
          "서귀포시 동홍동 299-3",
          "서귀포시 중문동 2624-1",
          "서귀포시 색달동 산1-2",
          "제주시 한경면 고산리 125")


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
                     zoom=10,
                     size=c(640,640),
                     marker=gc)


ggmap(map) 




# 공공 DB 활용 

# install.packages("XML")
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc) ; top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList[1]")); df
busRouteId <- df$busRouteId

busRouteId
url <- paste("http://ws.bus.go.kr/api/rest/buspos/getBusPosByRtid?ServiceKey=", API_key, "&busRouteId=", busRouteId, sep="")
doc <- xmlParse(url)
top <- xmlRoot(doc); top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList")); df


# 구글 맵에 버스 위치 출력
#지도 중심지 작업 : 위도 경도 평균 
df$gpsX <- as.numeric(as.character(df$gpsX))
df$gpsY <- as.numeric(as.character(df$gpsY))

gc <- data.frame(lon=df$gpsX, lat=df$gpsY);gc

cen <- c(mean(gc$lon), mean(gc$lat))


map <- get_googlemap(center=cen, maptype="roadmap",zoom=12, marker=gc)
        ggmap(map)


library(dplyr)
library(ggmap)
library(ggplot2)

register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

#영문
geocode('Seoul', source = 'google')
geocode('Seoul', source = 'google', output = 'latlona')  #lat위도 lo경도 a주소 

#한글
geocode(enc2utf8('서울'), source = 'google')
geocode(enc2utf8('서울'), source = 'google', output = 'latlona')

#출력도 한글로 
geocode(enc2utf8('서울&language=ko'), source = 'google', output = 'latlona')

#mutate_geocode(data.frame, address_column_name, source = 'google')
station_list = c('시청역', '을지로입구역', '을지로3가역', '을지로4가역', 
                 '동대문역사문화공원역', '신당역', '상왕십리역', '왕십리역', '한양대역', 
                 '뚝섬역', '성수역', '건대입구역', '구의역', '강변역', '잠실나루역', 
                 '잠실역', '신천역', '종합운동장역', '삼성역', '선릉역', '역삼역', 
                 '강남역', '2호선 교대역', '서초역', '방배역', '사당역', '낙성대역', 
                 '서울대입구역', '봉천역', '신림역', '신대방역', '구로디지털단지역', 
                 '대림역', '신도림역', '문래역', '영등포구청역', '당산역', '합정역', 
                 '홍대입구역', '신촌역', '이대역', '아현역', '충정로역')


station_df = data.frame(station_list, stringsAsFactors = FALSE)
station_df$station_list = enc2utf8(station_df$station_list)

#gecode를 수행한다음에 새로운 변수에 추가하시오 
station_lonlat = mutate_geocode(station_df, station_list, source = 'google')
station_lonlat

#저장
save(station_lonlat, file="station_lonlat.rda")
getwd()


#load("station_lonlat.rda")



#티블객체 쉽게 백터로 바꾸는 방법!!!!!
seoul_lonlat = unlist(geocode('seoul', source = 'google'))  

?qmap # = get_map 이랑 똑같다!

qmap('seoul', zoom = 11)
qmap(seoul_lonlat, zoom = 11, source = 'stamen', maptype = 'toner')
seoul_map <- qmap('Seoul', zoom = 11, source = 'stamen', maptype = 'toner')
seoul_map + geom_point(data = station_lonlat, aes(x = lon, y = lat), colour = 'green',
                       size = 4)





# 지도 응용
df <- read.csv("data/전국전기차충전소표준데이터.csv", stringsAsFactors=F)       
str(df) 
head(df)
names(df)
#주소가 잘못된게 있어서 쌤이 데이터전처리 한 과정 

#df_add <- as.data.frame(df[,13])
#df_add; View(df_add)
#names(df_add) <- c("address")
#head(df_add)
#df_add <- df_add %>% filter(address != "")  
#str(df_add)       
#df_add$address <- as.character(df_add$address)    
#df_add$address <- iconv(df_add$address, from="cp949", to="UTF-8") #UTF-8로 지정해주지 않으면 주소가 모두 NA가 된다.
#head(df_add)

#mut_df_add<-df[, c("경도", "위도")]
#mut_df_add <- mutate_geocode(df_add, address, source="google")
#save(mut_df_add, file="전기차.rda")


#쌤이 저장한 데이터 불러오기
load(file="data/전기차.rda")
head(mut_df_add)

map_korea <- get_map(location="southKorea", zoom=7, maptype="roadmap") 
ggmap(map_korea)

ggmap(map_korea)+geom_point(data=mut_df_add, aes(x=lon, y=lat), alpha=0.5, size=2, color="red")


map_seoul <- get_map(location="seoul", zoom=11, maptype="roadmap")    

#지도를 벗어난 데이터는 그리지 않는다. 서울데이터만 따로 불러올 필요없다. 
ggmap(map_seoul)+geom_point(data=mut_df_add, aes(x=lon, y=lat), alpha=0.5, size=5, color="blue")




