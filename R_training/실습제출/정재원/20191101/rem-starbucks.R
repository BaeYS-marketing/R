remDr$open()
remDr$setWindowSize(1280,8000, winHand = "current")
remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")
Sys.sleep(5)
seoul<-remDr$findElement(using='css',
                         '#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a')
seoul$clickElement()
entire<-remDr$findElement(using='css',
                         '#mCSB_2_container > ul > li:nth-child(1) > a')
entire$clickElement()
brNameText = NULL
for(i in 1:503){
  css=paste0("#mCSB_3_container > ul > li:nth-child(",i,") > strong")
  brName<-remDr$findElements(using = 'css selector',css)
  brNameText[i]<-sapply(brName,function(x){x$getElementText()})
  brNameText
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))  }
}
write.csv(unlist(brNameText),"starbucks.csv")