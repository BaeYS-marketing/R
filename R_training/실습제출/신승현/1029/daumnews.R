url <- "http://media.daum.net/ranking/popular/"
news.paper <- NULL

text <- read_html(url, encoding="UTF-8")
nodes <- html_nodes(text, "a.link_txt")
title <- html_text(nodes)
title <- title[1:50]

nodes <- html_nodes(text, "span.info_news")
paper <- html_text(nodes, trim=TRUE)
page <- data.frame(title, paper)
news.paper <- rbind(news.paper, page)

write.csv(news.paper, "daumnews.csv")
