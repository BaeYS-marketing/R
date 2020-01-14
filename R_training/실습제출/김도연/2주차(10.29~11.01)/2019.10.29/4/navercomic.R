url = "https://comic.naver.com/genre/bestChallenge.nhn"
text = read_html(url, encoding = "utf-8")
text

nodes = html_nodes(text, ".challengeTitle")
comicName = html_text(nodes, trim=T)
comicName = gsub("\t","",comicName) 
comicName = gsub("\r\n","",comicName)
comicName = gsub("\n","",comicName)
comicName

nodes = html_nodes(text, ".summary")
comicSummary = html_text(nodes)
comicSummary

nodes = html_nodes(text, ".rating_type")
comicGrade = html_text(nodes)
comicGrade = gsub("\t","",comicGrade) 
comicGrade = gsub("\r\n","",comicGrade)
comicGrade = gsub("\n","",comicGrade)
comicGrade = gsub("평점","",comicGrade)
comicGrade

page = data.frame(comicName, comicSummary, comicGrade)

write.csv(page, "navercomic.csv")




#모든 페이지
site = "https://comic.naver.com/genre/bestChallenge.nhn?m=main&order=Update&page="
comicName.comicSummary.comicGrade = NULL
i=0
repeat{
  
  i = i + 1
  paste(site, i, sep="")
  text = read_html(url, encoding = "utf-8")
  nodes = html_nodes(text, ".challengeTitle")
  comicName = html_text(nodes, trim=T)
  comicName = gsub("\t","",comicName) 
  comicName = gsub("\r\n","",comicName)
  comicName = gsub("\n","",comicName)
  comicName
  
  nodes = html_nodes(text, ".summary")
  comicSummary = html_text(nodes)
  comicSummary
  
  nodes = html_nodes(text, ".rating_type")
  comicGrade = html_text(nodes)
  comicGrade = gsub("\t","",comicGrade) 
  comicGrade = gsub("\r\n","",comicGrade)
  comicGrade = gsub("\n","",comicGrade)
  comicGrade = gsub("평점","",comicGrade)
  comicGrade
  
  page = data.frame(comicName, comicSummary, comicGrade)
  if(comicName.comicSummary.comicGrade[i]==comicName.comicSummary.comicGrade[i+1]) break
  comicName.comicSummary.comicGrade = rbind(comicName.comicSummary.comicGrade, page)

  
}
write.csv(comicName.comicSummary.comicGrade, "navercomic2.csv")
