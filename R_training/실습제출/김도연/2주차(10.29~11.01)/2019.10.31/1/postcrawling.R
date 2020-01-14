install.packages("httr")
library(httr)
library(rvest)
test = POST('http://unico2013.dothome.co.kr/crawling/post.php',
            encode = "form", body=list(name = "R", age = 27))
title2 = html_nodes(read_html(test), 'h1')
title2 = html_text(title2)
title2

 