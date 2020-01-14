library(httr)
library(rvest)
library(XML)
library(twitteR)

# 문제1
searchUrl = "https://openapi.naver.com/v1/search/blog.xml"
Client_ID = "izGsqP2exeThwwEUVU3x"
Client_Secret = "WrwbQ1l6ZI"

query = URLencode(iconv("단풍", "euc-kr", "UTF-8"))
query

url = paste0(searchUrl, "?query=", query, "&display=100")
doc = GET(url, add_headers('Content-Type' = "application/xml",
                           'X-Naver-Client-Id' = Client_ID,
                           'X-Naver-Client-Secret' = Client_Secret))

nodes = html_nodes(read_html(doc, encoding="UTF-8"),
                   xpath='//item/description')
naverblog = html_text(nodes)
naverblog = gsub("[(<b>)(</b>)]", "", naverblog)
naverblog

write(naverblog, "naverblog.txt")

# 문제2
searchUrl = "https://openapi.naver.com/v1/search/news.xml"

query = URLencode(iconv("빅데이터", "euc-kr", "UTF-8"))

url = paste0(searchUrl, "?query=", query, "&display=100")
doc = GET(url, add_headers('Content-Type' = "application/xml",
                           'X-Naver-Client-Id' = Client_ID,
                           'X-Naver-Client-Secret' = Client_Secret))

nodes = html_nodes(read_html(doc, encoding="UTF-8"),
                   xpath="//item/title")
navernews = html_text(nodes)
navernews = gsub("[(<b>)(</b>)]", "", navernews)
navernews

write(navernews, "navernews.txt")

# 문제3
api_key = "gjUkHgO8bFmNobRk4g0Jas8xb"
api_secret = "loF0mtnzLhtQDFjahdRHox6wcR1fiD6Fw95DP5QCSy3rLTTP1K"
access_token = "607145164-8L5HtzopZzhjuBCgusUGKE3MHOa9P4RbmhUrM0E1"
access_token_secret = "2wn2bsCA7JIH5DZ5Ss1deS5BNLabzaX2xSpM2ZLMIqwQf"
setup_twitter_oauth(api_key,api_secret, access_token,access_token_secret)
1

key = "취업"
key = enc2utf8(key)

result = searchTwitter(key, n=100)
DF = twListToDF(result)
str(DF)
twitter = DF$text
twitter = gsub("[[:cntrl:]]", "", twitter)
twitter

write(twitter, "twitter.txt")

# 문제4
API_key = "%2BjzsSyNtwmcqxUsGnflvs3rW2oceFvhHR8AFkM3ao%2Fw50hwHXgGyPVutXw04uAXvrkoWgkoScvvhlH7jgD4%2FRQ%3D%3D"
bus_No = "360"

url = paste0("http://ws.bus.go.kr/api/rest/busRouteInfo/getBusRouteList?ServiceKey=", API_key, "&strSrch=", bus_No)

doc = xmlParse(url, encoding="UTF-8")
top = xmlRoot(doc)
top

df = xmlToDataFrame(getNodeSet(doc, "//itemList[1]"),
                    stringsAsFactors = F)
str(df)

bus_360 = function() {
  cat("노선ID :", df$busRouteId, "\n")
  cat("노선길이 :", df$length, "km", "\n")
  cat("기점 :", df$stStationNm, "\n")
  cat("종점 :", df$edStationNm, "\n")
  cat("배차간격 :", df$term, "분", "\n")
}
bus_360()
