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
        #꺼내는건 알아서 구현
        nameCss <- paste0("#mCSB_3_container > ul > li:nth-child(",i,") > strong")
        placeCss<- paste0("#mCSB_3_container > ul > li:nth-child(",i,") > p")
        latCss <- paste0("#mCSB_3_container > ul > li:nth-child(",i,")")
        longCss <- paste0("#mCSB_3_container > ul > li:nth-child(",i,")")
        
        name1Node <- remDr$findElements(using='css',nameCss)
        place1Node <- remDr$findElements(using ='css', placeCss )
        lat1Node <- remDr$findElements(using='css',latCss)
        long1Node <- remDr$findElements(using='css',longCss)
        
        name <- sapply(name1Node, function(x){x$getElementText()})
        place <- sapply(place1Node, function(x){x$getElementText()})
        lat <- sapply(lat1Node, function(x){x$getElementAttribute('data-lat')})
        long <- sapply(long1Node, function(x){x$getElementAttribute('data-long')})
        
        
        
        name <- as.matrix(name)
        resultName <- rbind(resultName,name)
        
        place <- as.matrix(place)
        resultPlace <- rbind(resultPlace,place)
        
        lat <- as.matrix(lat)
        resultLat <- rbind(resultLat,lat)
        
        long <- as.matrix(long)
        resultLong <- rbind(resultLong,long)
        
        
        if(i%%3==0){
                remDr$executeScript(
                        "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
        }
}


totalData<-NULL
totalData<-cbind(resultName,resultPlace,resultLat,resultLong)
View(totalData)
write.table(totalData,"starbucks.txt")