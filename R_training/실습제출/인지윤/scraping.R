install.packages("rvest")
library("rvest")

url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)
text

html_text(html_nodes(text, "h1"))

a <- html_nodes(text, "a")
html_attr(a, "href")
html_text(html_nodes(text, "a"))
html_attr(html_nodes(text, "a"), "href")

img <- html_nodes(text, "img")
html_attr(img, "src")
html_attr(html_nodes(text, "img"), "src")


html_text(html_nodes(text, "h2:nth-of-type(1)"))

#<ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
html_text(html_nodes(text, "ul > li[style$=green]"))
html_text(html_nodes(text, "ul > [style$=green]"))  #Eliment 값 li 생략 가능


html_text(html_nodes(text, "h2:nth-of-type(2)"))

html_text(html_nodes(text, "ol > *"))     #"모든", "자식" 태그들의 콘텐츠

html_text(html_nodes(text, "table *"))    #"모든", "자손" 태그들의 콘텐츠

#name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
html_text(html_nodes(text, "[class=name]"))   #태그가 tr밖에 없어서 tr생략 가능
html_text(html_nodes(text, "tr[class=name]"))
html_text(html_nodes(text, "tr.name"))

#target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
html_text(html_nodes(text, "td#target"))