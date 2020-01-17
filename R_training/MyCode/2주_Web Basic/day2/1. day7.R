install.packages("rvest")
library(rvest)

#주소 _ 웹브라우저 처럼 읽어올 수 있다. > read_html()
url2="http://unico2013.dothome.co.kr/crawling/tagstyle.html" #브라우저의 기능
url=read_html(url)
url
View(url)



#지정 노드 읽어오기 > html_nodes(html주소 , "태그명")

nodesAll = html_nodes(url,'*')
nodesAll

nodes=html_nodes(url,"div")# 태그명으로 CSS선택자
nodes

#지정 노드에서 콘텐츠만 추출하기 > html_text(지정노드)
title=html_text(nodes)
title



# html_nodes( )심화 _ 태그 순서로 특정 태그 지정하기

nodes1=html_nodes(url,"div:nth-of-type(1)")# div 태그 중 첫번째
nodes1

nodes2=html_nodes(url,"div:nth-of-type(1)")# div 태그 중 첫번째
nodes2

html_text(nodes1)
html_text(nodes2)
nodes1


#해당 속성값(변수)추출 : html_attr(노드, 속성)
nodes1
print(nodes1)
nodes2=html_attr(nodes1,"style")#두번째 아규먼트=추출하려는 속성
nodes2



nodes2=html_nodes(url,"div:nth-of-type(2)")# div 태그 중 두번째
nodes2
html_attr(nodes2,"style")

nodes3=html_nodes(url,"div:nth-of-type(3)")# div 태그 중 세번째
nodes3




#<!DOCTYPE html>
  # <html>
  # <head>
  # <meta charset="UTF-8"> 컨텐트가 없는 엠티태그
  # <title>Insert title here</title> #시작과 종료 사이에 컨텐트
  # </head>
  # <body>
  # <h1>블럭스타일 태그</h1> # 태그는 밑에 자식으로 태그, 텍스트가 가능, 텍스트는 불가/
  # <div style="background-color:yellow">테스트입니다1</div>
  # <div>테스트입니다2</div>
  # <div>테스트입니다3</div>
  # <hr>
  # <h1>인라인스타일 태그</h1>
  # <span style="background-color:yellow">테스트입니다1</span>
  # <span>테스트입니다2</span>
  # <span>테스트입니다3</span>
  # </body>
  # </html>