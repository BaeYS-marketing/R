#네이버 블로그

library(rvest)
library(httr)
library(XML)

searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"


search <- URLencode(iconv('단풍','euc-kr','UTF-8'))
search                    


Url <- paste0(searchUrl,'?query=',search,'&display=100')
Url


askServe <-GET(Url, add_headers('Content-Type' = "application/xml",
                                  'X-Naver-Client-Id' = Client_ID,'X-Naver-Client-Secret' = Client_Secret))



blogText <- read_html(askServe, encoding = 'UTF-8')

blogNodes <- html_nodes(blogText, xpath='//item/description')

content<-html_text(blogNodes)

content<-gsub('[(<b>)(<\b>)(/)(&quot)]','',content)
content
View(content)


write.table(content,'naverblog.txt')







#뉴스

searchUrl2<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"


serach2 <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))

t.url<- paste(searchUrl2, "?query=", serach2, "&display=100", sep="")

t.html<-GET(t.url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,
                          'X-Naver-Client-Secret' = Client_Secret))







#트위터

newsText <- read_html(t.html, encoding = 'UTF-8')
newsNodes <- html_nodes(newsText, 'item>title')
newsContent <- html_text(newsNodes)
newsContent

newscontent<-gsub('[[:punct:]]','',newsContent)
newscontent<-gsub('[(&quot)(<b>)(<\b>)]','',newsContent)
write.table(newsContent,'navernews.txt')

getwd()


library(twitteR) 


api_key <- "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret <- "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token <- "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret <- "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)


key <- "취업"
key <- enc2utf8(key)    


subContent <- searchTwitter(key, n=100)
Data <- twListToDF(subContent)  #리스트 데이터프레임 형식으로 변환 
str(Data)
View(Data)
twitterContent <- Data$text   #그중에서 text만 추출

twitterContent







#공공DB
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"


url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")

doc <- xmlParse(url, encoding="UTF-8")

top <- xmlRoot(doc)           #트레이싱

typeof(top)

#방법1  인덱싱 추출 후 값 대입

top
busRouteNm <- xpathSApply(top, '//itemList[1]/busRouteNm[1]', xmlValue)
length <- xpathSApply(top, '//itemList[1]/length', xmlValue)
stStationNm <- xpathSApply(top, '//itemList[1]/stStationNm', xmlValue)
edStationNm <- xpathSApply(top, '//itemList[1]/edStationNm', xmlValue)
term  <- xpathSApply(top, '//itemList[1]/term', xmlValue)

busdata <- list(노선ID=busRouteNm,노선길이=length,기점=stStationNm,
                  종점=edStationNm,배차간격=term,)





#방법2  데이터 프레임으로 변환 후 인덱싱 
DFDFD <- xmlToDataFrame(getNodeSet(top, "//itemList"))
View(DFDFD)

DFDFD[1,1]

subset()