#leaflet 그리기
'자바스크립트 라이브러리인데 R도 지정한다. 
이제 ggplot2보다 이걸 쓸껄.'

# install.packages("leaflet")
library(leaflet)
library(dplyr)
library(ggmap)

seoul_lonlat <- geocode("seoul")

#지도 밑바탕 그린 것이랑 같다. 
leaflet()

#아규먼트로 줘도 되지만 덧붙이는 방식 느낌을 주기 위해 %>% 사용!!
#타일을 추가하겠습니다.   / 앞 ggplot과 다른 점은 움직인다는 것!
#얘는 이미지 파일 전체를 받는 것이 아니라, 반경내에 tile을 깔아주는 것이다. 아이작스처럼  
leaflet() %>% addTiles() 

register_google(key='AIzaSyD8k2DWC_7yFHCrH6LDR3RfITsmWMEqC8c')

map0 <- leaflet() %>% setView(lng = seoul_lonlat$lon, lat = seoul_lonlat$lat, zoom = 16)  
map0



map1 <- map0 %>% addTiles() 
map1


학원lonlat <- geocode(enc2utf8("강남구 역삼동 테헤란로 212"), source = "google")

mk <- 학원lonlat
lan <- mk$lon
lat <- mk$lat
msg <- '<strong><a href="http://www.multicampus.co.kr" style="text-decoration:none" >멀티캠퍼스</a></strong><hr>우리가 공부하는 곳 ㅎㅎ'
map2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 16) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color='green', popup = msg )
map2

map2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 18) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color='green', popup = msg )
map2

map2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 5) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color='green', popup = msg )
map2

map2 <- leaflet() %>% setView(lng = mk$lon, lat = mk$lat, zoom = 1) %>% addTiles() %>% addCircles(lng = lan, lat = lat, color='green', popup = msg )
map2


content1 <- paste(sep = '<br/>',"<b><a href='https://www.seoul.go.kr/main/index.jsp'>서울시청</a></b>",'아름다운 서울','박원순 시장님 화이팅!!')
map3<-leaflet() %>% addTiles() %>%  addPopups(126.97797, 37.56654, content1, options = popupOptions() )
map3


#stong은 강하게
#b 는 bold체로 

content2 <- paste(sep = '<br/>',"<b><a href='http://www.snmb.mil.kr/mbshome/mbs/snmb/'>국립서울현충원</a></b>",'1955년에 개장', '2013년 ‘서울 미래유산’으로 등재')
map3<-leaflet() %>% addTiles() %>%  addPopups(c(126.97797, 126.97797),  c(37.56654, 37.50124) , c(content1, content2), options = popupOptions(closeButton = FALSE) )
map3







wifi_data = read.csv('data/wifi_data.csv', encoding = 'utf-8', stringsAsFactors = FALSE)

View(wifi_data)

leaflet(wifi_data) %>%                              # leaflet(wifi_data) : wifi_data를 데이터로 하겠어 
        setView(lng = seoul_lonlat[1], 
                lat = seoul_lonlat[2], 
                zoom = 11) %>% 
        addTiles() %>% 
        addCircles(lng = ~lon, lat = ~lat)         # ~ : ~별 이라는 포뮬라 식을 함께 써줘야한다._ 안쓰면 Error
                                                  # wifi_data에 있는 lon의 데이터 별로 , lat의 데이터 별로 수행하겠다.         



leaflet(wifi_data) %>% 
        setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
        addProviderTiles('Stamen.Toner') %>%               #addTiles() 업글레이드 버전  /  Stamen이 제공하는 Toner 타일
        addCircles(lng = ~lon, lat = ~lat)


leaflet(wifi_data) %>% 
        setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
        addProviderTiles('CartoDB.Positron') %>% 
        addCircles(lng = ~lon, lat = ~lat)

leaflet(wifi_data) %>% 
        setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
        addProviderTiles('Stamen.Toner') %>% 
        addCircles(lng = ~lon, lat = ~lat, popup = ~div)


#색깔을 통신사별로 다르게 지정하면 좋을텐데  : colorFactor() 함수 ~~ 특이점은 !! 리턴값도 함수 !!
?colorFactor

colorFactor() 
'아규먼트로 지정한 팔렛트를 사용하여 아규먼트 데이터 만틈 색을 만들고나서 
출력으로 만들어진 함수를 통해 팩터별 색을 칠할 수 있게 만드는 함수!!'

telecom_color = colorFactor('Set1', wifi_data$div)      
#Set1 팔렛트 사용, wifi_data$div를 기준으로 Set1 팔렛트를 사용하겠다. 



'즉 colorFactor를 통해 만든 telecom_color는 Set1 팔레트를 wifi_data$div만큼 색을 가지고  
 색을 그려주는 또 다른 팔렛트 함수가 됐다'
str(telecom_color)
mode(telecom_color)

telecom_color(wifi_data$div)  #~div set1 팔레트를 사용한 팔레트 함수 
'우선 관측치 만큼 색을 만들고 실제 사용하는 색은 데이터의 팩터 레벨대로만 사용된다.'



leaflet(wifi_data) %>% 
        setView(lng = seoul_lonlat[1], lat = seoul_lonlat[2], zoom = 11) %>% 
        addProviderTiles('Stamen.Toner') %>% 
        addCircles(lng = ~lon, lat=~lat, popup = ~div, color = ~telecom_color(div))

                                                           #div별, 즉 3가지 색을 사용하겠다는 함수가 된다. 



# leaflet과 우리나라 행정구역 지도 활용
# # RStudio 를 재기동한 후에 설치한다.(안하면 재앙이 따를거임!!)
# install.packages("devtools") 
# devtools::install_github("cardiomoon/Kormaps")

#install.packages("rlang", "digest")
#Rtools 설치
#복사 붙여넣기 

library(Kormaps)

names(korpopmap1)  #데이터 프레임 같은 애 한테 names를 하면 변수명 리스트가 나온다. 
names(korpopmap2)
names(korpopmap3)
Encoding(names(korpopmap1))<-'UTF-8'   #Encoding이라는 함수를 수행하면서 UTF-8을 대입해준다. 
Encoding(names(korpopmap2))<-'UTF-8'
Encoding(names(korpopmap3))<-'UTF-8'
names(korpopmap1)
names(korpopmap2)
names(korpopmap3)

head(korpopmap1,1)  #SpatialPolygonsDataFrame 타입 : 행정구역 폴리건 그래서 위도 경도가 되게 많다. 

View(korpopmap1)

head(korpopmap2,1)
head(korpopmap3,1)

Encoding(korpopmap2@data$name)<-'UTF-8'
Encoding(korpopmap2@data$행정구역별_읍면동)<-'UTF-8'

korpopmap2@data <- korpopmap2@data[-26:-251,]
View(korpopmap2@data)
korpopmap2@polygons<-korpopmap2@polygons[-26:-251]
mymap <- korpopmap2@data
head(mymap)
View(korpopmap2)

crime <- read.csv('data/2017crime.csv')
head(crime)
palette1<-colorNumeric(palette = 'Oranges', domain = crime$살인_발생)
popup1 <- paste0(mymap$name,'<br> 살인 : ',crime$살인_발생, '건')
map4<-leaflet(korpopmap2) %>% addTiles() %>% setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%
        addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup1, color=~palette1(crime$살인_발생), group='살인')
map4


palette2<-colorNumeric(palette = 'Blues', domain = crime$폭력_발생)
popup2 <- paste0(mymap$name,'<br> 폭력 : ',crime$폭력_발생, '건')
map5<-leaflet(korpopmap2) %>% addTiles() %>% setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%
        addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup2, color=~palette2(crime$폭력_발생), group='폭력')
map5


palette3<-colorNumeric(palette = 'Reds', domain = crime$범죄_발생_총합)
popup3 <- paste0(mymap$name,'<br> 범죄_발생_총합 : ',crime$범죄_발생_총합, '건')
map6<-leaflet(korpopmap2) %>% addTiles() %>% setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%
        addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup3, color=~palette3(crime$범죄_발생_총합),group='총 범죄')

map6

palette2<-colorNumeric(palette = 'Blues', domain = crime$폭력_발생)
popup2 <- paste0(mymap$name,'<br> 폭력 : ',crime$폭력_발생, '건')
map8<-leaflet(korpopmap2) %>% addTiles() %>% setView(lat=37.559957 ,lng=126.975302 , zoom=11)%>%
        addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup2, color=~palette2(crime$폭력_발생), group='폭력') %>%
        addPolygons(stroke=FALSE,smoothFactor=0.2,fillOpacity=.5, popup=popup3, color=~palette3(crime$범죄_발생_총합),group='총 범죄')
map8