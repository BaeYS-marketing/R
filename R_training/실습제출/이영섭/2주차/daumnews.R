#문제 1
url <- "https://media.daum.net/ranking/popular/"
newstitle <- read_html(url) %>% html_nodes("#mArticle li > div.cont_thumb > strong > a") %>% html_text()
newspapername <- read_html(url) %>% html_nodes("#mArticle  li > div.cont_thumb > strong > span") %>% html_text()
news <- data.frame(newspapername,newstitle)
write.csv(news,"daumnews.csv")
