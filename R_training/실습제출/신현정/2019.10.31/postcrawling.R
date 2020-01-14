install.packages("httr")
library(httr)
library(rvest)


web= POST("http://unico2013.dothome.co.kr/crawling/post.php"
, encode ="form", body=list(name = 'R', age ='27'))
link =html_nodes(read_html(web), 'h1')
link = html_text(link)
link