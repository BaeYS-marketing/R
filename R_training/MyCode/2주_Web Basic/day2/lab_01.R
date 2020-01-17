library(rvest)
url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"
text <- read_html(url)
text
text
#<h1> 태그의 컨텐츠
html_text(html_nodes(text, "h1"))                                               #h1이라는 태그 선택자  콘텐츠(html_text) 꺼내기
# <a> 태그의 컨텐츠
html_text(html_nodes(text, "a"))   
# <a> 태그의 href 속성값
html_attr(html_nodes(text, "a"), "href")

html_nodes(text, "a")
html_text(html_nodes(text, "a"))
# <img> 태그의 src 속성값
html_attr(html_nodes(text, "img"), "src")    
# 첫 번째 <h2> 태그의 컨텐츠
html_text(html_nodes(text, "h2:nth-of-type(1)"))                                          #규칙 :  "태그:nth-of-type(1)"       _숫자도 1부터 
# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
html_text(html_nodes(text, "ul > li[style$=green]"))                                      #   > : 자식선택자 ,   ex. ul >li 모든 li 태그 다 찾음. ul 자식 li밖에 없으니까 생략했던 것 
#두 번째 <h2> 태그의 컨텐츠
html_text(html_nodes(text, "h2:nth-of-type(2)"))
#<ol> 태그의 모든 자식 태그들의 컨텐츠 
html_text(html_nodes(text, "ol >*"))                                                      #*: 모든(All)의 의미.
#<table> 태그의 모든 자손 태그들의 컨텐츠 
html_text(html_nodes(text, "table *"))
#name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
html_text(html_nodes(text, "[class=name]"))                                              #-> "tr[class=name]" 이게 더 정확,             등가연산 한개 =
        = html_text(html_nodes(text, "tr.name"))                                         #cf.     .name : name이라는 클래스 속성을 갖는(클래스 속성 값이 name) 모든 태그                               
#target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
html_text(html_nodes(text, "td#target"))                 




#ERROR
html_text(html_nodes(text, "h2[2]"))



#나만의 노하우
'1.  html_text(노드) : 노드 안 텍스트 추출
 2.  html_nodes(주소, 어떤 노드 추출할지 조건 설정 '




'쌤 정리 
어떤 노드 조건설정
       *[속성명]
        [속성명]          앞에 태그는 상관없어. 모든 태그에서 속성명만 해당하는 것을 다 찾아라.
태그명[속성명]          태그명 중에서 속성명에 해당하는 것을 다 찾아라 
태그명[속성명 = 속성값]                태그명 중에서 속성명 중에서 이 속성값을 갖고있는 태그를 찾아라.  ~ 마찬가지로 [속성명 = 속성값 ] 가능.
태그명[속성명^=속성값]                ~시작하는
태그명[속성명$=속성값]                 $끝나는


--태그 --
*
태그명
.클래스명
#아이디명
태그명.클래스명
상위태그명>자식태그명>손자태그명
상위태그명.클래스명 > 자식태그명.클래스명
상위태그명.클래스명  자손태그명
상위태그명 > 자식태그명 자손태그명
#아이디명 > 태그명.클래스명'



