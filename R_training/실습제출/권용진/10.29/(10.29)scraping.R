url = "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text = read_html(url)
text

html_text(html_nodes(text, "h1"))

nodes = html_nodes(text, "a")
nodes

html_attr(html_nodes(text, "a"), "href") 

html_attr(html_nodes(text, "img"), "src")

html_text(html_nodes(text, "h2:nth-of-type(1)"))

html_text(html_nodes(text, "ul>li[style$=green]"))
#꺾새는 자식 선택자에서 찾겠다는 의미

html_text(html_nodes(text, "h2:nth-of-type(2)"))

html_text(html_nodes(text, "h2:nth-of-type(2)"))

html_text(html_nodes(text, "ol > *"))
# 꺾새 : 자식만 찾고 싶을 때

html_text(html_nodes(text, "table *")) 
# +blank :자손을 다 찾고 싶을 때

html_text(html_nodes(text, "tr[class=name]"))
html_text(html_nodes(text, "tr.name"))


html_text(html_nodes(text, "td#target"))
#id는 .이 아니라 #
html_text(html_nodes(text, "#target"))
#td라는 아이디 속성은 다른 것은 가질 수 없다.

html_text(html_nodes(text, "td[id=target]"))