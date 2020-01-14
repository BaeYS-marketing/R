rm(list=ls())

library(httr)
library(XML)
library(rvest)
library(twitteR)


#문제1
searchUrl <- "https://openapi.naver.com/v1/search/blog.xml"
Client_ID <- "izGsqP2exeThwwEUVU3x"
Client_Secret <- "WrwbQ1l6ZI"

query <- URLencode(iconv("단풍","euc-kr","UTF-8"))
url <- paste0(searchUrl, "?query=", query, "&display=100")
doc <- GET(url, add_headers("Content_Type" = "application/xml",
                            "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

doc1 <- html_nodes(read_html(doc, encoding = "UTF-8"), xpath ="//item/description")
text <- html_text(doc1, trim = T)
text <- gsub("<b>", "", text)
text <- gsub("</b>", "", text)

write.table(text, "naverblog.txt")



#문제2
searchUrl2 <- "https://openapi.naver.com/v1/search/news.xml"
Cli_ID <- "izGsqP2exeThwwEUVU3x"
Cli_Sec <- "WrwbQ1l6ZI"

query2 <- URLencode(iconv("빅데이터","euc-kr","UTF-8"))
url <- paste0(searchUrl2, "?query=", query2, "&display=100")
doc2 <- GET(url, add_headers("context_Type" = "application/xml",
                             "X-Naver-client-Id" = Client_ID, "X-naver-Client-Secret" = Client_Secret))

mid <- html_nodes(read_html(doc2, encoding = "UTF-8"), xpath = "//item/title")
text2 <- html_text(mid, trim = T)
text2 <- gsub("<b>","",text2)
text2 <- gsub("</b>","",text2)
text2 <- gsub("&quot","",text2)
text2 <- gsub(";","",text2)

write.table(text2, "navernews.txt")


#문제3
key <- "취업"
key <- enc2utf8(key)
result <- searchTwitter(key, n=100)
DF <- twListToDF(result)
content <- DF$text
content <- gsub("[[:lower:][:upper:][:punct:][:cntrl:]]", "", content)

write.table(content, "twitter.txt")


#문제4
api_key <- "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_no <- "360"
url <- paste("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", api_key, "&strSrch=", bus_no, sep = "")
doc3 <- xmlParse(url, encoding = "UTF-8")
doc3 <- xmlRoot(doc3)
DF <- xmlToDataFrame(getNodeSet(doc, "//itemList"),stringsAsFactors = F)
View(DF)
str(DF)

cat(" 노선ID : ", DF[1,1],"\n","노선길이 : ", DF[1,10],"\n","기점 : ", DF[1,12],"\n","종점 : ", DF[1,4],"\n","배차간격 : ", DF[1,13])
