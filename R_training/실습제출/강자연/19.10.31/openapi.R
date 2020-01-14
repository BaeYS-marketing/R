
# openapi.R, naverblog.txt, navernews.txt, twitter.txt 파일을 제출하시오.

# [ OPEN API 실습 1 ] 
# 네이버의 블로그에서 “단풍” 이라는 단어가 들어간 글들을 검색하여 100개까지 추출한 다음 naverblog.txt 파일로
# 저장하시오.
 library(httr)
library(rvest)
library(XML)


getwd()

searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x" 
Client_Secret <- "WrwbQ1l6ZI"


query <- URLencode(iconv("단풍","euc-kr","UTF-8"))
query
url<- paste0(searchUrl, "?query=", query, "&display=100")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,'X-Naver-Client-Secret' = Client_Secret))
doc1=read_html(doc,encoding = "UTF-8")
doc2=html_nodes(doc1,xpath='//item/description')
blog<-html_text(doc2)
blog=gsub('[<b>,<b/>]','',blog)
write.table(blog,'naverblog.txt')

# [ OPEN API 실습 2 ] 
# 네이버의 뉴스에서 “빅데이터” 라는 단어가 들어간 뉴스글들을 검색하여 100개까지 추출한 다음 
# 뉴스 제목을 추출하여 navernews.txt 파일로 저장하시오.
# 참고 : https://developers.naver.com/docs/search/news/

searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI" 

URLencode("빅데이터")
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
query
url<- paste0(searchUrl, "?query=", query, "&display=100")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,'X-Naver-Client-Secret' = Client_Secret))

doc1=read_html(doc,encoding = "UTF-8")
doc2=html_nodes(doc1,xpath='//item/title')
news<-html_text(doc2)
news=gsub('[<b>,<b/>]','',news)
write.table(news,'navernews.txt')
getwd()

#   [ OPEN API 실습 3 ] 
# 트위터에서  “취업” 이라는 단어가 들어간 트윗글들을 검색하여 100개까지 추출한 다음 
#  twitter.txt 파일로 저장하시오.
# 
# install.packages("twitteR")
library(twitteR) 
api_key <- "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret <- "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token <- "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret <- "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret) 
# 한번만 시크릿키를 받으면 인증토큰을 발급, oauth방식은 인증방식을 표준화 시킨 것.
# oauth 정보 저장 확인
key <- "취업"
key <- enc2utf8(key) #함수를 이용해 변환

result <- searchTwitter(key, n=100) #함수를 제공함 searchTwitter(키워드, n=개수)하면 리스트로 반환
DF <- twListToDF(result) #데이터프레임 형식으로 변환
str(DF)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content
write.table(content,'twitter.txt')
getwd()

# 
# [ OPEN API 실습 4 ] 
# 공공DB에서  360번 차량에 대하여 정보를 추출한 다음 노선ID, 노선길이, 기점, 종점, 배차간격을 다음 형식으로출력하시오.
# 
# [ 360번 버스정보 ]
# 노선ID : xxx
# 노선길이 : xxx
# 기점 : xxx
# 종점 : xxx
# 배차간격 : xxx
# 
# 참고 : http://api.bus.go.kr/contents/sub02/getBusRouteList.html


library(XML)
#서울시 버스 운행 데이터 -따로 승인을 받아야 함
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
#402번버스에 대한 정보 요청
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
#xml패키지만 사용됨
doc <- xmlParse(url, encoding="UTF-8") #utf-8인데도 깨짐?? 오픈 api들은 추가적인 처리가 더 필요함.
top <- xmlRoot(doc) #root함수를 돌리면 깨지지않음
top
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))
result=df[1,]


 d=c(result$busRouteId,result$length,result$firstBusTm,result$lastBusTm,result$term)
 e=c('노선ID','노선길이','기점','종점',"배차간격")
 bus=paste(e,d,sep=' : ',collepse='')


df=read_html(doc,encoding = "UTF-8")
doc2=html_nodes(df,xpath='//itemList')
bus<-html_text(doc2)
bus=gsub('[<b>,<b/>]','',bus)
write.table(bus,'navernews.txt')
