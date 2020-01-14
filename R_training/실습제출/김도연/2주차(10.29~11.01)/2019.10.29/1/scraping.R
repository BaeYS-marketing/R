url = "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text = read_html(url)
text

#<h1> 태그의 컨텐츠
nodes = html_nodes(text, "h1") # nodes로 태그 찾고 text로 컨텐츠 꺼내고싶을때
nodes

#텍스트 형식으로 내용을 가지고 있는 <a> 태그의 컨텐츠와 href 속성값
nodes1 = html_nodes(text, "a")
nodes1
html_text(nodes1)
html_attr(nodes1, "href") #속성값을 꺼내고싶을때

#<img> 태그의 src 속성값
nodes2 = html_nodes(text, "img")
nodes2
html_text(nodes2)
html_attr(nodes2, "src")

  #html_attr(html_nodes(text,"img"),"src)랑 같음

#첫 번째 <h2> 태그의 컨텐츠
nodes3 = html_nodes(text, "h2:nth-of-type(1)")
nodes3
  #html_text(html_nodes(text, "h2:nth-of-type(1)"))랑 같음

#<ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
html_text(html_nodes(text,"ul > [style$=green]")) #여기는 자식이 li밖에 없어서 생략함 li[style$=green]

#두 번째 <h2> 태그의 컨텐츠
nodes5 = html_nodes(text, "h2:nth-of-type(2)")
nodes5

#<ol> 태그의 모든 자식 태그들의 컨텐츠 
html_text(html_nodes(text, "ol > *"))


#<table> 태그의 모든 자손 태그들의 컨텐츠 
html_text(html_nodes(text, "table *"))

#name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
html_text(html_nodes(text, "tr.name")) ## name이라는 속성을 가진 class중 tr태그
html_text(html_nodes(text, "tr[class=name]"))

#target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
html_text(html_nodes(text, "td#target")) # target이라는 속성르 가진 td
html_text(html_nodes(text, "#target")) #id의 경우는 태그이름이 중복이 되지 않으니 생략을 많이함
html_text(html_nodes(text, "td[id=target]"))
