url7 <- "http://media.daum.net/ranking/popular/"
txt3 <- read_html(url7)

nodes4 <- html_nodes(txt3, "#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a")
newstitle <- html_text(nodes4)

nodes4 <- html_nodes(txt3, ".info_news")
newspapername <- html_text(nodes4)

page3 <- data.frame(newstitle, newspapername)
write.csv(page3, "daumnews.csv")
