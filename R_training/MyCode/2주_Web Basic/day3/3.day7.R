########   정규식    ########

'정규표현식은 줄여서 정규식(영어로는 Regular Expression이고 줄여서 Regex, Regexp 등으로 불린다.) 
이라고도 하는데, 컴퓨터 과학의 정규언어로부터 유래한 것으로 
특정한 규칙을 가진 문자열의 집합을 표현하기 위해 쓰이는 형식언어'


#정규표현식 사용
word <- 'JAVA javascrpit Aa가나다 AAaAaA123 %^&*'
gsub('A','',word)
gsub('a','',word)
gsub('Aa','',word)
gsub('(Aa)','',word)          #굳이 괄호 안쓴다. 위엥랑 같다. 쓰는경우 밑에
gsub('(Aa){2}','',word)       #{}횟수: Aa*2인 부분지정 
gsub('[Aa]','',word)          #[  ] 안 문자 : or 적용
gsub('[가-힣]','',word)       # -  : 범위
gsub('[^가-힣]','',word)      # ^ : not   - ^는 대괄호 '안'에서 시작문자 '앞'에서
gsub('[%^&*]','',word)
gsub('[[:punct:]]','',word)
gsub('[[:alnum:]]','',word)   #문자와 숫자 제외
gsub('[1234567890]','',word)
gsub('[0-9]','',word)
gsub('[[:digit:]]','',word)
gsub('[^[:alnum:]]','',word)  #공백도 삭제되서 단어가 안된다는 것을 주의
gsub('[[:space:]]','',word)



gsub('[[A-Z]][a-z]]','',word)   #  값 - 값  할때 앞에 값이 더 커야된다. 










############  1  xpath   #############

install.packages('XML')
library(XML)

imsi <- read_html('http://www.hankookilbo.com/') #XML은 읽어들이는 기능X, rvest패키지 이용
t <- htmlParse(imsi)      #html의 각각 태그들을 파싱
content<- xpathSApply(t, "//p[@class='title']", xmlValue)  #xmlValue : content 추출해줘 함수
content

content <- gsub("[[:punct:][:cntrl:]]",'',content)  
content
content <- trimws(content)              #trim(제거) ws(white space_공백)
content
unique(content)                         #중복제거


#trim : rvest패키지 html_text함수 아규먼트
#trimws : base함수  _ 성능동일 앞뒤 공백제거 
#윈도우 운영체제는 \r\n : 개행 _ 그래서 자주 \r이 등장하는 것 





#2 xpath
'HTML은 태그가 정해져 있고, XML은 직접 태그를 만들어서 쓸 수 있다는 점에서
차이를 보인다. 구조(태그-서브태그)나 쓰는 방식은 비슷.'

#[Xpath 식]                      [CSS Selector]
"//p[@class= 'title']              p.title

XML
// : 부모(조상)이 누구든 P태그를 찾아라.
/ : 부모자식 관계          ex.  //table/tbody/tr/th[@id='f']
                           ex. //ol/li[2]         _ css selector :nth~~
"


#xpath
'XPath(XML Path Language)는 W3C의 표준으로 확장 생성 언어 문서의 구조를 통해
경로 위에 지정한 구문을 사용하여 항목을 배치하고 처리하는 방법을 기술하는 언어이다.'


'즉, 문서를 읽어와서 노드 계층적 트리구조로 만드는 것 _ 이것은 html 문서도 마찬가지'

'//poject :  역삼동 에서 공부해
 /wikimedia/projects/project  : 대한민국 서울특별시 강남구 역삼동에서 공부해'
#wikimedia : / 바로 옆에는 최상위 태그 _루트앨먼트 가 와야 돼.

'   xpath                     css selector
project//project     =   project project   (자식 자손)
project/project      =   project > project  (자식)           '






############   3  httr 패키지  ~~ GET() , POST() ############

#HTTP+R   :  rvest방식으로는 기능이용 못할 때 사용한다.
'rvest는 post방식 요청 기능지원이 안된다. '

install.packages('httr')
library(httr)
library(rvest)

#1.GET 방식 요청     ~httr 패키지 이용 안해도 사용할 수 있으나 있다는 걸 알려줄려고 

http.standard <- GET('http://www.w3.org./protocols/rfc2616/rfc2616.html')


str(http.standard)       # 자세한 내용이 많이 필요할 떄는(개발자) GET함수 이용할 수 있겠다.
                         # +쿠키 : 서버가 클라이언트를 잊지 않으려고 심어두는 것.

title = html_nodes(read_html(http.standard),'div.toc h2')
#read_html 도 요청하는 기능이 있기 때문에 그냥 read_html(주소)해도 된다.


title2 = html_text(title)
title2





#2.POST 방식          (body안에 담기 때문에 보안+길이 제한X)

#POST 방식 : 대부분은 로그인, 회원가입란. 

game = POST("http://www.gevolution.co.kr/score/gamescore.asp?t=3&m=0&d=week"
            ,encode = 'form', body = list(txtPeriodW = '2019-10-5'))  #쿼리문자 ~주로 폼 데이터 _ post형식은 항상 쿼리문자를 포함해서  전달 
                                                                     # name =  textPeriodW (사이트 제작자 지정 _ 우리가 마음대로X) 
                                                                     #      : 이걸 아는게 쉽지 않아서 웹에 대한 전문지식이 있어야 된다. 
                                                          

title2 = html_nodes(read_html(game),'a.tracktitle')
title2 = html_text(title2)
title2[1:10]



#? get방식이냐 post방식이냐
'개발자 도구 - 네트워크'





#3. 이미지, 첨부파일 다운받기      cf.pdf도 이미지_ 바이너리(이진) 파일 

#1) PDF
res <- GET('http://cran.r-project.org/web/packages/httr/httr.pdf')

writeBin(content(res,'raw'), 'c:/Temp/httr.pdf')    #writeBin : 이진수로 저장_ 텍스트파일을 제외한 그림 등.


#2) jpg
h = read_html('http://unico2013.dothome.co.kr/productlog.html')

h
imgs = html_nodes(h,'img')
img.src = html_attr(imgs,'src')

for(i in 1:length(img.src)){
        res = GET(paste('http://unico2013.dothome.co.kr/',img.src[i],sep=''))
        writeBin(content(res,'raw'),paste('c:/Temp/',img.src[i],sep=''))
}

