#POST.R


# httr= get방식만 지원하는 rvest와 달리 post 방식도 지원
install.packages('httr')
library(httr)
library(rvest)
library(XML)

#post로 요청하기

ex=POST('http://unico2013.dothome.co.kr/crawling/post.php',encode='form',body=list(name='R',age=27))
#마지막 부분은 쿼리에 따라 달라짐
a=html_nodes(read_html(ex),'h1')
a=html_text(a)

a
