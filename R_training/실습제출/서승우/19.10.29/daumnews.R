url<-"http://media.daum.net/ranking/popular/"
text<-read_html(url, encoding="UTF-8")
nodes<-html_nodes(text, "#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a")
newstitle<-html_text(nodes)
nodes<-html_nodes(text, "#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > span")
newspapername<-html_text(nodes)
news<-data.frame(newstitle, newspapername)
write.csv(news, "daumnews.csv")