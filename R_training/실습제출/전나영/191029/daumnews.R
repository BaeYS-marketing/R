url <- "https://media.daum.net/ranking/popular/"
text <- read_html(url, encoding = "UTF-8")
text

# 뉴스 제목
nodes <- html_nodes(text, "ul.list_news2 > li > div.cont_thumb > strong > a")
title <- html_text(nodes)
title

# 신문사
nodes <- html_nodes(text, ".info_news")
news <- html_text(nodes)
news

page <- data.frame(title, news)
write.csv(page, "daumnews.csv")
