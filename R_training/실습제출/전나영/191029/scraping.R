url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)
text

# <h1> 태그의 컨텐츠
nodes <- html_nodes(text, "h1")
nodes
title <- html_text(nodes)
title

# 텍스트 형식으로 내용을 가지고 있는 <a> 태그의 컨텐츠와 href 속성값
nodes1 <- html_nodes(text, "a")
nodes1
html_text(nodes1)
html_attr(nodes1, "href")

# <img> 태그의 src 속성값
nodes2 <- html_nodes(text, "img")
nodes2
html_attr(nodes2, "src")

# 첫 번째 <h2> 태그의 컨텐츠
nodes3 <- html_nodes(text, "h2:nth-of-type(1)")
nodes3
html_text(nodes3)

# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠 #####
nodes4 <- html_nodes(text, "ul > [style$=green]")
nodes4
html_text(nodes4)

# 두 번째 <h2> 태그의 컨텐츠
nodes5 <- html_nodes(text, "h2:nth-of-type(2)")
nodes5
html_text(nodes5)

# <ol> 태그의 모든 자식 태그들의 컨텐츠
nodes6 <- html_nodes(text, "ol > *")
nodes6
html_text(nodes6)

# <table> 태그의 모든 자손 태그들의 컨텐츠 ###
nodes7 <- html_nodes(text, "table *")
nodes7
html_text(nodes7)

# name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠 #####
nodes8 <- html_nodes(text, "tr.name")
nodes8
html_text(nodes8)

# target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠 #####
nodes9 <- html_nodes(text, "td#target")
nodes9
html_text(nodes9)
