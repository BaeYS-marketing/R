# [ YES24의 명견만리 댓글 읽어오기 ]

#http://www.yes24.com/Product/goods/40936880

'
1.페이지소스보기로 대슬 동적내용인 것을 확인
2. 내리는 순간 나머지 내용을 에이작스로 받아오더라.
3. 스크롤바이 함수 써야되겟네 _ scrollby 자바스크립트 함수
4. 댓글도 긴 댓글이 있는데 펼쳐보기 태그 눌러야된다.
'


library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("http://www.yes24.com/24/goods/40936880")

#아규먼트에 지정해야한다고 해서 지정했는데 안하면 기본값으로 지정되더라.
webElem <- remDr$findElement("css", "body")

#scrollTo 절대적이고  /  scrollby 상대적이다.

#이미지 때문인지 살금살금 내려가야하더라.
#스크롤 내리는 행위 -  스크롤 내리면서 랜더링하는 것 
remDr$executeScript("scrollTo(0, 0)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 2500)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 2500)", args = list(webElem))
Sys.sleep(1)
remDr$executeScript("scrollBy(0, 1000)", args = list(webElem))
Sys.sleep(3)


repl_v = NULL
endFlag <- FALSE
page <- 3

repeat {
        for(index in 3:7) {
                #펼쳐보기
                fullContentLinkCSS <- paste("#infoset_reviewContentList > div:nth-child(",index,") > div.btn_halfMore > a", sep='')
                fullContentLink<-remDr$findElements(using='css selector',  fullContentLinkCSS)
                if (length(fullContentLink) == 0) {
                        endFlag <- TRUE
                        break
                }
                sapply(fullContentLink,function(x){x$clickElement()})      
                Sys.sleep(1)
                
                #컨텐트 읽어들이기 
                fullContentCSS <- paste("div:nth-child(",index,") > div.reviewInfoBot.origin > div.review_cont > p", sep='')
                fullContent<-remDr$findElements(using='css selector', fullContentCSS)
                print(fullContent)
                repl <-sapply(fullContent,function(x){x$getElementText()})    
                print(repl)
                repl_v <- c(repl_v, unlist(repl))
        }
        if(endFlag)
                break;  
        
        if(page == 10){
                page <- 3
                nextPageCSS <- "#infoset_reviewContentList > div.review_sort.sortTop > div.review_sortLft > div > a.bgYUI.next"
        }
        else{
                page <- page+1;
                nextPageCSS <- paste("#infoset_reviewContentList > div.review_sort.sortTop > div.review_sortLft > div > a:nth-child(",page,")",sep="")
        }
        remDr$executeScript("scrollTo(0, 0)", args = list(webElem))
        nextPageLink<-remDr$findElements(using='css selector',nextPageCSS)  
        sapply(nextPageLink,function(x){x$clickElement()})  
        Sys.sleep(5)
        print(page)
}
write(repl_v, "yes24.txt")

#개발자들이 오류 수정할 때 이런경우가 있으니까
#  ~ 메모장에 태그 쭉 옮겨놓고 알고리즘 만들면 된다.