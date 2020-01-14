url2="http://unico2013.dothome.co.kr/crawling/tagstyle.html" #브라우저의 기능
text2=read_html(url2)
text2

# <h1> 태그의 컨텐츠
# 텍스트 형식으로 내용을 가지고 있는 <a> 태그의 컨텐츠와 href 속성값
# <img> 태그의 src 속성값
# 첫 번째 <h2> 태그의 컨텐츠
# 두 번째 <h2> 태그의 컨텐츠


nodes6=html_nodes(text,"h1")
nodes6
h1=html_text(nodes6)
h1

nodes4=html_nodes(text,"a")
nodes4
a=html_text(nodes4)
a
html_attr(nodes4,"herf")#두번째 아규먼트=추출하려는 속성


nodessix=html_nodes(text,"h2")
nodessix
h2=html_text(nodessix)
h2

nodes7=html_nodes(text,"h2:nth-of-type(1)")
nodes7

nodes8=html_nodes(text,"h2:nth-of-type(2)")
nodes8



nodes5=html_nodes(text,"img")
nodes5
img=html_text(nodes5)
img
html_attr(nodes5,"src")



# <ul> 태그의 모든 자식 태그들의 컨텐츠 
# <table> 태그의 모든 자손 태그들의 컨텐츠 

# name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
# target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠

# <ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠

nodes9=html_nodes(text,"ul>*")
nodes9
child_ul=html_text(nodes9)
child_ul


nodes13=html_nodes(text,"ul > [style$=green]")
nodes13
ul=html_text(nodes13)
ul



nodes12=html_nodes(text,"table*")
nodes12
child_table=html_text(nodes12)
child_table
 


nodes10=html_nodes(text,"[class=name]")
nodes10=
tr=html_text(nodes10)
tr




nodes11=html_nodes(text,"td#target")
nodes11
td=html_text(nodes11)
td





