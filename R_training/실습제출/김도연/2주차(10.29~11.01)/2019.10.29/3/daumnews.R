url = "http://media.daum.net/ranking/popular/"
text = read_html(url)
text

nodes = html_nodes(text, "#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a")
newstitle = html_text(nodes)
newstitle

newstitle
nodes = html_nodes(text, ".info_news")
newspapername = html_text(nodes)
newspapername

page = data.frame(newstitle, newspapername)

write.csv(page, "daumnews.csv")
