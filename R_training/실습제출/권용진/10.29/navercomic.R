site = "https://comic.naver.com/genre/bestChallenge.nhn?&page="
webtoon = NULL
repeat{
  url = paste(site, i, sep="")
  text = read_html(url, encoding="utf-8")
  nodes = html_nodes(text, ".challengeTitle > a")
  comicName = html_text(nodes, trim = T)
  
  nodes = html_nodes(text, ".summary")
  comicSummary = html_text(nodes, trim = T)  
  
  nodes = html_nodes(text, ".rating_type > strong")
  comicGrade = html_text(nodes, trim = T)
  
  page = data.frame(comicName, comicSummary, comicGrade)
  webtoon = rbind(webtoon, page)

i=i+1
if(length(ccomicName)<24)
  break
}
  write.csv(webtoon, "navercomic.csv")