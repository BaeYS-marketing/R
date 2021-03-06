
url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)
text

#<h1> 태그의 컨텐츠
html_text(html_nodes(text, "h1"))
# <a> 태그의 컨텐츠
html_text(html_nodes(text, "a"))
# <a> 태그의 href 속성값
html_attr(html_nodes(text, "a"), "href")
# <img> 태그의 src 속성값
html_attr(html_nodes(text, "img"), "src")
# 첫 번째 <h2> 태그의 컨텐츠
html_text(html_nodes(text, "h2:nth-of-type(1)"))
# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
html_text(html_nodes(text, "ul >li[style$=green]"))
#두 번째 <h2> 태그의 컨텐츠
html_text(html_nodes(text, "h2:nth-of-type(2)"))
#<ol> 태그의 모든 자식 태그들의 컨텐츠 
html_text(html_nodes(text, "ol > *"))
#<table> 태그의 모든 자손 태그들의 컨텐츠 
html_text(html_nodes(text, "table *"))
#name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
html_text(html_nodes(text, "tr.name"))
html_text(html_nodes(text, "[class=name]"))
#target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
html_text(html_nodes(text, "td#target"))
html_text(html_nodes(text, "#target"))
# target이라는 아이디 속성을 갖는 td

#<h1> 태그의 컨텐츠
#텍스트 형식으로 내용을 가지고 있는 <a> 태그의 컨텐츠와 href
#속성값
#<img> 태그의 src 속성값
#첫 번째 <h2> 태그의 컨텐츠
#<ul> 태그의 자식 태그들 중 style 속성의 값이 green으로
#끝나는 태그의 컨텐츠
#두 번째 <h2> 태그의 컨텐츠
#<ul> 태그의 모든 자식 태그들의 컨텐츠 
#<table> 태그의 모든 자손 태그들의 컨텐츠 
#name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
#target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
