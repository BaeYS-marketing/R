url <- "https://media.daum.net/ranking/popular/"
text <- read_html(url)


#기사제목
nodes <- html_nodes(text, "#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a")
newstitle <- html_text(nodes, trim=TRUE)
newstitle
newstitle <- gsub("\"", "", newstitle)
newstitle

#신문사이름
newspapername <- html_text(html_nodes(text, ".info_news"), trim=TRUE)
newspapername

page <- data.frame(newstitle, newspapername)
write.csv(page, "c:/Rstudy/daumnews.csv")
