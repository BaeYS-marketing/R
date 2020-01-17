
# install.packages('RSelenium')

library(RSelenium)

"java -jar selenium-server-standalone.jar -port 4445
1.자바코드 프로그래밍 - RSelenium실행
2.chrome_driver 설치한 것으로 브라우저 환경"




remDr <- remoteDriver(remoteServerAddr ='localhost',port=4445,
                      browserName = 'chrome')

#localhost = 나 자신, 내 컴퓨터 네트워크
#port = 4445  포트번호 4445 서버에 접속해서
#크롬이라는 이름을 셀레늄 브라우저 이름으로 할께


remDr$open()
#실행 : 한번만 실행. 실행 계속하면 웹브라우저 계속 생김

remDr$navigate('http://www.google.com/ncr') 
#셀레늄 브라우저에 google 접속 

#자바스크립트 실행은 브라우저가 한다.
#셀레늄이 기동시킨 크롬은 우리가 제어할 수 있다. 
#왜냐면 내가 셀레늄한테 명령 - 셀레늄이 크롬 작동

webElem <- remDr$findElement(using = 'css',"[name = 'q']")
#입력상자 엘먼트를 찾아라, css적용해서 네임 속성값이이 q인 태그(앨먼트) 
#네임 속성값이 q인 노드객체 가져옴

webElem$sendKeysToElement(list('JAVA', key='enter'))
#키를 보내라 엘먼트한테 - 리스트 객체로 준다. 
#첫 번쨰 아규먼트 : 입력할 데이터 , 두 번째는 keys




#연습_ 네이버 시행
remDr$navigate('https://www.naver.com')

webElem <- remDr$findElement(using = 'css',"[name ='query']")
#[id = 'query] : css랑은 다름.

webElem$sendKeysToElement(list('JAVA',key='enter'))





#클릭 이벤트 시행
remDr$open()

remDr$navigate('
  http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135
')
#s : 2개다 실행한거다.
more <- remDr$findElements(using = 'css','[class="u_cbox_sort_label"]')
sapply(more,function(x){x$clickElement()})

#정확하게 1개가 아니다. 적용X
more <- remDr$findElement(using = 'css','[class="u_cbox_sort_label"]')
sapply(more,function(x){x$clickElement()})

#
more <- remDr$findElements(using = 'css','span.u_cbox_in_view_comment')
sapply(more,function(x){x$clickElement()})


remDr$navigate('
  https://comic.naver.com/comment/comment.nhn?titleId=570503&no=135
')


#
# more <- remDr$findElements(using = 'css','span.u_cbox_page:nth-child(4)')
more <- remDr$findElements(using = 'css','a:nth-child(5)>span')

# more <- remDr$findElements(using = 'css','#cbox_module > div
                           # >div.u_cbox_paginate>div>a:nth-child(4)>span')
sapply(more,function(x){x$clickElement()})

for( i in 4:12){
        nextCss <- paste0('a:nth-child(',i,')>span')
        nextPage <- remDr$findElements(using = 'css',nextCss)
        sapply(nextPage,function(x){x$clickElement()})
        Sys.sleep(3)
        }
