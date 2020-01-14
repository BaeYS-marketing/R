

library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()#리모트드라이버 리턴값을 셀레늄서버가 오픈, 함수도 저장가능

remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale") 
Sys.sleep(3)
seoul<-remDr$findElement(using="css", "#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step1 > div.loca_step1_cont > ul > li:nth-child(1) > a")
seoul$clickElement()
Sys.sleep(3)
seoul<-remDr$findElement(using="css", "#mCSB_2_container > ul > li:nth-child(1) > a")
seoul$clickElement()
Sys.sleep(5)
Names=NULL
#container > div > form > fieldset > div > section > article.find_store_cont > article
for(i in 1:503){

  css=paste0('#mCSB_3_container > ul > li:nth-child(',i,') > strong')
  firstnames<-remDr$findElements(using ='css',css)
  Name<-sapply(firstnames, function(x){x$getElementText()})
  Name=as.matrix(Name)
  Names=rbind(Names, Name)
  if(i%%3==0){
    remDr$executeScript(
      "var su=arguments[0]; var dom=document.querySelectorAll(
                '#mCSB_3_container > ul > li')[su]; dom.scrollIntoView();",list(i))

  }
}

write.table(Names,"starbucks.txt")  
getwd()

