library(httr)
library(XML)
library(rvest)
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

# 실습1
query <- URLencode(iconv("단풍","euc-kr","UTF-8"))

query
url<- paste(searchUrl, "?query=", query, "&display=100", sep="")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,'X-Naver-Client-Secret' = Client_Secret))

doc1 <- htmlParse(doc, encoding="UTF-8")
text1<- xpathSApply(doc1, "//item/description", xmlValue)
write(text1,'naverblog.txt')

# 실습2
searchUrl <- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url<- paste(searchUrl, "?query=", query, "&display=100", sep="")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,
                          'X-Naver-Client-Secret' = Client_Secret))

paringData <- htmlParse(doc, encoding="UTF-8")
text<- xpathSApply(paringData, "//item/title", xmlValue) 
text
write(text, 'navernews.txt')

# 실습3 
install.packages("twitteR")
library(twitteR) 

key <- "취업"
key <- enc2utf8(key)

result <- searchTwitter(key, n=100) # 키워드와 원하는 개수
DF <- twListToDF(result) 
str(DF)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content
write(content, 'twitter.txt')


#실습4
library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8")
doc
top <- xmlRoot(doc)
top
df1 <- xmlToDataFrame(getNodeSet(doc, "//itemList/busRouteId"))
df2 <- xmlToDataFrame(getNodeSet(doc, "//itemList/length"))
df3 <- xmlToDataFrame(getNodeSet(doc, "//itemList/stStationNum"))
df4 <- xmlToDataFrame(getNodeSet(doc, "//itemList/edStationNm"))
df5 <- xmlToDataFrame(getNodeSet(doc, "//itemList/term"))

?xmlToDataFrame
