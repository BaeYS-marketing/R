url_n <- ("http://media.daum.net/ranking/popular")
text_n <- read_html(url_n)

title_n <- html_text(html_nodes(text_n, "#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a"))
agency_n <- html_text(html_nodes(text_n, "#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > span"))

page <- data.frame(newstitle = title_n, newspapername = agency_n)
write.csv(page, "daumnews.csv")
