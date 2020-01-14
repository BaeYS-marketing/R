site <- "http://media.daum.net/ranking/popular/"


text <- read_html(site, encoding="utf-8")
nodes<- html_nodes(text,"#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a")
newstitle<-html_text(nodes)
nodes <- html_nodes(text,"#mArticle div.cont_thumb > strong > span")
newspapername <-html_text(nodes)

page <-data.frame(newstitle ,newspapername )

write.csv(page, "daumnews.csv")
