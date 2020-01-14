library(rvest)


url = 'http://unico2013.dothome.co.kr/crawling/exercise_bs.html'
text = read_html(url) #read-html - rvest가 제공하는 함수

# <h1> 태그의 컨텐츠

html_text(html_nodes(text,'h1'))

# 텍스트 형식으로 내용을 가지고 있는 <a> 태그의 컨텐츠와 href 속성값

html_text(html_nodes(text, "a"))
html_attr(html_nodes(text, "a"), "href")

# <img> 태그의 src 속성값

html_attr(html_nodes(text, "img"), "src")


# 첫 번째 <h2> 태그의 컨텐츠

html_text(html_nodes(text, "h2:nth-of-type(1)"))


# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠

html_text(html_nodes(text, "ul > li[style$=green]"))
html_text(html_nodes(text, "ul > [style$=green]"))


# 두 번째 <h2> 태그의 컨텐츠

html_text(html_nodes(text, "h2:nth-of-type(2)"))

# <ul> 태그의 모든 자식 태그들의 컨텐츠 

html_text(html_nodes(text, "ol > *"))


# <table> 태그의 모든 자손 태그들의 컨텐츠 

html_text(html_nodes(text, "table  *"))

# name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠

html_text(html_nodes(text, "tr[class=name]"))

html_text(html_nodes(text, "tr.name"))

# target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠

html_text(html_nodes(text, "td#target"))







