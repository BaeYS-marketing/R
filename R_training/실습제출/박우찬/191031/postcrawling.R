library(httr)
library(rvest)
site = POST('http://unico2013.dothome.co.kr/crawling/post.php' ,
            encode ='form', body = list(name = 'R' ,age = 27),
            )
result = html_nodes(read_html(site), 'h1')
result = html_text(result)
result
