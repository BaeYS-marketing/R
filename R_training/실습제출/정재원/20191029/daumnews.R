url <- "https://media.daum.net/ranking/popular/"
text <- read_html(url)
text
nodes<-html_nodes(text,".#mArticle > cont_thumb > strong > a")
newstitle<-html_text(nodes, trim=T)
newstitle<-gsub("\t", "" ,newstitle)
newstitle<-gsub("[\r\n]", "" ,newstitle)
newstitle<-gsub("\n", "" ,newstitle)
nodes<-html_nodes(text,".info_news")
newspapername <-html_text(nodes, trim=T)
newspapername <-gsub("\t", "" ,newspapername)
newspapername <-gsub("[\r\n]", "" ,newspapername)
newspapername <-gsub("\n", "" ,newspapername)
newspage  <- data.frame(newstitle,newspapername)
write.csv(newspage, "daumnews.csv")

