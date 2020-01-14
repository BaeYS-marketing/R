#실습

library(rvest)
site <- "https://media.daum.net/ranking/popular/"

url<-read_html(site)

h.nodes<-html_nodes(url,'#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a')        
head<- html_text(h.nodes)
head

b.nodes <- html_nodes(url,'.info_news')
by <- html_text(b.nodes)
by

news<-data.frame(head,by)
news
write.csv(news,'daumnews.csv')





#.tit_thumb
#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a