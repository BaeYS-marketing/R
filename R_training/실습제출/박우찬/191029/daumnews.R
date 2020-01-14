library(rvest)

ur1 = 'https://media.daum.net/ranking/popular/'
text = read_html(ur1)

#제목
newstitle = html_text(html_nodes(text,'#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a
'))

#회사명
nodes = html_nodes(text, 'li > div.cont_thumb > strong > span')
newspapername  = html_text(nodes, trim = TRUE)

page1 = data.frame('기사제목' = newstitle, '회사명' = newspapername)
write.csv(page1, 'daumnews.csv')
