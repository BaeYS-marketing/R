library(httr)
site <- POST("http://unico2013.dothome.co.kr/crawling/post.php", encode = 'form', body = list(name = 'R', age = '27'))
test <- html_nodes(read_html(site), 'h1')
test <- html_text(test)
test
