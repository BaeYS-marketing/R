remDr$open()
remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")
Sys.sleep(3)
more <- remDr$findElement(using = 'css', '#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a')
more$clickElement()
more <- remDr$findElement(using = 'css', '#mCSB_2_container > ul > li:nth-child(1) > a')
h<-more$clickElement()
h=as.matrix(h)
result<-NULL

  for(i in 1:503){
    totalReviewNodes<-remDr$findElements(using="css", '#mCSB_3_container > ul > li:nth-child(1)')
    hh<-sapply(totalReviewNodes,function(x){x$getElementText()})
    hh=as.matrix(hh)
    result<-rbind(result,hh)
    if(i%%3==0){
      remDr$executeScript(
        "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))
      Sys.sleep(3)
    }
  }

final<-rbind(h, result)
write.csv(final, "starbucks.csv")