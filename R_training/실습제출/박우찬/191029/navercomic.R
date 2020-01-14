library(rvest)

site = "https://comic.naver.com/genre/bestChallenge.nhn?page="
result = NULL
i = 0
repeat{
    i = i + 1
    
    url = paste(site,i,sep="")
    text = read_html(url)

    nodes = html_nodes(text, 'div.challengeInfo > h6 > a')
    comicName = html_text(nodes, trim = TRUE)

    nodes = html_nodes(text, 'div.challengeInfo > div.summary')
    comicSummary = html_text(nodes, trim = TRUE)

    nodes = html_nodes(text, 'div.challengeInfo > div.rating_type > strong')
    comicGrade = html_text(nodes, trim = TRUE)
    
    nodes = html_nodes(text, 'div.paginate > div > strong.page > em')
    endpage = html_text(nodes, trim = TRUE)


    page = data.frame(comicName, comicSummary, comicGrade)
    result = rbind(result, page)    
    
    
    
    if(i > as.numeric(endpage))
      break()

    
  
}   

write.csv(result, 'navercomic.csv')

