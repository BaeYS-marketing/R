
install.packages("rvest")
library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)
text

#<h1> 태그의 컨텐츠
html_text(html_nodes(text, "h1"))
# <a> 태그의 컨텐츠
html_text(html_nodes(text, "a"))
# <a> 태그의 href 속성값
html_attr(html_nodes(text, "a"), "href") #추출하려는 속성명을 준다. 
# <img> 태그의 src 속성값
html_attr(html_nodes(text, "img"), "src")
# 첫 번째 <h2> 태그의 컨텐츠
html_text(html_nodes(text, "h2:nth-of-type(1)"))
# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
html_text(html_nodes(text, "ul > [style$=green]"))
#두 번째 <h2> 태그의 컨텐츠
html_text(html_nodes(text, "h2:nth-of-type(2)"))
#<ol> 태그의 모든 자식 태그들의 컨텐츠 
html_text(html_nodes(text, "ol > *")) # 모든 = *
#<table> 태그의 모든 자손 태그들의 컨텐츠 
html_text(html_nodes(text, "table *"))    # 손자 = 빈칸 
#name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
html_text(html_nodes(text, "tr[class=name]"))
html_text(html_nodes(text, "tr.name"))
#target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
html_text(html_nodes(text, "td#target"))
html_text(html_nodes(text, "td[id=target]"))

# 태그명[속성명]: 속성명을 가지고 있는 tag
# 태그명[속성명 =속성값]: 이 속성값을 갖고 있는 tag 
# 태그명[속성명^=속성값]: 이 속성값으로 시작하는 tag
# 태그명[속성명$=속성값]: 이 속성값으로 끝나는 tag
# 상위태그명 > 자식태그명 > 손자태그명
# 상위태그명.클래스속성값 자손태그명
# 상위태그명 
# 생략가능


