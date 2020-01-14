url <- "https://media.daum.net/ranking/popular/"
text <- read_html(url, encoding="UTF-8")

#신문 제목
nodes <- html_nodes(text,"#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a")
newstitle <- html_text(nodes)
newstitle

#신문사
nodes <- html_nodes(text, "#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > span")
newspapername <- html_text(nodes)
newspapername <- gsub("\n","",newspapername)
newspapername <- gsub("\t","",newspapername)
newspapername <- gsub("[\r\n]","",newspapername)
newspapername <- gsub("신고","",newspapername)

page <- data.frame(newstitle, newspapername)
write.csv(page,"daumnews.csv")