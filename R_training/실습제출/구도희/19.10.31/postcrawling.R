install.packages("httr")
library(rvest)
library(httr)
ps <- POST('http://unico2013.dothome.co.kr/crawling/post.php',
           encoding = "form", body=list(name='R', age='27'))

ps
p <- html_nodes(read_html(ps),'h1')
s <- html_text(p)
s
