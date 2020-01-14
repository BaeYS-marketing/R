library(rvest)
library(httr)

http_std <- POST('http://unico2013.dothome.co.kr/crawling/post.php',
                    encode = 'form', body = list(name = 'R', age = '27'))
  
title3 <- html_nodes(read_html(http_std), 'h1' )
title3 <- html_text(title3)

getwd()
