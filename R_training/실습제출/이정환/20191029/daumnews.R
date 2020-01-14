url = "http://media.daum.net/ranking/popular/"
text = read_html(url)
newstitle = html_nodes(text, '#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a')
newstitle = html_text(newstitle)

newspapername = html_nodes(text, '#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > span')
newspapername = html_text(newspapername)

daumnews = data.frame(newstitle, newspapername)
write.csv(daumnews, 'daumnews.csv', row.names = F)
