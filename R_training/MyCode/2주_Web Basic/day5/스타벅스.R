

#순서
'태그로 지정하기 - 태그 일기'

#1
library(RSelenium)
remDr<-remoteDriver(remoteServerAddr= "localhost", port = 4445, browserName= "chrome")

#2
remDr$open()


#3
url = "https://www.istarbucks.co.kr/store/store_map.do?disp=locale"
remDr$navigate(url)

Sys.sleep(3)

#4

seoulNode <- remDr$findElements(using ='css','#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a' ) 
sapply(seoulNode, function(x){x$clickElement()})



seoulTotalNode <- remDr$findElements(using ='css','#mCSB_2_container > ul > li:nth-child(1) > a')
sapply(seoulTotalNode, function(x){x$clickElement()})




#store1 
name1Node <- remDr$findElements(using='css','#mCSB_3_container > ul > li:nth-child(1) > strong')
name1 <- sapply(name1Node, function(x){x$getElementText()})
name1

#store2 
name2Node <- remDr$findElements(using='css','#mCSB_3_container > ul > li:nth-child(2) > strong')
name2 <- sapply(name2Node, function(x){x$getElementText()})
name2
#store3
name3Node <- remDr$findElements(using='css','#mCSB_3_container > ul > li:nth-child(3) > strong')
name3 <- sapply(name3Node, function(x){x$getElementText()})
name3





#place
place1Node <- remDr$findElements(using ='css', '#mCSB_3_container > ul > li:nth-child(1) > p')
place1 <- sapply(place1Node, function(x){x$getElementText()})
place1
as.character(place1)

place1<-strsplit(place1,"\n")






#lat
lat1Node <- remDr$findElements(using='css','#mCSB_3_container > ul > li:nth-child(1)')
lat1 <- sapply(lat1Node, function(x){x$getElementAttribute('data-lat')})
lat1

lat2Node <- remDr$findElements(using='css','#mCSB_3_container > ul > li:nth-child(2)')
lat2 <- sapply(lat2Node, function(x){x$getElementAttribute('data-lat')})
lat2

lat3Node <- remDr$findElements(using = 'css','#mCSB_3_container > ul > li:nth-child(3)')
lat3 <- sapply(lat3Node, function(x){x$getElementAttribute('data-lat')})
lat3



#long
long1Node <- remDr$findElements(using='css','#mCSB_3_container > ul > li:nth-child(1)')
long1 <- sapply(long1Node, function(x){x$getElementAttribute('data-long')})
long1




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




remDr$executeScript(
        "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(3))
        




