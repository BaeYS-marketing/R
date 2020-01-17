#2
remDr$open()

url = "https://www.istarbucks.co.kr/store/store_map.do?disp=locale"
remDr$navigate(url)

Sys.sleep(3)

#4

seoulNode <- remDr$findElements(using ='css','#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a' ) 
sapply(seoulNode, function(x){x$clickElement()})



seoulTotalNode <- remDr$findElements(using ='css','#mCSB_2_container > ul > li:nth-child(1) > a')
sapply(seoulTotalNode, function(x){x$clickElement()})




resultName<-NULL
resultPlace <- NULL
resultLat <- NULL
resultLong <- NULL


for(i in 1:503){
        #태그(노드) 알고리즘 : for문에 맞춰서 하나씩 넘어가도록
        nameCss <- paste0("#mCSB_3_container > ul > li:nth-child(",i,") > strong")
        placeCss<- paste0("#mCSB_3_container > ul > li:nth-child(",i,") > p")
        latCss <- paste0("#mCSB_3_container > ul > li:nth-child(",i,")")
        longCss <- paste0("#mCSB_3_container > ul > li:nth-child(",i,")")
        
        #셀레늄에 노드 지정
        name1Node <- remDr$findElements(using='css',nameCss)
        place1Node <- remDr$findElements(using ='css', placeCss )
        lat1Node <- remDr$findElements(using='css',latCss)
        long1Node <- remDr$findElements(using='css',longCss)
        
        #셀레늄에 텍스트 추출 / getElementText(), getElementAttribute()
        name <- sapply(name1Node, function(x){x$getElementText()})
        place <- sapply(place1Node, function(x){x$getElementText()})
        lat <- sapply(lat1Node, function(x){x$getElementAttribute('data-lat')})
        long <- sapply(long1Node, function(x){x$getElementAttribute('data-long')})
        
        
        #출력 데이터 통합 알고리즘 : 빈 데이터프레임 만들어서 바인드. 
        name <- as.matrix(name)
        resultName <- rbind(resultName,name)
        
        place <- as.matrix(place)
        resultPlace <- rbind(resultPlace,place)
        
        lat <- as.matrix(lat)
        resultLat <- rbind(resultLat,lat)
        
        long <- as.matrix(long)
        resultLong <- rbind(resultLong,long)
        
        
        #자바스크립트 언어...
        if(i%%3==0){
                remDr$executeScript(
                        "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
                
                
                #executeScript : 현재 페이지에서 비동기 javascript를 실행합니다.
                #executeScript(Script,Arguments) : Script - 실행해야하는 JavaScript , Arguments - 스크립트에 대한 인수입니다(선택사항)
                
                #1. arguments
                #arguments 객체는 함수에 전달되는 인수들의 배열 집합입니다. 하지만 완벽한 array는 아니며 length를 제외하고는 어떠한 속성도 없습니다. 배열로 변환이 가능합니다.
                
                #첫 번째 인수는 arguments[0]에 저장
                
                #매장컨테이너 > >리스트들 1개
                # var : 전역변수설정 
                # .querySelectorAll()은 특정 CSS 선택자를 가진 모든 요소를 배열로 가져오는 메서드입니다.
                # scrollIntoView() : 특정한 영역 및 엘리먼트의 위치로 스크롤을 위치
        }
}


totalData<-NULL
totalData<-cbind(resultName,resultPlace,resultLat,resultLong)
View(totalData)
write.table(totalData,"starbucks.txt")