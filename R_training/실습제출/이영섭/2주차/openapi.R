library(httr)
library(XML)
library(rvest)
library(dplyr)

#네이버 블로그
rm(list=ls())
searchUrl<- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode(iconv("단풍","euc-kr","UTF-8"))
url <- paste(searchUrl, "?query=", query, "&display=100",sep="")
doc <- GET(url,add_headers('Content-Type' = "application/xml",
                           'X-Naver-Client-Id' = Client_ID,
                           'X-Naver-Client-Secret' = Client_Secret))

doc1 <- htmlParse(doc, encoding = "UTF-8")
blog <- xpathSApply(doc1, "//item/description", xmlValue)
write(blog,"naverblog.txt")

#네이버 뉴스
rm(list=ls())
searchUrl<- "https://openapi.naver.com/v1/search/news.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url <- paste(searchUrl, "?query=", query, "&display=100",sep="")
doc <- GET(url,add_headers('Content-Type' = "application/xml",
                           'X-Naver-Client-Id' = Client_ID,
                           'X-Naver-Client-Secret' = Client_Secret))

doc2 <- read_html(doc, encoding = "UTF-8") %>% html_nodes(xpath ='//item/title' )
news2 <- html_text(doc2)
write(news2,"navernews.txt")


#트위터
library(twitteR) 
# api_key <- "gjUkHgO8bFmNobRk4g0Jas8xb"
# api_secret <- "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
# access_token <- "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
# access_token_secret <- "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"
# setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)

key <- "취업"
key <- enc2utf8(key)

result <- searchTwitter(key, n=100)
DF <- twListToDF(result)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:digit:][:punct:][:cntrl:]]", "", content)   
write(content,"twitter.txt")

#공공 DB 360번 버스
api_key <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_num <- "360"
url <- paste0("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?serviceKey=",api_key,"&strSrch=",bus_num)
doc <- xmlParse(url, encoding = "UTF-8")
df <- xmlToDataFrame(getNodeSet(doc, "//itemList"))

bus360 <- df[1,c("busRouteId","length", "stStationNm", "edStationNm", "term")]

cat(
  "[ 360번 버스정보 ]\n",
  paste0("노선ID  : ",bus360$busRouteId,"\n"),
  paste0("노선길이 : ",bus360$length,"\n"),
  paste0("기점    : ",bus360$stStationNm,"\n"),
  paste0("종점    : ",bus360$edStationNm,"\n"),
  paste0("배차간격 :  ",bus360$term,"\n")
  )
