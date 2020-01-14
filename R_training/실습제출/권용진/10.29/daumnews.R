url = "http://media.daum.net/ranking/popular/"
text = read_html(url, encoding="utf-8")

  #신문제목
nodes = html_nodes(text, "#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a")
newstitles = html_text(nodes)
newstitles = gsub("\t","",newstitles)  
newstitles = gsub("\r\n","",newstitles)
newstitles = gsub("\n","",newstitles)

#신문사
nodes = html_nodes(text, "#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > span")
newspapername = html_text(nodes, trim = T)
newspapername = gsub("\t","",newspapername)  
newspapername = gsub("\r\n","",newspapername)
newspapername = gsub("\n","",newspapername)
page = data.frame(newstitles, newspapername)

write.csv(page, "daumnews.csv")