url_c <- "https://comic.naver.com/genre/bestChallenge.nhn?page="

naver.comic = NULL

i =1
while(T){

url_c <- paste(url_c, i , sep="")
text_c <- read_html(url_c)
title_c <- html_text(html_nodes(text_c, "#content div.challengeInfo > h6 > a"), trim=T)
sum_c <- html_text(html_nodes(text_c, "#content div.challengeInfo > div.summary "), trim=T)
score_c <- html_text(html_nodes(text_c, "#content div.challengeInfo > div.rating_type > strong"), trim=T)

page_c <- data.frame(title_c, sum_c, score_c )
naver.comic <- rbind(naver.comic, page_c)

nodes = html_nodes(text, 'div.paginate > div > strong.page > em')
endpage = html_text(nodes, trim = TRUE)

if(i > as.numeric(endpage))
  break()
}

write.csv(naver.comic, "navercomic.csv")
