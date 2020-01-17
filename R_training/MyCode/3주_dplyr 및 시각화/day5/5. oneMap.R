library(Kormaps)
library(dplyr)

rm(list=ls())

DONG<-read.csv('c:/RStudy/data/one.csv',stringsAsFactors = FALSE)
#View(DONG)
data(korpopmap3)
Encoding(names(korpopmap3))<-'UTF-8'

#View(korpopmap3)
Encoding(korpopmap3@data$name_eng)<-'UTF-8'
Encoding(korpopmap3@data$name)<-'UTF-8'
Encoding(korpopmap3@data$행정구역별_읍면동)<-'UTF-8'






#관악구
View(DONG)
donglist<-DONG %>% 
        filter(구별 == '관악구') %>% 
        select(동)

# donglist<-unique(donglist)
# donglist


#korpopamp3 데이터 
Encoding(korpopmap3@data$행정구역별_읍면동)<-'UTF-8'
Encoding(korpopmap3@data$name)<-'UTF-8'


dd<-as.vector(donglist)
sum(korpopmap3@data$name %in% dd)
korpopmap3@data$행정구역별_읍면동 <- gsub(' ','',korpopmap3@data$행정구역별_읍면동)




#방법1
DONG[DONG$구별 == "관악구", ]$X1인가구







#방법2
list<-korpopmap3@data$name
df<- as.data.frame(list)
View(df)


#donglist 와 korpopmap3 데이터 비교 
print(donglist)
    
df2<-df %>% 
        mutate(index = 1:length(df$list)) %>% 
        filter(list == c(  '낙성대동',
                             '난곡동',
                             '난향동',
                             '남현동',
                             '대학동',
                             '미성동',
                           '보라매동',
                             '삼성동',
                             '서림동',
                            '서원동',
                            '성현동',
                            '신림동',
                            '신사동',
                            '신원동',
                            '은천동',
                            '인헌동',
                            '조원동',
                            '중앙동',
                            '청룡동',
                            '청림동',
                            '행운동'))




##방법3   inner_join 방식

df2<-df %>% 
    mutate(index = 1:length(df$list))

names(df2)

names(donglist)<-'list'


#left 조인으로 donglist와 일치하는 것만 뽑아내기.
data<-inner_join(df2, as.data.frame(donglist), by=c('list'='list'))
data$index

names(df2)
df2<-df2 %>% arrange(index)
df2





################# 여기까지 korpopmap3에서 관악구 동 뽑아내기.





#사무엘씨
# 종로구 동별 1인 가구 수 시각화
library(dplyr)

# 1. 1인가구, korpopmap3, 종로구 91개동 행정코드 dataset 준비
DONG <- read.csv('data/one.csv')
data(korpopmap3)
jongro_codes_df <- 
    read.csv('data/행정구역분류와_행정동_법정동_연계표2_20091231_기준.csv', 
             header=T, stringsAsFactors=F) %>% 
    filter(시군구=='종로구') %>% 
    select(시군구, 행정동, 법정동, 행정구역분류)
jongro_codes_df <- jongro_codes_df[ !is.na(jongro_codes_df$행정구역분류), ]
row.names(jongro_codes_df) <- NULL


# 2. 전처리 - 인코딩 변환
Encoding(names(korpopmap3)) <- 'UTF-8'
Encoding(korpopmap3@data$name_eng) <- 'UTF-8'
Encoding(korpopmap3@data$name) <- 'UTF-8'
Encoding(korpopmap3@data$행정구역별_읍면동) <- 'UTF-8'


# 3. 전처리 - korpopmap3에서 종로구 행정동 코드를 가진 지역만 추출
# View(korpopmap3@data)
# View(korpopmap3@polygons)

# korpopmap3@data %>% class  # dataframe
# korpopmap3@polygons %>% class  # list

tmp_idx <- 
    korpopmap3@data[ korpopmap3@data$code %in% 
                         jongro_codes_df$행정구역분류, ] %>%
    row.names()  %>% as.numeric()  # 종로구 행정코드를 가진 row 인덱스 추출
# tmp_idx %>% length()  # 18개 추출됨

korpopmap3@data <- korpopmap3@data[( 3472+1 - tmp_idx),]
korpopmap3@polygons <- korpopmap3@polygons[( 3472+1 - tmp_idx)]

# korpopmap3@data$name <- gsub('·', '', korpopmap3@data$name)  # skip - 종로구 행정동들은 텍스트 전처리 불필요


# 4. 전처리 - 1인 가구 데이터에서 종로구만 추출해 korpopmap3에 추가
colnames(DONG) <- c('구별','name','일인가구')
dong <- DONG %>% filter(구별=='종로구')
dong %>% ncol
korpopmap3@data %>% ncol
korpopmap3@data <- merge(korpopmap3@data, dong,
                         by.x='name', sort=FALSE)
korpopmap3@data %>% ncol  # ncol 42+2 => 44개 확인


# 5. 지도 준비
mymap <- korpopmap3@data
mypalette <- colorNumeric(palette ='RdYlBu' , 
                          domain = mymap$'일인가구')
mypopup <- paste0(mymap$name,
                  '<br> 1인가구: '
                  ,mymap$'일인가구')


# 6. 지도 시각화
map7<-leaflet(korpopmap3) %>% 
    addTiles() %>% 
    setView(lat=37.52711, lng=126.987517, zoom=12) %>%
    addPolygons(stroke =FALSE,
                smoothFactor = 0.2,
                fillOpacity = .9,
                popup = mypopup,
                color = ~mypalette(mymap$일인가구)) %>% 
    addLegend( values = ~mymap$일인가구,
               pal =mypalette ,
               title = '인구수',
               opacity = 1)
map7

saveWidget(res_map, 'oneMap.html')





#종현씨
rm(list=ls())

library(Kormaps)

# 1인 가구 정보 불러오기
DONG<-read.csv('one.csv')
colnames(DONG)<-c('구별','name','일인가구')
gangnam <- DONG %>% filter(구별=='강남구')

# 동별 단계 구분도
Encoding(names(korpopmap3))<-'UTF-8'
Encoding(korpopmap3@data$name_eng)<-'UTF-8'
Encoding(korpopmap3@data$name)<-'UTF-8'
Encoding(korpopmap3@data$행정구역별_읍면동)<-'UTF-8'
korpopmap3@data$name = gsub('·','',korpopmap3@data$name)

idx = which(korpopmap3@data$name %in% gangnam$name)[-1]

korpopmap3@data = korpopmap3@data[idx,] 
korpopmap3@data = merge(korpopmap3@data, gangnam, by.x='name', sort=FALSE)
korpopmap3@polygons<-korpopmap3@polygons[idx] 

mymap <- korpopmap3@data
mypalette <- colorNumeric(palette ='RdYlBu' , domain = mymap$'일인가구')
mypopup <- paste0(mymap$name,'<br> 1인가구: ',mymap$'일인가구')


my_map <- NULL
my_map <-leaflet(korpopmap3) %>% 
    addTiles() %>% 
    setView(lat=37.52711, lng=126.987517, zoom=12) %>%
    addPolygons(stroke =FALSE,
                smoothFactor = 0.2,
                fillOpacity = .4,
                popup = mypopup,
                color = ~mypalette(mymap$일인가구)) %>% 
    addLegend(values = ~mymap$일인가구,
              pal = mypalette,
              title = '인구수',
              opacity = 1)
my_map	

saveWidget(my_map, file="oneMap.html")
