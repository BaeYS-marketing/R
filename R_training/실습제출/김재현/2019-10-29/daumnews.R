url <- "http://media.daum.net/ranking/popular/"
text <- read_html(url)
newstitle <- html_text(html_nodes(text, "#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a"))
newspapername <- html_text(html_nodes(text, ".info_news"))
news.data <- data.frame(newstitle,newspapername)
write.csv(news.data, "daumnews.csv")
