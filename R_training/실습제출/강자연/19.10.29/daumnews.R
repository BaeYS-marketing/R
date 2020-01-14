
  url3="https://media.daum.net/ranking/popular/" #브라우저의 기능  R에서도 가능
text=read_html(url3)
text

  nodes1= html_nodes(text,"#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > span")
  newspapername <- html_text(nodes1,trim=T)
  newspapername 
  
  nodes2<- html_nodes(text,"#mArticle > div.rank_news > ul.list_news2 > li > div.cont_thumb > strong > a")
  newstitle<-html_text(nodes2, trim=T)
  newstitle
  
  #gsub("없애고 싶은 것","바꾸고 싶은 것", 대상 )
  # review<- gsub("\t","",review)
  # review<- gsub("\t\n","",review)
  # review<- gsub("\n","",review)
  # review<- gsub("신고","",review)

  page<-data.frame(newstitle, newspapername)
  write.csv(page,"daumnews.csv")

  
  
  
  #mArticle > div.rank_news > ul.list_news2 > li:nth-child(7) > div.cont_thumb > strong > a