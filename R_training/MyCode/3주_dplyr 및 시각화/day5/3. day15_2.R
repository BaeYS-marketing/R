library(ggplot2)
library(leaflet)

str(iris)

ggplot(data = iris, aes(x = Petal.Width, y= Petal.Length, col=Species)) + geom_point() 
# ggsave("ggtest.png")

icon.glyphicon <- makeAwesomeIcon(icon = "flag", markerColor = "blue",
                                  iconColor = "yellow",
                                  squareMarker =  TRUE)
icon.fa <- makeAwesomeIcon(icon = "flag", markerColor = "red",
                           iconColor = "black")
icon.ion <- makeAwesomeIcon(icon = "home", markerColor = "green")


#addAwesomeMarker() 함수 
# Marker + Label
leaflet() %>% addTiles() %>%
        addAwesomeMarkers(
                lng = -118.456554, lat = 34.078039,
                label = "This is a label",
                icon = icon.glyphicon)

leaflet() %>% addTiles() %>%
        addAwesomeMarkers(
                lng = -118.456554, lat = 34.078039,
                label = "This is a label",
                icon = icon.fa)

leaflet() %>% addTiles() %>%
        addAwesomeMarkers(
                lng = -118.456554, lat = 34.078039,
                label = "This is a label",
                icon = icon.ion)

leaflet() %>% addTiles() %>%
        addAwesomeMarkers(
                lng = -118.456554, lat = 34.078039,
                label = "This is a static label",
                labelOptions = labelOptions(noHide = T),   #계속 팝업 T
                icon = icon.fa)

View(quakes)
str(quakes)

data = quakes[1:20,]
leaflet() %>% addTiles() %>%
        addMarkers(data$long, data$lat, popup = paste("지진 강도 : ",as.character(data$mag)), label = as.character(data$mag))   
             #!!!!!!!!!!!! 마커가 여러게이기 때문에 x= ,y= 에 백터로 넣었다. 
             # label은 올려놓으면 나오고, popup은 눌러야 나온다. 

getColor <- function(quakes) {
        result <- sapply(quakes$mag, function(mag) {
                if(mag <= 4) {
                        "green"
                } else if(mag <= 5) {
                        "orange"
                } else {
                        "red"
                } })
        return(result)
}

icons <- awesomeIcons(
        icon = 'ios-close',
        iconColor = 'black',
        library = 'ion',  #어디서 제공하는 ion인지 적어주는게 더 좋다. 검색시간 줄임.
        markerColor = getColor(data)
)

leaflet() %>% addTiles() %>%
        addAwesomeMarkers(data$long, data$lat, icon=icons, label = as.character(data$mag))








# install.packages("RColorBrewer")
library(RColorBrewer)


#대부분 시작색 끝색 _ 색 설정 알아보는 식.
for(col_i in c('YlGn','RdPu', 'PuRd', 'BrBG', 'RdBu', 'RdYlBu', 'Set3', 'Set1')){
        print(col_i)
        print(brewer.pal(n = 5, name = col_i))
}







# install.packages("KoNLP")
library(KoNLP)

useSystemDic()
useSejongDic()
useNIADic()

word_data <- readLines("book/애국가(가사).txt")
is.vector(word_data)

useSejongDic()
#exractNoun은 원소 하나만 읽어서 sapply로 자동화     
                                          #USE.NAMES : 2개 출력 방지, 하나는 실제 이름. 하나는 라벨 
word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F)
word_data2

'!!!!!!!!그런데 최근!! extractNoun : 여러 원소를 한번에 읽어서 리스트로 반환해준다. '
word_data3 <- extractNoun(word_data)
word_data3




word_data2<-unlist(word_data2)
word_data3<-unlist(word_data3)




table(word_data2)
table(word_data3)



SimplePos09(word_data)


#추가 사전등록
add_words <- c("백두산", "남산", "철갑", "가을", "달")  #ex. 백수산이  ... 라서 


#ncn : 명사(체언_보통명사)라고 입력해서 사전에 추가 + replace_usr_dir = T  : 기존에 있으면 새롭게 바꾼다.
buildDictionary(user_dic=data.frame(add_words, rep("ncn", length(add_words))), replace_usr_dic=T)

word_data3 <- extractNoun(word_data)
word_data3

undata <- unlist(word_data2)
undata

word_table <- table(undata)
word_table

undata2 <- Filter(function(x) {nchar(x) >= 2}, undata)
word_table2 <- table(undata2)
word_table2

final <- sort(word_table2, decreasing = T)

head(final, 10)




#KONLP 사전 테스트
extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")  #벡터
SimplePos09("대한민국의 영토는 한반도와 그 부속도서로 한다")  #리스트  9가지 품사로 알려준다.
SimplePos22("대한민국의 영토는 한반도와 그 부속도서로 한다")  #리스트  22개로 더 자세하게 알려준다.








# install.packages("wordcloud")   : 정적 클라우드 
library(wordcloud)  

# install.packages("wordcloud2")   : 동적 클라우드
library(wordcloud2)

words <- read.csv("data/wc.csv",stringsAsFactors = F)
head(words)
install.packages("wordcloud")
library(wordcloud)


#폰트설정 (윈도우 설치되어 있는 기본 폰트)
#워드 클라우드2는 이렇게 안해도 된다.
lett=windowsFont("휴먼옛체")

#wordcloud(워드, 숫자)
wordcloud(words$keyword, words$freq,family="lett")
wordcloud(words$keyword, words$freq, 
          min.freq = 2,                 #2번 이상 등장한 워드만 하겠다. 
          random.order = FALSE,         #순서,빈도별 자리에 출력   
          rot.per = 0.1, scale = c(4, 1),    #전체에서 10%는 회전해서 출력  , 제일 많이 등장한 애와 적은 등장한 단어의 크기 
          colors = rainbow(7))





#wordcloud2 
wordcloud2(words)
wordcloud2(words,rotateRatio = 1)   #회전할 단어 비율 
wordcloud2(words,rotateRatio = 0.5)
wordcloud2(words,rotateRatio = 0)
wordcloud2(words, size=0.5,col="random-dark")
wordcloud2(words,size=0.5,col="random-dark", figPath="book/peace.png")
wordcloud2(words,size=0.7,col="random-light",backgroundColor = "black")
wordcloud2(data = demoFreq)










#install.packages("twitteR")
library(twitteR) 
api_key <- "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret <- "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token <- "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret <- "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)
# oauth 정보 저장 확인
key <- "수능"
key <- enc2utf8(key)
result <- searchTwitter(key, n=100)
DF <- twListToDF(result)
str(DF)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content) 
content <- gsub("수능", "", content) 
content
word <- extractNoun(content)
cdata <- unlist(word)
cdata
cdata <- Filter(function(x) {nchar(x) < 6 & nchar(x) >= 2} ,cdata)
wordcount <- table(cdata) 
wordcount <- head(sort(wordcount, decreasing=T),30)

par(mar=c(1,1,1,1))
wordcloud(names(wordcount),freq=wordcount,scale=c(3,0.5),rot.per=0.35,min.freq=1,
          random.order=F,random.color=T,colors=rainbow(20))





