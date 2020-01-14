

#이용주

##############################
library('rvest')
rm(list=ls())

url <- "http://media.daum.net/ranking/popular"
page <- read_html(url)

newstitle <- page %>% html_nodes('.list_news2') %>% html_nodes('.tit_thumb')  %>% html_nodes('.link_txt') %>% html_text(); newstitle
newstitle <- gsub("\"","",newstitle);newstitle

newspapername <- page %>% html_nodes('.list_news2') %>% html_nodes('.tit_thumb')  %>% html_nodes('.info_news') %>% html_text(); newspapername

page <- data.frame(newstitle, newspapername); page
write.csv(page,"./data/daumnews.csv")