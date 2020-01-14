library(httr)
library(dplyr)
library(rvest)

test <- POST('http://unico2013.dothome.co.kr/crawling/post.php',
             encode = 'form', body =list(name='R', age='27'))
test %>% read_html() %>%  html_nodes("h1") %>% html_text()
