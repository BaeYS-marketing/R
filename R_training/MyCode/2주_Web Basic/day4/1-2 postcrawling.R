getwd()

library(rvest)
library(httr)

site = 'http://unico2013.dothome.co.kr/crawling/post.php' 
#URL을 그냥 읽는 것은 GET방식(디폴트) 
#post방식이니까 POST 그냥 URL로 사이트 불러올 수 없다.
#메서드 형식을 POST로 요청한 폼 태그 이어야지 요청할 수 있다.
#encode는 form이라고 생각하면 된다. 웹 크롤링이니까 / 가끔 첨부파일 업로드형식일 때 multipart
#전달되는 쿼리의 제한도 없고, 숨길 수 있는 기능이 추가되었다_POST 방식
#

p.site = POST(site,encode = 'form', body = list(name='배윤성',age='27'))
#POST(URL,ecode = , body = )

nodesContent <- html_nodes(read_html(p.site),'h1')
content <- html_text(nodesContent)
content



?POST
POST(url = NULL, config = list(), ..., body = NULL,
    encode = c("multipart", "form", "json", "raw"), handle = NULL)
  