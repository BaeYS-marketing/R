# 실습 1
library(httr)
library(XML)
library(rvest)
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("단풍","euc-kr","UTF-8"))

url<- paste(searchUrl, "?query=", query, "&display=100", sep="")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,'X-Naver-Client-Secret' = Client_Secret))

doc1 <- html_nodes(read_html(doc, encoding="UTF-8"), xpath='//item/title')
text1 <- html_text(doc1)
text1 <- gsub("[(</b>)(<b>)]", "", text1)   
text1

write(text1, 'naverblog.txt')

# 실습 2

searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"
query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url<- paste(searchUrl, "?query=", query, "&display=100", sep="")
doc<-GET(url, add_headers('Content-Type' = "application/xml",
                          'X-Naver-Client-Id' = Client_ID,
                          'X-Naver-Client-Secret' = Client_Secret))

paringData <- htmlParse(doc, encoding="UTF-8")
text2<- xpathSApply(paringData, "//item/title", xmlValue); 
text2 <- gsub("[(</b>)(<b>)]", "", text2)   
text2

write(text2, 'navernews.txt')

# 실습 3
library(twitteR) 
api_key <- "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret <- "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token <- "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret <- "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"

key <- "취업"
key <- enc2utf8(key)

result <- searchTwitter(key, n=100)
DF <- twListToDF(result)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
content

write(content, 'twitter.txt')


# 실습 4

library(XML)
API_key  <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No, sep="")
doc <- xmlParse(url, encoding="UTF-8") 
top <- xmlRoot(doc)
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))

paste('노선ID :' ,df$busRouteId[1])
paste('노선길이 :' ,df$length[1])
paste('기점 :' ,df$stStationNm[1])
paste('종점 :' ,df$edStationNm[1])
paste('배차간격 :' ,df$term[1])


