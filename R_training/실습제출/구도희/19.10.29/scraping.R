text <- read_html("http://unico2013.dothome.co.kr/crawling/exercise_bs.html")
text

content <- html_nodes(text, "h1")
content
html_text(content)

content1 <- html_nodes(text, "a")
content1
html_text(content1)
html_attr(content1, "href")

content2 <- html_nodes(text, "img")
content2
html_attr(content2, "src")

content3 <- html_nodes(text, "h2:nth-of-type(1)")
content3
html_text(content3)

content4 <- html_nodes(text, "u > li[style$=grren]")


content5 <- html_nodes(text, "h2:nth-of-type(2)")
content5
html_text(content5)

html_text(html_nodes(text, "ol > *"))

html_text(html_nodes(text, "tr[class=name]"))

html_text(html_nodes(text, "td#target"))

