url = "https://comic.naver.com/genre/bestChallenge.nhn"
site = "https://comic.naver.com"

navercomic = NULL

while (1) {
  text = read_html(url)
  
  comicName = html_text(html_nodes(text, '#content h6 > a'), trim=T)
  comicSummary = html_text(html_nodes(text, '#content div.challengeInfo > div.summary'), trim=T)
  comicGrade = html_text(html_nodes(text, '#content div.challengeInfo > div.rating_type > strong'), trim=T)
  
  df = data.frame(comicName, comicSummary, comicGrade)
  navercomic = rbind(navercomic, df)
  
  nex = html_nodes(text, '#content > div.paginate > div > a.next')
  if (length(nex) == 0) {
    break;
  }
  url = paste(site, html_attr(nex, 'href'), sep='')
}

write.csv(navercomic, 'navercomic.csv', row.names = F)
